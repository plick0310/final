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
		
		</script>
</head>

   	<body class="member-body">
		<div class="member-container">
			<div class="member-outer">
				<div class="member-inner">
					<div class="login-msg">
						<a href="<%=cp%>/member/findmember"><strong>개인정보 보호를 위해 패스워드를 확인합니다.</strong></a>
					</div>
				
				
					<div class="member-form">
						<div class="form-top">
							<span style="font-size: 25px; color: #BDBDBD; font-weight: bold;">
								<span style="font-size: 20px; color: #1abc9c;"
								class="glyphicon glyphicon-pencil"> </span>&nbsp;&nbsp;&nbsp;W O O L T A R I&nbsp;&nbsp;&nbsp;
							</span> <span style="font-size: 24px;"> L O G I N</span>
						</div>
						<div class="form-bottom" style="margin-top: 25px">
							<form name="memberform" class="memberform" method="post" role="form">
								<div class="form-group">
									<label class="sr-only" for="form-userid">E-mail</label>
									<input type="text" name="userId" placeholder="E-mail" class="form-userid form-control" id="form-userid" value="${sessionScope.member.userId}" readonly="readonly">
								</div>
								<div class="form-group">
									<label class="sr-only" for="form-password">Password</label>
									<input type="password" name=userPwd placeholder="Password" class="form-password form-control" id="form-password">
								</div>
								<button type="submit" class="member_btn">확인</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
		
