<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>



<form name="calForm" id="calForm" method="post">
	<div style="margin-left: 17px;">
		<p style="font-size: 30px; font-weight: bold; font-family: monospace; margin-right: 20px;">일정추가</p>
		<hr style="width: auto; margin-top: -15px; margin-right:20px; height: 1px;">
		<table style="margin-top: -20px;">
			<tr>
				<td style="font-weight: bold; font-family: monospace; color: #1abc9c;">시작날짜<br>
					<input type="text" style=" text-align:center;  border: none; color: gray" value="${sdate }" name="sdate" readonly="readonly">
				</td>
			</tr>
	
			<tr>
				<td style="font-weight: bold; font-family: monospace; color: #1abc9c;">종료날짜<br>
					<input type="text" style="  text-align:center; border: none; color: gray" value="${edate }" name="edate" readonly="readonly">
				</td>
			</tr>
			
			<tr>
				<td style="font-weight: bold; font-family: monospace; color: #1abc9c;">타이틀<br>
					<input type="text" name="subject" style=" color: gray">
				</td>
			</tr>
			
			<tr>
				<td style="font-weight: bold; font-family: monospace;  color: #1abc9c;">내용<br>
					<textarea style="color: gray" name="content"></textarea>
				</td>
			</tr>
			
		</table>
		
	</div>
	<input type="hidden" name="month" value="${month }">
	<input type="hidden" name="s_num" value="${s_num }">
</form>