package com.wooltari.keyword;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		
		return ".keywordSearch.union";
	}
}
