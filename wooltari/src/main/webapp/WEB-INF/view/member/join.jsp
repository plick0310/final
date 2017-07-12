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
		    	if(! userCheckForm()) {
		    		return false;
		    	}else{
			    	userCheckId();
		    	}
		    	if($('#checkId').val() == "false") {
		    		return false;
		    	}
		    	
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
		    	}
		    });
		});

		function userCheckId(){
			
			var url="<%=cp%>/member/userIdCheck";
			var userId=$("#form-userid").val();
			var query="userId="+userId;
			$.ajax({
				type:"POST"
				,url:url
				,data:query
				,dataType:"JSON"
				,success:function(data) {
					var passed=data.passed;
					if(passed=="true") {
						var str="<span style='color:blue;font-weight: bold;'>해당 이메일은 사용가능 합니다.</span>";
						$("#form-userid + .help-block").html(str);
						$('#checkId').val("true");
					} else {
						var str="<span style='color:red;font-weight: bold;'>이미 사용중인 이메일입니다.</span>";
						$("#form-userid + .help-block").html(str);
						$("form-userid").val("");
						$("form-userid").focus();
						$('#checkId').val("false");
					}
				}
			});
		}
		function userCheckForm(){
			//이메일 형식 검사
			var userId=$("#form-userid").val();
			var regex=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
			if(!regex.test(userId)) { 
				$("#form-userid").focus();
				var str="<span style='color:red;font-weight: bold;'>잘못된 이메일 형식입니다.</span>";
				$("#form-userid + .help-block").html(str);
				return false;
			}else{
				var str="<span style='color:blue;font-weight: bold;'>이메일 형식을 만족합니다.<span>";
				$("#form-userid + .help-block").html(str);
			}
			//닉네임 검사
			var userName=$.trim($("#form-username").val());
			if(!userName) { 
				$("#form-username").focus();
				var str="<span style='color:red;font-weight: bold;'>이름을 입력해주세요.</span>";
				$("#form-username + .help-block").html(str);
				return false;
			}else{
				var str="<span style='color:blue;font-weight: bold;'>입력하신 닉네임은 '" + userName + "' 입니다.</span>";
				$("#form-username + .help-block").html(str);
			}
			
			//패스워드 형식 검사			
			var userPwd=$("#form-password").val();
			var regex=/^(?=.*[a-z])(?=.*[!@#$%^*+=-]|.*[0-9]).{5,10}$/;
			if(!regex.test(userPwd)) { 
				$("#form-password").focus();
				var str="<span style='color:red;font-weight: bold;'>패스워드는 5~10자이며 하나 이상의 숫자나 특수문자가 포함되어야 합니다.</span>";
				$("#form-password + .help-block").html(str);
				return false;
			}else{
				var str="<span style='color:blue;font-weight: bold;'>패스워드 조건에 만족합니다.<span>";
				$("#form-password + .help-block").html(str);
			}
			//패스워드 2차 확인
			if($("#form-password").val() != $("#form-password2").val()) {
				$("#form-password2").focus();
				var str="<span style='color:red;font-weight: bold;'>패스워드가 일치하지 않습니다.</span>";
				$("#form-password2 + .help-block").html(str);
				return false;
			}else{
				var str="<span style='color:blue;font-weight: bold;'>패스워드가 일치합니다.</span>";
				$("#form-password2 + .help-block").html(str);
			}
			return true;
		}
		
      	//첨부파일
    	$(function(){ 
    		var num=1;
    		var userImg;
    		$('body').on('change', 'input[name=userImgUpload]', function(){ 
    			
    			var src = getFileExtension($(this).val());
    			if(!((src.toLowerCase() == "gif") || (src.toLowerCase() == "jpg") || (src.toLowerCase() == "jpeg"))){
    			        alert('gif 와 jpg 파일만 지원합니다.');
    			        return;
   			    }
    			
    			if(window.FileReader){ 
    				userImg = $(this)[0].files[0].name;
    			} 
    			else { //ie구버전
    				userImg = $(this).val().split('/').pop().split('\\').pop();
    			} 
    			$(this).siblings('.file_upload').val(userImg);
    			
    			//프로필 이미지 미리보기
    			var value = document.memberform.userImgUpload;
    			if (value.files && value.files[0]) {
            		var reader = new FileReader();
            		reader.onload = function (e) {
            			$('#img-thumbnail').attr('src', e.target.result);
            		}
            		reader.readAsDataURL(value.files[0]);
            	}
    			/* 
    			if (value.files && value.files[0]) {
            		window.URL = window.URL || window.webkitURL;
            		var img = document.createElement("img");
            		
            		img.width = 100;
            		img.height = 100;
            		img.src = window.URL.createObjectURL(value.files[0]);
            		img.onload = function(e) {
            			window.URL.revokeObjectURL(this.src);
            		};
            		preview.innerHTML="";
            		preview.appendChild(img);
            	}
    			 */
    		});
    	});
      	
    	// 파일의 확장자를 가져옴
    	function getFileExtension(filePath){  
    	    var lastIndex = -1;
    	    lastIndex  = filePath.lastIndexOf('.');
    	    var extension = "";

    	 if(lastIndex != -1){
    	  extension = filePath.substring( lastIndex+1, filePath.len );
    	 }else{
    	  extension = "";
    	 }
    	    return extension;
    	}
		</script>
	</head>

   	<body class="member-body">
		<div class="member-container2">
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
							<form name="memberform" class="memberform" method="post" role="form" enctype="multipart/form-data">
								<div class="leftContent">
									<div class="form-group">
										<label class="control-label" for="modalUserImg">프로필 사진</label><br>
										<img src="<%=cp%>/resource/img/noprofileimg.png" id="img-thumbnail" class="img-thumbnail" style="width: 100px; height: 100px;"/>
										<div class="fileBox">
											<input class="file_upload" type="text" name="file_upload" readonly="readonly" value="선택된 파일 없음">
											<label for="userImgUpload" class="btn_file">찾아보기</label>
											<input id="userImgUpload" type="file" name="userImgUpload">
										</div>
									</div>
								</div>
							<div class="rightContent">
								<div class="form-group">
									<label class="sr-only" for="form-userid">E-mail</label>
									<input type="text" name="userId" placeholder="E-mail"
									class="form-userid form-control" id="form-userid" onchange="userCheckId();">
									<p class="help-block">아이디는 이메일 주소를 사용합니다.</p>
								</div>
								<div class="form-group">
									<label class="sr-only" for="form-username">Username</label>
									<input type="text" name="userName" placeholder="Name"
									class="form-username form-control" id="form-username">
									<p class="help-block">닉네임을 입력하세요.(한글 6자 / 영어 12자)</p>
								</div>
								<div class="form-group">
									<label class="sr-only" for="gender">Gender</label>
									<div class="form-gender form-control" style="margin: auto;">
										<label class="radio-inline" for="gender-0">
											<input type="radio" name="gender" id="gender-0" value="1" required="required">남자
										</label> 
										<label class="radio-inline" for="gender-1">
											<input type="radio" name="gender" id="gender-1" value="2" required="required">여자
										</label>
									</div>
									<p class="help-block">성별을 선택하세요.</p> 
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
								<input type="hidden" name="checkId" id="checkId" value="false">
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
		
