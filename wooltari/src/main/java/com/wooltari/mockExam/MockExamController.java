package com.wooltari.mockExam;

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

import com.wooltari.member.SessionInfo;

@Controller("community.mockExam.mockExamController")
public class MockExamController {

	@Autowired
	private MockExamService service;
	
	
	@RequestMapping(value="/mockTest/mockExam", method=RequestMethod.GET)
	public String mockExam(
			HttpSession session
			) {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		Map<String, Object> map = new HashMap<>();
		map.put("userId", info.getUserId());
	
		return "community/mockTest/mockExam";
	}
	
	@RequestMapping(value="/mockTest/mockExam", method=RequestMethod.POST)
	public String checkExam(
			@RequestParam(value="ansTryList", defaultValue="") String answerList, 
			@RequestParam(value="name", defaultValue="정보처리기사") String name,
			HttpServletRequest req,
			Model model,
			HttpSession session
			) throws Exception {
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		Map<String, Object> map = new HashMap<>();
		map.put("userId", info.getUserId());
		map.put("examinfoName", name);
		
		String s = answerList;
		String [] selectanswerList;
		
		selectanswerList = s.split(",");
		
		List<MockExam> scoring = service.scoring(map);
		// 글번호 만들기
		int examNum=0;
		int result = 0;
		String pass = "채점중";
		int n = 0;
		Iterator<MockExam> it = scoring.iterator();
		while(it.hasNext()) {
			MockExam data = (MockExam)it.next();
			if(n < 10) {
				// getAnswer가 DB의 값을 가지고 있음
				if(data.getAnswer().equals(selectanswerList[n])) {
					result += 10;
				}
				n++;
				data.setResult(result);
	
				if(result >= 60) {
					pass = "합격";
					data.setPass(pass);
				} else {
					pass = "불합격";
					data.setPass(pass);
				}
			} else if(n >= 10) {
				break;
			}
		}
		
		map.put("result", result);
		map.put("pass", pass);
		
		service.insertResult(map);
		
		model.addAttribute("examNum", examNum);
		model.addAttribute("result", result);
		
		return ".community.mockTest.main";
	}
	
	@RequestMapping(value="/mockTest/mockJExam", method=RequestMethod.GET)
	public String mockJExam(
			HttpSession session
			) {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		Map<String, Object> map = new HashMap<>();
		map.put("userId", info.getUserId());
	
		return "community/mockTest/mockJExam";
	}
	
	@RequestMapping(value="/mockTest/mockJExam", method=RequestMethod.POST)
	public String checkJExam(
			@RequestParam(value="ansTryList", defaultValue="") String answerList, 
			@RequestParam(value="name", defaultValue="JLPT N2") String name, 
			HttpServletRequest req,
			Model model,
			HttpSession session
			) throws Exception {
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		Map<String, Object> map = new HashMap<>();
		map.put("userId", info.getUserId());
		map.put("examinfoName", name);
		
		
		String s = answerList;
		String [] selectanswerList;
		
		selectanswerList = s.split(",");
		
		List<MockExam> scoring = service.scoring(map);
		
		// 글번호 만들기
		int examNum = 0;
		int result = 0;
		String pass = "채점중";
		int n = 0;
		Iterator<MockExam> it = scoring.iterator();
		while(it.hasNext()) {
			MockExam data = (MockExam)it.next();
			// getAnswer가 DB의 값을 가지고 있음
			if(data.getAnswer().equals(selectanswerList[n])) {
				result += 10;
			}
			n++;
			data.setResult(result);

			if(result >= 60) {
				pass = "합격";
				data.setPass(pass);
			} else {
				pass = "불합격";
				data.setPass(pass);
			}
		}
		
		map.put("result", result);
		map.put("pass", pass);
		
		service.insertResult(map);
		
		model.addAttribute("examNum",examNum);
		model.addAttribute("result", result);
		
		return ".community.mockTest.main";
	}
	
}