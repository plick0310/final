package com.wooltari.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;

import net.sf.json.JSONObject;

//로그인 후 처리를 위한 클래스
public class AuthSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler {
	// 서비스단 작업(날짜 등)
	@Autowired
	private MemberService service;

	protected void forward(HttpServletRequest request, HttpServletResponse response, String path) throws ServletException, IOException {
		// 포워딩
		RequestDispatcher rd = request.getRequestDispatcher(path);
		rd.forward(request, response);
	}
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws ServletException, IOException {

		Member dto = service.readMember(authentication.getName());

		
		System.out.println("-------------------로그인 판단중-------------------");
		// enabled가 0이면 로그인 불가
		/*if(dto.getEnabled() == 0){
			System.out.println("-------------------enabled가" +  dto.getEnabled() + "인 회원-------------------");
			request.setAttribute("message", "탈퇴한 회원이거나 운영자에 의해 활동이 정지된 회원입니다.");
			forward(request, response, "login");
		}*/
		System.out.println("-------------------enabled가" +  dto.getEnabled() + "인 회원-------------------");
		
		// 로그인 날짜 수정(아이디:authentication.getName() )
		service.updateLastLogin(authentication.getName());
		SessionInfo info = new SessionInfo();
		info.setUserId(dto.getUserId());
		info.setUserName(dto.getUserName());
		info.setUserImg(dto.getUserImg());

		HttpSession session = request.getSession();
		session.setAttribute("member", info);

		if (isAjaxRequest(request)) {
			response.setContentType("application/json");
			response.setCharacterEncoding("utf-8");

			JSONObject job = new JSONObject();
			job.put("state", "true");

			PrintWriter out = response.getWriter();
			out.print(job.toString());
			out.flush();
			out.close();
		} else {
			super.onAuthenticationSuccess(request, response, authentication);
		}
	}

	// AJAX 요청인지를 확인하기 위해 작성한 메소드
	private boolean isAjaxRequest(HttpServletRequest req) {
		String header = req.getHeader("AJAX");
		return header != null && header.equals("true");
	}

}