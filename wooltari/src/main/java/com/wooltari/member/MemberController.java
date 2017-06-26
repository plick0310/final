package com.wooltari.member;


import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MemberController {
	@Autowired
	private MemberService service;

	@RequestMapping(value="/member/join", method=RequestMethod.GET)
	public String joinForm() throws Exception {
		return "/member/join";
	}
	
	@RequestMapping(value="/member/login", method=RequestMethod.GET)
	public String loginForm() throws Exception {
		return "/member/login";
	}
	
	@RequestMapping(value="/member/kakao", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> kakaoLogin(@RequestParam String userId, @RequestParam String nickName, @RequestParam String profileImg, HttpSession session) throws Exception {
		SessionInfo info = new SessionInfo();
		System.out.println(userId + " : " + nickName + " : " + profileImg);
		info.setUserId(userId);
		info.setUserName(nickName);
		info.setUserImg(profileImg);
		session.setAttribute("member", info);
		
		// 작업 결과를 json으로 전송
		Map<String, Object> model = new HashMap<>();
		model.put("userId", userId);
		return model;
	}
	
	@RequestMapping(value="/member/logout")
	public String logout(HttpSession session) throws Exception {
		// 로그인 정보를 세션에서 삭제 한다.
		session.removeAttribute("member");
		session.invalidate();
		
		return "redirect:/";
	}
	
}
