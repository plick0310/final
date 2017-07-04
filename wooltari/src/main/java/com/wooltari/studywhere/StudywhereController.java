package com.wooltari.studywhere;

import java.io.File;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.wooltari.common.FileManager;
import com.wooltari.common.MyUtil;
import com.wooltari.member.SessionInfo;

@Controller("studyboard.studywhere.studywhereController")
public class StudywhereController {
	
	@Autowired
	private StudyWhereService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@Autowired
	private FileManager fileManager;
	
	@RequestMapping(value="/studyboard/studywhere/list")
	public String list(
		@RequestParam(name="page",defaultValue="1") int current_page,
		@RequestParam(name="searchKey",defaultValue="subject") String searchKey,
		@RequestParam(name="searchValue",defaultValue="")String searchValue,
		HttpServletRequest req,
		Model model
		)throws Exception{
	
	if(req.getMethod().equalsIgnoreCase("GET")) {
		searchValue= URLDecoder.decode(searchValue, "UTF-8");
	}
	
	int rows=10;
	int total_page=0;
	int dataCount=0;
	
	Map<String, Object> map = new HashMap<>();
	map.put(searchKey, searchKey);
	map.put(searchValue, searchValue);
	
	dataCount=service.dataCount(map);
	if(dataCount!=0) {
		total_page=myUtil.pageCount(rows, dataCount);
	}
	
	/*if(current_page>total_page) {
		current_page=total_page;
	}*/
	
	int start=(current_page-1)*rows+1;	
	int end=current_page*rows;
	map.put("start", start);
	map.put("end", end);
	
	List<StudyWhere> list = service.listStudyWhere(map);
	
	int listNum, n=0;
	Iterator<StudyWhere> it = list.iterator();
	while(it.hasNext()) {
		StudyWhere dto = it.next();
		listNum=dataCount-(start+n-1);
		dto.setListNum(listNum);
		n++;
	}
	
	String query="";
	String listUrl, articleUrl;
	if(searchValue.length()!=0) {
		query="searchKey="+searchKey+"&searchValue="+URLEncoder.encode(searchValue,"UTF-8");
	}
	String cp = req.getContextPath();
	listUrl=cp+"/bbs/list";
	articleUrl=cp+"/bbs/article?page="+current_page;
	if(query.length()!=0) {
		listUrl +="?"+query;
		articleUrl+="&"+query;
	}
	
	String paging = myUtil.paging(current_page, total_page, listUrl);
	
	model.addAttribute("list",list);
	model.addAttribute("articleUrl",articleUrl);
	model.addAttribute("paging",paging);
	model.addAttribute("page", current_page);
	model.addAttribute("dataCount",dataCount);
	model.addAttribute("total_page",total_page);
	
	return ".studyboard.studywhere.list";
	}
	
	@RequestMapping(value="/studyboard/studywhere/created",method=RequestMethod.GET)
	public String createdForm(Model model,HttpSession session) throws Exception{

		model.addAttribute("mode","created");
		return ".studyboard.studywhere.created";
	}
	@RequestMapping(value="/studyboard/studywhere/created",method=RequestMethod.POST)
	public String createdSubmit(StudyWhere dto,HttpSession session)throws Exception {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
	
				dto.setUserId(info.getUserId());
				String root=session.getServletContext().getRealPath("/");
				
				String pathname=root+"uploads"+File.separator+"bbs";
				
				service.insertStudyWhere(dto, pathname);
		return "redirect:/studyboard/studywhere/list";
	}
	

	
	@RequestMapping(value="/community/report/article")
	public String article() {

		return ".help.report.article";
	}
}
