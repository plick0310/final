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

import com.wooltari.member.SessionInfo;

@Controller("study.board.BoardController")
public class BoardController {
	@Autowired
	private BoardService service;

	
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
			Board dto, 
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
			e.printStackTrace();
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
			e.printStackTrace();
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
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
	
		Map<String, Object> map = new HashMap<>();
		String tableName="s_"+s_num;		
		map.put("tableName",tableName);
		
		int dataCount = service.dataCount(map); //데이터 총 개수
		
	//	map.put("userId", info.getUserId());
	//	int checkLike = service.checkLike(map);
		
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
			map.put("num", dto.getNum());
			
			dto.setLikeCount(service.countLikeBoard(map));
			dto.setReplyCount(service.countReplyBoard(map));
			
			
			List<String> photolist = service.readPhoto(map);
				if(photolist.size()!=0){
					dto.setImageFileName(photolist.get(0));
				}
			
		}
		
		
		Map<String, Object> model = new HashMap<>();
		
		
		model.put("list", list);
		model.put("dataCount", dataCount);
		
		return model;
	}
	
/*************************** 좋아요  ******************************/	
	//좋아요
	@RequestMapping(value="/study/myStudy/{s_num}/boardLike" , method= RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> boardLike(
			@PathVariable long s_num,
			@RequestParam int num,
			HttpSession session
			) throws Exception{
		
		
	   
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		String state = "true";

		String tableName = "s_" + s_num;
		Map<String, Object> map = new HashMap<>();

		map.put("tableName", tableName);
		map.put("userId", info.getUserId());
		map.put("num", num);

		int result = service.insertLikeBoard(map);
		if(result==0)
			state="false";
		
		Map<String, Object> model = new HashMap<>();
   	    model.put("state", state);
   	    return model;
	}
	
	//좋아요 개수
	@RequestMapping(value="/study/myStudy/{s_num}/countboardLike" , method= RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> countLike(
			@PathVariable long s_num,
			@RequestParam int num
			) throws Exception{

		String tableName="s_"+s_num;		
		 Map<String, Object> map = new HashMap<>();
		 
		 map.put("tableName", tableName);
		 map.put("num", num);
		int countLikeBoard = service.countLikeBoard(map);
		
   	    Map<String, Object> model = new HashMap<>();
   	    model.put("countLikeBoard", countLikeBoard);
   	    return model;
	}
	 
/*************************** 댓글 ******************************/
	//댓글 페이지 이동
	@RequestMapping(value="/study/myStudy/{s_num}/listReply")
	public String Reply(
			@PathVariable long s_num,
			Model  model,
			@RequestParam int num) {
		
		Map<String, Object> map = new HashMap<>();
		String tableName="s_"+s_num;		
		map.put("tableName",tableName);   
		map.put("num",num);
		int replyCount = service.countReplyBoard(map);
		
		model.addAttribute("num",num);
		model.addAttribute("replyCount",replyCount);
		return "/study/myStudy/listReply";
	} 
	
	//댓글 입력
	@RequestMapping(value="/study/myStudy/home/{s_num}/replyCreated" , method= RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> insertReply(
			@PathVariable long s_num, Reply dto, HttpSession session) throws Exception {
         
	try {
		
			SessionInfo info = (SessionInfo) session.getAttribute("member");
			String root =session.getServletContext().getRealPath("/"); 

			String tableName = "s_"+ s_num;
			dto.setTableName(tableName);
			dto.setUserId(info.getUserId());
			dto.setUserImg(info.getUserImg());
			
			service.insertReplyBoard(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		Map<String, Object> model = new HashMap<>();
		return model;

		} 
	 
	//댓글 삭제
	@RequestMapping(value="/study/myStudy/home/{s_num}/replyDelete" , method= RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> deleteReply(
			@PathVariable long s_num,
			@RequestParam int reNum,
			HttpSession session) throws Exception {
	try {
			SessionInfo info = (SessionInfo) session.getAttribute("member");
			Map<String, Object> map = new HashMap<>();
			String tableName = "s_" + s_num;
			map.put("tableName", tableName);
			map.put("reNum", reNum);
			
			service.deleteReplyBoard(map);
			    
		} catch (Exception e) {
			e.printStackTrace();
		}
		Map<String, Object> model = new HashMap<>();
		return model;

		} 
	  
	  
	//댓글 리스트
	@RequestMapping(value="/study/myStudy/{s_num}/reply_List" , method= RequestMethod.POST )
	@ResponseBody
	public Map<String, Object> reply_List(
			@PathVariable long s_num,
			@RequestParam int num
			
			) throws Exception {
	
		
		Map<String, Object> map= new HashMap<>();
		map.put("num", num);
		String tableName = "s_" + s_num;
		map.put("tableName", tableName);
		map.put("s_num", s_num);
		List<Reply> list = service.listReply(map);
		
		Map<String, Object> model = new HashMap<>();
		model.put("list", list);
		return model;
	}
	
	//댓글 갯수 카운트
	@RequestMapping(value="/study/myStudy/{s_num}/countboardReply" , method= RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> countReply(
			@PathVariable long s_num,
			@RequestParam int num
			) throws Exception{
   
	   	String tableName="s_"+s_num;		
		 Map<String, Object> map = new HashMap<>();
		 
		 map.put("tableName", tableName);
		 map.put("num", num);
		int countReplyBoard = service.countReplyBoard(map);
		
   	    Map<String, Object> model = new HashMap<>();
   	    model.put("countReplyBoard", countReplyBoard);
   	    return model;
	}
	
	
}
