package com.wooltari.study.team;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	public String s_member() {

		return "/study/myStudy/team";
	}
	
	@RequestMapping(value="/study/{s_num}/joinStudy" ,method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> joinStudy(@PathVariable long s_num ,
			Team dto ,
			HttpSession session) throws Exception{
		try {
			  
			SessionInfo info =(SessionInfo)session.getAttribute("member");
			String root =session.getServletContext().getRealPath("/"); 
			String pathname = root +File.separator+"uploads"+File.separator+"study"+
					File.separator+s_num+"_TeamImg";
			
			//System.out.println(pathname);
			//이미지를 새로 저장하지 않은 경우
			if(dto.getUpload()!=null && !dto.getUpload().isEmpty()){
				String newFilename=fileManager.doFileUpload(dto.getUpload(), pathname);
				dto.setImageFileName(newFilename);
			} else {
				dto.setImageFileName(info.getUserImg());
			}
			
			dto.setS_num(s_num);
			dto.setUserId(info.getUserId());
			
			service.joinStudy(dto);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		Map<String, Object> model = new HashMap<>();
		
		return model;
	}
}
