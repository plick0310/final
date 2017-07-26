<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<div id="innerSection">
	
	<div id="innerTitle">포인트 이용내역</div>
	<div id="innerContent">
		<table class="table table-striped">
		<colgroup>
		<col width="100"/>
		<col width="300"/>
		<col width="100"/>
		</colgroup>
		<tr>
			<th scope="col">발생일자</th>
			<th scope="col">내역</th>
			<th scope="col">포인트</th>
		</tr>
		<c:forEach var="dto" items="${list}">
		<tr>
			<td>${dto.term}</td>
			<td>${dto.info}</td>
			<td>${dto.value}</td>
		</tr>
		</c:forEach>
		</table>
		<div style="text-align: center;">
		${paging}
		</div>
	</div>
</div>