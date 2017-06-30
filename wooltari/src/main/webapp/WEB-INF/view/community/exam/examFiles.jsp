<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
   String cp = request.getContextPath();
%>

<div style="width: 1000px; height:30px; margin: 13px auto;">
   <div style="height: 50px; font-size: 20px; text-align: center;">
      <span style="font-size: 20px; color: #BDBDBD; font-weight: bold;">
        <span style="font-size: 19px; color: #1abc9c;" class="glyphicon glyphicon-pencil"></span>
        &nbsp;&nbsp;&nbsp;WOOLTARI&nbsp;&nbsp;&nbsp;
      </span>
     <span style="color: #1abc9c; font-weight: bolder;">Trial Examination </span> <br><br>
       <span style="height: 10px; font-size: 27px;"> # 정 보 처 리 기 사</span>
       <span style="font-size: 15px;">[ 17년 3회차 ]</span>
   </div>
   <br><br>
   
   <div style="margin-bottom: 5px; font-size: 15px; width: 100%; text-align: end;">
      <span style="font-size: 20px; color: #1abc9c; font-weight: bolder;">홍길동&nbsp;&nbsp;</span>
         회원님의 응시할 시험 목록입니다.
   </div>
  <br>
  <div>
    <strong>
      1. 첫 번째 문제는 DB 문제입니다.<br>
      DML이 뭐인지 잘 기억해내서 아닌 것을 골라보세요.<br>
    </div>

    <td><br>
      <input type="checkbox" name="chk"> SELECT
      <input type="checkbox" name="chk"> INSERT
      <input type="checkbox" name="chk"> DROP
      <input type="checkbox" name="chk"> UPDATE
    </td>
    </strong>
  <br><br><br>
  
  <strong>
      2. 두 번째 문제도 DB 문제입니다.<br>
      DDL이 뭐인지 잘 기억해내서 아닌 것을 골라보세요.<br>
    <td><br>
      <input type="checkbox" name="chk"> CREATED
      <input type="checkbox" name="chk"> ALTER
      <input type="checkbox" name="chk"> SELECT
      <input type="checkbox" name="chk"> DROP
    </td>
    </strong>
   
</div>