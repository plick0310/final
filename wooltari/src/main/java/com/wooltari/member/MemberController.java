package com.wooltari.member;


import java.io.File;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller("member.memberController")
public class MemberController {
	@Autowired
	private MemberService service;

	@RequestMapping(value="/member/login", method=RequestMethod.GET)
	public String loginForm(
			String login_error, Model model
			) {
		
		if(login_error!=null){
			String message = "등록되지 않은 아이디이거나,<br>아이디 또는 비밀번호를 잘못 입력하셨습니다.";
			model.addAttribute("message", message);
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
	
	@RequestMapping(value="/member/membergetinfo", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> memberGetInfo(@RequestParam String userId) {
		Member dto = service.readMember(userId);
		// 작업 결과를 json으로 전송
		Map<String, Object> model = new HashMap<>(); 
		model.put("dto", dto);
		return model;
	}
	@RequestMapping(value="/member/memberinfo", method=RequestMethod.POST)
	public String memberInfo(@RequestParam String userId, Model model) throws Exception{
		Member dto = service.readMember(userId);
		model.addAttribute("dto", dto);
		return "member/memberinfo";
	}
	
	@RequestMapping(value="/member/join_submit", method=RequestMethod.POST)
	public String joinSubmit(Member dto, Model model, HttpSession session) throws Exception {
		try {
			// 패스워드 암호화
			ShaPasswordEncoder pe = new ShaPasswordEncoder(256);
			String s = pe.encodePassword(dto.getUserPwd(), null);
			dto.setUserPwd(s);
			
			// 프로필 이미지 저장
			String root=session.getServletContext().getRealPath("/");
			String path=root+File.separator+"uploads"+File.separator+"member"+
					File.separator+"userImg";
			
			service.insertMember(dto, path);
		} catch (Exception e) {
			model.addAttribute("message", "회원가입이 실패했습니다.");
			return "member/notice";
		}
		String message = "울타리의 회원이 되신것을 환영합니다.<br>마이페이지에서 추가정보를 입력하시면 원할한 서비스 이용이 가능합니다.";
		model.addAttribute("message", message);
		
		return "member/notice";
	}
	
	@RequestMapping(value="/member/pwd", method=RequestMethod.GET)
	public String pwdForm(){
		
		return "member/pwd";
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
	public String myPage(Model model , HttpSession session) {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		Member dto = service.readMember(info.getUserId());
		model.addAttribute("dto", dto);
		return ".member.mypage";
	}
	
	@RequestMapping(value="/member/my_main", method=RequestMethod.GET)
	public String my_Main(Model model , HttpSession session){
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		Member dto = service.readMember(info.getUserId());
		model.addAttribute("dto", dto);
		return "member/my_main";
	}
	@RequestMapping(value="/member/my_msg", method=RequestMethod.GET)
	public String my_Msg(Model model , HttpSession session){
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		Member dto = service.readMember(info.getUserId());
		model.addAttribute("dto", dto);
		return "member/my_msg";
	}
	@RequestMapping(value="/member/my_activity", method=RequestMethod.GET)
	public String my_Activity(Model model , HttpSession session){
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		Member dto = service.readMember(info.getUserId());
		model.addAttribute("dto", dto);
		return "member/my_activity";
	}
	@RequestMapping(value="/member/my_info", method=RequestMethod.GET)
	public String my_Info(Model model , HttpSession session){
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		Member dto = service.readMember(info.getUserId());
		model.addAttribute("dto", dto);
		return "member/my_info";
	}
	@RequestMapping(value="/member/my_point", method=RequestMethod.GET)
	public String my_Point(Model model , HttpSession session){
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		Member dto = service.readMember(info.getUserId());
		model.addAttribute("dto", dto);
		return "member/my_point";
	}
	@RequestMapping(value="/member/my_qna", method=RequestMethod.GET)
	public String my_Qna(Model model , HttpSession session){
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		Member dto = service.readMember(info.getUserId());
		model.addAttribute("dto", dto);
		return "member/my_qna";
	}
	@RequestMapping(value="/member/my_out", method=RequestMethod.GET)
	public String my_Out(Model model , HttpSession session){
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		Member dto = service.readMember(info.getUserId());
		model.addAttribute("dto", dto);
		return "member/my_out";
	}
	
	
}
