package com.wooltari.guest;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wooltari.common.MyUtil;
import com.wooltari.member.SessionInfo;


@Controller("guest.guestController")
public class GuestController {
	@Autowired
	private GuestService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping("/guest/guest")
	public String guest() throws Exception {
		return ".guest.guest";
	}
	
	@RequestMapping(value="/guest/insert", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insert(
			Guest dto, HttpSession session
			) throws Exception{
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		String state="true";
		
		if(info==null) {
			state="loginFail";
		} else {
			dto.setUserId(info.getUserId());
			service.insertGuest(dto);
		}
		
		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		
		return model;
	}
	
	@RequestMapping(value="/guest/list")
	@ResponseBody
	public Map<String, Object> list(
				@RequestParam(value="pageNo", defaultValue="1") int current_page
			) throws Exception {
		
		int rows=5;
		int dataCount=service.dataCount();
		
		
		
		int total_page=myUtil.pageCount(rows, dataCount);
		if(current_page>total_page) {
			current_page=total_page;
		}
		int start=(current_page-1)*rows+1;
		int end=current_page*rows;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start",start);
		map.put("end", end);

		List<Guest> list = service.listGuest(map);
		Iterator<Guest> it = list.iterator();
		
		while(it.hasNext()) {
			Guest dto = it.next();
			dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
		}
		
		String paging = myUtil.paging(current_page, total_page);
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		model.put("list", list);
		model.put("paging", paging);
		model.put("pageNo", current_page);
		model.put("dataCount", dataCount);
		model.put("total_page", total_page);
		
		return model;
	}
	
	@RequestMapping(value="/guest/delete",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> delete(
				@RequestParam(value="num") int num,
				HttpSession session
			) throws Exception {
		SessionInfo info=(SessionInfo) session.getAttribute("member");
		String state="true";
		
		if(info==null) {
			state="loginFail";
		} else {
			Map<String, Object> map=new HashMap<>();
			map.put("num", num);
			map.put("userId", info.getUserId());
			service.deleteGuest(map);
		}
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);
		return model;
	}
}
