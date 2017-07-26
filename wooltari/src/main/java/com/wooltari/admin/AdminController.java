package com.wooltari.admin;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.wooltari.common.MyUtil;
import com.wooltari.member.Member;

@Controller("admin.adminController")
public class AdminController {
	@Autowired
	private AdminService service;
	
	@Autowired
	private MyUtil myUtil;
	
	
	@RequestMapping(value="/admin/index", method=RequestMethod.GET)
	public String adminIndex(){
		return "admin/index";
	}
	@RequestMapping(value="/admin/dashboard", method=RequestMethod.GET)
	public String adminDashBoard(){
		return "admin/dashboard";
	}
	
	/*@RequestMapping(value="/admin/member", method=RequestMethod.GET)
	public String adminMember(){
		return "admin/member";
	}
	*/
	@RequestMapping(value="/admin/member", method=RequestMethod.GET)
	public String adminMember(
			@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(value="searchKey", defaultValue="userId") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			Model model,
			HttpServletRequest req)throws Exception{
		
		String cp=req.getContextPath();
		
		int rows=10;
		int total_page=0;
		int dataCount=0;
		
		if(req.getMethod().equalsIgnoreCase("GET")){
			searchValue = URLDecoder.decode(searchValue,"utf-8");
		}
		
		Map<String, Object> map= new HashMap<String, Object>();
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		
		dataCount=service.dataCount(map);
		if(dataCount !=0)
			total_page=myUtil.pageCount(rows, dataCount);
		
		if(total_page<current_page)
			current_page=total_page;	
		
		int start=(current_page-1)*rows+1;
		int end=current_page*rows;
		map.put("start", start);
		map.put("end", end);
		
		List<Member> list = service.listBoard(map);
		
		String query="";
		String listUrl= cp+"/admin/member";
		//String articleUrl= cp + "/admin/member?page="+current_page;
		
		if(searchValue.length() !=0){
			query = "searchKey="+searchKey + 
					"&searchValue=" + URLEncoder.encode(searchValue, "utf-8");				
		}
		
		if(query.length()!=0){
			listUrl= cp +"/admin/member?" + query;
			//articleUrl = cp + "/admin/member?page="+ current_page+"&"+query;
		}
		
		String paging = myUtil.pagingMethod(current_page, total_page, "paging");
		
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("page", current_page);
		model.addAttribute("total_page", total_page);
		model.addAttribute("list", list);
		//model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("paging", paging);
		
		return "admin/member";
	}
}
