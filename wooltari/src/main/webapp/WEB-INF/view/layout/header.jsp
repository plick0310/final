<%@ page contentType="text/html; charset=UTF-8" %>
<%
   String cp = request.getContextPath();
%>

<script type="text/javascript">
//엔터 처리
$(function(){
	   $("input").not($(":button")).keypress(function (evt) {
	        if (evt.keyCode == 13) {
	            var fields = $(this).parents('form,body').find('button,input,textarea,select');
	            var index = fields.index(this);
	            if ( index > -1 && ( index + 1 ) < fields.length ) {
	                fields.eq( index + 1 ).focus();
	            }
	            return false;
	        }
	     });
});

function dialogLogin() {
	$("#modal-content").load("<%=cp%>/member/login");
	$("#modalLogin").modal("show");	
}

function dialogJoin() {
	$("#modal-content").load("<%=cp%>/member/join");
}

function modalSendLogin() {
    var f = document.modalLoginForm;
	var msg = document.getElementById('msg');
	var str = f.modalUserId.value;
    if(!str) {
    	msg.innerHTML="<strong>아이디를 입력해주세요.</strong>";
        f.modalUserId.focus();
        return;
    }

    str = f.modalUserPwd.value;
    if(!str) {
    	msg.innerHTML="<strong>패스워드를 입력하세요.</strong>";
        f.modalUserPwd.focus();
        return;
    }

    f.action = "<%=cp%>/member/login";
    f.submit();
}

</script>

<div data-spy="scroll" data-target=".navbar" data-offset="80">
	<div class="mainlogo">
		<div class="mainimg">
			<a href="<%=cp%>/"> <img alt="" src="<%=cp%>/resource/images/logofifi.png"></a>
		</div>
		
	</div>
	<div class="navbar yamm navbar-info navbar" data-spy="affix"
		data-offset-top="127">
		<div class="container">
			<div class="navbar-header">
				<button type="button" data-toggle="collapse"
					data-target="#navbar-collapse-1" class="navbar-toggle">
					<span class="icon-bar"></span><span class="icon-bar"></span><span
						class="icon-bar"></span>
				</button>
				<a href="<%=cp%>/" class="fa fa-home"
					style="margin: 15px; font-size:20px;"></a>
			</div>
			<div id="navbar-collapse-1" class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<!-- Classic list -->
					<li class="dropdown yamm-fw"><a href="#"
						data-toggle="dropdown" class="dropdown-toggle">스터디<b
							></b></a>
						<ul class="dropdown-menu">
							<li class="grid-demo">

								<div class="row">
									<div class="col-sm-2"><a href="<%=cp%>/bbs/list">맞춤스터디 찾기</a></div>
									<div class="col-sm-2"><a href="<%=cp%>/study/created">스터디 만들기</a></div>
									<div class="col-sm-2"><a href="<%=cp%>">스터디 홍보</a></div>
									<div class="col-sm-2"><a href="<%=cp%>">스터디 어디서 하지</a></div>
									<div class="col-sm-2"><a href="<%=cp%>">번개 스터디</a></div>
									<div class="col-sm-2"><a href="<%=cp%>">스터디 후기</a></div>
								</div>
							</li>
						</ul></li>


					<li class="dropdown yamm-fw"><a href="#"
						data-toggle="dropdown" class="dropdown-toggle">커뮤니티<b
							></b></a>
						<ul class="dropdown-menu">
							<li class="grid-demo">

								<div class="row">
									<div class="col-sm-2"><a href="<%=cp%>/community/exam/list">모의 테스트</a></div>
									<div class="col-sm-2"><a href="<%=cp%>">한줄톡톡</a></div>
									<div class="col-sm-2"><a href="<%=cp%>">자유광장</a></div>
									<div class="col-sm-2"><a href="<%=cp%>">포톡스</a></div>
									<div class="col-sm-2"><a href="<%=cp%>">교재중고장터</a></div>
									<div class="col-sm-2"><a href="<%=cp%>">놀이터</a></div>
								</div>
							</li>
						</ul></li>

					<li class="dropdown yamm-fw"><a href="#"
						data-toggle="dropdown" class="dropdown-toggle">스터디 마켓<b></b></a>
					<li class="dropdown yamm-fw"><a href="#"
						data-toggle="dropdown" class="dropdown-toggle">자료실<b
							></b></a>
						<ul class="dropdown-menu">
							<li class="grid-demo">

								<div class="row">
									<div class="col-md-6"><a href="<%=cp%>">정보요청</a></div>

									<div class="col-md-6"><a href="<%=cp%>">자료다운</a></div>
								</div>
							</li>
						</ul></li>

					<li class="dropdown yamm-fw"><a href="#"
						data-toggle="dropdown" class="dropdown-toggle">고객센터<b
							></b></a>
						<ul class="dropdown-menu">
							<li class="grid-demo">

								<div class="row">
									<div class="col-md-4"><a href="<%=cp%>">공지사항</a></div>
									<div class="col-md-4"><a href="<%=cp%>">FAQ</a></div>
									<div class="col-md-4"><a href="<%=cp%>/help/report/list">신고 / 건의</a></div>
								</div>
							</li>
						</ul></li>

				</ul>
				<div class="col-lg-4"
					style="margin-left: 100px; padding-right: 0px; width: 245px;">
					<form class="form-inline" style="margin: 7.5px;">
					  <div class="form-group">
					    <label class="sr-only" for="exampleInputAmount">Amount (in dollars)</label>
					    <div class="input-group">
					     
					      <input type="text" class="form-control" id="exampleInputAmount" placeholder="검색어를 입력하세요..." 
					      style=" border:3px solid #1abc9c; border-right:none; border-top-left-radius: 20px; border-bottom-left-radius: 20px;">
					      <div class="input-group-addon" style="background:none; border:3px solid #1abc9c; border-left:none; cursor: pointer;  border-top-right-radius: 20px; 
					      border-bottom-right-radius: 20px;" onclick=""><i class="fa fa-search"></i></div>
					    </div>
					  </div>
				
					</form>				
					</div>
				<div class="member" style="margin: 14px 0;">
			<a href="javascript:dialogLogin();">Login</a> &nbsp;|&nbsp; <span class="fa fa-user" style="font-size: 17px;"></span>
		</div>
			</div>
		</div>
	</div>
</div>

<!-- 모달 -->
<div id="modalLogin" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content" id="modal-content">
			<!-- jsp가 들어가는 곳 -->
		</div>
	</div>
</div>
