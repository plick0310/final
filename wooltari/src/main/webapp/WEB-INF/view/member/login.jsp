<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String cp = request.getContextPath();
%>
<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal" aria-label="Close">
		<span aria-hidden="true">&times;</span>
	</button>
	<h2 id="myModalLabel" class="modal-title text-center fc-orange"
		style="font-family: sans-serif, 나눔고딕, 맑은 고딕; font-weight: bold;">Login</h2>
</div>

<div class="modal-body" id="modal-body">
	<form name="modalLoginForm" method="post">
		<div class="form-group">
			<label class="control-label" for="modalUserId">이메일</label>
			<input class="form-control" id="modalUserId" name="userId" type="text" placeholder="example@example.com">
		</div>
		<div class="form-group">
			<label class="control-label" for="modalUserPwd">패스워드</label>
			<input class="form-control" id="modalUserPwd" name="userPwd" type="password" placeholder="패스워드를 입력해주세요.">
		</div>

		<div class="msg" id="msg" style="text-align: center;">
		</div>
		
		<div class="form-group">
			<button class="btn btn-lg btn-primary btn-block" type="button" onclick="modalSendLogin();">로그인</button>		
		</div>
		
		<div class="form-group">
			<a id="custom-login-btn" href="javascript:loginWithKakao()">
			<img src="<%=cp%>/resource/img/kakao_btn.png" width="100%"/>
			</a>
		</div>
		
		<div style="text-align: center;">
			<button type="button" class="btn btn-link" onclick="javascript:dialogJoin();">회원가입</button>
			<button type="button" class="btn btn-link">아이디/패스워드찾기</button>
		</div>
	</form>
</div>
