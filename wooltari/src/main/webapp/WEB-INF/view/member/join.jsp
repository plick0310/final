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
			<label class="control-label" for="modalUserId">이메일</label>
			<input class="form-control" id="modalUserId" name="userId" type="text" placeholder="example@example.com">
		</div>
		<div class="form-group">
			<label class="control-label" for="modalUserPwd">패스워드</label>
			<input class="form-control" id="modalUserPwd" name="userPwd" type="password" placeholder="패스워드는 5~10자이며 하나 이상의 숫자나 특수문자가 포함되어야 합니다.">
		</div>
		<div class="form-group">
			<label class="control-label" for="modalUserPwd">패스워드확인</label>
			<input class="form-control" id="modalUserPwd" name="userPwd" type="password" placeholder="패스워드를 한번 더 입력해주세요.">
		</div>
		<div class="form-group">
			<label class="control-label" for="modalUserId">성별</label><br>
			<label class="radio-inline">
			  <input type="radio" name="inlineRadioOptions" id="inlineRadio1" value="0"> 남자
			</label>
			<label class="radio-inline">
			  <input type="radio" name="inlineRadioOptions" id="inlineRadio2" value="1"> 여자
			</label>
		</div>
		<div class="form-group">
			<img src="<%=cp%>/resource/img/noimg.png"/>
			<label class="control-label" for="modalUserPwd">프로필 사진</label>
		</div>
		
		
		<div class="msg" id="msg" style="text-align: center;">
		</div>
		
		<div class="form-group">
			<button class="btn btn-lg btn-primary btn-block" type="button" onclick="modalSendLogin();">회원가입</button>
		</div>
	</form>
</div>