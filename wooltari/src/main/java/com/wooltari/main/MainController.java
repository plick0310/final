package com.wooltari.main;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller("mainController")
public class MainController {
	 
	@Autowired
	private MainService mservice;
	
	@RequestMapping(value="/main", method=RequestMethod.GET)
	public String method(Model model) {
		
		CountMain dto = mservice.countMain();
		System.out.println(dto.getCount_study());
		System.out.println(dto.getCount_member());
		System.out.println(dto.getCount_category());
		
		model.addAttribute("dto", dto);
		return "/main/main";
	}
	@RequestMapping(value="/msg", method=RequestMethod.GET)
	public String msg(@RequestParam String msg, Model model) {
		
		model.addAttribute("message", msg);
		return "main/msg";
	}
	
}