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
        
		<!-- 카카오톡 로그인 -->
		<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
		<script type='text/javascript'>

		$(document).ready(function() {
			
		    /*
		        Form validation
		    */
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
				    f.action = "<%=cp%>/member/login_check";
				    f.submit();
		    	}
		    });
		});
		
		function sendLogin() {
			var f = document.loginform;
		    f.action = "<%=cp%>/member/login_check";
		    f.submit();
		}
		<%-- 
		//<![CDATA[
		// 사용할 앱의 JavaScript 키를 설정해 주세요.
		Kakao.init('510168497a3434cba4caf707891b2cca');
		function loginWithKakao() {
		  // 로그인 창을 띄웁니다.
		  Kakao.Auth.login({
		    	persistAccessToken: true,
				persistRefreshToken: true,
		    success: function(authObj) {
		    	getKakaoProfile();
		    },
		    fail: function(err) {
		      alert(JSON.stringify(err));
		    }
		  });
		};
		
		function getKakaoProfile(){
			Kakao.API.request({
				url: '/v1/user/me',
				success: function(res) {
					/* 
					alert("인증여부 : " + res.kaccount_email_verified);
					alert("이메일 : " + res.kaccount_email);
					alert("닉네임 : " + res.properties.nickname);
					alert("프로필이미지 : " + res.properties.profile_image);
					 */
					var userId = res.kaccount_email;
					var userName = res.properties.nickname;
					var userImg = res.properties.profile_image;
					var json_data = {"userId":userId,"userName":userName,"userImg":userImg};
					$.ajax({
						type:"POST"
						,url:"<%=cp%>/member/login_kakao"
						,data:json_data
						,dataType:"JSON"
						,success:function(data) {
							window.location.href='<%=cp%>/main';
						}
						,error:function(e) {
							alert(e.responseText);
						}
					});
				},
				fail: function(error) {
					console.log(error);
				}
			});
		}
		--%>
		</script>
	</head>
   	<body class="member-body">
		<div class="member-container2">
			<div class="member-outer">
				<div class="member-inner">
					<div class="login-msg">
						<h3>${message}</h3>
						<a href="<%=cp%>/customer/faq/main"><strong>로그인이 안되시나요?</strong></a>
					</div>
				
				
					<div class="member-form">
						<div class="form-top">
							<span style="font-size: 25px; color: #BDBDBD; font-weight: bold;">
								<span style="font-size: 20px; color: #1abc9c;"
								class="glyphicon glyphicon-pencil"> </span>&nbsp;&nbsp;&nbsp;W O O L T A R I&nbsp;&nbsp;&nbsp;
							</span> <span style="font-size: 24px;"> L O G I N</span>
						</div>
						<div class="form-bottom" style="margin-top: 25px">
							<form name="memberform" class="memberform" method="post"
								role="form">
								<div class="form-group">
									<label class="sr-only" for="form-userid">E-mail</label>
									<input type="text" name="userId" placeholder="E-mail"
									class="form-userid form-control" id="form-userid">
								</div>
								<div class="form-group">
									<label class="sr-only" for="form-password">Password</label>
									<input type="password" name=userPwd placeholder="Password"
									class="form-password form-control" id="form-password">
								</div>
								<button type="submit" class="member_btn">로그인</button>
							</form>
							<div style="margin-top: 25px">
								<a href="#"><strong>아이디/비밀번호찾기</strong></a> |
								<a href="<%=cp%>/member/join"><strong> 회원가입</strong></a>
							</div>
						</div>
					</div>
					<!-- 
					<div class="login-social">
						<h3>소셜 계정 로그인</h3>
						<div class="social-login-buttons">
							<a class="btn btn-link-1 btn-link-1-kakaotalk" href="javascript:loginWithKakao();">
							<i class="fa fa-comments"></i><strong> KaKao</strong>
							</a> <a class="btn btn-link-1 btn-link-1-facebook" href="#">
							<i class="fa fa-facebook"></i><strong> Facebook</strong>
							</a> <a class="btn btn-link-1 btn-link-1-google-plus" href="#">
							<i class="fa fa-google"></i><strong> Google</strong>
							</a>
						</div>
					</div>
					 -->
				</div>
			</div>
		</div>
	</body>
</html>
		
