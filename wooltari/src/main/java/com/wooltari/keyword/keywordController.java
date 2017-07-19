package com.wooltari.keyword;

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
import org.springframework.web.bind.annotation.RequestParam;

import com.wooltari.common.MyUtil;
import com.wooltari.member.SessionInfo;


@Controller("study.keywordController")
public class keywordController {
	
	@Autowired
	private MyUtil myUtil;
	
	@Autowired
	private keywordService service;
	
	//3개만 출력
	@RequestMapping("/keyword/search")
	public String UnionList(
			@RequestParam String keyword
			,Model model
			)throws Exception{
		
		int start=1;
		int end=3;
		
		Map<String, Object> map=new HashMap<>();
		map.put("keyword", keyword);
		
		int studyCount=service.studyCount(map);
		int promoteCount=service.PromoteCount(map);
		
		System.out.println(promoteCount+"갯수");
		
		map.put("start", start);
		map.put("end", end);
		
		List<StudyInfo> list= service.studyList(map);
		List<Promote> promoteList=service.PromoteList(map);
		
		
		
		model.addAttribute("keyword",keyword);
		
		model.addAttribute("list",list);
		model.addAttribute("studyCount",studyCount);
		
		model.addAttribute("promoteList",promoteList);
		model.addAttribute("promoteCount",promoteCount);
		
	

		
		return ".keywordSearch.union";
	}
	
	@RequestMapping("/keyword/studySearch")
	public String StudyList(
			@RequestParam String keyword
			,@RequestParam(value="page",defaultValue="1")int currentPage
			,Model model
			,HttpServletRequest req
			)throws Exception{
	
		int rows=10;
		int total_page;
		int studyCount;
		
		Map<String, Object> map=new HashMap<>();
		map.put("keyword", keyword);
		
		studyCount=service.studyCount(map);
		total_page=myUtil.pageCount(rows, studyCount);
		
		if(currentPage>total_page)
			currentPage=total_page;
		
		int start=(currentPage-1)*rows+1;
		int end=currentPage*rows;
		
		map.put("start", start);
		map.put("end", end);
		
		List<StudyInfo>list=service.allStudyList(map);
		
		int listNum,n=0;
		Iterator<StudyInfo> it=list.iterator();
		while(it.hasNext()){
			StudyInfo dto=(StudyInfo)it.next();
			listNum=studyCount-(start+n-1);
			dto.setListNum(listNum);
			
			n++;
		}
		
		String paging=myUtil.paging(currentPage, total_page);

		
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		model.addAttribute("studyCount", studyCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("page", currentPage);
		
		return ".keywordSearch.allStudy";
	}
	
	@RequestMapping("/keyword/promoteSearch")
	public String promoteList(
			@RequestParam String keyword
			,@RequestParam(value="page",defaultValue="1")int currentPage
			,Model model
			,HttpServletRequest req
			)throws Exception{
		
		
		int rows=10;
		int total_page;
		int dataCount;
		
		Map<String, Object> map=new HashMap<>();
		map.put("keyword", keyword);
		
		dataCount=service.PromoteCount(map);
		total_page=myUtil.pageCount(rows, dataCount);
		
	
		if(currentPage>total_page)
			currentPage=total_page;
		
		int start=(currentPage-1)*rows+1;
		int end=currentPage*rows;
		
		map.put("start", start);
		map.put("end", end);
		
		List<Promote>list=service.allPromoteList(map);
		
		int listNum,n=0;
		Iterator<Promote> it=list.iterator();
		while(it.hasNext()){
			Promote dto=(Promote)it.next();
			listNum=dataCount-(start+n-1);
			dto.setListNum(listNum);
			
			n++;
		}
		
		String paging=myUtil.paging(currentPage, total_page);
		

		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("page", currentPage);
		
		return ".keywordSearch.allPromote";
	}
	
	
	
	
}
