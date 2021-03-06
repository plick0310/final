package com.wooltari.review;

import java.io.File;
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
import com.wooltari.promote.Promote;
import com.wooltari.study.StudyCategory;
import com.wooltari.study.StudyService;

@Controller("study.reviewController")
public class ReviewController {
	
	@Autowired
	private ReviewService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@Autowired
	private StudyService studyService;
	
	@RequestMapping("/review/list")
	public String reviewList(
			@RequestParam(value="page", defaultValue="1")int currentPage,
			Model model,
			HttpServletRequest req
			)throws Exception{
		
		String cp=req.getContextPath();
		
		
		int rows=12;
		int total_page;
		int dataCount;
		
		dataCount=service.dataCount();
		total_page=myUtil.pageCount(rows, dataCount);
		
		if(currentPage>total_page)
			currentPage=total_page;
		
		int start=(currentPage-1)*rows+1;
		int end=currentPage*rows;
		
		Map<String, Object>map=new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		
		List<Review> list=service.listBoard(map);
		
		int listNum,n=0;
		
		Iterator<Review> it=list.iterator();
		while(it.hasNext()){
			Review dto=it.next();
			listNum=dataCount-(start+n-1);
			dto.setListNum(listNum);
			n++;
			List<StudyCategory> categoryList = studyService.readMyCategory(dto.getS_num());
			dto.setListCategory(categoryList);
			
		}
		
		String listUrl=cp+"/review/list";
		
		String paging=myUtil.paging(currentPage, total_page, listUrl);
		
		
		model.addAttribute("list", list);
		model.addAttribute("paging",paging);
		model.addAttribute("dataCount",dataCount);
		model.addAttribute("total_page",total_page);
		model.addAttribute("page", currentPage);
		
		return ".studyboard.review.list"; 
	}
	
	@RequestMapping(value="/review/created", method=RequestMethod.GET)
	public String createdForm(Model model, HttpSession session)throws Exception{
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		Map<String, Object> map=new HashMap<>();
		map.put("userId", info.getUserId());
		List<Review> list=service.pushStudy(map);
		
		model.addAttribute("list",list);
		return ".studyboard.review.created";
	}
	
	@RequestMapping(value="/review/created", method=RequestMethod.POST)
	public String createdSubmit(
				Review dto,Model model,HttpSession session
			)throws Exception{
		String root=session.getServletContext().getRealPath("/");
		String pathname=root+File.separator+"uploads"+File.separator+"review";
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		
		

		dto.setUserId(info.getUserId());
		
		model.addAttribute("dto", dto);
		
		service.insertBoard(dto, pathname);
		
		return "redirect:/review/list";
	}
	
	@RequestMapping("/review/article")
	public String readArticle(
			@RequestParam int num,
			@RequestParam(value="page") String page,
			Model model
			)throws Exception{
		
		Review dto=service.readBoard(num);
		service.updateHitCount(num);
		
		int star=service.readStar(num);
		int many=service.manyStar(num);
		
		model.addAttribute("dto", dto);
		model.addAttribute("star",star);
		model.addAttribute("many",many);
		model.addAttribute("page",page);
		
		return "studyboard/review/article";
	}
	
	@RequestMapping(value="/review/insertStar",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertStar(
			Review dto,HttpSession session			
			)throws Exception{
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		String state="true";
		
		if(info==null){
			
			state="loginFail";
			
		}else{
			
			dto.setNum(dto.getNum());
			dto.setStar(dto.getStar());
			dto.setUserId(info.getUserId());
			int result=service.insertStar(dto);
			
			if(result==0)
				state="false";
		}
		
		Map<String, Object> model=new HashMap<>();
		model.put("state", state);
		

		return model;
	}
	
	@RequestMapping(value="/review/countStar",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> countStar(
			@RequestParam(value="num") int num)throws Exception{
		
		String state="true";
		int countStar=service.readStar(num);
		int manyStar=service.manyStar(num);
		
		Map<String, Object> model=new HashMap<>();
		model.put("state", state);
		model.put("countStar", countStar);
		model.put("manyStar", manyStar);
		
		return model;
	}
	
	@RequestMapping(value="/review/delete")
	public String deleteBoard(
			@RequestParam(value="num") int num,
			@RequestParam String page,
			HttpSession session			
			)throws Exception{
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		
		Review dto=service.readBoard(num);
		if(dto==null){
			return "redircet:/review/list?page="+page;
			
		}
		if(! info.getUserId().equals(dto.getUserId()) && ! info.getUserId().equals("admin")) {
			return "redirect:/bbs/list?page="+page;
		}
		
		String root=session.getServletContext().getRealPath("/");
		String pathname=root+File.separator+"uploads"+File.separator+"photo";
		
		service.deleteBoard(num, dto.getImageFileName(), pathname);
			
		
		return "redirect:/review/list?page="+page;

	}
	
	@RequestMapping(value="/review/cal")
	public String cal(){
		return ".studyboard.review.cal";
	}
	  
	
	@RequestMapping(value="/keyword/review/article")
	public String article(
				@RequestParam(value="num") int num,
				Model model, HttpSession session
			)throws Exception{
		
	/*	SessionInfo info=(SessionInfo)session.getAttribute("member");
		if(info==null)
			return "redirect:/main";*/
		
		service.updateHitCount(num);
		
		Review dto=service.readBoard(num);
		
		dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
			
		//model 스프링, map은 자바. 어떤거든 상관없음
		model.addAttribute("dto", dto);

		
		return "studyboard/review/article";
	}
}
