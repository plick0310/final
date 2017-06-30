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
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
        <link rel="stylesheet" href="<%=cp%>/resource/css/bootstrap.min.css">
        <link rel="stylesheet" href="<%=cp%>/resource/fonts/font-awesome/css/font-awesome.min.css">
		<link rel="stylesheet" href="<%=cp%>/resource/css/login-form-elements.css">
        <link rel="stylesheet" href="<%=cp%>/resource/css/login-style.css">
        
        <!-- Javascript -->
        <script src="<%=cp%>/resource/js/jquery-1.11.1.min.js"></script>
        <script src="<%=cp%>/resource/js/bootstrap.min.js"></script>
        <script src="<%=cp%>/resource/js/jquery.backstretch.min.js"></script>
        <%-- <script src="<%=cp%>/resource/js/login-scripts.js"></script> --%>
        
        <!--[if lt IE 10]>
            <script src="<%=cp%>/resource/js/placeholder.js"></script>
        <![endif]-->
        
		<!-- 카카오톡 로그인 -->
		<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
		<script type='text/javascript'>
		
		$(document).ready(function() {
		    /*
		        Fullscreen background
		    */
		    $.backstretch("<%=cp%>/resource/img/login_background.jpg");
		    
		    /*
		        Form validation
		    */
		    $('.login-form input[type="text"], .login-form input[type="password"], .login-form textarea').on('focus', function() {
		    	$(this).removeClass('input-error');
		    });
		    
		    $('.login-form').on('submit', function(e) {
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
		    		var f = document.loginform;
				    f.action = "<%=cp%>/member/login_check";
				    f.submit();
		    	}
		    });
		    
		});
		<%-- 
		function sendLogin() {
			var f = document.loginform;
		    f.action = "<%=cp%>/member/login_check";
		    f.submit();
		}
		 --%>
		
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
							window.location.reload();
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
		</script>
</head>

    <body>
		<div class="body-container">
		
		    <!-- Top content -->
		        <div class="top-content">
		        	
		            <div class="inner-bg">
		                <div class="container">
		                    <div class="row">
		                        <div class="col-sm-8 col-sm-offset-2 text">
		                            <div class="description"> 
		                            	<p>${message}</p>
		                            	<a href="<%=cp%>/member/findmember"><strong>로그인이 안 되시나요?</strong></a>
		                            </div>
		                        </div>
		                    </div>
		                    <div class="row">
		                        <div class="col-sm-6 col-sm-offset-3 form-box">
		                        	<div class="form-top">
		                        		<div class="form-top-left"> 
											<span style="font-size: 25px;color:#BDBDBD; font-weight: bold;"> 
											<span style="font-size: 20px; color: #1abc9c; " class="glyphicon glyphicon-pencil">
											</span>&nbsp;&nbsp;&nbsp;W O O L T A R I&nbsp;&nbsp;&nbsp;</span>
											<span style="font-size: 24px;"> L O G I N</span> 
		                        		</div>
		                            </div>
		                            <div class="form-bottom">
					                    <form name="loginform"  class="login-form" method="post" role="form" > 
					                    	<div class="form-group">
					                    		<label class="sr-only" for="form-username">Username</label>
					                        	<input type="text" name="userId" placeholder="E-mail" class="form-username form-control" id="form-username">
					                        </div>
					                        <div class="form-group">
					                        	<label class="sr-only" for="form-password">Password</label>
					                        	<input type="password" name=userPwd placeholder="Password" class="form-password form-control" id="form-password">
					                        </div>
					                        <button type="submit" class="btn">로그인</button>
					                        <div style="margin-top: 25px">  
					                        <a href="<%=cp%>/member/findmember"><strong>아이디/비밀번호 찾기</strong></a> | 
		                            		<a href="<%=cp%>/member/join"><strong> 회원 가입</strong></a>
		                            		</div> 
					                    </form>
				                    </div>
		                        </div>
		                    </div>
		                    <div class="row">
		                        <div class="col-sm-6 col-sm-offset-3 social-login">
		                        	<h3>소셜 계정 로그인</h3>
		                        	<div class="social-login-buttons">
			                        	<a class="btn btn-link-1 btn-link-1-kakaotalk" href="#">
			                        		<i class="fa fa-comments"></i> KaKao
			                        	</a>
			                        	<a class="btn btn-link-1 btn-link-1-facebook" href="#">
			                        		<i class="fa fa-facebook"></i> Facebook
			                        	</a>
			                        	<a class="btn btn-link-1 btn-link-1-twitter" href="#">
			                        		<i class="fa fa-twitter"></i> Twitter
			                        	</a>
			                        	<a class="btn btn-link-1 btn-link-1-google-plus" href="#">
			                        		<i class="fa fa-google-plus"></i> Google
			                        	</a>
		                        	</div>
		                        </div>
		                    </div>
		                </div>
		            </div>
		        </div>
		</div>
    </body>
</html>
		
