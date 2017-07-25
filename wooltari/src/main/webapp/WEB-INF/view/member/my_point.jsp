<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<script type="text/javascript">
var mode = "log";
var page = 1;
var searchValue = "";

$(document).ready(function(){
	reload();
	$(".inbox-nav li").click(function () {
		mode = $(this).attr('id');
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
		url:"<%=cp%>/point/log?mode=" + mode + "&page=" + page + "&searchValue=" + searchValue,
		dataType:"html",
		success : function(data) {
		$('.content').html(data);
		}
	});
	
	<%-- 
	var query = { "info":"글 작성", "value":30}
	$.ajax({
		url:"<%=cp%>/point/update",
		data:query,
		type:"post",
		dataType:"json",
		success : function(data) {
			var state = data.state;
			if(state == "true"){
				alert("포인트 적용 성공");
			}else{
				alert("포인트 적용 실패");
			}
		}
	});
	--%>
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
				<h5><a href="#">${dto.userName}</a></h5>
				<span><a href="#">${dto.userId}</a></span>
			</div>
		</div>
                  
		<div class="inbox-body">
		</div>
		
		<div style="text-overflow:ellipsis; overflow:hidden">
		<ul class="inbox-nav inbox-divider">
			<li id="log" class="active">
				<a href="#"><i class="fa fa-list-alt" aria-hidden="true"></i> 포인트 이용내역</a>
			</li>
			<li id="pay">
				<a href="#"><i class="fa fa-credit-card" aria-hidden="true"></i> 포인트 충전</a>
			</li>
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