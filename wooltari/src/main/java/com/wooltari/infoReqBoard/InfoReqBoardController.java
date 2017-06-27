package com.wooltari.infoReqBoard;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller("download.infoReqBoard.infoReqBoardController")
public class InfoReqBoardController {	
		
		@RequestMapping(value="/download/infoReqBoard/list")
		public String list() {

			return ".download.infoReqBoard.list";
		}
		
		@RequestMapping(value="/download/infoReqBoard/created")
		public String article() {

			return ".download.infoReqBoard.created";
		}
		
		@RequestMapping(value="/download/infoReqBoard/article")
		public String created() {

			return ".download.infoReqBoard.article";
		}	

	}

