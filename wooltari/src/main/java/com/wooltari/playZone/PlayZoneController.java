package com.wooltari.playZone;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wooltari.member.SessionInfo;
import com.wooltari.point.PointService;



@Controller("community.playZone.playZoneController")
public class PlayZoneController {
	//컨트롤러 상단에 PointService 선언
    @Autowired
    private PointService pservice;
	
	@Autowired
	private PlayZoneService service;
	
	@RequestMapping(value="/community/playZone/home")
	public String list( 

			Model model,HttpSession session
			)throws Exception{
	
		int point = 0;
		String userId,userName;
		
	SessionInfo info=(SessionInfo)session.getAttribute("member");

		if(info==null)
			return "redirect:/member/login";
		Map<String, Object> map=new HashMap<>();
		map.put("userId", info.getUserId());
		point=service.pointlist(map);
		
		userId = info.getUserId();
		userName = info.getUserName();
		
		model.addAttribute("point",point);
		model.addAttribute("userId",userId);
		model.addAttribute("userName",userName);
	
		
	return ".community.playZone.home";
	}
	
	@RequestMapping(value="/community/playZone/pointset")
		@ResponseBody
	public Map<String, Object> pointset( 
			@RequestParam(name="hid", defaultValue="")Integer coin,
			HttpSession session
			)throws Exception{
		int poi=0;
		int change=0;
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		Map<String, Object> smap=new HashMap<>();
		smap.put("userId", info.getUserId());
		poi=service.pointlist(smap);
		change = coin-poi;
		Map<String, Object> pmap = new HashMap<String, Object>();
		pmap.put("userId", info.getUserId());
		pmap.put("value", change);
        pmap.put("info", "룰렛"); 
        pservice.insertLog(pmap); 
		Map<String, Object> map=new HashMap<>();
		map.put("userId", info.getUserId());
		map.put("point", coin);
		
		service.pointupdate(map);
		Map<String, Object> model = new HashMap<>();
		model.put("state", "true");
		
		return model;
	}
}
