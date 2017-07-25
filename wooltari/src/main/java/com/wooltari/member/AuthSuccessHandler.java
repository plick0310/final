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