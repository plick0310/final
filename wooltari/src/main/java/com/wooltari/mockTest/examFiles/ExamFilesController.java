package com.wooltari.mockTest.examFiles;

import java.util.HashMap;
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
import com.wooltari.mockTest.exam.Exam;

@Controller("mockTest.examFiles.examFilesController")
public class ExamFilesController {
	@Autowired
	private ExamFilesService service;
	@Autowired
	private MyUtil myUtil;
	
	/*@RequestMapping("/mockTest/examFiles") 
	public String examFiles(
			@RequestParam(value="pageNo", defaultValue="1") int current_page,
			@RequestParam(value="examNo",defaultValue="examNo") int examNo,
			HttpServletRequest req,
			Model model,
			HttpSession session
			) throws Exception {
		
		System.out.println("들어왔다~");
		System.out.println("examNo값은"+examNo);
		
SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		int rows = 1;

		Map<String, Object> map = new HashMap<>();
		map.put("userId", info.getUserId());
		map.put("num", examNo);
		
        int start = (current_page - 1) * rows +1;
		int end = current_page * rows;
		map.put("start", start);
		map.put("end", end);
		
		// '시험' 리스트
		List<Exam> examtestList = service.listExamfiles(map);
		
		model.addAttribute("examtestList", examtestList);
		
		return "community/mockTest/examFiles";
	}*/
	
	@RequestMapping("/mockTest/examFiles") 
	public String examFiles(
			) throws Exception {
		System.out.println("들어왔다~");	
		
		
		
		return "community/mockTest/examFiles";
	}
}
