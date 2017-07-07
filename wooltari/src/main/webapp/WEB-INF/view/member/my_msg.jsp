<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<style>
.form-group {
	margin: 10px;
}
.form-horizontal {
	padding: 10px;
}
.modal-dialog {
	width: 600px;
	height: 600px;
    margin: 20% auto;
}
.mail-box {
    border-collapse: collapse;
    border-spacing: 0;
    display: table;
    table-layout: fixed;
    width: 100%;
}
.mail-box aside {
    display: table-cell;
    float: none;
    height: 100%;
    padding: 0;
    vertical-align: top;
}
.mail-box .sm-side {
    background: none repeat scroll 0 0 #e5e8ef;
    border-radius: 4px 0 0 4px;
    width: 25%;
}
.mail-box .lg-side {
    background: none repeat scroll 0 0 #fff;
    border-radius: 0 4px 4px 0;
    width: 75%;
}
.mail-box .sm-side .user-head {
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
.inbox-body {
    padding: 20px;
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
ul.inbox-pagination {
    float: right;
}
ul.inbox-pagination li {
    float: left;
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
.inbox-pagination a.np-btn {
    background: none repeat scroll 0 0 #fcfcfc;
    border: 1px solid #e7e7e7;
    border-radius: 3px !important;
    color: #afafaf;
    display: inline-block;
    padding: 5px 15px;
}
.mail-option .chk-all input[type="checkbox"] {
    margin-top: 0;
}
.mail-option .btn-group a.all {
    border: medium none;
    padding: 0;
}
.inbox-pagination a.np-btn {
    margin-left: 5px;
}
.inbox-pagination li span {
	margin: 2px 10px 0px 0px;
    display: inline-block;
    font-size: 14px;
    font-weight: 600;
}
.fileinput-button {
    background: none repeat scroll 0 0 #eeeeee;
    border: 1px solid #e6e6e6;
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
.heading-inbox h4 {
    border-bottom: 1px solid #ddd;
    color: #444;
    font-size: 18px;
    margin-top: 20px;
    padding-bottom: 10px;
}
.sender-info {
    margin-bottom: 20px;
}
.sender-info img {
    height: 30px;
    width: 30px;
}
.sender-dropdown {
    background: none repeat scroll 0 0 #eaeaea;
    color: #777;
    font-size: 10px;
    padding: 0 3px;
}
.view-mail a {
    color: #ff6c60;
}
.attachment-mail {
    margin-top: 30px;
}
.attachment-mail ul {
    display: inline-block;
    margin-bottom: 30px;
    width: 100%;
}
.attachment-mail ul li {
    float: left;
    margin-bottom: 10px;
    margin-right: 10px;
    width: 150px;
}
.attachment-mail ul li img {
    width: 100%;
}
.attachment-mail ul li span {
    float: right;
}
.attachment-mail .file-name {
    float: left;
}
.attachment-mail .links {
    display: inline-block;
    width: 100%;
}

.fileinput-button {
    float: left;
    margin-right: 4px;
    overflow: hidden;
    position: relative;
}
.fileinput-button input {
    cursor: pointer;
    direction: ltr;
    font-size: 23px;
    margin: 0;
    opacity: 0;
    position: absolute;
    right: 0;
    top: 0;
    transform: translate(-300px, 0px) scale(4);
}
.fileupload-buttonbar .btn, .fileupload-buttonbar .toggle {
    margin-bottom: 5px;
}
.files .progress {
    width: 200px;
}
.fileupload-processing .fileupload-loading {
    display: block;
}
* html .fileinput-button {
    line-height: 24px;
    margin: 1px -3px 0 0;
}
* + html .fileinput-button {
    margin: 1px 0 0;
    padding: 2px 15px;
}
@media (max-width: 767px) {
.files .btn span {
    display: none;
}
.files .preview * {
    width: 40px;
}
.files .name * {
    display: inline-block;
    width: 80px;
    word-wrap: break-word;
}
.files .progress {
    width: 20px;
}
.files .delete {
    width: 60px;
}
}
ul {
    list-style-type: none;
    padding: 0px;
    margin: 0px;
}
</style>
<script type="text/javascript">
var mode = "all";
var page = 1;
$(document).ready(function(){
	$.ajax({
		url:"<%=cp%>/message/list",
		dataType:"html",
		success : function(data) {
		$('.msg-list').html(data);
		}
	});
	$.ajax({
		url:"<%=cp%>/message/count",
		type : "POST",
		dataType:"JSON",
		success : function(data) {
			$('#recv_Count').html(data.recv_Count);
		}
	});
	noreadCount = setInterval(function() {
		$.ajax({
			url:"<%=cp%>/message/count",
			type : "POST",
			dataType:"JSON",
			success : function(data) {
				$('#recv_Count').html(data.recv_Count);
			}
		});
		$.ajax({
			url:"<%=cp%>/message/list?mode=" + mode + "&page=" + page,
			dataType:"html",
			success : function(data) {
			$('.msg-list').html(data);
			}
		});
	}, 3000);
	$(".inbox-nav li").click(function () {
		mode = $(this).attr('id');
		page = 1;
		$(".inbox-nav li").removeClass("active");
		$(this).addClass("active");
		$.ajax({
			url:"<%=cp%>/message/list?mode=" + mode,
			dataType:"html",
			success : function(data) {
			$('.msg-list').html(data);
			}
		});
	});
	$("#myModal").on('hidden.bs.modal', function () {
		$("#recv_Id").val("");
		$("#recv_Id").removeAttr('readonly');
	});
});
function messagePaging(paging) {
	page = paging;
	$.ajax({
		url:"<%=cp%>/message/list?mode=" + mode + "&page=" + page,
		dataType:"html",
		success : function(data) {
		$('.msg-list').html(data);
		}
	});
}

function sendMsg(userId) {
	$("#recv_Id").val(userId);
	$("#recv_Id").attr('readonly', 'readonly');
	$("#myModal").modal('show');
}

function readMsg() {
	
}

</script>
<link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css'>
<div class="mail-box">
                  <aside class="sm-side">
                      <div class="user-head">
                          <a class="inbox-avatar" href="javascript:;">
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
                          <a class="mail-dropdown pull-right" href="javascript:;">
                              <i class="fa fa-chevron-down"></i>
                          </a>
                      </div>
                      <div class="inbox-body">
                          <a href="#myModal" data-toggle="modal"  title="Compose"    class="btn btn-compose">
                              	새 쪽지 보내기
                          </a>
                          
                          <!-- Modal -->
                          <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModal" class="modal fade" style="display: none;">
                              <div class="modal-dialog">
                                  <div class="modal-content">
                                      <div class="modal-header">
                                          <button aria-hidden="true" data-dismiss="modal" class="close" type="button">×</button>
                                          <h4 class="modal-title">쪽지 보내기</h4>
                                      </div>
                                      <div class="modal-body">
                                          <form role="form" class="form-horizontal">
                                          <div class="form-group">
                                                  <label class="col-lg-2 control-label">From</label>
                                                  <div class="col-lg-10">
                                                      <input type="text" class="form-control" id="sent_Id" name="sent_Id" readonly="readonly" value="${sessionScope.member.userName}(${sessionScope.member.userId})">
                                                  </div>
                                              </div>
                                              <div class="form-group">
                                                  <label class="col-lg-2 control-label">To</label>
                                                  <div class="col-lg-10">
                                                      <input type="text" placeholder="받는 분의 아이디(example@example.com)" class="form-control" id="recv_Id" name="recv_Id" required="required">
                                                  </div>
                                              </div>
                                              <div class="form-group">
                                                  <label class="col-lg-2 control-label">Message</label>
                                                  <div class="col-lg-10">
                                                      <textarea rows="10" cols="30" placeholder="보내실 내용을 입력해주세요." class="form-control" id="content" name="content" required="required"></textarea>
                                                  </div>
                                              </div>
                                              <div class="form-group">
                                                  <div class="col-lg-offset-2 col-lg-10 text-right">
                                                      <button class="btn btn-send" type="submit">Send</button>
                                                  </div>
                                              </div>
                                          </form>
                                      </div>
                                  </div><!-- /.modal-content -->
                              </div><!-- /.modal-dialog -->
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
                              <a href="#"><i class="fa fa-paper-plane-o"></i>보낸 쪽지함</a>
                          </li>
                          <li id="keep">
                              <a href="#"><i class="fa fa-folder-o"></i> 쪽지 보관함</a>
                          </li>
                          <li id="trash">
                              <a href="#"><i class=" fa fa-trash-o"></i> 휴지통</a>
                          </li>
                      </ul>
                      <ul class="nav nav-pills nav-stacked labels-info inbox-divider">
                          <li> <h4>스터디 쪽지함</h4> </li>
                          <li> <a href="#"> <i class=" fa fa-sign-blank text-danger"></i>Study1</a> </li>
                          <li> <a href="#"> <i class=" fa fa-sign-blank text-success"></i>Study2</a> </li>
                          <li> <a href="#"> <i class=" fa fa-sign-blank text-info "></i>Study3</a>
                          </li><li> <a href="#"> <i class=" fa fa-sign-blank text-warning "></i>Study4</a>
                          </li><li> <a href="#"> <i class=" fa fa-sign-blank text-primary "></i>Study5</a>
                          </li>
                      </ul>
                      <ul class="nav nav-pills nav-stacked labels-info ">
                          <li> <h4>스터디 멤버</h4> </li>
                          <li> <a href="javascript:dialogURLID('/member/memberinfo', 'admin');"> <i class=" fa fa-circle text-success"></i>하동기</a>  </li>
                          <li> <a href="javascript:dialogURL('/member/login');"> <i class=" fa fa-circle text-danger"></i>이형석</a> </li>
                          <li> <a href="javascript:dialogChat();"> <i class=" fa fa-circle text-muted "></i>오세훈</a> </li>
                          <li> <a href="javascript:dialogChat();"> <i class=" fa fa-circle text-muted "></i>이수정</a> </li>
                          <li> <a href="javascript:dialogChat();"> <i class=" fa fa-circle text-muted "></i>이주영</a> </li>
                          <li> <a href="javascript:dialogChat();"> <i class=" fa fa-circle text-muted "></i>이도현</a> </li>
                      </ul>

                      <div class="inbox-body text-center">
                          <div class="btn-group">
                              <a class="btn mini btn-primary" href="javascript:;">
                                  <i class="fa fa-plus"></i>
                              </a>
                          </div>
                          <div class="btn-group">
                              <a class="btn mini btn-success" href="javascript:;">
                                  <i class="fa fa-phone"></i>
                              </a>
                          </div>
                          <div class="btn-group">
                              <a class="btn mini btn-info" href="javascript:;">
                                  <i class="fa fa-cog"></i>
                              </a>
                          </div>
                      </div>

                  </aside>
                  <aside class="lg-side">
                      <div class="inbox-head">
                          <form action="#" class="pull-right position">
                              <div class="input-append">
                                  <input type="text" class="sr-input" placeholder="쪽지 검색">
                                  <button class="btn sr-btn" type="button"><i class="fa fa-search"></i></button>
                              </div>
                          </form>
                      </div>
                      <div class="inbox-body">
                      	<div class="msg-list">
                       	  <!-- 여기가 쪽지 리스트 -->
						</div>
                      </div>
                  </aside>
              </div>