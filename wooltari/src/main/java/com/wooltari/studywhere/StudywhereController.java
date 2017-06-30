package com.wooltari.studywhere;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("studyboard.studywhere.studywhereController")
public class StudywhereController {
	
	@RequestMapping(value="/studyboard/studywhere/list")
	public String list() {

		return ".studyboard.studywhere.list";
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
