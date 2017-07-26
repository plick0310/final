<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<link rel="stylesheet" href="<%=cp%>/resource/css/mypage.css">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script> 
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>
<script type="text/javascript">
var noreadCount = null;
var pageName = '${pageName}';
$(document).ready(function(){
	myPageLoad();
	$('#'+pageName).removeClass("btn-default").addClass("btn-primary");
	$(".btn-pref .btn").click(function () {
		$(".btn-pref .btn").removeClass("btn-primary").addClass("btn-default");
		$(this).removeClass("btn-default").addClass("btn-primary");   
		
		pageName = $(this).attr('id');
		if(noreadCount != null){
			clearInterval(noreadCount);
			noreadCount=null;
		}
		myPageLoad();
	});
});

function myPageLoad() {
	$.ajax({
		url:"<%=cp%>/member/" + pageName,
		dataType:"html",
		success : function(data) {
		$('.tab-content').html(data);
		}
	});
}
</script>
<div class="container">
	
    <div class="btn-pref btn-group btn-group-justified btn-group-lg" role="group" aria-label="...">
        <div class="btn-group" role="group">
            <button type="button" id="my_main" class="btn btn-default" data-toggle="tab">
            	<i class="fa fa-star-o" aria-hidden="true"></i>
                <div class="hidden-xs">마이페이지</div>
            </button>
        </div>
        <div class="btn-group" role="group">
            <button type="button" id="my_msg" class="btn btn-default" data-toggle="tab">
            	<i class="fa fa-envelope-o" aria-hidden="true"></i>
                <div class="hidden-xs">쪽지함</div>
            </button>
        </div>
        
        <div class="btn-group" role="group">
            <button type="button" id="my_info" class="btn btn-default" data-toggle="tab">
            	<i class="fa fa-user-o" aria-hidden="true"></i>
                <div class="hidden-xs">나의 정보</div>
            </button>
        </div>
        <div class="btn-group" role="group">
            <button type="button" id="my_calender" class="btn btn-default" data-toggle="tab">
            	<i class="fa fa-calendar" aria-hidden="true"></i>
                <div class="hidden-xs">나의 스케줄</div>
            </button>
        </div>
        <div class="btn-group" role="group">
            <button type="button" id="my_point" class="btn btn-default" data-toggle="tab">
            	<i class="fa fa-krw" aria-hidden="true"></i>
                <div class="hidden-xs">나의 포인트</div>
            </button>
        </div>
    </div>

    <div class="well">
      <div class="tab-content">
        	<!-- 여기에 내용이 표시됨 -->
      </div>
    </div>
</div>
            
    