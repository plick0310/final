package com.wooltari.mockTest.exam;

import java.net.URLDecoder;
import java.text.SimpleDateFormat;
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
import org.springframework.web.bind.annotation.RequestParam;

import com.wooltari.common.MyUtil;
import com.wooltari.member.SessionInfo;

@Controller("mockTest.exam.examController")
public class ExamController {
	@Autowired
	private ExamService service;
	@Autowired
	private MyUtil myUtil;
	
	// exam 리스트
	@RequestMapping("/mockTest/exam") 
	public String examList(
			@RequestParam(value="pageNo", defaultValue="1") int current_page,
			@RequestParam(value="searchKey", defaultValue="examInfoName") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			HttpServletRequest req,
			Model model,
			HttpSession session
			) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		int rows = 5; // 한 화면에 보여주는 게시물 수
		int dataCount = 0;
		int total_page = 0;
		
		if(req.getMethod().equalsIgnoreCase("GET")) { // GET 방식인 경우
			searchValue = URLDecoder.decode(searchValue, "utf-8");
		}
		
		Map<String, Object> map = new HashMap<>();
		map.put("userId", info.getUserId());
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		
		// 카운트는 최대 5까지 설정
		dataCount = service.dataCount(map);
        if(dataCount != 0)
            total_page = myUtil.pageCount(rows,  dataCount) ;
		
        if(total_page < current_page) {
        	current_page = total_page;
        }
		
        int start = (current_page - 1) * rows +1;
		int end = current_page * rows;
		map.put("start", start);
		map.put("end", end);
		
        
		// '시험' 리스트
		List<Exam> examtestList = service.listExam(map);
		
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		
		Date beginDate = new Date();
		
		long gap;
		int examlistNum = 0;
		int n=1;
		
		Iterator<Exam> it = examtestList.iterator();
		while(it.hasNext()) {
			Exam data = (Exam)it.next();
			examlistNum = n;
			data.setExamlistNum(examlistNum);
			
			Date endDate = formatter.parse(data.getCreated());
			
			gap = (endDate.getTime() - beginDate.getTime()) / (60*60*1000);
			data.setGap((int)gap);
			
			data.setCreated(data.getCreated().substring(0,10));
			
			n++;
		}
		
		String paging = myUtil.paging(current_page, total_page);
		
		model.addAttribute("examtestList", examtestList);
		model.addAttribute("pageNo",current_page);
		model.addAttribute("dataCount",dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging",paging);
		
		return "community/mockTest/exam";
	}
}
