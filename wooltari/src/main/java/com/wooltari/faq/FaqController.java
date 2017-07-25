package com.wooltari.faq;

import java.net.URLDecoder;
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

@Controller("faq.FaqController")
public class FaqController {
	
	@Autowired
	private FaqService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value="/customer/faq/created", method=RequestMethod.GET)
	public String createdForm(
			Model model, HttpSession session
			)throws Exception{
			model.addAttribute("mode","created");
		return ".customer.faq.created";
	}
	@RequestMapping(value="/customer/faq/created", method=RequestMethod.POST)
	public String createdSubmit(
			Faq dto, HttpSession session
			)throws Exception{
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		if(!info.getUserId().equals("admin")){
			return "redirect:/customer/faq/list";
		}
		dto.setUserId(info.getUserId());
		service.insertFaq(dto);
		
		return ".customer.faq.main";
	}
	
	@RequestMapping(value="/customer/faq/main")
	public String main()throws Exception{
		return ".customer.faq.main";
	}
	
	@RequestMapping(value="/customer/faq/list")
	public String list(
			//@RequestParam(value="num") int num,
			@RequestParam(value="pageNo", defaultValue="1") int current_page,
			@RequestParam(value="searchKey", defaultValue="subject") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			@RequestParam(value="category", defaultValue="all") String category,
			Model model,
			HttpServletRequest req
			)throws Exception{
		
		//줄수, 토탈페이지, 데이타 카운트
		int rows=10;
		int total_page=0;
		int dataCount=0;
		
		//Faq dto=service.readFaq(num);
		//dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
		
		
		//검색값
		if(req.getMethod().equalsIgnoreCase("GET")){
			searchValue=URLDecoder.decode(searchValue,"utf-8");
		}
		
		//맵, 검색값, 데이타카운트, 토탈페이지
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		map.put("category", category);
		
		dataCount=service.dataCount(map);
		if(dataCount !=0)
			total_page=myUtil.pageCount(rows, dataCount);
		
		
		//다른 사람이 자료를 삭제하여 전체페이지수가 변화된 경우
		if(total_page<current_page)
			total_page=current_page;
				
		//리스트에 출력할 데이터의 시작과 끝 
		int start=(current_page-1)*rows+1;
		int end=current_page*rows;
		map.put("start", start);
		map.put("end", end);
		
		//맵의 내용을 리스트에 담기
		List<Faq> list=service.listFaq(map);
		
		//리스트의 번호
		Date endDate= new Date();
		long gap;
		int listNum, n=0;
		
		//이터레이터를 통해 리스트의 내용을 it에 나눠 다음.
		Iterator<Faq> it=list.iterator();
		
		while(it.hasNext()){
			Faq data=(Faq)it.next();
			listNum=dataCount-(start+n-1);
			data.setListNum(listNum);
			data.setContent(data.getContent().replaceAll("\n", "<br>"));
			
			//심플 데이터 포맷 이용 비긴데이트(생성일 구하기)
			SimpleDateFormat formatter=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date beginDate= formatter.parse(data.getCreated());
			
			System.out.println(beginDate);
			
			//날짜 차이
			gap=(endDate.getTime()-beginDate.getTime())/(60*60*1000);
			data.setGap(gap);
			
			data.setCreated(data.getCreated().substring(0,10));
					
			n++;
			switch (data.getCategory()) {
			case "frequentask":
				data.setCategory("자주묻는 질문");
				break;
			case "using":
				data.setCategory("이용관련");
				break;
			case "payment":
				data.setCategory("결제관련 문의");
				break;

			default:
				break;
			}
			
		}
		
		//페이징		
		String paging=myUtil.paging(current_page, total_page);
		
		model.addAttribute("dataCount", dataCount);
		
		model.addAttribute("pageNo", current_page);
		model.addAttribute("category", category);
		
		model.addAttribute("total_page", total_page);
		
		model.addAttribute("list", list);

		model.addAttribute("paging", paging);
		
		model.addAttribute("searchKey", searchKey);
		model.addAttribute("searchValue", searchValue);
		
		return "customer/faq/list";
	}
	

	@RequestMapping(value="/customer/faq/update", method=RequestMethod.GET)
	public String updateForm(
			@RequestParam int num,
			@RequestParam String pageNo,
			Model model,
			HttpSession session)throws Exception{
		
		Faq dto=(Faq)service.readFaq(num);
		if(dto==null){
			return "redirect:/customer/faq/main";
		}
		model.addAttribute("mode", "update");
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("dto", dto);
		
		return ".customer.faq.created";
	}
	
	@RequestMapping(value="/customer/faq/update")
	public String updateSubmit(
			Faq dto,
			@RequestParam String category,
			@RequestParam String pageNo,
			HttpSession session
			)throws Exception{
		
		service.updateFaq(dto);
		return "redirect:/customer/faq/main?page="+pageNo+"&category="+category;
	}
	
	
	@RequestMapping(value="/customer/faq/delete")
	public String delete(
			@RequestParam int num,
			@RequestParam String pageNo,
			@RequestParam String category,
			HttpSession session)throws Exception{
		
		Faq dto=service.readFaq(num);
		if(dto==null){
			return "redirect:/customer/faq/main?page="+pageNo+"&category="+category;
		}
		service.deleteFaq(num);
		
		return "redirect:/customer/faq/main?page="+pageNo+"&category="+category;
	}
	
	
	@RequestMapping(value="/customer/faq/deleteList")
	public String deleteList(
			Integer[] chk,
			@RequestParam String pageNo,
			@RequestParam String category
			)throws Exception{
		List<Integer> list=Arrays.asList(chk);
		service.deleteList(list);
		
		return "redirect:/customer/faq/main?page="+pageNo+"&category="+category;
	}
	
}