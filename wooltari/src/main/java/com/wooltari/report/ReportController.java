package com.wooltari.report;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("help.report.reportController")
public class ReportController {
	
	@RequestMapping(value="/help/report/list")
	public String list() {

		return ".help.report.list";
	}
	
	@RequestMapping(value="/help/report/created")
	public String article() {

		return ".help.report.created";
	}
	
	@RequestMapping(value="/help/report/article")
	public String created() {

		return ".help.report.article";
	}
}
