<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String cp = request.getContextPath();
%>
<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal" aria-label="Close">
		<span aria-hidden="true">&times;</span>
	</button>
	<h2 id="myModalLabel" class="modal-title text-center fc-orange"
		style="font-family: sans-serif, 나눔고딕, 맑은 고딕; font-weight: bold;">Join</h2>
</div>

<div class="modal-body" id="modal-body">
	<form name="modalLoginForm" method="post">
		<div class="form-group">
			<label class="control-label" for="modalUserId">아이디</label>
			<input class="form-control" id="modalUserId" name="userId" type="text" placeholder="아이디">
		</div>
		<div class="form-group">
			<label class="control-label" for="modalUserPwd">패스워드</label>
			<input class="form-control" id="modalUserPwd" name="userPwd" type="password" placeholder="패스워드">
		</div>

		<div class="form-group">
			<button class="btn btn-lg btn-primary btn-block" type="button" onclick="modalSendLogin();">로그인 <span class="glyphicon glyphicon-ok"></span></button>
		</div>

		<div style="text-align: center;">
			<button type="button" class="btn btn-link" onclick="javascript:dialogJoin();">회원가입</button>
			<button type="button" class="btn btn-link">아이디찾기</button>
			<button type="button" class="btn btn-link">패스워드찾기</button>
		</div>
	</form>
</div>
