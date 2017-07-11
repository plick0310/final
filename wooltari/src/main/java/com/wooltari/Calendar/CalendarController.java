package com.wooltari.Calendar;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.wooltari.member.SessionInfo;

@Controller("myStudy.calendarController")
public class CalendarController {
	
	@Autowired
	private CalendarService service;
	
	@RequestMapping(value="/study/myStudy/{s_num}/calender")
	public String calender(
			@PathVariable long s_num
			)throws Exception {
		
		Map<String, Object> map=new HashMap<>();
		map.put("s_num", s_num);
		
		return "/study/myStudy/cal";
	}
	
	@RequestMapping(value="/cal/created",method=RequestMethod.GET)
	public String createdForm(
			HttpSession session,
			@RequestParam String startDate,
			@RequestParam String endDate,
			@RequestParam long s_num,
			Model model
			)throws Exception{
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		if(info==null){
			return "redirect:/main";
		}
		
		
		
		model.addAttribute("startDate",startDate);
		model.addAttribute("endDate",endDate);

		return "/study/myStudy/calCreated";
	}
	
	@RequestMapping(value="/cal/created",method=RequestMethod.POST)
	public String createdSubmit(
			Calendar dto,
			Model model,
			HttpSession session,
			@RequestParam long s_num
			)throws Exception{
		
		String tableName="s_"+s_num;
		dto.setTableName(tableName);
		dto.setS_num(s_num);
		
		model.addAttribute("dto",dto);
		
		service.insertBoard(dto);
		
		return "redirect:/study/myStudy/{s_num}/calender";
	}
	
	@RequestMapping(value="/cal/listCalendar")
	public String listCalendar(){
		
		return "/study/myStudy/calList";
	}
	
	
	
}
