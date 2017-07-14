package com.wooltari.study.search;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("study.search.SearchController")
public class SearchController {
	@Autowired
	private SearchService service;

	@RequestMapping(value="/study/search", method=RequestMethod.GET)
	public String search(Model model, HttpSession session)throws Exception {
		
		
		return ".studysearch.search";
	}
	
	@RequestMapping(value="/study/search2", method=RequestMethod.GET)
	public String search2(Model model, HttpSession session)throws Exception {
		
		
		return ".studysearch.search2";
	}
}
