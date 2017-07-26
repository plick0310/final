package com.wooltari.main;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller("mainController")
public class MainController {
	 
	@RequestMapping(value="/main", method=RequestMethod.GET)
	public String method() {
		return "/main/main";
	}
	@RequestMapping(value="/msg", method=RequestMethod.GET)
	public String msg(@RequestParam String msg, Model model) {
		
		model.addAttribute("message", msg);
		return "main/msg";
	}
	
}