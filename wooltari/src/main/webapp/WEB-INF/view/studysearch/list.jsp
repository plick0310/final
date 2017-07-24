<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<style>
#list-header > .select, .option-section .add-filter-btn {
    width: 118px;
    border-radius: 0;
    height: 38px;
    font-size: 13px;
}
.inline {
    display: inline-block !important;
}
</style>
<div id="list-header">
	<div class="result-box inline">
		검색결과 <span class="result-num">${dataCount}</span>개
	</div>
</div>

<div id="list-box">
	<div id="search-list" class="row">
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
								<c:forEach var="vo" items="${dto.listCategory}">
									${vo.subject}&nbsp; 
								</c:forEach>
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
								<c:forEach var="vo" items="${dto.listLocal}" end="0">
									<h3>${vo.city}</h3> 
								</c:forEach>
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
	</div>
	<div id="paging" style=" text-align: center; clear: both;">
	${paging}
	</div>
</div>