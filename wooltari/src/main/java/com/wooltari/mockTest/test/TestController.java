package com.wooltari.mockTest.test;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wooltari.common.MyUtil;

@Controller("nockTest.testController")
public class TestController {
	@Autowired
	private TestService service;
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value = "/nockTest/test/list")
	public String list() throws Exception {
		
		return "nockTest/test/list";
	}
}
