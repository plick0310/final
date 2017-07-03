<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
    <head>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="description" content="">
		<meta name="author" content="">
		<title>Wooltari</title>
		<!-- CSS -->
		<link rel="stylesheet" href="<%=cp%>/resource/css/bootstrap.css">
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
        <link rel="stylesheet" type="text/css" href="<%=cp%>/resource/css/header.css">
		<link rel="stylesheet" type="text/css" href="<%=cp%>/resource/css/style.css">
        <link rel="stylesheet" href="<%=cp%>/resource/fonts/font-awesome/css/font-awesome.min.css">
		<link rel="stylesheet" href="<%=cp%>/resource/css/member-form-elements.css">
        <link rel="stylesheet" href="<%=cp%>/resource/css/member-form-style.css">
        
        <!-- Javascript -->
        <script src="<%=cp%>/resource/js/jquery-1.11.1.min.js"></script>
        <script src="<%=cp%>/resource/js/bootstrap.min.js"></script>
        
        <!--[if lt IE 10]>
            <script src="<%=cp%>/resource/js/placeholder.js"></script>
        <![endif]-->
        
		<script type='text/javascript'>

		$(document).ready(function() {
			
		    $('.memberform input[type="text"], .memberform input[type="password"], .memberform textarea').on('focus', function() {
		    	$(this).removeClass('input-error');
		    });
		    
		    $('.memberform').on('submit', function(e) {
		    	var flag = true;
		    	$(this).find('input[type="text"], input[type="password"], textarea').each(function(){
		    		if( $(this).val() == "" ) {
		    			e.preventDefault();
		    			$(this).addClass('input-error');
		    			flag = false;
		    		}
		    		else {
		    			$(this).removeClass('input-error');
		    		}
		    	});
		    	if(flag){
		    		var f = document.memberform;
		    		f.action = "<%=cp%>/member/join_submit";
				    f.submit();
		    	}
		    });
		});

		function check(){
			var f = document.memberform;
			
			var userId=$("#form-userid").val();
			var regex=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
			if(!regex.test(userId)) { 
				$("#form-userid").focus();
				var str="잘못된 이메일 형식입니다.";
				$("#form-userid + .help-block").html(str);
				return false;
			}
			
			var url="<%=cp%>/member/userIdCheck";
			var query="userId="+userId;
			$.ajax({
				type:"POST"
				,url:url
				,data:query
				,dataType:"JSON"
				,success:function(data) {
					var passed=data.passed;
					if(passed=="true") {
						var str="해당 이메일은 사용가능 합니다.";
						$("#form-userid + .help-block").html(str);
					} else {
						var str="이미 사용중인 이메일입니다.";
						$("#form-userid + .help-block").html(str);
						$("form-userid").val("");
						$("form-userid").focus();
					}
				}
			});
			
			var userPwd=$("#form-password").val();
			var regex=/^(?=.*[a-z])(?=.*[!@#$%^*+=-]|.*[0-9]).{5,10}$/;
			
			if(!regex.test(userPwd)) { 
				$("#form-password").focus();
				var str="패스워드는 5~10자이며 하나 이상의 숫자나 특수문자가 포함되어야 합니다.";
				$("#form-password + .help-block").html(str);
				return false;
			}else{
				var str="패스워드 조건에 만족합니다.";
				$("#form-password + .help-block").html(str);
			}
			
			if($("#form-password").val() != $("#form-password2").val()) {
				$("#form-password2").focus();
				var str="패스워드가 일치하지 않습니다.";
				$("#form-password2 + .help-block").html(str);
				return false;
			}else{
				var str="패스워드가 일치합니다.";
				$("#form-password2 + .help-block").html(str);
			}
			
		}
		</script>
		<style type="text/css">
		.leftContent {
			float: left;
			width: 30%;
			text-align: left;
		}
		.rightContent {
			float: right;
			width: 70%;
		}
		.footerContent {
			clear: both;
		}
		.fileBox{position: relative}
		.fileBox .mem_img{display:inline-block; width:100px; height:25px;}
		.fileBox .btn_file{display:inline-block; width:100px; height:25px; border:1px solid #ccc; font-size:12px; background:none; text-align:center; vertical-align:middle; line-height:25px; cursor:pointer}
		.fileBox input[type='file'], .fileBox input[type='button']{position:absolute; /*top:14px; left:202px;*/ width:1px; height:1px; padding:0; overflow:hidden; clip:rect(0,0,0,0); border:0}
		</style>
		
</head>

   	<body class="member-body">
		<div class="member-container">
			<div class="member-outer">
				<div class="member-inner">
					<div class="member-form">
						<div class="form-top">
							<span style="font-size: 25px; color: #BDBDBD; font-weight: bold;">
								<span style="font-size: 20px; color: #1abc9c;"
								class="glyphicon glyphicon-pencil"> </span>&nbsp;&nbsp;&nbsp;W O O L T A R I&nbsp;&nbsp;&nbsp;
							</span> <span style="font-size: 24px;"> J O I N</span>
						</div>
						<div class="form-bottom" style="margin-top: 25px">
							<form name="memberform" class="memberform" method="post" role="form" onsubmit="return check();">
								<div class="leftContent">
									<div class="form-group">
										<label class="control-label" for="modalUserImg">프로필 사진</label><br>
										<img src="<%=cp%>/resource/img/noprofileimg.png" class="img-thumbnail" style="width: 100px; height: 100px;"/>
										<div class="fileBox">
											<input class="mem_img" type="text" name="mem_img" readonly="readonly" value="선택된 파일 없음">
											<label for="file_upload" class="btn_file">찾아보기</label>
											<input id="file_upload" type="file" name="file_upload">
										</div>
									</div>
								</div>
							<div class="rightContent">
								<div class="form-group">
									<label class="sr-only" for="form-userid">E-mail</label>
									<input type="text" name="userId" placeholder="E-mail"
									class="form-userid form-control" id="form-userid">
									<p class="help-block">아이디는 이메일 주소를 사용합니다.</p>
								</div>
								<div class="form-group">
									<label class="sr-only" for="form-username">Username</label>
									<input type="text" name="userName" placeholder="Name"
									class="form-username form-control" id="form-username">
									<p class="help-block">다른 회원들에게 보여질 별명입니다.</p>
								</div>
								<div class="form-group">
									<label class="sr-only" for="form-password">Password</label>
									<input type="password" name=userPwd placeholder="Password"
									class="form-password form-control" id="form-password">
									<p class="help-block">패스워드를 입력해주세요.</p>
								</div>
								<div class="form-group">
									<label class="sr-only" for="form-password2">Password</label>
									<input type="password" name=userPwd2 placeholder="Password"
									class="form-password form-control" id="form-password2">
									<p class="help-block">패스워드를 한번 더 입력해주세요.</p>
								</div>
								<button type="submit" class="member_btn">회원가입</button>
							</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
		
