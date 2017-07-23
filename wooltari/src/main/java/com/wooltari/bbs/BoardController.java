package com.wooltari.bbs;

import java.io.File;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wooltari.common.FileManager;
import com.wooltari.common.MyUtil;
import com.wooltari.member.SessionInfo;

@Controller("bbs.boardController")
public class BoardController {
	
	@Autowired
	private BoardService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@Autowired
	private FileManager fileManager;
	
	@RequestMapping(value="/bbs/list")
	public String list(
			@RequestParam(name="page",defaultValue="1") int current_page,
			@RequestParam(name="searchKey",defaultValue="subject") String searchKey,
			@RequestParam(name="searchValue",defaultValue="")String searchValue,
			HttpServletRequest req,
			Model model
			)throws Exception{
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			searchValue= URLDecoder.decode(searchValue, "UTF-8");
		}
		
		int rows=10;
		int total_page=0;
		int dataCount=0;
		
		Map<String, Object> map = new HashMap<>();
		map.put(searchKey, searchKey);
		map.put(searchValue, searchValue);
		
		dataCount=service.dataCount(map);
		if(dataCount!=0) {
			total_page=myUtil.pageCount(rows, dataCount);
		}
		
		if(current_page>total_page) {
			current_page=total_page;
		}
		
		int start=(current_page-1)*rows+1;
		int end=current_page*rows;
		map.put("start", start);
		map.put("end", end);
		
		List<Board> list = service.listBoard(map);
		
		int listNum, n=0;
		Iterator<Board> it = list.iterator();
		while(it.hasNext()) {
			Board dto = it.next();
			listNum=dataCount-(start+n-1);
			dto.setListNum(listNum);
			n++;
		}
		
		String query="";
		String listUrl, articleUrl;
		if(searchValue.length()!=0) {
			query="searchKey="+searchKey+"&searchValue="+URLEncoder.encode(searchValue,"UTF-8");
		}
		String cp = req.getContextPath();
		listUrl=cp+"/bbs/list";
		articleUrl=cp+"/bbs/article?page="+current_page;
		if(query.length()!=0) {
			listUrl +="?"+query;
			articleUrl+="&"+query;
		}
		
		String paging = myUtil.paging(current_page, total_page, listUrl);
		
		model.addAttribute("list",list);
		model.addAttribute("articleUrl",articleUrl);
		model.addAttribute("paging",paging);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount",dataCount);
		model.addAttribute("total_page",total_page);
		
		return ".community.bbs.list";
	}
	
	@RequestMapping(value="/bbs/created",method=RequestMethod.GET)
	public String createdForm(Model model,HttpSession session) throws Exception{
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		if(info==null){
			return "redirect:/member/login";
		}
		model.addAttribute("mode","created");
		return ".community.bbs.created";
	}
	
	@RequestMapping(value="/bbs/created",method=RequestMethod.POST)
	public String createdSubmit(Board dto,HttpSession session)throws Exception{
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		if(info==null){
			return "redirect:/member/login";
		}
		dto.setUserId(info.getUserId());
		
		service.insertBoard(dto);
		
		return "redirect:/bbs/list";
	}
	
	@RequestMapping(value="/bbs/article")
	public String article(
				@RequestParam int num,
				@RequestParam int page,
				@RequestParam(value="searchKey", defaultValue="subject") String searchKey,
				@RequestParam(value="searchValue", defaultValue="") String searchValue,
				Model model
			) throws Exception {
		
		searchValue=URLDecoder.decode(searchValue,"UTF-8");
		
		service.updateHitCount(num);
		Board dto = service.readBoard(num);
		if(dto==null) {
			return "redirect:/bbs/list?page="+page;
		}
		
		dto.setContent(myUtil.htmlSymbols(dto.getContent()));
		
		// 이전글, 다음글
		Map<String, Object> map = new HashMap<>();
		map.put("num", num);
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		
		Board preReadDto = service.preReadBoard(map);
		Board nextReadDto = service.nextReadBoard(map);
		
		// 공감개수
		int countLikeBoard=service.countLikeBoard(num);
		
		String query="page="+page;
		if(searchValue.length()!=0) {
			query+="&searchKey="+searchKey;
			query+="&searchValue="+URLEncoder.encode(searchValue,"UTF-8");
		}
		
		model.addAttribute("dto", dto);
		model.addAttribute("page", page);
		model.addAttribute("query", query);
		model.addAttribute("preReadDto", preReadDto);
		model.addAttribute("nextReadDto", nextReadDto);
		model.addAttribute("countLikeBoard", countLikeBoard);
		
		return ".community.bbs.article";
	}
	
	@RequestMapping(value="/bbs/insertLikeBoard",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertLikeBoard(Board dto, HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		String state="true";
		
		if(info==null) {
			state="loginFail";
		} else {
			dto.setUserId(info.getUserId());
			int result=service.insertLikeBoard(dto);
			if(result==0) {
				state="false";
			}
		}
		
		int countLikeBoard = service.countLikeBoard(dto.getNum());
		
		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		model.put("countLikeBoard", countLikeBoard);
		return model;
	}
	
	@RequestMapping(value="/bbs/update", method=RequestMethod.GET)
	public String updateForm(
				@RequestParam int num,
				@RequestParam String page,
				Model model,
				HttpSession session
			) throws Exception {
		SessionInfo info=(SessionInfo) session.getAttribute("member");
		if(info==null) {
			return "redirect:/member/login";
		}
		
		Board dto = service.readBoard(num);
		if(dto==null) {
			return "redirect:/bbs/list?page="+page;
		}
		if(! info.getUserId().equals(dto.getUserId())) {
			return "redirect:/bbs/list?page="+page;
		}
		model.addAttribute("dto",dto);
		model.addAttribute("mode", "update");
		model.addAttribute("page", page);
		
		return ".community.bbs.created";
	}
	
	@RequestMapping(value="/bbs/update",method=RequestMethod.POST)
	public String updateSubmit(
				Board dto,
				@RequestParam String page,
				HttpSession session) throws Exception {
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		if(info==null) {
			return "redirect:/member/login";
		}
		
		String root = session.getServletContext().getRealPath("/");
		String pathname=root+File.separator+"uploads"+File.separator+"bbs";

		service.updateBoard(dto, pathname);
		
		return "redirect:/bbs/list?page="+page;
	}
	
	@RequestMapping(value="/bbs/delete")
	public String delete(
				@RequestParam int num,
				@RequestParam String page,
				HttpSession session) throws Exception {
		SessionInfo info=(SessionInfo) session.getAttribute("member");
		if(info==null) {
			return "redirect:/member/login";
		}
		
		String root=session.getServletContext().getRealPath("/");
		String pathname=root+File.separator+"uploads"+File.separator+"bbs";
		
		service.deleteBoard(num, pathname, info.getUserId());
		
		return "redirect:/community/bbs/list?page="+page;
	}
	
	

	@RequestMapping(value="/bbs/createdReply",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> createdReply(Reply dto, HttpSession session) throws Exception {
		SessionInfo info=(SessionInfo) session.getAttribute("member");
		String state="true";
		
		if(info==null) {
			state="loginFail";
		} else {
			dto.setUserId(info.getUserId());
			int result=service.insertReply(dto);
			if(result==0) {
				state="false";
			}
		}
		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		return model;
	}
	
	@RequestMapping(value="/bbs/listReply")
	public String listReply(
			@RequestParam int num,
			@RequestParam(value="pageNo", defaultValue="1") int current_page,
			Model model
			) throws Exception {
		int rows = 5;
		int total_page=0;
		int dataCount=0;
		
		Map<String, Object> map = new HashMap<>();
		map.put("num", num);
		
		dataCount=service.replyDataCount(map);
		total_page=myUtil.pageCount(rows, dataCount);
		if(current_page>total_page) {
			current_page=total_page;
		}
		int start=(current_page-1)*rows+1;
		int end=current_page*rows;
		map.put("start", start);
		map.put("end", end);
		
		List<Reply> list = service.listReply(map);
		
		Iterator<Reply> it = list.iterator();
		while(it.hasNext()) {
			Reply vo = it.next();
			vo.setContent(myUtil.htmlSymbols(vo.getContent()));
		}
		
		
		String paging=myUtil.paging(current_page, total_page);
		
		model.addAttribute("list",list);
		model.addAttribute("paging",paging);
		model.addAttribute("pageNo", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		
		// .bb.listReply라고 주게되면 출력화면이 뒤죽박죽이 되버린다.
		return "/community/bbs/listReply"; // 포워딩
	}
	
	@RequestMapping(value="/bbs/deleteReply",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteReply(
			@RequestParam int replyNum,
			@RequestParam String mode,
			HttpSession session) throws Exception {
		SessionInfo info=(SessionInfo) session.getAttribute("member");
		String state="true";
		
		if(info==null) {
			state="loginFail";
		} else {
			Map<String, Object> map = new HashMap<>();
			map.put("replyNum", replyNum);
			map.put("mode",mode);
			service.deleteReply(map);
			
		}
		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		return model;
	}
}















