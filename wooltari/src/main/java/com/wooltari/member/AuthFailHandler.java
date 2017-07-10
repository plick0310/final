package com.wooltari.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

import net.sf.json.JSONObject;

//로그인 실패 처리를 위한 클래스
public class AuthFailHandler implements AuthenticationFailureHandler{
	//서비스단 작업(날짜 등)
	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException AuthenticationException)
			throws IOException, ServletException {
		
		if(isAjaxRequest(request)) {
	    	  response.setContentType("application/json");
	    	  response.setCharacterEncoding("utf-8");

	    	  JSONObject job=new JSONObject();
	    	  job.put("state", "false");

	    	  PrintWriter out = response.getWriter();
	    	  out.print(job.toString());
	    	  out.flush();
	    	  out.close();
	      } else {
	    	  //super.onAuthenticationSuccess(request, response, AuthenticationException);
	    	  //여기서 포워드
	    	  request.setAttribute("message", "로그인 실패!");
	    	  
	    	  
	      }
	}
	
	// AJAX 요청인지를 확인하기 위해 작성한 메소드
	private boolean isAjaxRequest(HttpServletRequest req) {
		String header=req.getHeader("AJAX");
		return header!=null && header.equals("true");
	}
}