package com.wooltari.member;


import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MemberController {
	@Autowired
	private MemberService service;

	@RequestMapping(value="/member/login", method=RequestMethod.GET)
	public String loginForm(
			String login_error, Model model
			) {
		
		if(login_error!=null){
			String s = "등록되지 않은 아이디이거나,<br>아이디 또는 비밀번호를 잘못 입력하셨습니다.";
			model.addAttribute("message", s);
			model.addAttribute("modalflag", "false");
		}
		// 로그인 폼
		return "member/login";
	}
	
	@RequestMapping(value="/member/noAuth")
	public String noAuth(){
		return ".member.noAuthorized";
	}
	
	@RequestMapping(value="/member/join", method=RequestMethod.GET)
	public String joinForm() throws Exception {
		return "member/join";
	}
	
	@RequestMapping(value="/member/join_submit", method=RequestMethod.GET)
	public String joinSubmit() throws Exception {
		
		return ".member.complete";
	}
	
	@RequestMapping(value="/member/userIdCheck")
	@ResponseBody
	public Map<String, Object> userIdCheck(
			@RequestParam String userId
			) throws Exception {
		String passed="false";
		Member dto=service.readMember(userId);
		if(dto==null)
			passed="true";
		
   	    // 작업 결과를 json으로 전송
		Map<String, Object> model = new HashMap<>(); 
		model.put("passed", passed);
		return model;
	}
	
	@RequestMapping(value="/member/login_kakao", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> Login_kakao(@RequestParam String userId, @RequestParam String userName, @RequestParam String userImg, HttpSession session) throws Exception {
		SessionInfo info = new SessionInfo();
		System.out.println(userId + " : " + userName + " : " + userImg);
		info.setUserId(userId);
		info.setUserName(userName);
		info.setUserImg(userImg);
		session.setAttribute("member", info);
		
		// 작업 결과를 json으로 전송
		Map<String, Object> model = new HashMap<>();
		model.put("userId", userId);
		return model;
	}
	
	@RequestMapping(value="/member/mypage", method=RequestMethod.GET)
	public String myPage() {
		
		return ".member.mypage";
	}
	
	
	
}
