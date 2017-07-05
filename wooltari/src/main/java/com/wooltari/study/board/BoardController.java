package com.wooltari.study.board;

import java.io.File;
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

import com.wooltari.common.MyUtilBootstrap;
import com.wooltari.member.SessionInfo;
import com.wooltari.study.StudyService;

@Controller("study.board.BoardController")
public class BoardController {
	@Autowired
	private BoardService service;
	@Autowired
	private StudyService studyService;
	@Autowired
	private MyUtilBootstrap util; //페이징처리
	
	
	@RequestMapping(value="/study/myStudy/{s_num}/board")
	public String board(@PathVariable long s_num, Model  model) {
		
		Map<String, Object> map = new HashMap<>();
		String tableName="s_"+s_num;		
		map.put("tableName",tableName);
		
		int dataCount = service.dataCount(map);
		
		model.addAttribute("s_num",s_num);
		model.addAttribute("dataCount",dataCount);
		
		return "/study/myStudy/board";
	}
	   
	@RequestMapping(value="/study/myStudy/home/{s_num}/boardCreated" , method= RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> createdSubmit(
			@PathVariable long s_num, 
			Board dto , 
			HttpSession session) throws Exception{
		try {
			
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		String root=session.getServletContext().getRealPath("/");
		String pathname = root +File.separator+"uploads"+File.separator+"study"+
				File.separator+s_num+"_Board";
		System.out.println(pathname);
		
		String tableName="s_"+s_num;
		dto.setTableName(tableName);
		dto.setS_num(s_num);
		
		dto.setUserId(info.getUserId());
		service.insertBoard(dto ,pathname);
		} catch (Exception e) {
			
		}
		Map<String, Object> model = new HashMap<>();
		
		return model;
	}
	
	
	@RequestMapping(value="/study/myStudy/{s_num}/boardDelete" , method= RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> delete( 
			@RequestParam int num,
			@PathVariable long s_num,
			HttpSession session)throws Exception{
		   
		try {
				
			Map<String, Object> map = new HashMap<>();
			String tableName="s_"+s_num;		
			map.put("tableName",tableName);
			map.put("num", num);
			
			service.deleteBoard(map);
		} catch (Exception e) {
			
		}
		
		Map<String, Object> model = new HashMap<>();
		return model;
	}
	
	
	@RequestMapping(value="/study/myStudy/{s_num}/boardList" , method= RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> list(
			@PathVariable long s_num, 
			@RequestParam (value="bbs_count", defaultValue="1") int bbs_count, //현재 화면에 출력할 개수
			HttpSession session){
		
		Map<String, Object> map = new HashMap<>();
		String tableName="s_"+s_num;		
		map.put("tableName",tableName);
		
		int dataCount = service.dataCount(map); //데이터 총 개수
		
		int start = 1;
		int end = 0;	
		
		if(bbs_count>5){
			end=5;
		}
		  
		end = bbs_count;
		 
		map.put("start", start);
		map.put("end", end);
		
		List<Board> list = service.listBoard(map);
		
		
		Iterator<Board> it = list.iterator();
		
		while(it.hasNext()){
			Board dto = it.next();
			dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
		}
		
		
		Map<String, Object> model = new HashMap<>();
		
		model.put("list", list);
		model.put("dataCount", dataCount);
		
		return model;
	}
	
}
