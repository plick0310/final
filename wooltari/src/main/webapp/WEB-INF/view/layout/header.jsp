<%@ page contentType="text/html; charset=UTF-8" %>
<%
   String cp = request.getContextPath();
%>
<body data-spy="scroll" data-target=".navbar" data-offset="80">
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
				<a href="#" class="fa fa-home"
					style="margin: 15px; font-size:20px;"></a>
			</div>
			<div id="navbar-collapse-1" class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<!-- Classic list -->
					<li class="dropdown yamm-fw"><a href="#"
						data-toggle="dropdown" class="dropdown-toggle">스터디<b
							></b></a>
						<ul class="dropdown-menu">
							<li class="grid-demo">

								<div class="row">
									<div class="col-sm-2"><a href="<%=cp%>/bbs/list">맞춤스터디 찾기</a></div>
									<div class="col-sm-2"><a href="<%=cp%>">스터디 만들기</a></div>
									<div class="col-sm-2"><a href="<%=cp%>">스터디 홍보</a></div>
									<div class="col-sm-2"><a href="<%=cp%>">스터디 어디서 하지</a></div>
									<div class="col-sm-2"><a href="<%=cp%>">번개 스터디</a></div>
									<div class="col-sm-2"><a href="<%=cp%>">스터디 후기</a></div>
								</div>
							</li>
						</ul></li>


					<li class="dropdown yamm-fw"><a href="#"
						data-toggle="dropdown" class="dropdown-toggle">커뮤니티<b
							></b></a>
						<ul class="dropdown-menu">
							<li class="grid-demo">

								<div class="row">
									<div class="col-sm-2"><a href="<%=cp%>">모의 테스트</a></div>
									<div class="col-sm-2"><a href="<%=cp%>">한줄톡톡</a></div>
									<div class="col-sm-2"><a href="<%=cp%>">자유광장</a></div>
									<div class="col-sm-2"><a href="<%=cp%>">포톡스</a></div>
									<div class="col-sm-2"><a href="<%=cp%>">교재중고장터</a></div>
									<div class="col-sm-2"><a href="<%=cp%>">놀이터</a></div>
								</div>
							</li>
						</ul></li>

					<li class="dropdown yamm-fw"><a href="#"
						data-toggle="dropdown" class="dropdown-toggle">스터디 마켓<b></b></a>
					<li class="dropdown yamm-fw"><a href="#"
						data-toggle="dropdown" class="dropdown-toggle">자료실<b
							></b></a>
						<ul class="dropdown-menu">
							<li class="grid-demo">

								<div class="row">
									<div class="col-md-6"><a href="<%=cp%>">정보요청</a></div>

									<div class="col-md-6"><a href="<%=cp%>">자료다운</a></div>
								</div>
							</li>
						</ul></li>

					<li class="dropdown yamm-fw"><a href="#"
						data-toggle="dropdown" class="dropdown-toggle">고객센터<b
							></b></a>
						<ul class="dropdown-menu">
							<li class="grid-demo">

								<div class="row">
									<div class="col-md-4"><a href="<%=cp%>">공지사항</a></div>
									<div class="col-md-4"><a href="<%=cp%>">FAQ</a></div>
									<div class="col-md-4"><a href="<%=cp%>">신고 / 건의</a></div>
								</div>
							</li>
						</ul></li>





				</ul>
				<div class="col-lg-4"
					style="margin-left: 100px; padding-right: 0px; width: 245px;">
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
				<div class="member" style="margin: 14px 0;">
			<a data-toggle="modal" href="#myModal">Login</a><%@ include file="../member/login.jsp" %> &nbsp;|&nbsp; <span class="fa fa-user" style="font-size: 17px;"></span>
		</div>
			</div>
		</div>
	</div>

	<div class="jquery-script-ads" align="center">
	
		<script type="text/javascript"
			src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
			
		</script>
	</div>
	
	<script
		src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	<script>
		$(function() {
			window.prettyPrint && prettyPrint()
			$(document).on('click', '.yamm .dropdown-menu', function(e) {
				e.stopPropagation()
			})
		})
	</script>
	<script type="text/javascript">
		var _gaq = _gaq || [];
		_gaq.push([ '_setAccount', 'UA-36251023-1' ]);
		_gaq.push([ '_setDomainName', 'jqueryscript.net' ]);
		_gaq.push([ '_trackPageview' ]);

		(function() {
			var ga = document.createElement('script');
			ga.type = 'text/javascript';
			ga.async = true;
			ga.src = ('https:' == document.location.protocol ? 'https://ssl'
					: 'http://www')
					+ '.google-analytics.com/ga.js';
			var s = document.getElementsByTagName('script')[0];
			s.parentNode.insertBefore(ga, s);
		})();
	</script>
</body>
