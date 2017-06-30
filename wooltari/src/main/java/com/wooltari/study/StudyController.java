package com.wooltari.study;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller("study.studyController")
public class StudyController {
	@Autowired
	private StudyService service;
	
	@RequestMapping(value="/study/created")
	public String StudyCratedForm(Model model) throws Exception{
		
		List<StudyCategory> listBigCategory=service.listBigCategory();
		List<StudyCity> listBigCity = service.listBigCity();
		
		model.addAttribute("listBigCategory", listBigCategory);
		model.addAttribute("listBigCity",listBigCity);
		return "/study/manage/create";
	}
	
	
	@RequestMapping(value="/study/created", method=RequestMethod.POST)
	public String StudyCratedSubmit(
			StudyInfo dto,  Model model ,HttpSession session) throws Exception{
		
		
		//SessionInfo info = (SessionInfo)session.getAttribute("member");
	
		String root=session.getServletContext().getRealPath("/");
		String path=root+File.separator+"uploads"+File.separator+"study"+
				File.separator+"studyMainimage";
		
		dto.setUserId("나야나");
		service.insertStudy(dto ,path);
		
		
		System.out.println("ss");
		return "redirect:/main";
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
	
	
	
	
	
	@RequestMapping(value="/study/mylist")
	   public String list(){
	      
	      return ".study.mystudylist.mylist";
	}
}
