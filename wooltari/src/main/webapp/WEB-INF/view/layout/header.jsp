<%@ page contentType="text/html; charset=UTF-8" %>
<%
   String cp = request.getContextPath();
%>
<body data-spy="scroll" data-target=".navbar" data-offset="80">
	<div class="mainlogo">
		<div class="mainimg">
			<a href=""> <img alt="" src="<%=cp%>/resource/img/logofi.png"></a>
		</div>
		<div class="member">
			<a href=""> JOIN</a> &nbsp;|&nbsp; <a href="" class="glyphicon glyphicon-user"></a>
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
				<a href="#" class="glyphicon glyphicon-home"
					style="margin: 15px; color: #3e3a39;"></a>
			</div>
			<div id="navbar-collapse-1" class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<!-- Classic list -->
					<li class="dropdown yamm-fw"><a href="#"
						data-toggle="dropdown" class="dropdown-toggle">스터디<b
							class="caret"></b></a>
						<ul class="dropdown-menu">
							<li class="grid-demo">

								<div class="row">
									<div class="col-sm-2"><a href="<%=cp%>/bbs/list">맞춤스터디 찾기</a></div>
									<div class="col-sm-2">스터디 만들기</div>
									<div class="col-sm-2">스터디 홍보</div>
									<div class="col-sm-2">스터디 어디서 하지</div>
									<div class="col-sm-2">번개 스터디</div>
									<div class="col-sm-2">스터디 후기</div>
								</div>
							</li>
						</ul></li>


					<li class="dropdown yamm-fw"><a href="#"
						data-toggle="dropdown" class="dropdown-toggle">커뮤니티<b
							class="caret"></b></a>
						<ul class="dropdown-menu">
							<li class="grid-demo">

								<div class="row">
									<div class="col-sm-2">모의 테스트</div>
									<div class="col-sm-2">한줄톡톡</div>
									<div class="col-sm-2">자유광장</div>
									<div class="col-sm-2">포톡스</div>
									<div class="col-sm-2">교재중고장터</div>
									<div class="col-sm-2">놀이터</div>
								</div>
							</li>
						</ul></li>

					<li class="dropdown yamm-fw"><a href="#"
						data-toggle="dropdown" class="dropdown-toggle">스터디 마켓<b></b></a>
					<li class="dropdown yamm-fw"><a href="#"
						data-toggle="dropdown" class="dropdown-toggle">자료실<b
							class="caret"></b></a>
						<ul class="dropdown-menu">
							<li class="grid-demo">

								<div class="row">
									<div class="col-md-6">정보요청</div>

									<div class="col-md-6">자료다운</div>
								</div>
							</li>
						</ul></li>

					<li class="dropdown yamm-fw"><a href="#"
						data-toggle="dropdown" class="dropdown-toggle">고객센터<b
							class="caret"></b></a>
						<ul class="dropdown-menu">
							<li class="grid-demo">

								<div class="row">
									<div class="col-md-4">공지사항</div>
									<div class="col-md-4">FAQ</div>
									<div class="col-md-4">신고 / 건의</div>
								</div>
							</li>
						</ul></li>





				</ul>
				<div class="col-lg-4"
					style="margin-left: 200px; padding-right: 0px;">
					<div class="input-group">
						<input type="text" class="form-control"
							style="margin: 7.5px 0; border: none; border-radius: 0px;"
							placeholder="Search for..."> <span
							class="input-group-btn">
							<button class="btn btn-info" type="button"
								style="border: 1px solid #3e3a39; border-radius: 0px; background: #3e3a39;">
								<span class="glyphicon glyphicon-search"></span>
							</button>
						</span>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="jquery-script-ads" align="center">
		<script type="text/javascript">
		</script>
		<script type="text/javascript"
			src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
			
		</script>
	</div>
	<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
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
</html>