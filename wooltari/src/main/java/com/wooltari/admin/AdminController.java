package com.wooltari.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("admin.adminController")
public class AdminController {
	@Autowired
	private AdminService service;
	
	@RequestMapping(value="/admin/index", method=RequestMethod.GET)
	public String adminIndex(){
		return "admin/index";
	}
	@RequestMapping(value="/admin/dashboard", method=RequestMethod.GET)
	public String adminDashBoard(){
		return "admin/dashboard";
	}
	
	@RequestMapping(value="/admin/member", method=RequestMethod.GET)
	public String adminMember(){
		return "admin/member";
	}
}
