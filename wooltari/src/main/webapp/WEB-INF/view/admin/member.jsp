<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>



<script type="text/javascript">

</script>

<table class="table table-striped">
<caption>회원 관리</caption>
<colgroup>
<col width="50"/>
<col width="150"/>
<col width="150"/>
<col width="50"/>
</colgroup>
<tr>
	<th scope="col">선택</th>
	<th scope="col">아이디</th>
	<th scope="col">이름</th>
	<th scope="col">상태</th>
</tr>

<!-- c:forEach로 list 돌림 -->
<c:forEach var="vo" items="${list}">
<tr>
	<td><input type="checkbox" name="chk" value="${vo.userId}"></td>
	<td class="userId">${vo.userId}</td>
	<td class="userName">${vo.userName}</td>
	<!-- c:if문써서 0이면 정지/탈퇴 1이면 정상으로 출력 -->
	<td class="enabled">${vo.enabled}</td>
	
</tr>
</c:forEach>
<!-- c:forEach 끝나는 곳 -->
</table>

<div style="text-align: center;">
<!-- 페이징 처리 들어가는 곳 -->
	<c:if test="${dataCount==0 }">
		등록된 게시물이 없습니다.
	</c:if>
	<c:if test="${dataCount!=0 }">
		${paging}
	</c:if>
</div>

<div class="scArea" style="margin: 30px 10px 30px 200px; margin-left: 700px;">
	<select name="searchKey" class="searchKey" id="searchKey" style="float: left; margin-right: 10px;
    height: 33px;">
		<option value="userId">아이디</option>
		<option value="userName">이름</option>
		<option value="enabled">상태</option>
	</select>
	<input type="text" name="searchValue" class="form-control" id="searchValue" style="width:120px; float: left; "> 
	<input type="button" class="btn btn-primary" onclick="search();" value="검색">
</div>
