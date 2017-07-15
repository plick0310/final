package com.wooltari.notice;

import java.io.File;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.wooltari.common.MyUtil;
import com.wooltari.member.SessionInfo;

@Controller("notice.NoticeController")
public class NoticeController {
	@Autowired
	private NoticeService service;
	
	@Autowired
	private MyUtil myUtil;

	@RequestMapping(value="/customer/notice/created", method=RequestMethod.GET)
	public String createdForm(
			Model model, HttpSession session
			)throws Exception{
		
		model.addAttribute("mode", "created");
		return ".customer.notice.created";
	}
	
	@RequestMapping(value="/customer/notice/created", method=RequestMethod.POST)
	public String createdSubmit(
			Notice dto, HttpSession session
			) throws Exception{
		SessionInfo info= (SessionInfo)session.getAttribute("member");
		if(!info.getUserId().equals("admin")){
			return "redirect:/customer/notice/list";
		}
		
		//파일저장
		String root= session.getServletContext().getRealPath("/");
		//getRealPath("/"); 는 webapp폴더까지를 의미한다.
		String pathname= root+File.separator +"uploads" + File.separator + "notice";
		
		dto.setUserId(info.getUserId());
		service.insertNotice(dto, pathname);
		
		return "redirect:/customer/notice/list";
	}
	
	@RequestMapping(value="/customer/notice/list")
	public String list(
			@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(value="searchKey", defaultValue="subject") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			Model model,
			HttpServletRequest req
			) throws Exception{
		String cp=req.getContextPath();
		
		//줄수, 토탈페이지, 데이타 카운트
		int rows=10;
		int total_page=0;
		int dataCount=0;
		
		//검색값
		if(req.getMethod().equalsIgnoreCase("GET")){
			searchValue=URLDecoder.decode(searchValue,"utf-8");
		}
		
		//맵, 검색값, 데이타카운트, 토탈페이지
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		
		dataCount=service.dataCount(map);
		if(dataCount !=0)
			total_page=myUtil.pageCount(rows, dataCount);
		
		//다른 사람이 자료를 삭제하여 전체페이지수가 변화된 경우
		if(total_page<current_page)
			total_page=current_page;
		
		//1페이지인 경우 공지리스트 가져오기
		 List<Notice> noticeList = null;
		 if(current_page==1){
			 noticeList=service.listNoticeTop();
		 }
		
		//리스트에 출력할 데이터의 시작과 끝 
		int start=(current_page-1)*rows+1;
		int end=current_page*rows;
		map.put("start", start);
		map.put("end", end);
		
		//맵에 내용을 리스트에 담기 
		List<Notice> list=service.listNotice(map);
		
		//리스트의 번호
		Date endDate= new Date();
		long gap;
		int listNum, n=0;
		
		//이터레이터를 통해 리스트의 내용을 it에 나눠 담음.
		Iterator<Notice> it=list.iterator();
		
		while(it.hasNext()){
			Notice data=(Notice)it.next();
			listNum=dataCount-(start+n-1);
			data.setListNum(listNum);			
			
			//심플 데이터 포맷 이용 비긴데이트(생성일) 구하기
			SimpleDateFormat formatter=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date beginDate= formatter.parse(data.getCreated());
			
			System.out.println(beginDate);
			
			//날짜 차이
			gap=(endDate.getTime()-beginDate.getTime())/(60*60*1000);
			data.setGap(gap);
			
			data.setCreated(data.getCreated().substring(0,10));
					
			n++;
		}
		//쿼리, 리스트url, 아티클url
		String query="";
		String listUrl=cp+"/customer/notice/list";
		String articleUrl=cp+"/customer/notice/article?page="+current_page;
		if(searchValue.length()!=0){
			query="searchKey="+searchKey+
					"&searchValue="+URLEncoder.encode(searchValue,"utf-8");
			
		}
		if(query.length()!=0){
			listUrl=cp+"/customer/notice/list"+query;
			articleUrl=cp+"/customer/notice/article?page="+current_page+"&"+query;
		}
		
		
		//페이징		
		String paging=myUtil.paging(current_page, total_page, listUrl);
		
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("page", current_page);
		model.addAttribute("total_page", total_page);
		
		model.addAttribute("list", list);
		model.addAttribute("noticeList",noticeList);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("paging", paging);
		
		return ".customer.notice.list";
	}
	//아티클
	@RequestMapping(value="/customer/notice/article")
	public String article(
			@RequestParam(value="num") int num,
			@RequestParam(value="page") String page,
			@RequestParam(value="searchKey", defaultValue="subject") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			Model model)throws Exception{
		
		//검색 값 
		searchValue=URLDecoder.decode(searchValue, "utf-8");
		//조회수
		//service.updateHitCount(num);
		
		//
		Notice dto=service.readNotice(num);
		if(dto==null)
			return "redirect:/customer/notice/list?page="+page;
		
		dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
		
		//이전글, 다음글
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		map.put("num", num);
		
		Notice preReadDto= service.preReadNotice(map);
		Notice nextReadDto= service.nextReadNotice(map);
				
		//파일
		//List<Notice> listFile=service.listFile(num);
				
		String query="page="+page;
		if(searchValue.length()!=0){
			query+="&searchKey"+searchKey+
					"&searchValue="+URLEncoder.encode(searchValue,"utf-8");
		}
			model.addAttribute("dto", dto);
			model.addAttribute("preReadDto", preReadDto);
			model.addAttribute("nextReadDto", nextReadDto);
			
			model.addAttribute("page", page);
			model.addAttribute("query", query);
			
			return ".customer.notice.article";
		}
	
	@RequestMapping(value="/customer/notice/update", method=RequestMethod.GET)
	public String updateForm(
			@RequestParam(value="num") int num,
			@RequestParam(value="page") String page,
			Model model,
			HttpSession session) throws Exception {
		
		Notice dto=(Notice)service.readNotice(num);
		if(dto==null){
			return "redirect:/customer/notice/list?page="+page;
		}
			
		//model은 jsp로 넘기겠다.
		model.addAttribute("mode", "update");
		model.addAttribute("page", page);
		model.addAttribute("dto", dto);
					
		return ".customer.notice.created";
	}
	
	@RequestMapping(value="/customer/notice/update")
	public String udpateSubmit(
			Notice dto,
			@RequestParam String page,
			HttpSession session) throws Exception {
		
		String root=session.getServletContext().getRealPath("/");
		String pathname= root + File.separator +"uploads" + File.separator +"infoReqBoard";
		
		service.updateNotice(dto, pathname);
		
		return "redirect:/customer/notice/list?page="+page;
	}
	
	@RequestMapping(value="/customer/notice/delete")
	public String delete(
			@RequestParam int num,
			@RequestParam String page,
			HttpSession session)throws Exception{
		String root=session.getServletContext().getRealPath("/");
		String pathname= root+ File.separator + "uploads" + File.separator + "infoReqBoard";
		
		Notice dto= service.readNotice(num);
		if(dto==null){
			return "redirect:/customer/notice/list?page="+page;
		}			
		
		service.deleteNotice(num, dto.getSaveFilename(), pathname);
					
		return "redirect:/customer/notice/list?page="+page;
		
	}
		//체크 박스로 삭제.............................................
			@RequestMapping(value="/customer/notice/deleteList")
			public String deleteList(
					Integer[] chk,
					@RequestParam String page
					)throws Exception{
				List<Integer> list=Arrays.asList(chk);
				//Arrays.asList:Arrays 클래스 배열을 List에 담아서 반환한다.
				service.deleteList(list);		
				return "redirect:/customer/notice/list?page="+page;
			}
			
			
}
	
	
	

