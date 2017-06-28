package com.wooltari.myStudy;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("study.mystudy.myStudyController")
public class MyStudyController {
	
	@RequestMapping(value="/study/myStudy/list")
	public String list() {

		return ".study.myStudy.list";
	}
	
/*	@RequestMapping(value="/community/report/created")
	public String article() {

		return ".help.report.created";
	}
	
	@RequestMapping(value="/community/report/article")
	public String created() {

		return ".help.report.article";
	}*/
}
