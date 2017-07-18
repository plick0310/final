package com.wooltari.keyword;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.wooltari.common.MyUtil;

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
		
		int dataCount=service.studyCount(map);
		
		map.put("start", start);
		map.put("end", end);
		
		List<StudyInfo> list= service.studyList(map);
		
		model.addAttribute("list",list);
		model.addAttribute("dataCount",dataCount);
		model.addAttribute("keyword",keyword);
		
		return ".keywordSearch.union";
	}
	
	@RequestMapping("/keyword/studySearch")
	public String StudyList(
			@RequestParam String keyword
			,@RequestParam(value="page",defaultValue="1")int currentPage
			,Model model
			,HttpServletRequest req
			)throws Exception{
		
		String cp=req.getContextPath();
		
		int rows=10;
		int total_page;
		int dataCount;
		
		Map<String, Object> map=new HashMap<>();
		map.put("keyword", keyword);
		
		dataCount=service.studyCount(map);
		total_page=myUtil.pageCount(rows, dataCount);
		
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
			listNum=dataCount-(start+n-1);
			dto.setListNum(listNum);
			
			n++;
		}
		
		String paging=myUtil.paging(currentPage, total_page);
		
		String query=cp+"/study/myStudy/home/";
		
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("query", query);
		model.addAttribute("page", currentPage);
		
		return ".keywordSearch.allStudy";
	}
}
