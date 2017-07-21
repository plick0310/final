<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<c:forEach var="dto" items="${list}">
	<div class="col-lg-4 col-md-6 col-sm-12 col-xs-12 default-list-box study-item-wrap">
		<a href="javascript:location.href='<%=cp%>/study/myStudy/home/${dto.s_num}'">
			<div class="study-item list-item align-left">
				<div class="study-item-overlay">
				</div>
				<div class="header-bg" style="background-image:url(<%=cp%>/uploads/member/userImg/${dto.imageFileName})">
				</div>
				<div class="header-text-container">
					<div class="isPayment">
					카테고리 들어갈 곳
					</div>
					<div class="header-text align-left">
						<div class="title-wrap">
							<div class="title">
							${dto.studyName}
							</div>
						</div>
						<div class="tag">
							<span class="last">${dto.study_Info}</span>
						</div>
					</div>
				</div>
				<div class="item-contents align-left">
					<c:if test="${not empty dto.userImg}">
						<div class="profile-image" style="background-image:url(<%=cp%>/uploads/member/userImg/${dto.userImg})"></div>
					</c:if>
					<c:if test="${empty dto.userImg}">
						<div class="profile-image" style="background-image:url(<%=cp%>/resource/img/noprofileimg.png)"></div>
					</c:if>
					<div class="user-name">
						${dto.userName}
					</div>
					<div class="location">
						서울 동작구 사당동
					</div>
					<div class="strong-info">
						<span class="payment"></span> ${dto.gender} <span class="count"></span>
					</div>
					<div class="icon-container">
						<i class="fa fa-user-o" aria-hidden="true"></i><span class="info-comment"> ${dto.memcnt}</span>
					</div>
				</div>
			</div>
		</a>
	</div>
</c:forEach>
<div id="paging" style=" text-align: center; clear: both;">
${paging}
</div>