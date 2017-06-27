package com.wooltari.downloadBoard;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller("download.downloadBoard.downloadBoardController")
public class DownloadBoardController {	
		
		@RequestMapping(value="/download/downloadBoard/list")
		public String list() {

			return ".download.downloadBoard.list";
		}
		
		@RequestMapping(value="/download/downloadBoard/created")
		public String article() {

			return ".download.downloadBoard.created";
		}
		
		@RequestMapping(value="/download/downloadBoard/article")
		public String created() {

			return ".download.downloadBoard.article";
		}	

	}

