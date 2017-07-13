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
			String error_code, Model model
			) {
		String message;
		if(error_code != null){
			if(error_code.equals("1")){
				message = "권한을 인증받는 도중 오류가 발생하였습니다.";
				model.addAttribute("message", message);
			}else if(error_code.equals("2")){
				message = "등록되지 않은 아이디이거나,<br>비밀번호를 잘못 입력하셨습니다.";
				model.addAttribute("message", message);
			}else if(error_code.equals("3")){
				message = "서버에 문제가 있어 로그인이 불가합니다.";
				model.addAttribute("message", message);
			}else if(error_code.equals("4")){
				message = "탈퇴한 회원이거나,<br>운영자에 의해 계정이 정지된 회원입니다.";
				model.addAttribute("message", message);
			}
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
	
	@RequestMapping(value="/member/myinfo", method=RequestMethod.GET)
	public String myInfo(HttpSession session, Model model) throws Exception{
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		Member dto = service.readMember(info.getUserId());
		model.addAttribute("dto", dto);
		return "member/info/myinfo";
	}
	
	@RequestMapping(value="/member/editinfo", method=RequestMethod.GET)
	public String editInfo(HttpSession session, Model model) throws Exception{
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		Member dto = service.readMember(info.getUserId());
		model.addAttribute("dto", dto);
		return "member/info/editinfo";
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
		model.addAttribute("message", "울타리의 회원이 되신것을 환영합니다.<br>마이페이지에서 추가정보를 입력하시면 원할한 서비스 이용이 가능합니다.");
		return "member/notice";
	}
	
	@RequestMapping(value="/member/update_submit", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateSubmit(Member dto, HttpSession session) throws Exception {
		Map<String, Object> model = new HashMap<>();
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		try {
			// 패스워드 암호화
			ShaPasswordEncoder pe = new ShaPasswordEncoder(256);
			String s = pe.encodePassword(dto.getUserPwd(), null);
			dto.setUserPwd(s);
			
			// 아이디 설정
			dto.setUserId(info.getUserId());
						
			// 프로필 이미지 저장
			String root=session.getServletContext().getRealPath("/");
			String path=root+File.separator+"uploads"+File.separator+"member"+File.separator+"userImg";
			service.updateMember(dto, path);
		} catch (Exception e) {
			model.put("state", "false");
			return model;
		}
		// 세션 정보 수정
		info.setUserName(dto.getUserName());
	    info.setUserImg(dto.getUserImg());
		model.put("state", "true");
		return model;
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
	@RequestMapping(value="/member/my_customer", method=RequestMethod.GET)
	public String my_Customer(Model model , HttpSession session){
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		Member dto = service.readMember(info.getUserId());
		model.addAttribute("dto", dto);
		return "member/my_customer";
	}
	@RequestMapping(value="/member/my_out", method=RequestMethod.GET)
	public String my_Out(Model model , HttpSession session){
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		Member dto = service.readMember(info.getUserId());
		model.addAttribute("dto", dto);
		return "member/my_out";
	}
	
	
}
