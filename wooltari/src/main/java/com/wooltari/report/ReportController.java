package com.wooltari.report;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("report.ReportController")
public class ReportController {
	
	@RequestMapping(value="/customer/report/list")
	public String list() {

		return ".customer.report.list";
	}
	
	/*@RequestMapping(value="/help/report/created")
	public String article() {

		return ".help.report.created";
	}
	
	@RequestMapping(value="/help/report/article")
	public String created() {

		return ".help.report.article";
	}*/
}
