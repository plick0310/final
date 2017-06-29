package com.wooltari.infoReqBoard;

import java.io.File;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


import com.wooltari.member.SessionInfo;



@Controller("infoReqBoard.InfoReqBoardController")
public class InfoReqBoardController {	
	
	@Autowired
	private InfoReqBoardService service;
	

		
		@RequestMapping(value="/download/infoReqBoard/list")
		public String list() {

			return ".download.infoReqBoard.list";
		}
		
		@RequestMapping(value="/download/infoReqBoard/article")
		public String article() {

			return ".download.infoReqBoard.article";
		}
		
		@RequestMapping(value="/download/infoReqBoard/created", method=RequestMethod.GET)
		public String createdForm(Model model, HttpSession session)throws Exception {
			model.addAttribute("mode","created");			

			return ".download.infoReqBoard.created";
		}
		
		@RequestMapping(value="/download/infoReqBoard/created", method=RequestMethod.POST)
		public String createdSubmit(InfoReqBoard dto,	HttpSession session) throws Exception {
			
			SessionInfo info=(SessionInfo)session.getAttribute("member");
			
			String root=session.getServletContext().getRealPath("/");
			String pathname=root+File.separator+"uploads"+File.separator+"infoReqBoard";
			
			dto.setUserId(info.getUserId());			
			service.insertBoard(dto, pathname);
			
			return "redirect:/download/infoReqBoard/list";
		}
		@RequestMapping(value="/download/infoReqBoard/update", method=RequestMethod.GET)
		public String updateForm(@RequestParam int num, @RequestParam String page,
				Model model, HttpSession session) throws Exception {
			
			return ".download.infoReqBoard.created";
	}
		@RequestMapping(value="/download/infoReqBoard/update", method=RequestMethod.POST)
		public String udpateSubmit(InfoReqBoard dto, @RequestParam String page,
				HttpSession session) throws Exception {

			return "redirect:/download/list?page="+page;
		}
	//첨부 파일 추가....................................................
		
		
}
