package com.wooltari.promote;

import java.io.File;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wooltari.common.MyUtil;
import com.wooltari.member.SessionInfo;

@Controller("study.promoteController")
public class PromoteController {
	@Autowired
	private PromoteService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping("/promote/list")
	public String list(){
		
		
		return "/study/promote/list";
	}
	
	
	@RequestMapping(value="/promote/created",method=RequestMethod.GET )
	public String promoteCreatedForm(
			Model model,HttpSession session)throws Exception{
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		if(info==null)
			return "redirect:/main";
		
		
		return "/study/promote/created";
	}
	
	@RequestMapping(value="/promote/created",method=RequestMethod.POST )
	public String promoteCreatedSubmit(Promote dto,Model model,HttpSession session) throws Exception{
		
		
		String root=session.getServletContext().getRealPath("/");
		String pathname=root+File.separator+"uploads"+File.separator+"photo";
		
		
		service.insertBoard(dto, pathname);
		
		
		return "/study/promote/list";
	}
}
