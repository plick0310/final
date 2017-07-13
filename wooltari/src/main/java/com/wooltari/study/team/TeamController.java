package com.wooltari.study.team;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wooltari.common.FileManager;
import com.wooltari.member.SessionInfo;

  
@Controller("study.team.TeamController")
public class TeamController {
	
	@Autowired
	private TeamService service;
	
	@Autowired
	private FileManager fileManager;
	
	
	@RequestMapping(value="/study/myStudy/{s_num}/team")
	public String team(@PathVariable long s_num ,Model model ,@RequestParam String leader) {

		int waitCount = service.waitCount(s_num);
		int teamCount = service.teamCount(s_num);

		model.addAttribute("waitCount", waitCount);
		model.addAttribute("teamCount", teamCount);
		model.addAttribute("leader",leader);
		
		
		return "/study/myStudy/team";
	}
	  
	@RequestMapping(value="/study/{s_num}/joinStudy" ,method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> joinStudy(
			@PathVariable long s_num ,
			Team dto ,
			HttpSession session) throws Exception{
		try {
			       
		 	SessionInfo info =(SessionInfo)session.getAttribute("member");
			String root =session.getServletContext().getRealPath("/"); 
			String path=root+File.separator+"uploads"+File.separator+"member"+
					File.separator+"userImg";
			
			
			//System.out.println(pathname);
			//이미지를 새로 저장하지 않은 경우
			/*if(dto.getUpload()!=null && !dto.getUpload().isEmpty()){
				String newFilename=fileManager.doFileUpload(dto.getUpload(), pathname);
				dto.setImageFileName(newFilename);
			} else {
				dto.setImageFileName(info.getUserImg());
			}*/
			if(dto.getUpload()==null || dto.getUpload().isEmpty()){
				dto.setImageFileName(info.getUserImg());
			}
			dto.setS_num(s_num);
			dto.setUserId(info.getUserId());
			
			service.joinStudy(dto ,path);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		Map<String, Object> model = new HashMap<>();
		
		return model;
	}
	
	@RequestMapping(value="/{s_num}/listWait",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> listWait(
			@PathVariable long s_num 
			)throws Exception{

		List<Team> list = service.listWait(s_num);	
		Map<String, Object> model = new HashMap<>();
		model.put("list", list);
		return model;
	}
	
	
	@RequestMapping(value="/{s_num}/listTeam",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> listTeam(
			@PathVariable long s_num 
			)throws Exception{

		List<Team> list = service.listTeam(s_num);	
		Map<String, Object> model = new HashMap<>();
		model.put("list", list);
		return model;
	}
	  
	@RequestMapping(value="/{s_num}/admitTeam",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> admitTeam(
			@PathVariable long s_num ,
			@RequestParam String userId
			)throws Exception{

		try {
			Map<String, Object> map = new HashMap<>();
			map.put("s_num", s_num);
			map.put("userId", userId);
			service.updateTeam(map);
		  	
		} catch (Exception e) {
			e.printStackTrace();
		}
		List<Team> list = service.listTeam(s_num);	
		
		Map<String, Object> model = new HashMap<>();
		model.put("list", list);
		
		
		return model;
	}
	
	@RequestMapping(value="/{s_num}/countChange",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> countChange(
			@PathVariable long s_num 
			)throws Exception{

		int waitCount = service.waitCount(s_num);
		int teamCount = service.teamCount(s_num);

		 
			
		Map<String, Object> model = new HashMap<>();
		model.put("waitCount", waitCount);
		model.put("teamCount",teamCount);
		return model;
	}
	
}
