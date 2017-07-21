package com.wooltari.promote;

import java.io.File;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
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
import org.springframework.web.bind.annotation.ResponseBody;

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
		 Date endDate = new Date();
	     long gap;
	        
		int listNum,n =0;
		
		Iterator<Promote> it=list.iterator();
		while(it.hasNext()){
			Promote dto=(Promote)it.next();
			listNum=dataCount-(start+n-1);
			dto.setListNum(listNum);
			
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	        Date beginDate = formatter.parse(dto.getCreated());
			
	        
			gap=(endDate.getTime() - beginDate.getTime()) / (60*60* 1000);
            dto.setGap(gap);
            
            dto.setCreated(dto.getCreated().substring(0, 10));
            
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
		
		return ".studyboard.promote.list";
	}
	
	
	@RequestMapping(value="/promote/created",method=RequestMethod.GET )
	public String promoteCreatedForm(
			Model model,HttpSession session)throws Exception{
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		if(info==null)
			return "redirect:/main";
		
		Map<String, Object> map=new HashMap<>();
		map.put("userId", info.getUserId());
		List<Promote> list=service.pushStudy(map);
		
		model.addAttribute("list",list);
		model.addAttribute("mode","created");
		
		return ".studyboard.promote.created";
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
		
		return "redirect:/promote/list";
	}
	
	@RequestMapping(value="/promote/article")
	public String article(
				@RequestParam(value="num") int num,
				@RequestParam(value="page") String page,
				@RequestParam(value="searchKey",defaultValue="subject") String searchKey,
				@RequestParam(value="searchValue",defaultValue="") String searchValue,
				Model model, HttpSession session
			)throws Exception{
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		if(info==null)
			return "redirect:/main";
		
		service.updateHitCount(num);
		
		Promote dto=service.readBoard(num);
		if(dto==null)
			return "redirect:/promote/list?page="+page;
		
		dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
		
		String query = "page="+page;
		if(searchValue.length()!=0) {
			query += "&searchKey=" + searchKey + 
		              "&searchValue=" + URLEncoder.encode(searchValue, "utf-8");
		}
		
		//model 스프링, map은 자바. 어떤거든 상관없음
		model.addAttribute("dto", dto);
		model.addAttribute("query", query);
		model.addAttribute("page", page);
		
		return ".studyboard.promote.article";
	}
	
	@RequestMapping(value="/keyword/promote/article")
	public String article(
				@RequestParam(value="num") int num,
				Model model, HttpSession session
			)throws Exception{
		
	/*	SessionInfo info=(SessionInfo)session.getAttribute("member");
		if(info==null)
			return "redirect:/main";*/
		
		service.updateHitCount(num);
		
		Promote dto=service.readBoard(num);
		
		dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
			
		//model 스프링, map은 자바. 어떤거든 상관없음
		model.addAttribute("dto", dto);

		
		return ".studyboard.promote.article";
	}
	
	@RequestMapping(value="/promote/updateBoard", method=RequestMethod.GET)
	public String updateBoard(
			@RequestParam int num,
			HttpSession session,
			Model model
			)throws Exception{
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		if(info==null){
			return "redirect:/main";
		}
		
		Map<String, Object> map=new HashMap<>();
		map.put("userId", info.getUserId());
		List<Promote> list=service.pushStudy(map);
		
		Promote dto=service.readBoard(num);
		
		model.addAttribute("list",list);
		model.addAttribute("dto",dto);
		model.addAttribute("mode", "update");
		model.addAttribute("num",num);
		
		return ".studyboard.promote.created";
	}
	
	@RequestMapping(value="/promote/updateBoard",method=RequestMethod.POST)
	public String updateSubmit(
			Promote dto
			)throws Exception{
		
		int result;
		result=service.updateBoard(dto);
		System.out.println(result+"출력!!");
		
		return "redirect:/promote/list";
	}
	
	
	
	@RequestMapping(value="/promote/delete")
	public String delete(
			@RequestParam int num,
			@RequestParam String page,
			HttpSession session
			)throws Exception{
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		if(info==null)
			return "redirect:/main";
		
		String root=session.getServletContext().getRealPath("/");
		String pathname=root+File.separator+"uploads"+File.separator+"photo";
		
		Promote dto=service.readBoard(num);
		
		service.deleteBoard(num, dto.getImageFileName(), pathname);
		
		return "redirect:/promote/list?page="+page;
	}
	
	@RequestMapping(value="promote/insertReply",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertReply(
			PromoteReply dto,
			HttpSession session
			)throws Exception{
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		String state="true";
		if(info==null){
			state="loginFail";
		}else{
			dto.setUserId(info.getUserId());
			int result=service.insertReply(dto);
			if(result==0)
				state="false";
		}
			
		Map<String, Object> model=new HashMap<>();
		model.put("state", state);
	
		return model;
	}
	
	
	@RequestMapping(value="promote/listReply")
	public String listReply(
			@RequestParam(value="num") int num,
			@RequestParam(value="pageNo",defaultValue="1") int current_page,
			Model model
			)throws Exception{
		
		int rows=3;
		int total_page=0;
		int dataCount=0;
		
		Map<String, Object> map=new HashMap<String,Object>();
		map.put("num", num);
		
		dataCount=service.replyDataCount(map);
		total_page=myUtil.pageCount(rows, dataCount);
		if(current_page>total_page)
			current_page=total_page;
		
		int start=(current_page-1)*rows+1;
		int end=current_page*rows;
		map.put("start", start);
		map.put("end", end);
		List<PromoteReply> listReply=service.listReply(map);
		
		Iterator<PromoteReply> it=listReply.iterator();
		int listNum,n=0;
		while(it.hasNext())
		{
			PromoteReply dto=it.next();
			listNum=dataCount-(start+n-1);
			dto.setListNum(listNum);
			dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
			n++;
		}
		
		String paging=myUtil.paging(current_page, total_page);

		model.addAttribute("dataCount",dataCount);
		model.addAttribute("listReply",listReply);
		model.addAttribute("pageNo",current_page);
		model.addAttribute("total_page",total_page);
		model.addAttribute("paging",paging);
		
		return "studyboard/promote/listReply";
	}
	
	@RequestMapping(value="/promote/deleteReply",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteReply(
			@RequestParam int prNum,
			@RequestParam int page,
			HttpSession session
			){
		String state="true";
		
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		if(info==null){
			state="loginFail";
		}else {
			Map<String, Object>map=new HashMap<String,Object>();
			map.put("prnum", prNum);
			int result=service.deleteReply(map);
			
			if(result==0)
				state="false";
		}
		
		Map<String, Object>model=new HashMap<>();
		model.put("state", state);
		
		return model;
	}
	

}
