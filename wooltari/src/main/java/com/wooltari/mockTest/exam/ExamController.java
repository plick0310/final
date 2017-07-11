package com.wooltari.mockTest.exam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wooltari.common.MyUtil;

@Controller("mockTest.testController")
public class ExamController {
	@Autowired
	private ExamService service;
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value = "/mockTest/test/list")
	public String list() throws Exception {
		
		return "mockTest/test/";
	}
}
