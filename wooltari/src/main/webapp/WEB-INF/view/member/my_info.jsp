<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<style>
.form-horizontal {
	padding: 10px;
}
.modal-dialog {
	width: 600px;
	height: 600px;
    margin: 5% auto;
}
.body-box {
    border-collapse: collapse;
    border-spacing: 0;
    display: table;
    table-layout: fixed;
    width: 100%;
}
.body-box aside {
    display: table-cell;
    float: none;
    height: 100%;
    padding: 0;
    vertical-align: top;
}
.body-box .sm-side {
    background: none repeat scroll 0 0 #e5e8ef;
    border-radius: 4px 0 0 4px;
    width: 25%;
}
.body-box .lg-side {
    background: none repeat scroll 0 0 #fff;
    border-radius: 0 4px 4px 0;
    width: 75%;
}
.body-box .sm-side .user-head {
    background: none repeat scroll 0 0 #029e81;
    border-radius: 4px 0 0;
    color: #fff;
    min-height: 80px;
    padding: 10px;
}
.user-head .inbox-avatar {
    float: left;
    width: 65px;
}
.user-head .inbox-avatar img {
    border-radius: 4px;
}
.user-head .user-name {
    display: inline-block;
    margin: 0 0 0 10px;
}
.user-head .user-name h5 {
    font-size: 14px;
    font-weight: 300;
    margin-bottom: 0;
    margin-top: 15px;
}
.user-head .user-name h5 a {
    color: #fff;
}
.user-head .user-name span a {
    color: #87e2e7;
    font-size: 12px;
}
a.mail-dropdown {
    background: none repeat scroll 0 0 #80d3d9;
    border-radius: 2px;
    color: #01a7b3;
    font-size: 10px;
    margin-top: 20px;
    padding: 3px 5px;
}
.btn-compose {
    background: none repeat scroll 0 0 #ff6c60;
    color: #fff;
    padding: 12px 0;
    text-align: center;
    width: 100%;
}
.btn-compose:hover {
    background: none repeat scroll 0 0 #f5675c;
    color: #fff;
}
ul.inbox-nav {
    display: inline-block;
    margin: 0;
    padding: 0;
    width: 100%;
}
.inbox-divider {
    border-bottom: 1px solid #d5d8df;
}
ul.inbox-nav li {
    display: inline-block;
    line-height: 45px;
    width: 100%;
}
ul.inbox-nav li a {
    color: #6a6a6a;
    display: inline-block;
    line-height: 45px;
    padding: 0 20px;
    width: 100%;
}
ul.inbox-nav li a:hover, ul.inbox-nav li.active a, ul.inbox-nav li a:focus {
    background: none repeat scroll 0 0 #d5d7de;
    color: #6a6a6a;
}
ul.inbox-nav li a i {
    color: #6a6a6a;
    font-size: 16px;
    padding-right: 10px;
}
ul.inbox-nav li a span.label {
    margin-top: 13px;
}
ul.labels-info li h4 {
    color: #5c5c5e;
    font-size: 13px;
    padding-left: 15px;
    padding-right: 15px;
    padding-top: 5px;
    text-transform: uppercase;
}
ul.labels-info li {
    margin: 0;
}
ul.labels-info li a {
    border-radius: 0;
    color: #6a6a6a;
}
ul.labels-info li a:hover, ul.labels-info li a:focus {
    background: none repeat scroll 0 0 #d5d7de;
    color: #6a6a6a;
}
ul.labels-info li a i {
    padding-right: 10px;
}
.nav.nav-pills.nav-stacked.labels-info p {
    color: #9d9f9e;
    font-size: 11px;
    margin-bottom: 0;
    padding: 0 22px;
}
.inbox-head {
    background: none repeat scroll 0 0 #1abc9c;
    border-radius: 0 4px 0 0;
    color: #fff;
    min-height: 80px;
    padding: 20px;
}
.inbox-head h3 {
    display: inline-block;
    font-weight: 300;
    margin: 0;
    padding-top: 6px;
}
.inbox-head .sr-input {
    border: medium none;
    border-radius: 4px 0 0 4px;
    box-shadow: none;
    color: #8a8a8a;
    float: left;
    height: 40px;
    padding: 0 10px;
}
.inbox-head .sr-btn {
    background: none repeat scroll 0 0 #00a6b2;
    border: medium none;
    border-radius: 0 4px 4px 0;
    color: #fff;
    height: 40px;
    padding: 0 20px;
}
.table-inbox {
    border: 1px solid #d3d3d3;
    margin-bottom: 0;
}
.table-inbox tr td {
    padding: 12px !important;
}
.table-inbox tr td:hover {
    cursor: pointer;
}
.table-inbox tr td .fa-star.inbox-started, .table-inbox tr td .fa-star:hover {
    color: #f78a09;
}
.table-inbox tr td .fa-star {
    color: #d5d5d5;
}
.table-inbox tr.unread td {
    background: none repeat scroll 0 0 #f7f7f7;
    font-weight: 600;
}
.mail-option {
    display: inline-block;
    margin-bottom: 10px;
    width: 100%;
}
.mail-option .chk-all, .mail-option .btn-group {
    margin-right: 5px;
}
.mail-option .chk-all, .mail-option .btn-group a.btn {
    background: none repeat scroll 0 0 #fcfcfc;
    border: 1px solid #e7e7e7;
    border-radius: 3px !important;
    color: #afafaf;
    display: inline-block;
    padding: 5px 10px;
}
.mail-option .chk-all input[type="checkbox"] {
    margin-top: 0;
}
.mail-option .btn-group a.all {
    border: medium none;
    padding: 0;
}
.inbox-body .modal .modal-body input, .inbox-body .modal .modal-body textarea {
    border: 1px solid #e6e6e6;
    box-shadow: none;
}
.btn-send, .btn-send:hover {
    background: none repeat scroll 0 0 #00a8b3;
    color: #fff;
}
.btn-send:hover {
    background: none repeat scroll 0 0 #009da7;
}
.modal-header h4.modal-title {
    font-family: "Open Sans",sans-serif;
    font-weight: 300;
}
.modal-body label {
    font-family: "Open Sans",sans-serif;
    font-weight: 400;
}
ul {
    list-style-type: none;
    padding: 0px;
    margin: 0px;
}
ul.inbox-pagination {
    float: right;
	font-size: 12px;
	font-weight: 600;
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	myinfo();
	$(".inbox-nav li").click(function () {
		mode = $(this).attr('id');
		$(".inbox-nav li").removeClass("active");
		$(this).addClass("active");
	});
	
	
	$('.memberform input[type="text"], .memberform input[type="password"], .memberform textarea').on('focus', function() {
    	$(this).removeClass('input-error');
    });
});

function login_check() {
	var flag = true;
	$("#memberform").find('input[type=text], input[type=password], textarea').each(function(){
		if( $(this).val() == "" ) {
			$(this).addClass('input-error');
			flag = false;
		}
		else {
			$(this).removeClass('input-error');
		}
	});
	if(flag){
		var params = jQuery("#memberform").serialize();
		$.ajax({
			beforeSend : function(jqXHR) {
	            jqXHR.setRequestHeader("AJAX", true);
			},
			type:"POST",
			url:"<%=cp%>/member/login_check",
			data : params,
			dataType: "json",
			success : function(data) {
				var state = data.state;
				if(state == 'true'){
    				edit();
					$("#pwdmodal").modal("hide"); 
				}else{
					$(".login-msg strong").text("비밀번호를 잘못 입력하셨습니다."); 
				}
			}
		});
	}
}

function myinfo(){
	$.ajax({
		url:"<%=cp%>/member/myinfo",
		dataType:"html",
		success : function(data) {
		$('.content').html(data);
		}
	});
}
function edit(){
	$.ajax({
		url:"<%=cp%>/member/editinfo", 
		dataType:"html",
		success : function(data) {
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
				<h5><a href="#">${dto.userName}</a></h5>
				<span><a href="#">${dto.userId}</a></span>
			</div>
		</div>
                  
		<div class="inbox-body">
		</div>
		
		<ul class="inbox-nav inbox-divider">
			<li id="myinfo" class="active">
				<a href="javascript:myinfo();"><i class="fa fa-user-o" aria-hidden="true"></i> 나의 정보</a>
			</li> 
			<li id="edit">
				<a data-toggle="modal" href="#pwdmodal"><i class="fa fa-pencil-square-o" aria-hidden="true"></i>정보 수정</a>
			</li>
			<li id="out">
				<a href="#"><i class="fa fa-user-times" aria-hidden="true"></i>회원 탈퇴</a>
			</li>
		</ul>
	</aside>
	
	
	<aside class="lg-side">
		<div class="inbox-head">
		</div>
		
		<div class="inbox-body">
			<div class="content">
			<!-- content -->
			</div>
		</div>
	</aside>
</div>

<!-- 모달 -->
<div id="pwdmodal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content" id="modal-content" style="background: none;" >
			<div id="modal-body" class="modal-body">
			
					<div class="member-container">
						<div class="member-outer">
							<div class="member-inner">
								<div class="login-msg">
									<a href="<%=cp%>/member/findmember"><strong>개인정보 보호를 위해 패스워드를 확인합니다.</strong></a>
								</div>
							
							
								<div class="member-form">
									<div class="form-top">
										<span style="font-size: 25px; color: #BDBDBD; font-weight: bold;">
											<span style="font-size: 20px; color: #1abc9c;"
											class="glyphicon glyphicon-pencil"> </span>&nbsp;&nbsp;&nbsp;W O O L T A R I&nbsp;&nbsp;&nbsp;
										</span> <span style="font-size: 24px;"> L O G I N</span>
									</div>
									<div class="form-bottom" style="margin-top: 25px">
										<form id="memberform" name="memberform" class="memberform" method="post" role="form">
											<div class="form-group">
												<label class="sr-only" for="form-userid">E-mail</label>
												<input type="text" name="userId" placeholder="E-mail" class="form-userid form-control" id="form-userid" value="${sessionScope.member.userId}" readonly="readonly">
											</div>
											<div class="form-group">
												<label class="sr-only" for="form-password">Password</label>
												<input type="password" name="userPwd" placeholder="Password" class="form-password form-control" id="form-password">
											</div>
											<button type="button" onclick="login_check();" class="member_btn">확인</button>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
					
			</div>
		</div>
	</div>
</div> 
