package com.wooltari.playZone;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wooltari.member.SessionInfo;



@Controller("community.playZone.playZoneController")
public class PlayZoneController {
	
	@Autowired
	private PlayZoneService service;
	
	@RequestMapping(value="/community/playZone/home")
	public String list( 
			Model model,HttpSession session
			)throws Exception{
	
		
	SessionInfo info=(SessionInfo)session.getAttribute("member");
		System.out.println(info);
		if(info==null)
			return "redirect:/main";
		
		Map<String, Object> map=new HashMap<>();
		map.put("userId", info.getUserId());
		List<PlayZone> list=service.pointlist(map);
		
		model.addAttribute("list",list);
	
		
	return ".community.playZone.home";
	}
	
	
	
}
