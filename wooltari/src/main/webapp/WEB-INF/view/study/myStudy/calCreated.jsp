<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>



<form name="calForm" method="post">
	<div>
		<p style="font-size: 30px; font-weight: bold; font-family: monospace;">일정추가</p><hr style="width: auto;">
		<table>
			<tr>
				<td style="font-weight: bold; font-family: monospace;">시작날짜:<input type="text" value="${startDate }" name="startDate" readonly="readonly"></td>
			</tr>
		
			<tr>
				<td style="font-weight: bold; font-family: monospace;">종료날짜:<input type="text" value="${endDate }" name="endDate" readonly="readonly"></td>
			</tr>
			
			<tr>
				<td style="font-weight: bold; font-family: monospace; padding-top: 10px;">일정제목:<input type="text" name="subject"></td>
			</tr>
			
			<tr>
				<td style="font-weight: bold; font-family: monospace; padding-top: 10px; padding-left: 11px;">일정내용<textarea style="margin-left: 9px;" name="content"></textarea></td>
			</tr>
			
		</table>
	</div>
</form>