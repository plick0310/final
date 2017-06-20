package com.wooltari.bbs;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("bbs.boardController")
public class BoardController {
	
	@RequestMapping(value="/bbs/list")
	public String list() {

		return ".bbs.list";
	}
	
	@RequestMapping(value="/bbs/article")
	public String article() {

		return ".bbs.article";
	}
	
	@RequestMapping(value="/bbs/created")
	public String created() {

		return ".bbs.created";
	}
}
