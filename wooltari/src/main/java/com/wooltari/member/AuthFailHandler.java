package com.wooltari.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.AuthenticationServiceException;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

import net.sf.json.JSONObject;

//로그인 실패 처리를 위한 클래스
	public class AuthFailHandler implements AuthenticationFailureHandler{
		protected void forward(HttpServletRequest request, HttpServletResponse response, String path) throws ServletException, IOException {
				// 포워딩
				RequestDispatcher rd = request.getRequestDispatcher(path);
				rd.forward(request, response);
		}
		//서비스단 작업(날짜 등)
		@Override
		public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException AuthenticationException)
				throws IOException, ServletException {
			String error_code;
			if(AuthenticationException instanceof AuthenticationServiceException){
				//권한 인증 에러
				error_code = "1";
				isAjaxHeader(request, response, error_code);
			}
			else if(AuthenticationException instanceof BadCredentialsException){
				//id,pw 에러
				error_code = "2";
				isAjaxHeader(request, response, error_code);
			}
			else if(AuthenticationException instanceof LockedException){
				//서버 잠김 에러
				error_code = "3";
				isAjaxHeader(request, response, error_code);
			}
			else if(AuthenticationException instanceof AuthenticationException ){
				//계정 잠김 에러
				error_code = "4";
				isAjaxHeader(request, response, error_code);
			}
		}
		
		private void isAjaxHeader(HttpServletRequest request, HttpServletResponse response, String error_code)
				throws IOException, ServletException{
			//System.out.println("@@@@@@@@@@@@@@@@" + error_code);
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
				response.sendRedirect(request.getContextPath() + "/member/login?error_code=" + error_code);
				//forward(request, response, "login?error_code=" + error_code);
			}
			
		}
		
		// AJAX 요청인지를 확인하기 위해 작성한 메소드
		private boolean isAjaxRequest(HttpServletRequest request) {
			String header=request.getHeader("AJAX");
			return header!=null && header.equals("true");
		}
}