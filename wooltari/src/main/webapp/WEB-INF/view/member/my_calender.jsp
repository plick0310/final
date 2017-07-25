<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<script type="text/javascript">
var s_num = ${studyList[0].s_num};

$(document).ready(function(){
	reload();
	$(".inbox-nav li").click(function () {
		s_num = $(this).attr('id');
		$(".inbox-nav li").removeClass("active");
		$(this).addClass("active");
		reload();
	});
});

function paging(paging) {
	page = paging;
	reload();
}

function reload(){
	$.ajax({
		type: 'POST'
		,url:"<%=cp%>/study/myStudy/" + s_num + "/calender"
		,success : function(data) {
			$('.content').html(data);
		}
	});
}



</script>
<link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css'>
<div class="body-box">
	<aside class="sm-side">
		<div class="user-head">
			<a class="inbox-avatar" href="#">
			<c:if test="${not empty sessionScope.member.userImg}">
				<img alt="" src="<%=cp%>/uploads/member/userImg/${sessionScope.member.userImg}" width="60" height="60">
        	</c:if>
			<c:if test="${empty sessionScope.member.userImg}">
				<img alt="" src="<%=cp%>/resource/img/noprofileimg.png" width="60" height="60">
			</c:if>
			</a>
			<div class="user-name">
				<h5><a href="#">${mdto.userName}</a></h5>
				<span><a href="#">${mdto.userId}</a></span>
			</div>
		</div>
                  
		<div class="inbox-body">
		</div>
		
		<div style="text-overflow:ellipsis; overflow:hidden">
		<ul class="inbox-nav inbox-divider">
			<!-- 
			<li id="all" class="active">
				<a href="#"><i class="fa fa-bell-o" aria-hidden="true"></i> 전체 스케줄</a>
			</li>
			 -->
		<c:if test="${empty studyList}">
			<strong>가입된 스터디가 없습니다.</strong>
		</c:if>
		<c:forEach var="studyList" items="${studyList}" varStatus="status">
		<c:if test="${status.first}">
			<li id="${studyList.s_num}" class="active">
				<a href="#"><i class="fa fa-calendar-o" aria-hidden="true"></i> ${studyList.studyName}</a>
			</li>
		</c:if>
		<c:if test="${!status.first}">
			<li id="${studyList.s_num}">
				<a href="#"><i class="fa fa-calendar-o" aria-hidden="true"></i> ${studyList.studyName}</a>
			</li>
		</c:if>
		</c:forEach>
		</ul> 
		</div>
	</aside>
	
	<aside class="lg-side">
		
		<div class="inbox-body">
			<div class="content">
			<!-- content -->
			</div>
		</div>
	</aside>
</div>