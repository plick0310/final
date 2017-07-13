package com.wooltari.notice;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.wooltari.common.FileManager;
import com.wooltari.common.MyUtil;
import com.wooltari.member.SessionInfo;

@Controller("notice.NoticeController")
public class NoticeController {
	@Autowired
	private NoticeService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@Autowired
	private FileManager fileManager;

	@RequestMapping(value="/customer/notice/created", method=RequestMethod.GET)
	public String createdForm(
			Model model, HttpSession session
			)throws Exception{
		
		model.addAttribute("mode", "created");
		return ".customer.notice.created";
	}
	
	@RequestMapping(value="/customer/notice/created", method=RequestMethod.POST)
	public String createdSubmit(
			Notice dto, HttpSession session
			) throws Exception{
		SessionInfo info= (SessionInfo)session.getAttribute("member");
		if(!info.getUserId().equals("admin")){
			return "redirect:/customer/notice/list";
		}
		
		//파일저장
		String root= session.getServletContext().getRealPath("/");
		//getRealPath("/"); 는 webapp폴더까지를 의미한다.
		String pathname= root+File.separator +"uploads" + File.separator + "notice";
		
		dto.setUserId(info.getUserId());
		service.insertNotice(dto, pathname);
		
		return "redirect:/customer/notice/list";
	}
	
	@RequestMapping(value="/customer/notice/list")
	public String list(
			@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(value="searchKey", defaultValue="subject") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			Model model,
			HttpServletRequest req
			) throws Exception{
		String cp= req.getContextPath();
		
		
		
		return ".customer.notice.list";
	}
}
