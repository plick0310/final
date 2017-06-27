package com.wooltari.studyMarketBoard;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller("studyMarket.studyMarketBoard.studyMarketBoardController")
public class StudyMarketBoardController {	
		
		@RequestMapping(value="/studyMarket/studyMarketBoard/list")
		public String list() {

			return ".studyMarket.studyMarketBoard.list";
		}
		
		@RequestMapping(value="/studyMarket/studyMarketBoard/created")
		public String article() {

			return ".studyMarket.studyMarketBoard.created";
		}
		
		@RequestMapping(value="/studyMarket/studyMarketBoard/article")
		public String created() {

			return ".studyMarket.studyMarketBoard.article";
		}	

	}

