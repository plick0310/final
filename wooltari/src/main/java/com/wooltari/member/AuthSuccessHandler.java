package com.wooltari.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;

//로그인 후 처리를 위한 클래스
public class AuthSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler{
   //서비스단 작업(날짜 등)
   @Autowired
   private MemberService service;
   
   
   @Override
   public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
         Authentication authentication) throws ServletException, IOException {
      
      //로그인 날짜 수정(아이디:authentication.getName() )
      service.updateLastLogin(authentication.getName());
      Member dto=service.readMember(authentication.getName());
      SessionInfo info=new SessionInfo();
      info.setUserId(dto.getUserId());
      info.setUserName(dto.getUserName());
      info.setUserImg(dto.getUserImg());
      
      HttpSession session=request.getSession();
      session.setAttribute("member", info);
      
      super.onAuthenticationSuccess(request, response, authentication);
   }
   

}