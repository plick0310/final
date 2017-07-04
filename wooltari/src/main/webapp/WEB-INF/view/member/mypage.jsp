<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<div>
<pre>
-마이페이지-
아이디 : ${dto.userId}
이름 : ${dto.userName}
패스워드 : ${dto.userPwd}
프로필 : ${dto.userImg}
<c:if test="${not empty dto.userImg}">
	<img src="<%=cp%>/uploads/member/userImg/${dto.userImg}" style="max-width: 250px; height: auto; resize: both;">
</c:if>
<c:if test="${empty dto.userImg}">
	<img src="<%=cp%>/resource/img/noprofileimg.png" style="max-width: 250px; height: auto; resize: both;">
</c:if>
생일 : ${dto.birth}
연락처 : ${dto.tel}
가입일 : ${dto.created_date}
수정일 : ${dto.modify_date}
최근로그인 : ${dto.last_login}
포인트 : ${dto.point}
회원상태 : ${dto.enabled}

</pre>

</div>