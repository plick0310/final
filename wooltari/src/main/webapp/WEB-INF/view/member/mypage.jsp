<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<script type="text/javascript">
/* 
$(document).ready(function() {
	$(".btn-pref .btn").click(function () {
	    $(".btn-pref .btn").removeClass("btn-primary").addClass("btn-default");
	    // $(".tab").addClass("active"); // instead of this do the below 
	    $(this).removeClass("btn-default").addClass("btn-primary");   
	});
	});
*/
$(document).ready(function(){
	$.ajax({
		url:"<%=cp%>/member/my_main",
		dataType:"html",
		success : function(data) {
		$('.tab-content').html(data);
		}
	});
	$(".btn-pref .btn").click(function () {
		$(".btn-pref .btn").removeClass("btn-primary").addClass("btn-default");
		$(this).removeClass("btn-default").addClass("btn-primary");   
		
		var fileName;
		pageName = $(this).attr('id');
		$.ajax({
			url:"<%=cp%>/member/" + pageName,
			dataType:"html",
			success : function(data) {
			$('.tab-content').html(data);
			}
		});
	});
});
</script>
<style>
/* USER PROFILE PAGE */
 .card {
    margin-top: 20px;
    padding: 30px;
    background-color: rgba(214, 224, 226, 0.2);
    -webkit-border-top-left-radius:5px;
    -moz-border-top-left-radius:5px;
    border-top-left-radius:5px;
    -webkit-border-top-right-radius:5px;
    -moz-border-top-right-radius:5px;
    border-top-right-radius:5px;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
}
.card.hovercard {
    position: relative;
    padding-top: 0;
    overflow: hidden;
    text-align: center;
    background-color: #fff;
    background-color: rgba(255, 255, 255, 1);
}
.card.hovercard .card-background {
    height: 130px;
}
.card-background img {
    -webkit-filter: blur(25px);
    -moz-filter: blur(25px);
    -o-filter: blur(25px);
    -ms-filter: blur(25px);
    filter: blur(25px);
    margin-left: -100px;
    margin-top: -200px;
    min-width: 130%;
}
.card.hovercard .useravatar {
    position: absolute;
    top: 15px;
    left: 0;
    right: 0;
}
.card.hovercard .useravatar img {
    width: 100px;
    height: 100px;
    max-width: 100px;
    max-height: 100px;
    -webkit-border-radius: 50%;
    -moz-border-radius: 50%;
    border-radius: 50%;
    border: 5px solid rgba(26, 188, 156, 0.8);
}
.card.hovercard .card-info {
    position: absolute;
    bottom: 14px;
    left: 0;
    right: 0;
}
.card.hovercard .card-info .card-title {
    padding:0 5px;
    font-size: 20px;
    line-height: 1;
    color: #262626;
    background-color: rgba(255, 255, 255, 0.1);
    -webkit-border-radius: 4px;
    -moz-border-radius: 4px;
    border-radius: 4px;
}
.card.hovercard .card-info {
    overflow: hidden;
    font-size: 12px;
    line-height: 20px;
    color: #737373;
    text-overflow: ellipsis;
}
.card.hovercard .bottom {
    padding: 0 20px;
    margin-bottom: 17px;
}
.btn-pref .btn {
    -webkit-border-radius:0 !important;
}
</style>
<div class="container">
    <div class="card hovercard">
        <div class="card-background">
            <img class="card-bkimg" alt="" src="http://lorempixel.com/100/100/people/9/">
            <!-- http://lorempixel.com/850/280/people/9/ -->
        </div>
        <div class="useravatar">
            <img alt="" src="<%=cp%>/uploads/member/userImg/${sessionScope.member.userImg}">
        </div>
        <div class="card-info"> <span class="card-title">${sessionScope.member.userName}</span>

        </div>
    </div>
    <div class="btn-pref btn-group btn-group-justified btn-group-lg" role="group" aria-label="...">
        <div class="btn-group" role="group">
            <button type="button" id="my_main" class="btn btn-primary" data-toggle="tab"><span class="glyphicon glyphicon-star" aria-hidden="true"></span>
                <div class="hidden-xs">마이페이지</div>
            </button>
        </div>
        <div class="btn-group" role="group">
            <button type="button" id="my_msg" class="btn btn-default" data-toggle="tab"><span class="glyphicon glyphicon-comment" aria-hidden="true"></span>
                <div class="hidden-xs">쪽지함</div>
            </button>
        </div>
        <div class="btn-group" role="group">
            <button type="button" id="my_activity" class="btn btn-default" data-toggle="tab"><span class="glyphicon glyphicon-stats" aria-hidden="true"></span>
                <div class="hidden-xs">나의 활동</div>
            </button>
        </div>
        <div class="btn-group" role="group">
            <button type="button" id="my_info" class="btn btn-default" data-toggle="tab"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>
                <div class="hidden-xs">나의 정보</div>
            </button>
        </div>
        <div class="btn-group" role="group">
            <button type="button" id="my_point" class="btn btn-default" data-toggle="tab"><span class="glyphicon glyphicon-ruble" aria-hidden="true"></span>
                <div class="hidden-xs">나의 포인트</div>
            </button>
        </div>
        <div class="btn-group" role="group">
            <button type="button" id="my_qna" class="btn btn-default" data-toggle="tab"><span class="glyphicon glyphicon-earphone" aria-hidden="true"></span>
                <div class="hidden-xs">1:1 문의내역</div>
            </button>
        </div>
        <div class="btn-group" role="group">
            <button type="button" id="my_out" class="btn btn-default" data-toggle="tab"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                <div class="hidden-xs">회원 탈퇴</div>
            </button>
        </div>
    </div>

    <div class="well">
      <div class="tab-content" style="height: 1200px">
        	<!-- 여기에 내용이 표시됨 -->
      </div>
    </div>
</div>
            
    