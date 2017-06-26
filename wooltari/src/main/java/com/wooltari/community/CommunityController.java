package com.wooltari.community;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("community.exam.communityController")
public class CommunityController {
	
	@RequestMapping(value="/community/exam/list")
	public String list() {

		return ".community.exam.list";
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
