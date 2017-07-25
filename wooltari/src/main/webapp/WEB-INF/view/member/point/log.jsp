<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<table class="table table-striped">
<caption>포인트 이용내역</caption>
<colgroup>
<col width="110"/>
<col width="243"/>
<col width="242"/>
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