<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   String cp = request.getContextPath();
%>
<link rel="stylesheet" href="<%=cp%>/resource/css/member-form-elements.css">
<link rel="stylesheet" href="<%=cp%>/resource/css/member-form-style.css">
<!-- 카카오톡 로그인 -->
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
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
		    f.action = "<%=cp%>/member/login_check";
		    f.submit();
    	}
    });
});
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
//로그인 Submit
function sendLogin() {
	var f = document.loginform;
    f.action = "<%=cp%>/member/login_check";
    f.submit();
}
//로그아웃
function sendlogout(){
	//var refreshToken = Kakao.Auth.getRefreshToken();
	Kakao.Auth.logout(function(){
		setTimeout(function(){
		},10);
		location.href="<%=cp%>/member/logout";
	});
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
					<li class="dropdown yamm-fw"><a href="#" data-toggle="dropdown" class="dropdown-toggle">스터디<b
							></b></a>
						<ul class="dropdown-menu">
							<li class="grid-demo">

								<div class="row">
									<div class="col-sm-2"><a href="<%=cp%>/study/search">맞춤스터디 찾기</a></div>
									<div class="col-sm-2"><a href="<%=cp%>/study/created">스터디 만들기</a></div>
									<div class="col-sm-2"><a href="<%=cp%>/promote/list">스터디 홍보</a></div>
									<div class="col-sm-2"><a href="<%=cp%>/studyboard/studywhere/list">스터디 어디서 하지</a></div>
									<div class="col-sm-2"><a href="<%=cp%>">번개 스터디</a></div>
									<div class="col-sm-2"><a href="<%=cp%>/review/list">스터디 후기</a></div>
								</div>
							</li>
						</ul></li>


					<li class="dropdown yamm-fw"><a href="#"
						data-toggle="dropdown" class="dropdown-toggle">커뮤니티<b
							></b></a>
						<ul class="dropdown-menu">
							<li class="grid-demo">

								<div class="row">
									<div class="col-sm-2"><a href="<%=cp%>/mockTest/main">모의 테스트</a></div>
									<div class="col-sm-2"><a href="<%=cp%>">한줄톡톡</a></div>
									<div class="col-sm-2"><a href="<%=cp%>">자유광장</a></div>
									<div class="col-sm-2"><a href="<%=cp%>/community/photalks/list">포톡스</a></div>
									<div class="col-sm-2"><a href="<%=cp%>">교재중고장터</a></div>
									<div class="col-sm-2"><a href="<%=cp%>/community/playZone/home">놀이터</a></div>
								</div>
							</li>
						</ul></li>

					<li class="dropdown yamm-fw"><a href="<%=cp%>/studyMarket/studyMarketBoard/list" class="dropdown-toggle">스터디 마켓<b></b></a>
						
						
						
					<li class="dropdown yamm-fw"><a href="#"
						data-toggle="dropdown" class="dropdown-toggle">자료실<b
							></b></a>
						<ul class="dropdown-menu">
							<li class="grid-demo">

								<div class="row">
									<div class="col-md-6"><a href="<%=cp%>/download/infoReqBoard/list">정보요청</a></div>

									<div class="col-md-6"><a href="<%=cp%>/download/downloadBoard/list">자료다운</a></div>
								</div>
							</li>
						</ul></li>

					<li class="dropdown yamm-fw"><a href="#"
						data-toggle="dropdown" class="dropdown-toggle">고객센터<b
							></b></a>
						<ul class="dropdown-menu">
							<li class="grid-demo">

								<div class="row">
									<div class="col-md-4"><a href="<%=cp%>/customer/notice/list">공지사항</a></div>
									<div class="col-md-4"><a href="<%=cp%>/customer/faq/main">FAQ</a></div>
									<div class="col-md-4"><a href="<%=cp%>/customer/report/list">신고 / 건의</a></div>
								</div>
							</li>
						</ul></li>

				</ul>
				<div class="col-lg-4"
					style="margin-left: 70px; padding-right: 0px; width: 245px;">
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
				<div class="member" style="height: 50px;line-height: 50px;"> 
					<c:if test="${empty sessionScope.member}">
					<span style="color: #d6d6d6;">|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						<a data-toggle="modal" href="#modal">
						<strong style=" font-size: 16px;font-size: 14px;color: #3e3a39;font-weight: 600;
						font-family: 'Open Sans', sans-serif;"> L O G &nbsp;I N</strong>
						<%-- <img src="<%=cp%>/resource/img/loginicon.png" alt="Login"  width="35px" height="35px"> --%>
						</a>
					</c:if>
					<c:if test="${not empty sessionScope.member}">
						<strong style="margin-right: 5px">${sessionScope.member.userName}</strong>
						<c:if test="${empty sessionScope.member.userImg}">
							<a href="#" data-toggle="dropdown" aria-haspopup="true" role="button" aria-expanded="false">
								<img src="<%=cp%>/resource/img/noprofileimg.png" class="img-circle" width="35px" height="35px" style="padding:1px; box-shadow: 2px 2px 5px grey;"> 
							</a>
						</c:if>
						<c:if test="${not empty sessionScope.member.userImg}">
							<a href="#" data-toggle="dropdown" aria-haspopup="true" role="button" aria-expanded="false">
								<img src="<%=cp%>/uploads/member/userImg/${sessionScope.member.userImg}" class="img-circle" width="35px" height="35px" style="padding:1px; box-shadow: 2px 2px 5px grey;">
							</a>
						</c:if>
						<ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
							<c:if test="${empty sessionScope.member.userImg}">
								<img src="<%=cp%>/resource/img/noprofileimg.png" class="img-thumbnail" width="100%" height="100%">
							</c:if>
							<c:if test="${not empty sessionScope.member.userImg}">
								<img src="<%=cp%>/uploads/member/userImg/${sessionScope.member.userImg}" class="img-thumbnail" width="100%" height="100%">
							</c:if>
							<li><h3 style="text-align: center;">${sessionScope.member.userName} 님</h3></li>
							<c:if test="${sessionScope.member.userId == 'admin'}"> 
							<li><a href="<%=cp%>/admin/index">관리자 페이지</a></li>
							</c:if>
							<li><a href="<%=cp%>/member/mypage?pageName=my_info">나의 정보</a></li>
							<li><a href="<%=cp%>/study/mylist">나의 스터디</a></li>
							<li><a href="<%=cp%>/member/mypage?pageName=my_msg">나의 쪽지함</a></li>
							<li><a href="<%=cp%>/member/mypage?pageName=my_calender">나의 스케줄</a></li>
							<li><a href="javascript:sendlogout();">로그아웃</a></li>
						</ul>
					</c:if>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 모달 -->
<div id="modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content" id="modal-content" style="background: none;" >
			<div id="modal-body" class="modal-body">
			
					<div class="member-container">
						<div class="member-outer">
							<div class="member-inner">
								<div class="login-msg">
									<h3></h3>
									<a href="<%=cp%>/member/findmember"><strong>로그인이 안되시나요?</strong></a>
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
											<a href="<%=cp%>/member/findmember"><strong>아이디/비밀번호찾기</strong></a> |
											<a href="<%=cp%>/member/join"><strong> 회원가입</strong></a>
										</div>
									</div>
								</div>
							
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
							</div>
						</div>
					</div>
					
			</div>
		</div>
	</div>
</div>
