<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String cp = request.getContextPath();
%>
<style>
.leftContent {
	float: left;
	width: 30%;
}
.rightContent {
	float: right;
	width: 70%;
}
.footerContent {
	clear: both;
}
.fileBox{position: relative}
.fileBox .mem_img{display:inline-block; width:150px; height:25px;}
.fileBox .btn_file{display:inline-block; width:150px; height:25px; border:1px solid #ccc; font-size:12px; background:none; text-align:center; vertical-align:middle; line-height:25px; cursor:pointer}
.fileBox input[type='file'], .fileBox input[type='button']{position:absolute; /*top:14px; left:202px;*/ width:1px; height:1px; padding:0; overflow:hidden; clip:rect(0,0,0,0); border:0}


</style>
<script>
//첨부파일
$(function(){ 
	var num=1;
	var mem_img;
	$('body').on('change', 'input[name=file_upload]', function(){ 
		//alert(num);
		if(window.FileReader){ 
			mem_img = $(this)[0].files[0].name; 
		} 
		else { //ie구버전
			mem_img = $(this).val().split('/').pop().split('\\').pop();
		} 
		$(this).siblings('.mem_img').val(mem_img); 
		
	});

});
</script>
<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal" aria-label="Close">
		<span aria-hidden="true">&times;</span>
	</button>
	<h2 id="myModalLabel" class="modal-title text-center fc-orange"
		style="font-family: sans-serif, 나눔고딕, 맑은 고딕; font-weight: bold;">Join</h2>
</div>

<div class="modal-body" id="modal-body">
	<form name="modalLoginForm" method="post">
		<div class="leftContent">
			<div class="form-group">
				<label class="control-label" for="modalUserImg">프로필 사진</label><br>
				<img src="<%=cp%>/resource/img/noprofileimg.png" class="img-thumbnail" style="width: 150px; height: 150px;"/>
				<div class="fileBox">
					<input class="mem_img" type="text" name="mem_img" readonly="readonly" value="선택된 파일 없음">
					<label for="file_upload" class="btn_file">찾아보기</label>
					<input id="file_upload" type="file" name="file_upload">
				</div>
			</div>
		</div>
			<div class="rightContent">
				<div class="form-group">
					<label class="control-label" for="modalUserId">이메일</label>
					<input class="form-control" id="modalUserId" name="userId" type="text" placeholder="이메일을 입력해주세요.">
				</div>
				<div class="form-group">
					<label class="control-label" for="modalUserNick">닉네임</label>
					<input class="form-control" id="modalUserId" name="userId" type="text" placeholder="다른사람들에게 보여질 닉네임을 입력하세요.">
				</div>
				<div class="form-group">
					<label class="control-label" for="modalUserPwd">패스워드</label>
					<input class="form-control" id="modalUserPwd" name="userPwd" type="password" placeholder="패스워드는 5~10자이며 하나 이상의 숫자나 특수문자가 포함되어야 합니다.">
				</div>
				<div class="form-group">
					<label class="control-label" for="modalUserPwd2">패스워드확인</label>
					<input class="form-control" id="modalUserPwd" name="userPwd" type="password" placeholder="패스워드를 한번 더 입력해주세요.">
				</div>
			</div>
		<div class="footerContent">
			<div class="form-group">
				<div class="msg" id="msg" style="text-align: center;">
				</div>
				<button class="btn btn-lg btn-primary btn-block" type="button" onclick="modalSendLogin();">회원가입</button>
			</div>
		</div>
	</form>
</div>