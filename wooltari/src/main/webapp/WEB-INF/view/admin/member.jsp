<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<table class="table table-striped">
<caption>회원 관리</caption>
<colgroup>
<col width="110"/>
<col width="243"/>
<col width="242"/>
</colgroup>
<tr>
	<th scope="col">아이디</th>
	<th scope="col">이름</th>
	<th scope="col">상태</th>
</tr>

<!-- c:forEach로 list 돌림 -->
<tr>
	<td>admin</td>
	<td>관리자</td>
	<td>정상<!-- c:if문써서 0이면 정지/탈퇴 1이면 정상으로 출력 --></td>
</tr>
<!-- c:forEach 끝나는 곳 -->
</table>

<div style="text-align: center;">
<!-- 페이징 처리 들어가는 곳 -->
</div>