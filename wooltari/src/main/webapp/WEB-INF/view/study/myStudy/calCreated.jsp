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
			<tr style="font-size: 25px; font-weight: bolder; font-family: monospace; ">
				<td style="color: #1abc9c;">시작날짜<br>
					<input type="text" style="  width:130px; text-align:center;  border: none; color: gray" value="${sdate }" name="sdate" readonly="readonly">
				</td>
				<td style="color: #1abc9c; padding-left: 100px;">종료날짜<br>
					<input type="text" style=" width:130px; text-align:center; border: none; color: gray" value="${edate }" name="edate" readonly="readonly">
				</td>
			</tr>

			
			<tr>
				<td colspan="2" style="font-weight: bold; font-family: monospace; color: #1abc9c; font-size: 25px;">타이틀<br>
					<input type="text" name="subject" style=" color: gray; width: 450px;">
				</td>
			</tr>
			
			<tr>
				<td colspan="2" style="font-weight: bold; font-family: monospace;  color: #1abc9c; font-size: 25px;">내용<br>
					<textarea style="color: gray; width: 450px; height: 160px;" name="content"></textarea>
				</td>
			</tr>
			
		</table>
		
	</div>
	<input type="hidden" name="month" value="${month }">
	<input type="hidden" name="s_num" value="${s_num }">
</form>