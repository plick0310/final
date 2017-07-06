package com.wooltari.myStudy;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.wooltari.study.StudyInfo;
import com.wooltari.study.StudyService;

@Controller("study.mystudy.myStudyController")
public class MyStudyController {
	@Autowired
	private StudyService service;
	
	/*@RequestMapping(value="/study/myStudy/home/{S_num}")
	public String list(Model model , @RequestParam String s_num) {
		
		//StudyInfo dto = service.
		
		//model.addAttribute("dto",dto);
		return ".study.myStudy.home";
	}
	*/
/*	@RequestMapping(value="/study/myStudy/calender")
	public String calender() {

		return "/study/myStudy/calender";
	}
	@RequestMapping(value="/study/myStudy/s_member")
	public String s_member() {

		return "/study/myStudy/s_member";
	}
	@RequestMapping(value="/study/myStudy/chating")
	public String chating() {

		return "/study/myStudy/chating";
	}*/
	
	
/*	@RequestMapping(value="/community/report/created")
	public String article() {

		return ".help.report.created";
	}
	
	@RequestMapping(value="/community/report/article")
	public String created() {

		return ".help.report.article";
	}*/
}
