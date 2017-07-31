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
	min-height:800px;
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
.body-box .sm-side .user-head {
    background: none repeat scroll 0 0 #373635;

    color: #fff;
    min-height: 80px;
    padding: 10px;
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
.inbox-body {
    padding: 20px;
}
.btn-compose {
    background: none repeat scroll 0 0 #ffffff;
    color: #373635;
    padding: 12px 0;
    text-align: center;
    width: 100%;
    border-radius: 0;
}
.btn-compose:hover {
    background: none repeat scroll 0 0 #d6d6d6;
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
    border: 1px solid #cccccc;
    border-radius: 4px 0 0 4px;
    box-shadow: none;
    color: #8a8a8a;
    float: left;
    height: 40px;
    padding: 0 10px;
}
.inbox-head .sr-btn {
    background: none repeat scroll 0 0 #1abc9c;
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
var mode = "all";
var page = 1;
var searchValue = "";
$(document).ready(function(){
	msgLoad();
	noreadCount = setInterval(function() {
		msgLoad();
	}, 60000);
	$(".inbox-nav li").click(function () {
		mode = $(this).attr('id');
		page = 1;
		searchValue = "";
		$(".inbox-nav li").removeClass("active");
		$(this).addClass("active");
		msgLoad();
	});
	$("#myModal").on('hidden.bs.modal', function () {
		$('#send-btn').show();
		$("#recv_Id").val("");
		$("#content").val("");
		$("#recv_Id").removeAttr('readonly');
		$("#content").removeAttr('readonly');
		msgLoad();
	});
});

function paging(paging) {
	page = paging;
	msgLoad();
}

function msgLoad(){
	$.ajax({
		url:"<%=cp%>/message/list?mode=" + mode + "&page=" + page + "&searchValue=" + searchValue,
		dataType:"html",
		success : function(data) {
		$('.content').html(data);
		}
	});
	$.ajax({
		url:"<%=cp%>/message/count",
		type : "POST",
		dataType:"JSON",
		success : function(data) {
			if(data.recv_Count != 0){
				$('#recv_Count').html(data.recv_Count);
			}else{
				$('#recv_Count').html("");
			}
		}
	});
}

function readMsg(num) {
	var params = "num="+num;
	$.ajax({
			url: '<%=cp%>/message/read',
			type: 'POST',
			data:params,
			dataType: 'JSON',
			success: function (data) {
				var state = data.state;
				if(state=="true") { 
					$('#send-btn').hide();
					$("#sent_Id").val(data.sent_Id);
					$("#recv_Id").val(data.recv_Id);
					$("#recv_Id").attr('readonly', 'readonly');
					$("#content").val(data.content);
					$("#content").attr('readonly', 'readonly');
					$("#myModal").modal('show');
				} else {
					alert("메시지 로딩 실패");
				}
			}
			,error:function(e) {
				console.log(e.responseText);
			}
	});
}

function sendMsg(userId) {
	$("#recv_Id").val(userId);
	$("#recv_Id").attr('readonly', 'readonly');
	$("#myModal").modal('show');
}

function submitMsg() {
    var params = jQuery("#form-horizontal").serialize(); // serialize() : 입력된 모든Element(을)를 문자열의 데이터에 serialize 한다.
    $.ajax({
        url: '<%=cp%>/message/send',
        type: 'POST',
        data:params,
        dataType: 'json',
        success: function (data) {
        	var state = data.state;
        	if(state=="true") { 
				$('.modal.in').modal('hide') 
			} else {
				alert("전송 실패! 받는사람을 확인 해 주세요.");
			}
        }
        ,error:function(e) {
			console.log(e.responseText);
		}
    });
}

function searchMsg() {
	searchValue = $('.sr-input').val();
	msgLoad();
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
			<a href="#myModal" data-toggle="modal"  title="Compose"    class="btn btn-compose">새 쪽지 보내기</a>
			<!-- Modal -->
			<div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModal" class="modal fade" style="display: none;">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button aria-hidden="true" data-dismiss="modal" class="close" type="button">×</button>
							<h4 class="modal-title">쪽지</h4>
						</div>
						<div class="modal-body">
							<form role="form" id="form-horizontal" class="form-horizontal" method="post">
								<div class="form-group">
									<label class="col-lg-2 control-label">보낸 사람</label>
									<div class="col-lg-10">
										<input type="text" class="form-control" id="sent_Id" name="sent_Id" readonly="readonly" value="${sessionScope.member.userName}(${sessionScope.member.userId})">
									</div>
								</div>
								<div class="form-group">
									<label class="col-lg-2 control-label">받는 사람</label>
									<div class="col-lg-10">
										<input type="text" placeholder="받는 분의 아이디(example@example.com)" class="form-control" id="recv_Id" name="recv_Id" required="required">
									</div>
								</div>
								<div class="form-group">
									<label class="col-lg-2 control-label">내용</label>
									<div class="col-lg-10">
										<textarea rows="10" cols="30" placeholder="보내실 내용을 입력해주세요." class="form-control" id="content" name="content" required="required"></textarea>
									</div>
								</div>
								<div class="form-group">
									<div class="col-lg-offset-2 col-lg-10 text-right">
										<button id="send-btn" name="send-btn" class="btn btn-send" type="button" onclick="submitMsg()">Send</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- /.modal -->
		</div>
		
		<ul class="inbox-nav inbox-divider">
			<li id="all" class="active" >
				<a href="#"><i class="fa fa-envelope-o"></i> 전체 쪽지함</a>
			</li>
			<li id="receive">
				<a href="#"><i class="fa fa-inbox"></i> 받은 쪽지함<span class="label label-danger pull-right" id="recv_Count"></span></a>
			</li>
			<li id="send">
				<a href="#"><i class="fa fa-paper-plane-o"></i> 보낸 쪽지함</a>
			</li>
			<li id="keep">
				<a href="#"><i class="fa fa-folder-o"></i> 쪽지 보관함</a>
			</li>
			<li id="trash">
				<a href="#"><i class=" fa fa-trash-o"></i> 휴지통</a>
			</li>
		</ul>
	</aside>
	
	
	<aside class="lg-side">
		<div class="inbox-head">
			<form action="#" class="pull-right position">
				<div class="input-append">
					<input type="text" class="sr-input" placeholder="쪽지 검색">
					<button class="btn sr-btn" type="button" onclick="searchMsg();"><i class="fa fa-search"></i></button>
				</div>
			</form>
		</div>
		
		<div class="content">
		<!-- content -->
		</div>
	</aside>
</div>