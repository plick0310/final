package com.wooltari.report;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;

import com.wooltari.common.MyUtil;
import com.wooltari.member.SessionInfo;

//wooltari 신고 건의
@Controller("report.ReportController")
public class ReportController {
	@Autowired
	private ReportService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value="/customer/report/created", method=RequestMethod.GET)
	public String createdForm(
			Model model) throws Exception {
		
		model.addAttribute("pageNo", "1");
		model.addAttribute("mode","created");
		
		return ".customer.report.created";
	}
	
	@RequestMapping(value="/customer/report/created", method=RequestMethod.POST)
	//@ResponseBody //json으로 보낼 때 필요함.
	//public Map<String, Object> createdSubmit(
	public String createdSubmit(
			Report dto,
			HttpSession session) throws Exception {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		dto.setUserId(info.getUserId());
		service.insertReport(dto,"created");
		
		/*
		Map<String, Object> model=new HashMap<>();
		model.put("state", state);
		return model; //tap 프로젝트 board는 모델이었음.
		*/
		return "redirect:/customer/report/list";
	}
	
	
	@RequestMapping(value="/customer/report/list")
	public String list(
			@RequestParam(value="pageNo", defaultValue="1") int current_page,
			@RequestParam(value="searchKey", defaultValue="subject") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			HttpServletRequest req,
			Model model) throws Exception {
		int rows=10;
		int total_page;
		int dataCount;
		
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		
		dataCount = service.dataCount(map);
		total_page=myUtil.pageCount(rows, dataCount);
		
		if(total_page<current_page)
			current_page=total_page;
		
		int start = (current_page -1)* rows+1;
		int end = current_page * rows;
		
		map.put("start", start);
		map.put("end", end);
		
		List<Report> list = service.listReport(map);
		
		//글번호 만들기
		int listNum, n=0;
		// iterator == 반복자 -> 포인터 (출력을 해주는 방법중에 하나다)
		// while문을 이용해서 모두 출력할때 
		Iterator<Report> it = list.iterator();
		while(it.hasNext()){
			Report data = it.next();
			listNum = dataCount - (start + n - 1);
			data.setListNum(listNum);
			n++;
		}
		
		//ajax(인수 2개짜리)..ajax 안썼음 확인요.
		String paging = myUtil.paging(current_page, total_page);
		
		model.addAttribute("list", list);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("pageNo", current_page);
		model.addAttribute("paging", paging);
		model.addAttribute("total_page", total_page);
		
		return ".customer.report.list";
	}
	
	
	@RequestMapping(value="/customer/report/article")
	public String article(
			@RequestParam(value="repNum") int repNum,
			@RequestParam(value="pageNo") String pageNo,
			@RequestParam(value="searchKey", defaultValue="subject" ) String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			Model model)throws Exception {
		
		//검색 값
		searchValue=URLDecoder.decode(searchValue, "utf-8");
		
		Report dto = service.readReport(repNum);
		if(dto==null)
			return "redirect:/customer/report/list?pageNo="+pageNo;
		
		dto.setContent(dto.getContent().replaceAll("/n", "<br>"));
		
		//System.out.println("aaaaaaaaaaaaaaaaaaaa"+dto.getContent());
		
		//이전글, 다음글
		Map<String, Object> map= new HashMap<String, Object>();
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		map.put("repNum", repNum);
		
		Report preReadDto = service.preReadReport(map);
		Report nextReadDto = service.nextReadReport(map);
		
		String query="pageNo="+pageNo;
		if(searchValue.length()!=0){
			query+="&searchKey"+searchKey+
					"&searchValue="+URLEncoder.encode(searchValue,"utf-8");
		}
			model.addAttribute("dto", dto);
			model.addAttribute("preReadDto", preReadDto);
			model.addAttribute("nextReadDto", nextReadDto);
			
			model.addAttribute("pageNo", pageNo);
			model.addAttribute("query", query);			
		
		return ".customer.report.article";
	}

	@RequestMapping(value="customer/report/update", method=RequestMethod.GET)
	public String udpateForm(
			@RequestParam(value="repNum") int repNum,
			@RequestParam(value="pageNo") String pageNo,
			HttpSession session,
			Model model) throws Exception{
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		Report dto=service.readReport(repNum);
		if(dto==null) {
			return "customer/error";
		}
		
		if(! info.getUserId().equals(dto.getUserId())) {
			return "customer/error";
		}
		
		model.addAttribute("mode", "update");
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("dto", dto);	
		
		return "customer/report/created";
	}
	
/*	@RequestMapping(value="/customer/report/update")
	@ResponseBody
	public Map<String, Object> updateSubmit(
			Report dto,
			HttpSession session) throws Exception{
		
		String state="true";
		service.updateReport(dto);
		
		
		return model;
		
	}
	*/
	@RequestMapping(value="/customer/report/reply", method=RequestMethod.GET)
	public String replyForm(
			@RequestParam(value="repNum") int repNum,
			@RequestParam(value="pageNo") String pageNo,
			HttpSession session,
			Model model)throws Exception{
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		Report dto=service.readReport(repNum);
		if(dto==null) {
			return "customer/error";
		}
		
		if(! info.getUserId().equals(dto.getUserId())) {
			return "customer/error";
		}
		
		String str = "["+dto.getSubject()+"] 에 대한 답변입니다.\n";
		dto.setContent(str);
		
		model.addAttribute("mode", "reply");
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("dto", dto);		

		
		return "customer/board/created";
	}
	
	@RequestMapping(value="/customer/report/reply")
	@ResponseBody
	public Map<String, Object> replySubmit(
			Report dto,
			HttpSession session) throws Exception {
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		String state="true";
		
		dto.setUserId(info.getUserId());
		service.insertReport(dto, "reply");
		
		Map<String, Object> model=new HashMap<>();
		model.put("state", state);
		return model;		
	}
	
}
