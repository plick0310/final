package com.wooltari.study;
  
import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wooltari.member.SessionInfo;
import com.wooltari.study.team.Team;
import com.wooltari.study.team.TeamService;

@Controller("study.studyController")
public class StudyController {
	@Autowired
	private StudyService service;
	
	@Autowired
	private TeamService tservice;
	
/* 스터디 생성  */	
	@RequestMapping(value="/study/created")
	public String StudyCratedForm(Model model) throws Exception{
		
		List<StudyCategory> listBigCategory=service.listBigCategory();
		List<StudyCity> listBigCity = service.listBigCity();
		
		model.addAttribute("listBigCategory", listBigCategory);
		model.addAttribute("listBigCity",listBigCity);
		model.addAttribute("mode", "created");
		
		return "/study/manage/create";
	}
	  
	
	@RequestMapping(value="/study/getCategory", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> ThemeList(@RequestParam int parent) throws Exception{
		
		List<StudyCategory> listSmallCategory = new ArrayList<>();
		listSmallCategory = service.listSmallCategory(parent);
		
		Map<String, Object> model = new HashMap<>();
		model.put("listSmallCategory", listSmallCategory);
	
		return model;
	}
	 
	@RequestMapping(value="/study/getCity", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> CityList(@RequestParam int parent) throws Exception{
		
		List<StudyCity> listSmallCity = new ArrayList<>();
		listSmallCity = service.listSmallCity(parent);
		
		Map<String, Object> model = new HashMap<>();
		model.put("listSmallCity", listSmallCity);
	
		return model;
	}     
	  
	@RequestMapping(value="/study/created", method=RequestMethod.POST)
	public String StudyCratedSubmit(
			StudyInfo dto,  Model model ,HttpSession session) throws Exception{
		  try {
			
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		String root=session.getServletContext().getRealPath("/");
		String path=root+File.separator+"uploads"+File.separator+"member"+
				File.separator+"userImg";
		
		
		dto.setUserId(info.getUserId());
		service.insertStudy(dto ,path);
		
		Team tdto = new Team();
		tdto.setS_num(dto.getS_num());
		tdto.setUserId(info.getUserId());
		tdto.setImageFileName(info.getUserImg());
		tdto.setEnabled(1);
		tdto.setContent("리더입니다.");
		
		
		tservice.joinStudy(tdto,path);
		
		
		} catch (Exception e) {
			//study 테이블 삭제........ 
			service.deleteStudy(dto.getS_num());
			model.addAttribute("message","스터디 생성 실패");
			
			return "main/msg";
		}  
		
		return "redirect:/study/myStudy/home/"+dto.getS_num();
	}
	 
	
	
/* 스터디 수정  */
	@RequestMapping(value="/study/update")
	public String StudyUpdateForm(Model model ,@RequestParam long s_num ,HttpSession session) throws Exception{
	
		try {
			
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		StudyInfo dto = service.readMyStudy(s_num);
		
		
		//leader만 수정권한
			if(! dto.getUserId().equals(info.getUserId()) ){
				model.addAttribute("message","리더만 접근 가능합니다.");
			
				return "main/msg";
			}
		
		
		List<StudyCategory> listBigCategory=service.listBigCategory();
		//List<StudyCity> listBigCity = service.listBigCity();
	
		
		model.addAttribute("listBigCategory", listBigCategory);
		//model.addAttribute("listBigCity",listBigCity);
		
		model.addAttribute("s_num",s_num);
		model.addAttribute("vdto", dto);
		model.addAttribute("mode", "update");
		
		}catch (Exception e) {
			// TODO: handle exception
		}
		return "/study/manage/create";
	}
	      
	@RequestMapping(value="/{s_num}/study/update", method=RequestMethod.POST)
	public String StudyUpdateSubmit(StudyInfo vdto,@PathVariable long s_num, Model model ,HttpSession session) throws Exception{
		try {     
			
			
			String root=session.getServletContext().getRealPath("/");
			String path=root+File.separator+"uploads"+File.separator+"member"+
					File.separator+"userImg";
			
			service.updateStudy(vdto, path);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		 
		  
		return "redirect:/study/myStudy/home/"+s_num;
	}
	
	@RequestMapping(value="/study/{s_num}/getMyCategory", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getMyCategory(@PathVariable long s_num) throws Exception{
	
		List<StudyCategory> categoryList = service.readMyCategory(s_num);

		Map<String, Object> model = new HashMap<>();
		model.put("categoryList",categoryList);
		return model;
	}      
	   
	@RequestMapping(value="/study/{s_num}/getMyLocal", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getMyLocal(@PathVariable long s_num) throws Exception{
	
		List<StudyLocal> localList= service.readMyLocal(s_num);

		Map<String, Object> model = new HashMap<>();
		model.put("localList",localList);
		
		return model;
	}
	

	/*  스터디 리스트   */
	@RequestMapping(value="/study/mylist")
	   public String list(Model model , HttpSession session ,HttpServletRequest req) throws Exception{
	     try {
	    	 
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		List<StudyInfo> list = service.listMyStudy(info.getUserId());
		List<StudyInfo> list2 = service.list2MyStudy(info.getUserId());
		
		 Iterator<StudyInfo> it = list.iterator();
	        while(it.hasNext()){
	        	StudyInfo data = it.next();
	        	List<StudyCategory> categoryList = service.readMyCategory(data.getS_num());
	        	List<StudyLocal> localList= service.readMyLocal(data.getS_num());
	        	data.setListCategory(categoryList);
	        	data.setListLocal(localList);
	        }
		
	        
	   	 Iterator<StudyInfo> it2 = list2.iterator();
	        while(it2.hasNext()){
	        	StudyInfo data = it2.next();
	        	List<StudyCategory> categoryList = service.readMyCategory(data.getS_num());
	        	List<StudyLocal> localList= service.readMyLocal(data.getS_num());
	        	data.setListCategory(categoryList);
	          	data.setListLocal(localList);
	        }
	        
	             
		model.addAttribute("Mylist",list);	
		model.addAttribute("Mylist2",list2);	
		
		} catch (Exception e) {
			
			       
		}
		      
	    return ".study.mystudylist.mylist";
	}
	
	@RequestMapping(value="/study/myStudy/home/{s_num}")
	public String list(Model model, @PathVariable long s_num, HttpSession session) {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		StudyInfo dto = service.readMyStudy(s_num);
		List<Team> teamList = tservice.listTeam(s_num);
		List<Team> waitList = tservice.listWait(s_num);
		

		
		Iterator<Team> it = teamList.iterator();
        while(it.hasNext()){
        	Team tdto = it.next();
        	if(tdto.getUserId().equals(info.getUserId())){
        		model.addAttribute("state", "true");
        		break;
        	}
        	model.addAttribute("state", "false");
        }
		
        model.addAttribute("waitList",waitList);
		model.addAttribute("dto",dto);
		model.addAttribute("teamList", teamList);
		return ".study.myStudy.home";
	}
	
	

	
	
	/*@RequestMapping(value="/study/myStudy/{s_num}/calender")
	public String calender() {

		return "/study/myStudy/calender";
	}*/
	
	@RequestMapping(value="/study/myStudy/{s_num}/chating")
	public String chating() {

		return "/study/myStudy/chating";
	}
	
}
