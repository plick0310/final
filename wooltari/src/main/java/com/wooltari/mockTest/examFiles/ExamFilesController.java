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
	
	@RequestMapping("/mockTest/examFiles") 
	public String examFiles(
			) throws Exception {
		
		return "community/mockTest/examFiles";
	}
	
	@RequestMapping("/mockTest/examJFiles") 
	public String examJFiles(
			) throws Exception {
		
		return "community/mockTest/examJFiles";
	}
}
