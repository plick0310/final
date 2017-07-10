package com.wooltari.studywhere;

import java.io.File;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wooltari.common.MyUtil;
import com.wooltari.member.SessionInfo;



@Controller("studyboard.studywhere.studywhereController")
public class StudywhereController {
	
	@Autowired
	private StudyWhereService service;
	
	@Autowired
	private MyUtil myUtil;
	

	
	@RequestMapping(value="/studyboard/studywhere/list")
	public String list(
		@RequestParam(name="page",defaultValue="1") int current_page,
		@RequestParam(name="searchKey",defaultValue="subject") String searchKey,
		@RequestParam(name="searchValue",defaultValue="")String searchValue,
		HttpServletRequest req,
		Model model
		)throws Exception{
	System.out.println("================================1"+searchValue);
	if(req.getMethod().equalsIgnoreCase("GET")) {
		searchValue= URLDecoder.decode(searchValue, "UTF-8");
	}
	System.out.println("================================2"+searchValue);
	int rows=10;
	int total_page=0;
	int dataCount=0;
	
	
	Map<String, Object> map = new HashMap<>();
	map.put("searchKey", searchKey);
	map.put("searchValue", searchValue);
	
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
	System.out.println("================================3"+searchValue);
	List<StudyWhere> list = service.listStudyWhere(map);

	
	
	int listNum, n=0;
	Iterator<StudyWhere> it = list.iterator();
	while(it.hasNext()) {
		StudyWhere dto = it.next();
		listNum=dataCount-(start+n-1);
		dto.setListNum(listNum);
		
		Pattern pattern  =  Pattern.compile("<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>");
		String content = dto.getContent();
		Matcher match = pattern.matcher(content);	
		String imgTag = null;
		if(match.find()){
		    imgTag = match.group(1);
		}
		dto.setContent(imgTag);
		
		n++;
	}
	System.out.println("================================4"+searchValue);
	
	List<StudyWhere> bestlist = service.bestStudyWhere(map);
	int bestlistNum, b=0;
	Iterator<StudyWhere> ite = bestlist.iterator();
	while(ite.hasNext()) {
		StudyWhere dto = ite.next();
		bestlistNum=b+1;
		dto.setBestlistNum(bestlistNum);
		Pattern pattern  =  Pattern.compile("<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>");
		String content = dto.getContent();
		Matcher match = pattern.matcher(content);	
		String imgTag = null;
		if(match.find()){
		    imgTag = match.group(1);
		}
		dto.setContent(imgTag);
		b++;
	}

	
	
	
	String query="";
	String listUrl, articleUrl;
	if(searchValue.length()!=0) {
		query="searchKey="+searchKey+"&searchValue="+URLEncoder.encode(searchValue,"UTF-8");
	}
	String cp = req.getContextPath();
	listUrl=cp+"/studyboard/studywhere/list";
	articleUrl=cp+"/studyboard/studywhere/article?page="+current_page;
	if(query.length()!=0) {
		listUrl +="?"+query;
		articleUrl+="&"+query;
	}
	
	String paging = myUtil.paging(current_page, total_page, listUrl);
	
	model.addAttribute("bestlist",bestlist);
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
		if(info==null){
			return "redirect:/member/login";
		}
				dto.setUserId(info.getUserId());
				String root=session.getServletContext().getRealPath("/");
				
				String pathname=root+"uploads"+File.separator+"studywhere";
				
				service.insertStudyWhere(dto, pathname);
		return "redirect:/studyboard/studywhere/list";
	}
	

	@RequestMapping(value="/studyboard/studywhere/article")
	public String article(
				@RequestParam int num,
				@RequestParam int page,
				@RequestParam(value="searchKey", defaultValue="subject") String searchKey,
				@RequestParam(value="searchValue", defaultValue="") String searchValue,
				Model model
			) throws Exception {
		
		searchValue=URLDecoder.decode(searchValue,"UTF-8");
		
		service.updateHitCount(num);
		StudyWhere dto = service.readStudyWhere(num);
/* #이제필요없음#	
	if(dto==null) {
			return "redirect:/bbs/list?page="+page;
		}
*/
		
	/*	dto.setContent(myUtil.htmlSymbols(dto.getContent()));*/
		
		// 이전글, 다음글
		Map<String, Object> map = new HashMap<>();
		map.put("num", num);
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		
		StudyWhere preReadDto = service.preReadStudyWhere(map);
		StudyWhere nextReadDto = service.nextReadStudyWhere(map);
		
		// 공감개수
		int countLikeBoard=service.countLikeStudyWhere(num);
		
		String query="page="+page;
		if(searchValue.length()!=0) {
			query+="&searchKey="+searchKey;
			query+="&searchValue="+URLEncoder.encode(searchValue,"UTF-8");
		}
		
		model.addAttribute("dto", dto);
		model.addAttribute("page", page);
		model.addAttribute("query", query);
		model.addAttribute("preReadDto", preReadDto);
		model.addAttribute("nextReadDto", nextReadDto);
		model.addAttribute("countLikeBoard", countLikeBoard);
		
		return ".studyboard.studywhere.article";
	}
	
	
	@RequestMapping(value="/studyboard/studywhere/insertLikeStudyWhere",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertLikeStudyWhere(StudyWhere dto, HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		String state="true";
		
		if(info==null) {
			state="loginFail";
		} else {
			dto.setUserId(info.getUserId());
			int result=service.insertLikeStudyWhere(dto);
			if(result==0) {
				state="false";
			}
		}
		
		int countLikeStudyWhere = service.countLikeStudyWhere(dto.getNum());
		
		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		model.put("countLikeStudyWhere", countLikeStudyWhere);
		return model;
	}
	
	@RequestMapping(value="/studyboard/studywhere/update", method=RequestMethod.GET)
	public String updateForm(
				@RequestParam int num,
				@RequestParam String page,
				Model model,
				HttpSession session
			) throws Exception {
		SessionInfo info=(SessionInfo) session.getAttribute("member");
/*		if(info==null) {
			return "redirect:/member/login";
		}*/
		
		StudyWhere dto = service.readStudyWhere(num);
		if(dto==null) {
			return "redirect:/studyboard/studywhere/list?page="+page;
		}
		if(! info.getUserId().equals(dto.getUserId())) {
			return "redirect:/studyboard/studywhere/list?page="+page;
		}
		model.addAttribute("dto",dto);
		model.addAttribute("mode", "update");
		model.addAttribute("page", page);
		
		return ".studyboard.studywhere.created";
	}
	
	@RequestMapping(value="/studyboard/studywhere/update",method=RequestMethod.POST)
	public String updateSubmit(
			StudyWhere dto,
				@RequestParam String page,
				HttpSession session) throws Exception {
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
	if(info==null) {
			return "redirect:/member/login";
		}
		
		

		service.updateStudyWhere(dto);
		
		return "redirect:/studyboard/studywhere/list?page="+page;
	}
	
	@RequestMapping(value="/studyboard/studywhere/deleteFile", method=RequestMethod.GET)
	public String deleteFile(
				@RequestParam int num,
				@RequestParam String page,
				HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
/*		if(info==null) {
			return "redirect:/member/login";
		}*/
		StudyWhere dto = service.readStudyWhere(num);
		if(dto==null) {
			return "redirect:/studyboard/studywhere/list?page="+page;
		}
		if(! info.getUserId().equals(dto.getUserId())) {
			return "redirect:/studyboard/studywhere/list?page="+page;
		}
		
	/*	String root = session.getServletContext().getRealPath("/");
		String pathname=root+File.separator+"uploads"+File.separator+"bbs";
		if(dto.getSaveFilename()!=null&&dto.getSaveFilename().length()!=0) {
			fileManager.doFileDelete(dto.getSaveFilename(), pathname);
			
			dto.setSaveFilename("");
			dto.setOriginalFilename("");
			service.updateBoard(dto, pathname);
		}*/
		return "redirect:/studyboard/studywhere/update?num="+num+"&page="+page;
	}
	
	@RequestMapping(value="/studyboard/studywhere/delete")
	public String delete(
				@RequestParam int num,
				@RequestParam String page,
				HttpSession session) throws Exception {
		SessionInfo info=(SessionInfo) session.getAttribute("member");
/*		if(info==null) {
			return "redirect:/member/login";
		}*/
		
		String root=session.getServletContext().getRealPath("/");
		String pathname=root+File.separator+"uploads"+File.separator+"bbs";
		
		service.deleteStudyWhere(num, pathname, info.getUserId());
		
		return "redirect:/studyboard/studywhere/list?page="+page;
	}
	
	

	@RequestMapping(value="/studyboard/studywhere/createdReply",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> createdReply(Reply dto, HttpSession session) throws Exception {
		SessionInfo info=(SessionInfo) session.getAttribute("member");
		
		String state="true";
			
			dto.setUserId(info.getUserId());
			int result=service.insertReply(dto);
			if(result==0) 
				state="false";
			
		
		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		return model;
	}
	
	@RequestMapping(value="/studyboard/studywhere/listReply")
	public String listReply(
			@RequestParam int num,
			@RequestParam(value="pageNo", defaultValue="1") int current_page,
			Model model
			) throws Exception {
		int rows = 5;
		int total_page=0;
		int dataCount=0;
		
		Map<String, Object> map = new HashMap<>();
		map.put("num", num);
		
		dataCount=service.replyDataCount(map);
		total_page=myUtil.pageCount(rows, dataCount);
		if(current_page>total_page) {
			current_page=total_page;
		}
		int start=(current_page-1)*rows+1;
		int end=current_page*rows;
		map.put("start", start);
		map.put("end", end);
		
		List<Reply> list = service.listReply(map);
		
		Iterator<Reply> it = list.iterator();
		while(it.hasNext()) {
			Reply vo = it.next();
			vo.setContent(myUtil.htmlSymbols(vo.getContent()));
		}
		
		
		String paging=myUtil.paging(current_page, total_page);
		
		model.addAttribute("list",list);
		model.addAttribute("paging",paging);
		model.addAttribute("pageNo", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		
		// .bb.listReply라고 주게되면 출력화면이 뒤죽박죽이 되버린다.
		return "/studyboard/studywhere/listReply"; // 포워딩
	}
	
	@RequestMapping(value="/studyboard/studywhere/deleteReply",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteReply(
			@RequestParam int reNum,
			@RequestParam String mode,
			HttpSession session) throws Exception {
		SessionInfo info=(SessionInfo) session.getAttribute("member");
		String state="true";
		
		if(info==null) {
			state="loginFail";
		} else {
			Map<String, Object> map = new HashMap<>();
			map.put("reNum", reNum);
			map.put("mode",mode);
			service.deleteReply(map);
			
		}
		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		return model;
		
	}
	
}
