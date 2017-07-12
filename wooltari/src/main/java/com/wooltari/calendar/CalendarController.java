package com.wooltari.calendar;

import java.util.HashMap;
import java.util.Iterator;
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

import com.wooltari.common.MyUtil;
import com.wooltari.member.SessionInfo;

@Controller("myStudy.calendarController")
public class CalendarController {
	
	@Autowired
	private CalendarService service;
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value="/study/myStudy/{s_num}/calender")
	public String calender(
			@PathVariable long s_num
			)throws Exception {
		
		Map<String, Object> map=new HashMap<>();
		map.put("s_num", s_num);
		
		return "study/myStudy/cal";
	}
	
	
	@RequestMapping(value="/study/myStudy/{s_num}/calender/created",method=RequestMethod.GET)
	public String createdForm(
			@PathVariable long s_num,
			@RequestParam String sdate,
			@RequestParam String edate,
			Model model,HttpSession session
			)throws Exception{
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		if(info==null){
			return "redirect:/main";
		}
		Map<String, Object> map=new HashMap<>();
		map.put("sdate", sdate);
		int result=service.getMonth(map);
		String month="";
		try {
			if(result<10){
				month=Integer.toString(result);
				month="0"+month;
			}else{
				month=Integer.toString(result);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}	
		
		model.addAttribute("month",month);
		model.addAttribute("s_num",s_num);
		model.addAttribute("sdate",sdate);
		model.addAttribute("edate",edate);

		return "study/myStudy/calCreated";
	}
	
	@RequestMapping(value="/study/myStudy/{s_num}/calender/created",method=RequestMethod.POST)
	@ResponseBody//json일때.
	public Map<String, Object> createdSubmit(
			Calendar dto,
			Model model,
			HttpSession session,
			@PathVariable long s_num,
			@RequestParam String month
			)throws Exception{
		String state="true";

		 
		String tableName="s_"+dto.getS_num();
		dto.setTableName(tableName);
		
		model.addAttribute("dto",dto);
		int result=service.insertBoard(dto);
			
		if(result==0){
			state="false";
		}

		Map<String, Object> map= new HashMap<>();
		map.put("state", state);
		map.put("month", month);
		
		return map;
	}
	
	@RequestMapping(value="/study/myStudy/{s_num}/calender/list")
	public String listCalendar(
			@PathVariable long s_num,
			@RequestParam String month,
			@RequestParam(value="pageNo",defaultValue="1")int currentPage,
			Calendar dto,
			Model model//json 아니면 여기서 model로 보내야함
			)throws Exception{
		int rows=5;
		int total_page;
		int dataCount;
		
		String tableName="s_"+dto.getS_num();
		dto.setTableName(tableName);
		
		dto.setMonth(dto.getMonth());
		
		Map<String, Object> map=new HashMap<>();
		map.put("tableName", tableName);
		map.put("month", month);
		
		dataCount=service.dataCount(map);
		total_page=myUtil.pageCount(rows, dataCount);
		
		if(currentPage>total_page)
			currentPage=total_page;
		
		int start=(currentPage-1)*rows+1;
		int end=currentPage*rows;
		
		map.put("start", start);
		map.put("end", end);

		List<Calendar>list=service.listCalendar(map);
		
		int listNum,n=0;
		
		Iterator<Calendar> it=list.iterator();
		while(it.hasNext()){
			Calendar vo=it.next();
			listNum=dataCount-(start+n-1);
			vo.setListNum(listNum);
			n++;
		}
		
		String paging=myUtil.paging(currentPage, total_page);

		model.addAttribute("paging",paging);
		model.addAttribute("list", list);
		model.addAttribute("page",currentPage);
		model.addAttribute("dataCount", dataCount);
		
		return "study/myStudy/calList";
	}
	
	@RequestMapping(value="/study/myStudy/{s_num}/calender/delete",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteBoard(
			@PathVariable long s_num
			,@RequestParam int num
			,@RequestParam(value="pageNo",defaultValue="1") int page
			,Calendar dto
			)throws Exception{
		String state="true";
		
		
		String tableName="s_"+dto.getS_num();
		dto.setTableName(tableName);
		
		Map<String, Object>map=new HashMap<>();
		map.put("tableName", dto.getTableName());
		map.put("num", num);

		int result=service.deleteBoard(map);
		if(result==0){
			state="false";
		}

		Map<String, Object>model=new HashMap<>();
		model.put("state", state);
		model.put("page", page);
		return model;
	}

	
}
