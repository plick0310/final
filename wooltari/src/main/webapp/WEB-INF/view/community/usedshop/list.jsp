<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>


<style>
html {
	height: 100%;
}

body {
	padding: 0;
	text-align: center;
	font-family: 'BareunDotum';
	position: relative;
	margin: 0;
	height: 100%;
}



.pho {
	height: 380px;
	background: black;
	padding: 0;
	border: 1px solid white;
}

.hvr-grow-shadow {
	display: inline-block;
	vertical-align: middle;
	-webkit-transform: perspective(1px) translateZ(0);
	transform: perspective(1px) translateZ(0);
	box-shadow: 0 0 1px transparent;
	-webkit-transition-duration: 0.3s;
	transition-duration: 0.3s;
	-webkit-transition-property: box-shadow, transform;
	transition-property: box-shadow, transform;
}

.hvr-grow-shadow:hover, .hvr-grow-shadow:focus, .hvr-grow-shadow:active
	{
	box-shadow: 0 10px 10px -10px rgba(0, 0, 0, 0.5);
	-webkit-transform: scale(1.1);
	transform: scale(1.05);
}

p, [class^="hvr-"] {
	font-family: 'Roboto', sans-serif;
}

[class^="hvr-"] {
	margin: 5px 3px;
	width: 350px;
	height: 350px;
	padding: 1em;
	cursor: pointer;
	background: #e1e1e1;
	text-decoration: none;
	color: #666;
	/* Prevent highlight colour when element is tapped */
	-webkit-tap-highlight-color: rgba(0, 0, 0, 0);
	/* Smooth fonts */
	-webkit-font-smoothing: antialiased;
	-moz-osx-font-smoothing: grayscale;
}

.cbp-rfgrid {
	margin: auto;
	padding: 0;
	list-style: none;
	position: relative;
	width: 100%;
}

.cbp-rfgrid li {
	position: relative;
	float: left;
	overflow: hidden;
	width: 25%;
	width: -webkit-calc(100%/ 4);
	width: calc(100%/ 4);
	-webkit-transition: 0.4s all linear;
	transition: 0.4s all linear;
}

.fadeInLeft {
	-webkit-animation-name: fadeInLeft;
	animation-name: fadeInLeft;
}

.cbp-rfgrid li a .project-info {
	position: absolute;
	left: 10px;
	top: 10px;
	right: 10px;
	bottom: 10px;
	background: rgba(0, 0, 0, 0.5);
	padding-top: 25%;
	text-align: center;
	filter: alpha(opacity = 0);
	opacity: 0;
	-webkit-transition: all ease .25s;
	transition: all ease .2s;
}

.clickbtn {
	background-color: white;
	border-style: solid;
	padding: 5px 20px;
	margin-right: 10px;
	border: 1px solid #EAEAEA;
}

.tablist li {
	float: left;
}

.tab_umarket {
	width: 900px;
	margin: 0 auto
}

.tab_umarket .tabpanel-active {
	display: block !important
}

.tab_umarket .tablist {
	position: relative
}

.tab_umarket .on {
	display: block !important
}

.tab_umarket .tablist li.dep1 a.dep1_mn {
	display: block;
	position: absolute;
	top: 0;
	width: 76px;
	height: 108px;
	font-size: 0;
	color: transparent;
	background: url(//pics.auction.co.kr/listing/used/2014/sp_cate.jpg) 0 0
		no-repeat
}

.tab_umarket .tablist li.dep1 a.dep1_mn.mn1 {
	left: 0;
	background-position: 0 0
}

.tab_umarket .tablist li.dep1 a.dep1_mn.mn2 {
	left: 75px;
	background-position: -75px 0
}

.tab_umarket .tablist li.dep1 a.dep1_mn.mn3 {
	left: 150px;
	background-position: -150px 0
}

.tab_umarket .tablist li.dep1 a.dep1_mn.mn4 {
	left: 225px;
	background-position: -225px 0
}

.tab_umarket .tablist li.dep1 a.dep1_mn.mn5 {
	left: 300px;
	background-position: -300px 0
}

.tab_umarket .tablist li.dep1 a.dep1_mn.mn6 {
	left: 375px;
	background-position: -375px 0
}

.tab_umarket .tablist li.dep1 a.dep1_mn.mn7 {
	left: 449px;
	background-position: -449px 0
}

.tab_umarket .tablist li.dep1 a.dep1_mn.mn8 {
	left: 524px;
	background-position: -524px 0
}

.tab_umarket .tablist li.dep1 a.dep1_mn.mn9 {
	left: 599px;
	background-position: -599px 0
}

.tab_umarket .tablist li.dep1 a.dep1_mn.mn10 {
	left: 674px;
	background-position: -674px 0
}

.tab_umarket .tablist li.dep1 a.dep1_mn.mn11 {
	left: 749px;
	background-position: -749px 0
}

.tab_umarket .tablist li.dep1 a.dep1_mn.mn12 {
	left: 824px;
	background-position: -824px 0
}

.tab_umarket .tablist li.dep1 a:hover.dep1_mn.mn1, .tab_umarket .tablist li.dep1 a.dep1_mn.mn1.on
	{
	background-position: 0 -112px
}

.tab_umarket .tablist li.dep1 a:hover.dep1_mn.mn2, .tab_umarket .tablist li.dep1 a.dep1_mn.mn2.on
	{
	background-position: -75px -112px
}

.tab_umarket .tablist li.dep1 a:hover.dep1_mn.mn3, .tab_umarket .tablist li.dep1 a.dep1_mn.mn3.on
	{
	background-position: -150px -112px
}

.tab_umarket .tablist li.dep1 a:hover.dep1_mn.mn4, .tab_umarket .tablist li.dep1 a.dep1_mn.mn4.on
	{
	background-position: -225px -112px
}

.tab_umarket .tablist li.dep1 a:hover.dep1_mn.mn5, .tab_umarket .tablist li.dep1 a.dep1_mn.mn5.on
	{
	background-position: -300px -112px
}

.tab_umarket .tablist li.dep1 a:hover.dep1_mn.mn6, .tab_umarket .tablist li.dep1 a.dep1_mn.mn6.on
	{
	background-position: -375px -112px
}

.tab_umarket .tablist li.dep1 a:hover.dep1_mn.mn7, .tab_umarket .tablist li.dep1 a.dep1_mn.mn7.on
	{
	background-position: -449px -112px
}

.tab_umarket .tablist li.dep1 a:hover.dep1_mn.mn8, .tab_umarket .tablist li.dep1 a.dep1_mn.mn8.on
	{
	background-position: -524px -112px
}

.tab_umarket .tablist li.dep1 a:hover.dep1_mn.mn9, .tab_umarket .tablist li.dep1 a.dep1_mn.mn9.on
	{
	background-position: -599px -112px
}

.tab_umarket .tablist li.dep1 a:hover.dep1_mn.mn10, .tab_umarket .tablist li.dep1 a.dep1_mn.mn10.on
	{
	background-position: -674px -112px
}

.tab_umarket .tablist li.dep1 a:hover.dep1_mn.mn11, .tab_umarket .tablist li.dep1 a.dep1_mn.mn11.on
	{
	background-position: -749px -112px
}

.tab_umarket .tablist li.dep1 a:hover.dep1_mn.mn12, .tab_umarket .tablist li.dep1 a.dep1_mn.mn12.on
	{
	background-position: -824px -112px
}

.tab_umarket .tablist li.dep1 div.dep2 {
	display: none;
	position: absolute;
	top: 108px;
	left: 0;
	width: 900px;
	border-top: 0
}

.tab_umarket .tablist li.dep1 div.dep2 ul.dep2_list {
	width: 900px;
	height: 40px;
	padding-top: 23px;
	background: #ffffff;
	overflow: hidden
}

.tab_umarket .tablist li.dep1 div.dep2 ul.dep2_list li.dep2_mn {
	float: left;
	margin-left: 12px
}

.tab_umarket .tablist li.dep1 div.dep2 ul.dep2_list li.dep2_mn a {
	color: #666666
}

.tab_umarket .tablist li.dep1 div.dep2 ul.dep2_list li.dep2_mn a:hover {
	color: #ff644c;
	text-decoration: none
}

.tab_umarket .tablist li.dep1 div.dep2 ul.dep2_list li.dep2_mn.on a {
	color: #ff644c;
	text-decoration: none
}
/* //중고장터상단UI개선 725.2014-10-21 */

/* 중고장터개선 725.2015-06-19 */
/* 공통:헤더 */
.used_contents {
	overflow: visible !important
}

.used_head .headinside {
	width: 980px;
	margin: 0 auto
}

.umarket_head {
	width: 100%;
	height: 76px;
	background: #ffffff
}

.umarket_head .h_left {
	float: left
}

.umarket_head .h_left .tit_h1 {
	float: left;
	padding: 13px 12px 0 0
}

.umarket_head .h_left .search_inner {
	float: left;
	position: relative;
	width: 260px;
	height: 27px;
	margin-top: 25px;
	background: #ffffff;
	border-bottom: 4px solid #fb6e00
}

.umarket_head .h_left .search_input_keyword {
	width: 238px;
	margin: 0;
	padding: 2px 0;
	border: 0 none;
	outline: 0 none;
	color: #777;
	font-size: 14px;
	line-height: 1.2em;
	font-weight: bold
}

input[type=text]::-ms-clear {
	display: block
}

.umarket_head .h_left .search_btn_ok {
	position: absolute;
	right: 0;
	top: 0;
	display: block;
	width: 21px;
	height: 27px;
	border: none;
	background:
		url('//pics.auction.co.kr/listing/used/2014/btn_srch_2015.gif') 0 0
		no-repeat;
	text-indent: -10000em;
	overflow: hidden;
	cursor: pointer;
	-webkit-appearance: none;
	-webkit-border-radius: 0
}

.umarket_head .umarket_side {
	float: left;
	margin: 31px 14px 0 12px
}

.umarket_head .umarket_side li {
	float: left;
	height: 30px;
	padding: 0px 12px 0 12px;
	background: url(//pics.auction.co.kr/listing/used/2014/bg_line_03.gif) 0
		2px no-repeat
}

.umarket_head .umarket_side li a {
	display: inline-block
}

.umarket_head .umarket_side li:first-child {
	background: none
}

.used_head .tab_umarket {
	width: 903px;
	min-height: 94px;
	margin: 0 auto
}

.used_head .tab_umarket .tablist {
	overflow: hidden;
	margin-bottom: 0;
}

.used_head .tab_umarket .tablist li.dep1 {
	float: left
}

.used_head .tab_umarket .tablist li.dep1 a {
	overflow: hidden;
	float: left;
	position: relative;
	height: 94px
}

.used_head .tab_umarket .tablist li.active a, .used_head .tab_umarket .tablist li.hover a
	{
	height: 94px;
	margin-bottom: -10px;
	border: 0;
	color: #FF6E00
}

.used_head .tab_umarket .tablist li.hover a span {
	display: block
}

.used_head .tab_umarket .tablist li.on img, .used_head .tab_umarket .tablist li.active img,
	.used_head .tab_umarket .tablist li.hover img {
	margin-top: -94px
}

.used_head .tabpanel {
	display: none;
	width: 903px;
	margin-top: -3px;
	padding: 15px 9px 13px 19px;
	border: 1px solid #eaeaea;
	border-top: 0
}

.used_head .tabpanel-active {
	display: block !important
}

.used_head .tabpanel ul {
	width: 100%;
	overflow: hidden
}

.used_head .tabpanel ul li {
	float: left;
	width: 174px
}

.used_head .tabpanel ul li a {
	float: left;
	padding: 2px 0 2px 7px;
	background: url('//pics.auction.co.kr/listing/2012/bul_square.gif')
		no-repeat 0 6px
}

.used_head .tabpanel ul li.active a, .used_head .tabpanel ul li a:hover
	{
	color: #FF6E00;
	background-image:
		url('//pics.auction.co.kr/listing/2012/bul_square02.gif');
	text-decoration: none
}
/* 공통:좌배너,페이지넘,하단배너 */
.footer {
	clear: both
}

.thum {
	width: 100%;
	height: 300px;
	text-align: left;
	margin: 0 auto;
	line-height: 17px;
}

.col-sm-3 {
	padding: 0;
	margin: 15px;
	width: 195px;
}

.btn-default {
	border-radius: 0px;
	font-size: 12px;
	background: none;
	color: #8e8b89;
	border: 1px solid #eee;
	padding: 4px 6px;
	font-weight: lighter;
}
#btnright:HOVER {
	border-left: 1px solid gray;
}

/* 이까지 */
@import url(https://fonts.googleapis.com/css?family=Raleway:300,700);
@import url(https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css);
figure.snip1384 {
      position: relative;
    float: left;
    overflow: hidden;
    margin: 10px 1%;
    min-width: 195px;
    max-width: 300px;
    width: 195px;
    color: #ffffff;
    height: 300px;
    text-align: left;
    font-size: 16px;
}
figure.snip1384 * {
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
  -webkit-transition: all 0.35s ease;
  transition: all 0.35s ease;
}
figure.snip1384 img {
  max-width: 100%;
  backface-visibility: hidden;
  vertical-align: top;
}
figure.snip1384:after,
figure.snip1384 figcaption {
  position: absolute;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
}
figure.snip1384:after {
  content: '';
  background-color: rgba(0, 0, 0, 0.65);
  -webkit-transition: all 0.35s ease;
  transition: all 0.35s ease;
  opacity: 0;
}
figure.snip1384 figcaption {
  z-index: 1;
  padding: 40px;
  text-align: center; 
}
figure.snip1384 h3,
figure.snip1384 .links {
  width: 100%;
  margin: 5px 0;
  padding: 0;
}
figure.snip1384 h3 {
  line-height: 1.1em;
  font-weight: 700;
  font-size: 1.4em;
  text-transform: uppercase;
  opacity: 0;
}
figure.snip1384 p {
  font-size: 0.8em;
  font-weight: 300;
  letter-spacing: 1px;
  opacity: 0;
  top: 50%;
  -webkit-transform: translateY(40px);
  transform: translateY(40px);
}
figure.snip1384 i {
  position: absolute;
  bottom: 10px;
  right: 10px;
  padding: 20px 25px;
  font-size: 34px;
  opacity: 0;
  -webkit-transform: translateX(-10px);
  transform: translateX(-10px);
}
figure.snip1384 a {
  position: absolute;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  z-index: 1;
}
figure.snip1384:hover img,
figure.snip1384.hover img {
  zoom: 5;
  filter: alpha(opacity=50);
  -webkit-opacity: 0.5;
  opacity: 0.3;
}
figure.snip1384:hover:after,
figure.snip1384.hover:after {
  opacity: 1;
  position: absolute;
  width:195px;
  top: 10px;
  bottom: 10px;
  left: 10px;
  right: 10px;
}
figure.snip1384:hover h3,
figure.snip1384.hover h3,

figure.snip1384:hover p,
figure.snip1384.hover p,
figure.snip1384:hover i,
figure.snip1384.hover i {
  -webkit-transform: translate(0px, 0px);
  transform: translate(0px, 0px);
  opacity: 1;
}


</style>

<script>
$(".hover").mouseleave(
		  function () {
		    $(this).removeClass("hover");
		  }
		);
	


	(function(window, document) {

		// Tabs
		function initTopTabs() {
			var wrapper = $('div.tab_umarket'), tablist = wrapper
					.find('ul.tablist'), tabs = tablist.children('li'), activeTab = tabs
					.filter('.on'), tabpanels = wrapper.find('div.tabpanel'), hasActivePanel = !!tabpanels
					.filter('.tabpanel-active').length;

			tabs.bind({
				select : function(e, tabClass) {
					tabClass = tabClass || 'on';

					var tab = $(this), index = tab.index();

					tabs.removeClass('on hover');
					tab.addClass(tabClass);

					if (tabpanels.length > 1) {
						tabpanels.removeClass('tabpanel-active');
						tabpanels.eq(index).addClass('tabpanel-active');
					} else if (tabpanels.length) {
						tabpanels.addClass('tabpanel-active');
					}
				},
				'click mouseenter' : function(e) {
					$(this).trigger('select', 'hover');
				}
			});

			wrapper.bind('mouseleave', function() {
				if (activeTab.length) {
					if (hasActivePanel) {
						activeTab.trigger('select', 'on');
					} else {
						tabs.removeClass('hover');
						tabpanels.removeClass('tabpanel-active');
						activeTab.addClass('on');
					}
				} else {
					tabs.removeClass('hover');
					tabpanels.removeClass('tabpanel-active');
				}
			});
		}
 
		$(function() {
			initTopTabs();
	
		});
	}(this, this.document));
	
	
	
	
</script>
<!--------------------------- 중고장터 헤더 --------------------------------->
<div>
<form method="post">
	<table style="width: 900px; margin: 20px auto 5px;">
		<tr>
			<td style="font-size: 37px;width: 40px;font-weight: bolder;color: #1abc9c;text-shadow: 1px 1px 4px #eee;">W</td>
			<td style="width: 193px;"><a href="<%=cp %>/community/usedshop/list" style="font-size: 32px; font-weight: bold; color: #393635; ">교재중고장터</a></td>   
				
			<td style="padding-left: 15px; width: 215px;">
				<div style="border-bottom: 4px solid #1abc9c; width: 210px; padding: 3px; color: #1abc9c;">
					<input type="text" style="border: none;" name="searchValue">
					<div style="float: right;">
						<i class="glyphicon glyphicon-search" style="font-size: 20px;"></i>
					</div>
				</div>
			</td>
			
			<td style="text-align: right; width: 77px; color: #393635;"><a
				href="">인기상품</a></td>
			<td style="color: #eee;">|</td>
			<td style="text-align: left;"><a href="<%=cp %>/community/usedshop/created" style="color: #1abc9c; font-weight: bold;">
			<i class="glyphicon glyphicon-camera" style="font-size: 19px; vertical-align: middle;"></i> 내 상품팔기</a></td>
		</tr>

	</table>
</form>

</div>
<!--------------------------- 중고장터 카테고리 --------------------------------->

<div id="header" class="used_head">
	<div class="headinside">

		<!-- 카테고리 -->
		<div class="tab_umarket">
			<!-- 대대분류 -->
			<ul class="tablist"
				style="border-bottom: 1px solid #eee; box-shadow: 0px 3px 8px #eee;">

				<li class="dep1"><a href="#"><img
						src="<%=cp%>/resource/images/cateicon/cate-02.png" alt="라이프스타일"></a>
				</li>

				<li class="dep1"><a href="#"><img
						src="<%=cp%>/resource/images/cateicon/cate-03.png" alt="영어"></a>
				</li>

				<li class="dep1"><a href="#"><img
						src="<%=cp%>/resource/images/cateicon/cate-04.png" alt="외국어"></a>
				</li>

				<li class="dep1"><a href="#"><img
						src="<%=cp%>/resource/images/cateicon/cate-05.png" alt="컴퓨터"></a>
				</li>

				<li class="dep1"><a href="#"><img
						src="<%=cp%>/resource/images/cateicon/cate-06.png" alt="디자인/미술"></a>
				</li>

				<li class="dep1"><a href="#"><img
						src="<%=cp%>/resource/images/cateicon/cate-07.png" alt="국가고시/공무원"></a>
				</li>

				<li class="dep1"><a href="#"><img
						src="<%=cp%>/resource/images/cateicon/cate-08.png" alt="취업"></a>
				</li>

				<li class="dep1"><a href="#"><img
						src="<%=cp%>/resource/images/cateicon/cate-09.png" alt="음악/공연"></a>
				</li>

				<li class="dep1"><a href="#"><img
						src="<%=cp%>/resource/images/cateicon/cate-10.png" alt="스포츠"></a>
				</li>

				<li class="dep1"><a href="#"><img
						src="<%=cp%>/resource/images/cateicon/cate-11.png" alt="뷰티/미용"></a>
				</li>

				<li class="dep1"><a href="#"><img
						src="<%=cp%>/resource/images/cateicon/cate-12.png" alt="게임"></a>
				</li>



			</ul>
			<!-- //대대분류 -->
			<!-- 대분류 -->

			<div class="tabpanel">
				<ul>
					<li class=""><a
						href="<%=cp%>/community/usedshop/list?searchKey=category&searchValue=12">육아</a></li>

					<li class=""><a
						href="<%=cp%>/community/usedshop/list?searchKey=category&searchValue=13">반려동물</a></li>

					<li class=""><a
						href="<%=cp%>/community/usedshop/list?searchKey=category&searchValue=14">금융/재테크</a></li>

					<li class=""><a
						href="<%=cp%>/community/usedshop/list?searchKey=category&searchValue=15">상담/컨설팅</a></li>

					<li class=""><a
						href="<%=cp%>/community/usedshop/list?searchKey=category&searchValue=16">건강/웰빙</a></li>

					<li class=""><a
						href="<%=cp%>/community/usedshop/list?searchKey=category&searchValue=17">사주/타로</a></li>

					<li class=""><a
						href="<%=cp%>/community/usedshop/list?searchKey=category&searchValue=18">독서/글쓰기</a></li>

					<li class=""><a
						href="<%=cp%>/community/usedshop/list?searchKey=category&searchValue=19">사진/영상</a></li>

					<li class=""><a
						href="<%=cp%>/community/usedshop/list?searchKey=category&searchValue=20">키덜트</a></li>

					<li class=""><a
						href="<%=cp%>/community/usedshop/list?searchKey=category&searchValue=21">생활공예</a></li>

					<li class=""><a
						href="<%=cp%>/community/usedshop/list?searchKey=category&searchValue=22">요리/베이킹</a></li>

					<li class=""><a
						href="<%=cp%>/community/usedshop/list?searchKey=category&searchValue=23">인테리어</a></li>

					<li class=""><a
						href="<%=cp%>/community/usedshop/list?searchKey=category&searchValue=24">바리스타/바텐더</a></li>

					<li class=""><a
						href="<%=cp%>/community/usedshop/list?searchKey=category&searchValue=25">봉사활동</a></li>

					<li class=""><a
						href="<%=cp%>/community/usedshop/list?searchKey=category&searchValue=26">웨딩</a></li>

					<li class=""><a
						href="<%=cp%>/community/usedshop/list?searchKey=category&searchValue=27">라이프스타일 기타</a></li>

				</ul>
			</div>

			<div class="tabpanel">
				<ul>

					<li class=""><a
						href="<%=cp%>/community/usedshop/list?searchKey=category&searchValue=28">토익</a></li>

					<li class=""><a
						href="<%=cp%>/community/usedshop/list?searchKey=category&searchValue=29">토플</a></li>

					<li class=""><a
						href="<%=cp%>/community/usedshop/list?searchKey=category&searchValue=30">텝스</a></li>

					<li class=""><a
						href="<%=cp%>/community/usedshop/list?searchKey=category&searchValue=31">토스/오픽</a></li>

					<li class=""><a
						href="<%=cp%>/community/usedshop/list?searchKey=category&searchValue=32">영어회화</a></li>

					<li class=""><a
						href="<%=cp%>/community/usedshop/list?searchKey=category&searchValue=33">작문/독해</a></li>

					<li class=""><a
						href="<%=cp%>/community/usedshop/list?searchKey=category&searchValue=34">미드정복</a></li>

					<li class=""><a
						href="<%=cp%>/community/usedshop/list?searchKey=category&searchValue=35">영어 기타</a></li>


				</ul>
			</div>

			<div class="tabpanel">
				<ul>

					<li class=""><a
						href="<%=cp%>/community/usedshop/list?searchKey=category&searchValue=36">중국어</a></li>

					<li class=""><a
						href="<%=cp%>/community/usedshop/list?searchKey=category&searchValue=37">일본어</a></li>

					<li class=""><a
						href="<%=cp%>/community/usedshop/list?searchKey=category&searchValue=38">독일어</a></li>

					<li class=""><a
						href="<%=cp%>/community/usedshop/list?searchKey=category&searchValue=39">아랍어</a></li>

					<li class=""><a
						href="<%=cp%>/community/usedshop/list?searchKey=category&searchValue=40">태국어</a></li>

					<li class=""><a
						href="<%=cp%>/community/usedshop/list?searchKey=category&searchValue=41">스페인어</a></li>

					<li class=""><a
						href="<%=cp%>/community/usedshop/list?searchKey=category&searchValue=42">러시아어</a></li>

					<li class=""><a
						href="<%=cp%>/community/usedshop/list?searchKey=category&searchValue=43">프랑스어</a></li>

					<li class=""><a
						href="<%=cp%>/community/usedshop/list?searchKey=category&searchValue=44">베트남어</a></li>

					<li class=""><a
						href="<%=cp%>/community/usedshop/list?searchKey=category&searchValue=45">외국어 기타</a></li>


				</ul>
			</div>

			<div class="tabpanel">
				<ul>

					<li class=""><a
						href="<%=cp%>/community/usedshop/list?searchKey=category&searchValue=46">응용프로그래밍</a></li>

					<li class=""><a
						href="<%=cp%>/community/usedshop/list?searchKey=category&searchValue=47">웹프로그래밍</a></li>

					<li class=""><a
						href="<%=cp%>/community/usedshop/list?searchKey=category&searchValue=48">모바일프로그래밍</a></li>

					<li class=""><a
						href="<%=cp%>/community/usedshop/list?searchKey=category&searchValue=49">데이터베이스/서버</a></li>

					<li class=""><a
						href="<%=cp%>/community/usedshop/list?searchKey=category&searchValue=50">게임프로그래밍</a></li>

					<li class=""><a
						href="<%=cp%>/community/usedshop/list?searchKey=category&searchValue=51">문서작성/편집</a></li>

					<li class=""><a
						href="<%=cp%>/community/usedshop/list?searchKey=category&searchValue=52">컴퓨터자격증</a></li>

					<li class=""><a
						href="<%=cp%>/community/usedshop/list?searchKey=category&searchValue=53">사물인터넷</a></li>

					<li class=""><a
						href="<%=cp%>/community/usedshop/list?searchKey=category&searchValue=54">하드웨어</a></li>

					<li class=""><a
						href="<%=cp%>/community/usedshop/list?searchKey=category&searchValue=55">컴퓨터 기타</a></li>

				</ul>
			</div>

			<div class="tabpanel">
				<ul>

					<li class=""><a
						href="<%=cp%>/community/usedshop/list?searchKey=category&searchValue=56">웹/모바일디자인</a></li>

					<li class=""><a
						href="<%=cp%>/community/usedshop/list?searchKey=category&searchValue=57">일러스트/삽화</a></li>

					<li class=""><a
						href="<%=cp%>/community/usedshop/list?searchKey=category&searchValue=58">광고/영상</a></li>

					<li class=""><a
						href="<%=cp%>/community/usedshop/list?searchKey=category&searchValue=59">만화/웹툰</a></li>

					<li class=""><a
						href="<%=cp%>/community/usedshop/list?searchKey=category&searchValue=60">편집디자인</a></li>

					<li class=""><a
						href="<%=cp%>/community/usedshop/list?searchKey=category&searchValue=61">패션디자인</a></li>

					<li class=""><a
						href="<%=cp%>/community/usedshop/list?searchKey=category&searchValue=62">3D/VFX</a></li>

					<li class=""><a
						href="<%=cp%>/community/usedshop/list?searchKey=category&searchValue=63">도예/세라믹</a></li>

					<li class=""><a
						href="<%=cp%>/community/usedshop/list?searchKey=category&searchValue=64">캘리그라피</a></li>

					<li class=""><a
						href="<%=cp%>/community/usedshop/list?searchKey=category&searchValue=65">회화</a></li>

					<li class=""><a
						href="<%=cp%>/community/usedshop/list?searchKey=category&searchValue=66">디자인 기타</a></li>

				</ul>
			</div>

			<div class="tabpanel">
				<ul>

					<li class=""><a
						href="<%=cp%>/community/usedshop/list?searchKey=category&searchValue=67">행정</a></li>

					<li class=""><a
						href="<%=cp%>/community/usedshop/list?searchKey=category&searchValue=68">교육</a></li>

					<li class=""><a
						href="<%=cp%>/community/usedshop/list?searchKey=category&searchValue=69">경찰</a></li>

					<li class=""><a
						href="<%=cp%>/community/usedshop/list?searchKey=category&searchValue=70">소방</a></li>

					<li class=""><a
						href="<%=cp%>/community/usedshop/list?searchKey=category&searchValue=71">의료/보건</a></li>

					<li class=""><a
						href="<%=cp%>/community/usedshop/list?searchKey=category&searchValue=72">사법</a></li>

					<li class=""><a
						href="<%=cp%>/community/usedshop/list?searchKey=category&searchValue=73">기술</a></li>

					<li class=""><a
						href="<%=cp%>/community/usedshop/list?searchKey=category&searchValue=74">회계</a></li>

					<li class=""><a
						href="<%=cp%>/community/usedshop/list?searchKey=category&searchValue=75">국방</a></li>

					<li class=""><a
						href="<%=cp%>/community/usedshop/list?searchKey=category&searchValue=76">공무원 기타</a></li>

				</ul>
			</div>

			<div class="tabpanel">
				<ul>

					<li class=""><a
						href="<%=cp%>/community/usedshop/list?searchKey=category&searchValue=77">자소서/면접</a></li>

					<li class=""><a
						href="<%=cp%>/community/usedshop/list?searchKey=category&searchValue=78">인적성</a></li>

					<li class=""><a
						href="<%=cp%>/community/usedshop/list?searchKey=category&searchValue=79">스피치</a></li>

					<li class=""><a
						href="<%=cp%>/community/usedshop/list?searchKey=category&searchValue=80">자격증</a></li>

					<li class=""><a
						href="<%=cp%>/community/usedshop/list?searchKey=category&searchValue=81">기업공채</a></li>

					<li class=""><a
						href="<%=cp%>/community/usedshop/list?searchKey=category&searchValue=82">공모전/대외활동</a></li>

					<li class=""><a
						href="<%=cp%>/community/usedshop/list?searchKey=category&searchValue=83">창업/스타트업</a></li>

					<li class=""><a
						href="<%=cp%>/community/usedshop/list?searchKey=category&searchValue=84">취업 기타</a></li>

				</ul>
			</div>

			<div class="tabpanel">
				<ul>

					<li class=""><a
						href="<%=cp%>/community/usedshop/list?searchKey=category&searchValue=85">기타/우쿠렐라</a></li>

					<li class=""><a
						href="<%=cp%>/community/usedshop/list?searchKey=category&searchValue=86">피아노/키보드</a></li>

					<li class=""><a
						href="<%=cp%>/community/usedshop/list?searchKey=category&searchValue=87">보컬/음악이론</a></li>

					<li class=""><a
						href="<%=cp%>/community/usedshop/list?searchKey=category&searchValue=88">작사/작곡</a></li>

					<li class=""><a
						href="<%=cp%>/community/usedshop/list?searchKey=category&searchValue=89">밴드</a></li>

					<li class=""><a
						href="<%=cp%>/community/usedshop/list?searchKey=category&searchValue=90">뮤지컬</a></li>

					<li class=""><a
						href="<%=cp%>/community/usedshop/list?searchKey=category&searchValue=91">마술</a></li>

					<li class=""><a
						href="<%=cp%>/community/usedshop/list?searchKey=category&searchValue=92">음악/공연 기타</a></li>

				</ul>
			</div>

			<div class="tabpanel">
				<ul>

					<li class=""><a
						href="<%=cp%>/community/usedshop/list?searchKey=category&searchValue=93">축구</a></li>

					<li class=""><a
						href="<%=cp%>/community/usedshop/list?searchKey=category&searchValue=94">야구</a></li>

					<li class=""><a
						href="<%=cp%>/community/usedshop/list?searchKey=category&searchValue=95">농구</a></li>

					<li class=""><a
						href="<%=cp%>/community/usedshop/list?searchKey=category&searchValue=96">테니스</a></li>

					<li class=""><a
						href="<%=cp%>/community/usedshop/list?searchKey=category&searchValue=97">배드민턴</a></li>

					<li class=""><a
						href="<%=cp%>/community/usedshop/list?searchKey=category&searchValue=98">수영</a></li>

					<li class=""><a
						href="<%=cp%>/community/usedshop/list?searchKey=category&searchValue=99">골프</a></li>

					<li class=""><a
						href="<%=cp%>/community/usedshop/list?searchKey=category&searchValue=100">자전거</a></li>

					<li class=""><a
						href="<%=cp%>/community/usedshop/list?searchKey=category&searchValue=101">헬스</a></li>

					<li class=""><a
						href="<%=cp%>/community/usedshop/list?searchKey=category&searchValue=102">스포츠 기타</a></li>

				</ul>
			</div>

			<div class="tabpanel">
				<ul>

					<li class=""><a
						href="<%=cp%>/community/usedshop/list?searchKey=category&searchValue=103">헤어</a></li>

					<li class=""><a
						href="<%=cp%>/community/usedshop/list?searchKey=category&searchValue=104">마사지</a></li>

					<li class=""><a
						href="<%=cp%>/community/usedshop/list?searchKey=category&searchValue=105">네일아트</a></li>

					<li class=""><a
						href="<%=cp%>/community/usedshop/list?searchKey=category&searchValue=106">피부관리</a></li>

					<li class=""><a
						href="<%=cp%>/community/usedshop/list?searchKey=category&searchValue=107">메이크업</a></li>

					<li class=""><a
						href="<%=cp%>/community/usedshop/list?searchKey=category&searchValue=108">스타일/코디</a></li>

					<li class=""><a
						href="<%=cp%>/community/usedshop/list?searchKey=category&searchValue=109">뷰티/미용 기타</a></li>

				</ul>
			</div>

			<div class="tabpanel">
				<ul>

					<li class=""><a
						href="<%=cp%>/community/usedshop/list?searchKey=category&searchValue=110">LOL</a></li>

					<li class=""><a
						href="<%=cp%>/community/usedshop/list?searchKey=category&searchValue=111">피파온라인</a></li>

					<li class=""><a
						href="<%=cp%>/community/usedshop/list?searchKey=category&searchValue=112">온라인게임</a></li>

					<li class=""><a
						href="<%=cp%>/community/usedshop/list?searchKey=category&searchValue=113">PC게임</a></li>

					<li class=""><a
						href="<%=cp%>/community/usedshop/list?searchKey=category&searchValue=114">게임 기타</a></li>

				</ul>
			</div>


			<!-- //대분류 -->

			<!-- 중소분류 -->
			<div class="used_locbar popular_locbar"></div>
			<!-- categoryBox -->

			<!-- //categoryBox -->
			<!-- //중소분류 -->
		</div>
		<!-- //카테고리 -->
	</div>
</div>

<div style="width: 900px; margin: 30px auto 10px;"></div>
<br style="clear: both;">
<div class="row" style="width: 900px; margin: 0 auto;">
<form method="post">

	<div style="clear: both">
	
		<div
			style="float: left; font-size: 28px; margin-right: 20px; color: #393635; padding-left: 15px; font-weight: 100;">
			실시간 상품</div>

		<div class="btn-group btn-group-justified" role="group"
			aria-label="..." style="float: left; width: 180px; margin-top: 9px;">
			<div class="btn-group" role="group">
				<button type="submit" class="btn btn-default">신규등록순</button>
			</div>

			<div class="btn-group" role="group">
				<button type="submit" class="btn btn-default" id="btnright" name="bun" value="ASC"
					style="border-left: none;">마감임박순</button>
			</div>
		</div>
	</div>
	<br style="clear: both">
</form>
	<!-- list 시작 -->
<c:forEach var="dto" items="${list }">
<div class="col-sm-3">
		<div class="thum">
			<div onclick="javascript:location.href='${articleUrl }&num=${dto.num}'" 
			style="cursor:pointer; width: 195x; height: 195px; background: gray; background-image: url('${dto.content}');
		background-size:cover;">
			</div>
			<div style="padding: 2px">
				<div style="height: 35px; overflow: hidden; margin: 13px 0;">
					<a href="" style="font-size: 12px; color: #393635;">${dto.subject }</a>
				</div>
				<div style="position: absolute; bottom: 18px; right: 0;">
					<div 
						style="font-size: 11px; text-align: right; font-weight: 100; color: #b2b2b2;">
						판매가 <span
							style="font-weight: 100; font-size: 18px; color: #393635;">${dto.price}</span><span
							style="color: gray">원</span>
					</div>
					<c:if test="${dto.pointuse eq 1 }">
					<div
						style="font-size: 11px; text-align: right; font-weight: 100; color: #b2b2b2;">
						포인트판매가 <span
							style="font-weight: 100; font-size: 18px; color: #393635;">${dto.pointprice}</span><span
							style="color: gray; font-size: 17px; font-weight: 100;">P</span>
					</div>
					</c:if>
				</div>
				<div>
							<c:choose>
                              <c:when test="${dto.del eq 1 }">
                                 <span style="font-size: 10px; padding: 0px 4px; border-radius: 7px; font-weight: 100; background: #76d9c5; color: white; position: absolute; bottom: 20px;">무료배송</span>
                              </c:when>
                             
                              <c:otherwise>
                              	<span style="font-size: 10px; padding: 0px 4px; border-radius: 7px; font-weight: 100; background: gray; color: white; position: absolute; bottom: 20px;">유료배송</span>
                              </c:otherwise>
                              </c:choose>

							
			
				<!-- 	<span style="font-size: 10px; padding: 0px 4px; border-radius: 7px; font-weight: 100; background: #76d9c5; color: white; position: absolute; bottom: 20px;">무료배송</span> -->
				</div>
			
				<div
					style="font-size: 12px; position: absolute; bottom: 0; color: #393635;">
					<a href=""><i class="glyphicon glyphicon-home"></i>${dto.userId }</a>
				</div>
			</div>
		
	</div>
	</div>
<%-- 	<figure class="snip1384"> 
	<div style="width: 195x; height: 195px; background: gray; background-image: url('${dto.content}');
		background-size:cover;"></div> 
		<div style="padding: 2px">
				<div style="height: 35px; overflow: hidden; margin: 13px 0;">
					<a href="" style="    font-size: 12px;
    color: #393635;
    position: relative;">${dto.subject }</a>
				</div>
				<div style="position: absolute; bottom: 18px; right: 0;">
					<div 
						style="font-size: 11px; text-align: right; font-weight: 100; color: #b2b2b2;">
						판매가 <span
							style="font-weight: 100; font-size: 18px; color: #393635;">${dto.price}</span><span
							style="color: gray">원</span>
					</div>
					<c:if test="${dto.pointuse eq 1 }">
					<div
						style="font-size: 11px; text-align: right; font-weight: 100; color: #b2b2b2;">
						포인트판매가 <span
							style="font-weight: 100; font-size: 18px; color: #393635;">${dto.pointprice}</span><span
							style="color: gray; font-size: 17px; font-weight: 100;">P</span>
					</div>
					</c:if>
				</div>
				<div>
							<c:choose>
                              <c:when test="${dto.del eq 1 }">
                                 <span style="font-size: 10px; padding: 0px 4px; border-radius: 7px; font-weight: 100; background: #76d9c5; color: white; position: absolute; bottom: 20px;">무료배송</span>
                              </c:when>
                             
                              <c:otherwise>
                              	<span style="font-size: 10px; padding: 0px 4px; border-radius: 7px; font-weight: 100; background: gray; color: white; position: absolute; bottom: 20px;">유료배송</span>
                              </c:otherwise>
                              </c:choose>

							
			
				<!-- 	<span style="font-size: 10px; padding: 0px 4px; border-radius: 7px; font-weight: 100; background: #76d9c5; color: white; position: absolute; bottom: 20px;">무료배송</span> -->
				</div>
			
				<div
					style="font-size: 12px; position: absolute; bottom: 0; color: #393635;">
					<div style="color: #888888;
    font-weight: 100;"><span class="glyphicon glyphicon-home"></span>${dto.userId }</div>
				</div>
			</div>
  <figcaption>  
    <h3>마감시간</h3>
    <p>${dto.created }</p> 
  </figcaption>
  <a href="#"></a> 
</figure> --%>
	</c:forEach>
	<!-- 끝 -->
 
	

</div>
<div>${paging }</div>









