package com.wooltari.study.search;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller("study.search.SearchController")
public class SearchController {
	@Autowired
	private SearchService service;
	
}
