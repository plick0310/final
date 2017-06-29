package com.wooltari.promoteList;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("study.promoteList.promoteListController")
public class PromoteListController {
	
	@RequestMapping(value="/study/promoteList/list")
	public String list() {

		return ".study.promoteList.list";
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
