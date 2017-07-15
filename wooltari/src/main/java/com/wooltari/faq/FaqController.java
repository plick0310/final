package com.wooltari.faq;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wooltari.common.MyUtil;

@Controller("faq.FaqController")
public class FaqController {
	
	@Autowired
	private FaqService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value="/customer/faq/list")
	public String list()throws Exception{
		
		return ".customer.faq.list";
		
	}
	
	@RequestMapping(value="/customer/faq/created")
	public String created()throws Exception{
		
		return ".customer.faq.created";
	}
	
	@RequestMapping(value="/customer/faq/article")
	public String article()throws Exception{
		
		return ".customer.faq.article";
	}
	
	
	
}
