package com.wooltari.promote;

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
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.wooltari.common.MyUtil;
import com.wooltari.member.SessionInfo;

@Controller("study.promoteController")
public class PromoteController {
	@Autowired
	private PromoteService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping("/promote/list")
	public String list(
			@RequestParam(value="page", defaultValue="1")int currentPage,
			@RequestParam(value="searchKey",defaultValue="subject") String searchKey,
			@RequestParam(value="searchValue", defaultValue="")String searchValue,
			Model model,HttpServletRequest req
			)throws Exception{
		
		String cp=req.getContextPath();
		
		int rows=10;
		int total_page;
		int dataCount;
		
		if(req.getMethod().equalsIgnoreCase("GET")){
			searchValue=URLDecoder.decode(searchValue,"utf-8");
		}
		
		Map<String, Object>map=new HashMap<String,Object>();
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		
		dataCount=service.dataCount(map);
		total_page=myUtil.pageCount(rows, dataCount);
		
		if(currentPage>total_page)
			currentPage=total_page;
		
		int start=(currentPage-1)*rows+1;
		int end=currentPage*rows;
		
		map.put("start", start);
		map.put("end", end);
		
		List<Promote> list=service.listBoard(map);
		
		//글번호
		int listNum,n =0;
		Iterator<Promote> it=list.iterator();
		while(it.hasNext()){
			Promote dto=it.next();
			listNum=dataCount-(start+n-1);
			dto.setListNum(listNum);
			n++;
		}
		
		String query="";
		String listUrl=cp+"/promote/list";
		String articleUrl=cp+"/promote/article?page="+currentPage;
		
		if(searchValue.length()!=0){
			query="searchKey="+searchKey+"&searchValue="+URLEncoder.encode(searchValue,"utf-8");
		}
		
		if(query.length()!=0){
			listUrl=cp+"/promote/list?"+query;
			articleUrl=cp+"/promote/article?page="+currentPage+"&"+query;
		}
		
		String paging=myUtil.paging(currentPage, total_page, listUrl);
		
		model.addAttribute("list", list);
		model.addAttribute("paging",paging);
		model.addAttribute("dataCount",dataCount);
		model.addAttribute("total_page",total_page);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("page", currentPage);
		
		return ".study.promote.list";
	}
	
	
	@RequestMapping(value="/promote/created",method=RequestMethod.GET )
	public String promoteCreatedForm(
			Model model,HttpSession session)throws Exception{
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		if(info==null)
			return "redirect:/main";
		
		
		return "/study/promote/created";
	}
	
	@RequestMapping(value="/promote/created",method=RequestMethod.POST )
	public String promoteCreatedSubmit(Promote dto,Model model,HttpSession session) throws Exception{
		
		
		String root=session.getServletContext().getRealPath("/");
		String pathname=root+File.separator+"uploads"+File.separator+"photo";
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		if(info==null)
			return "redirect:/main";
		
		dto.setUserId(info.getUserId());
		
		model.addAttribute("dto", dto);
		
		service.insertBoard(dto, pathname);
		
		
		return ".study.promote.list";
	}
	
}
