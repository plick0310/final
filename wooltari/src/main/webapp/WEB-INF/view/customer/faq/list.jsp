<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<style type="text/css">
* {
	box-sizing: border-box;
}

body {
	margin: 0;
}

.nav a, .nav a:link, .nav a:visited, .nav a:hover, .nav a:focus, span {
	color: #3e3a39;
}

.headerbody {
	width: 1140px;
	margin: 0px auto;
}

input[id=allCheck] {
	display: none;
}

input[id=allCheck]+label {
	display: inline-block;
	cursor: pointer;
	position: relative;
	padding-left: 25px;
	font-size: 13px;
}

input[id=allCheck]+label:before {
	content: "";
	display: inline-block;
	width: 13px;
	height: 13px;
	margin-right: 10px;
	position: absolute;
	left: 0;
	top: 3px;
	bottom: 1px;
	background-color: #ccc;
	border-radius: 16px;
	box-shadow: inset 0px 1px 1px 0px rgba(0, 0, 0, .3), 0px 1px 0px 0px
		rgba(255, 255, 255, .8);
}

input[id=allCheck]:checked+label:before {
	text-shadow: 1px 1px 1px rgba(0, 0, 0, .2);
	font-size: 7px;
	font-weight: 800;
	color: #fff;
	background: #1abc9c;
	text-align: center;
	line-height: 15px;
}

.clickbtn {
	background-color: white;
	border-style: solid;
	padding: 5px 20px;
	margin-right: 10px;
	border: 1px solid #EAEAEA;
}

ul.tabs {
	margin: 0;
	padding: 0;
	float: left;
	list-style: none;
	height: 32px;
	border-left: 1px solid #eee;
	width: 900px;
	font-family: "dotum";
	font-size: 12px;
	font-family: "dotum";
}

ul.tabs li {
	float: left;
	text-align: center;
	cursor: pointer;
	width: 82px;
	height: 31px;
	line-height: 31px;
	border: 1px solid #eee;
	border-left: none;
	font-weight: bold;
	background: #fafafa;
	overflow: hidden;
	position: relative;
}

ul.tabs li.active {
	background: #FFFFFF;
	border-bottom: 1px solid #FFFFFF;
}

.tab_container {
	border-top: none;
	clear: both;
	float: left;
	width: 900px;
	background: #FFFFFF;
}

.tab_content {
	font-size: 12px;
	display: none;
}

.tab_container .tab_content ul {
	width: 100%;
	margin: 0px;
	padding: 0px;
}

.tab_container .tab_content ul li {
	list-style: none
}

.info {
	padding-top: 7px;
}
</style>
<script>
	$(document).ready(function() {
		//최상단 체크박스 클릭

		$("#allCheck").click(function() {
			//클릭되었으면
			if ($("#allCheck").prop("checked")) {
				//input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
				$("input[name=chk]").prop("checked", true);
				//클릭이 안되있으면
			} else {
				//input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
				$("input[name=chk]").prop("checked", false);
			}
		});

	});
	$(function() {

		$(".tab_content").hide();
		$(".tab_content:first").show();

		$("ul.tabs li").click(function() {
			$("ul.tabs li").removeClass("active").css("color", "#333");
			//$(this).addClass("active").css({"color": "darkred","font-weight": "bolder"});
			$(this).addClass("active").css("color", "#1abc9c");
			$(".tab_content").hide()
			var activeTab = $(this).attr("rel");
			$("#" + activeTab).fadeIn()
		});
	});
</script>

<div style="width: 900px; height: 600px; margin: 60px auto;">
	<div style="height: 50px; font-size: 20px; text-align: center;">
		<span style="font-size: 20px; color: #BDBDBD; font-weight: bold;">
			<span style="font-size: 19px; color: #1abc9c;"
			class="glyphicon glyphicon-pencil"> </span>&nbsp;&nbsp;&nbsp;WOOLTARI&nbsp;&nbsp;&nbsp;
		</span>R E P O R T
	</div>
	<div id="tabwrap" style="width: 900px; margin: 0px auto;">
		<ul class="tabs">
			<li class="active" rel="tab1">공지사항</li>
			<li rel="tab2">구매랭킹</li>
			<li rel="tab3">공지사항</li>
			<div style="float: right; margin: 8px 0;">
				<input type="checkbox" id="allCheck" name="allCheck"
					class="checkbox-style" /><label for="allCheck">전체선택</label>
			</div>
		</ul>
		<div class="tab_container">
			<div id="tab1" class="tab_content">

				<table cellpadding="0" cellspacing="0" style="width: 100%;"
					class="board_table array">
					<tr>

						<td style="text-align: right; width: 65px; padding: 5px 18px;"><input
							type="checkbox" name="chk"></td>

						<td class="___number"
							style="font-size: 11px; color: #666; text-align: center; font-weight: bold;">11</td>
						<td style="padding: 9px 5px; border-bottom: 1px solid #EEEEEE;">
							<div style="position: relative;">
								<!--[category_name]-->

								<a href="<%=cp%>/help/report/article" class="subject"
									style="font-size: 15px; font-weight: bold; color: #373737;">제목입니다</a><span
									class="comment"
									style="display: inline-block; padding: 1px 7px 7px 7px; margin-left: 15px; color: #1abc9c; font-weight: bold; font-size: 15px; line-height: 8px; vertical-align: middle;">[16]</span>

								<div class="info">
									<strong>작성일 </strong> <span class="dateWrap" title="[datetime]">2017-06-19</span>
									<span class="__dotted"></span> <strong>작성자 </strong><span>홍길동</span>
									<span class="__dotted"></span> <strong>조회수 </strong><span>30</span>
								</div>


								<div class="likes"
									style="line-height: 23px; position: absolute; top: -8px; right: 10px; background: #fff; padding: 9px 5px 5px 5px; display: block; width: 45px; height: 41px; text-align: center; font-size: 16px; letter-spacing: -1px; color: #666666; font-weight: bold;">
									25<br> <span class="num"
										style="color: #1abc9c; font-size: 18px; font-weight: bold; font-family: tahoma;">추천</span>
									<!--[unlikes]-->
								</div>

							</div>
						</td>
					</tr>
					</tbody>
				</table>

			</div>
			<!-- #tab1 -->
			<div id="tab2" class="tab_content">
				<table cellpadding="0" cellspacing="0" style="width: 100%;"
					class="board_table array">
					<tr>

						<td style="text-align: right; width: 65px; padding: 5px 18px;"><input
							type="checkbox" name="chk"></td>

						<td class="___number"
							style="font-size: 11px; color: #666; text-align: center; font-weight: bold;">11</td>
						<td style="padding: 9px 5px; border-bottom: 1px solid #EEEEEE;">
							<div style="position: relative;">
								<!--[category_name]-->

								<a href="<%=cp%>/help/report/article" class="subject"
									style="font-size: 15px; font-weight: bold; color: #373737;">죔혹힙니다</a><span
									class="comment"
									style="display: inline-block; padding: 1px 7px 7px 7px; margin-left: 15px; color: #1abc9c; font-weight: bold; font-size: 15px; line-height: 8px; vertical-align: middle;">[16]</span>

								<div class="info">
									<strong>작성일 </strong> <span class="dateWrap" title="[datetime]">2017-06-19</span>
									<span class="__dotted"></span> <strong>작성자 </strong><span>홍길동</span>
									<span class="__dotted"></span> <strong>조회수 </strong><span>30</span>
								</div>


								<div class="likes"
									style="line-height: 23px; position: absolute; top: -8px; right: 10px; background: #fff; padding: 9px 5px 5px 5px; display: block; width: 45px; height: 41px; text-align: center; font-size: 16px; letter-spacing: -1px; color: #666666; font-weight: bold;">
									25<br> <span class="num"
										style="color: #1abc9c; font-size: 18px; font-weight: bold; font-family: tahoma;">추천</span>
									<!--[unlikes]-->
								</div>

							</div>
						</td>
					</tr>
					</tbody>
				</table>
			</div>
			<!-- #tab2 -->
			<div id="tab3" class="tab_content"></div>
			<!-- #tab3 -->
		</div>
		<!-- .tab_container -->
	</div>
	<!-- #container -->
</div>