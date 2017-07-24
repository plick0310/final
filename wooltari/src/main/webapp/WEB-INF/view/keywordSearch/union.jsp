<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
   request.setCharacterEncoding("utf-8");
   String cp=request.getContextPath();
%>

<style>
.thumb {
    float: left;
    left: 0;
    top: 0;
    z-index: 2;
    margin: 0 16px 0 0;
    position: relative;
    width: 82px;
    height: 82px;
}

.section_more {
    position: relative;
    overflow: hidden;
    clear: both;
    padding: 14px 0 0 0;
    font-size: 12px;
    text-align: right;
    zoom: 1;
}

.txt_inline {
    display: inline;
}


dl > dt:FIRST-OF-TYPE {
	color: #1abc9c;
	border-bottom: 1px solid #1abc9c;
}

dl  a{
	color:#1abc9c;
}

</style>

<style>
.pic-list .pic-list-padding {
    padding: 10px;
}

select>optgroup:disabled, select>option:disabled{
    -moz-user-select : none;
    -webkit-user-select : none;
}

/*페이지 번호 통일*/
.pagination>li>a, .pagination>li>span{
    color:#666;
    padding:8px 14px;
}

.pagination>.active>a, .pagination>.active>span, .pagination>.active>a:hover, .pagination>.active>span:hover, .pagination>.active>a:focus, .pagination>.active>span:focus{
    background-color: #00b7ee;
    border-color: #00b7ee;
}

/*최대 넓이가 1000px인 container*/
.sm-container {
    max-width:1200px;
}

/*[Panel] 감싸는 div*/
.contents-box {
    background-color:#fff;
    width:100%;
    border-radius:8px;
    overflow:hidden;
    box-shadow: 1px 1px 2px #D4D4D4;
    margin-bottom: 14px;
    position:relative;
}
/*[Panel] 상단 제목 부분*/    
.contents-header {
    background-color:#656D77;
    color:#fff;
    padding: 14px 16px;
    font-weight:500;
}
/*[Panel] 만약 상단에 버튼을 넣어야 할 경우 in-btn 클래스 추가*/
.contents-header.in-btn {
    padding: 10px 16px;
}
/*[Panel] 중앙 내용 부분*/
.contents-body {
    padding: 22px 20px 20px;
}
/*[Panel] control 왼쪽에 제목(글씨) 부분*/
.contents-body .control-label {
    font-size:13px;
    color:#8C8C8C;
    padding-top:6px;
}
/*[Panel] 하단 부분*/
.contents-footer {
    background-color:#EEF0F1;
    width:100%;
    padding: 14px 16px;
    overflow: hidden;
}
/*[button]포인트 버튼*/
.btn-point{
    background-color:#00b7ee;
    color:#fff;
}
/*[button]포인트 버튼 마우스 오버시*/
.btn-point:hover{
    background-color:#009DCC;
    color:#fff;
}
/*[overlay]아이템 오버레이*/
.item-overlay{
    position:absolute;
    top:0;
    bottom:0;
    left: 0;
    right: 0;
    background-color: transparent;
    -webkit-transition:background 0.4s, color 0.4s;
    transition: background 0.4s, color 0.4s;
    z-index:10;
    /*border-radius:8px;*/
}
/*[overlay]item 마우스 오버시*/
.item-overlay:hover {
    background-color: rgba(96, 166, 185, 0.25);
}

/*[overlay]이미지 오버레이: 이미지위에 글을 올릴수 있게 이미지를 어둡게 함*/
.img-overlay{
    position:absolute;
    width:100%;
    height:100%;
    top:0;
    background-color:rgba(0,0,0,0.2);
    /*border-radius:5px;*/
}
/*유효성 체크 결과 표시*/
.validation {
    font-size:12px;
    margin: 8px 0 0 2px;
    color: #F56058;
    display:none;
    /*기본값 -> display: none*/
}
.validation em {
    padding-right:4px;
}

/*[슬라이더]공통 슬라이더: 슬라이더 id를 slider-range로 지정해서 적용*/
#slider-range.ui-slider {
    height: 8px;
}

#slider-range .ui-state-default {
    border-radius:20px;
    height: 22px;
    width: 22px;
    top:-8px ;
}


/*[label] 회색의 label*/
label.tag {
    padding: 8px 20px;
    background-color: #F5F5F5;
    color: #777;
    margin-right: 4px;
    font-size: 13px;
    cursor: pointer;
    font-weight: 300;
    -webkit-transition: background 0.4s, color 0.4s;
    transition: background 0.4s, color 0.4s;
    position:relative;
}

label.tag.check{
    background-color:#00b7ee;
    color:#fff;
}

label.tag:hover:not(.check){
    background-color: #E0E0E0;
    color: #8A8A8A;
}

label.tag > em {
    position: absolute;
    right: 5px;
    top: 3px;
    font-size: 10px;
    color: #C7C7C7;
    font-weight: 300;
}

/*[label] 서류인증 라벨*/
.school-certify {
    font-size:13px;
    font-weight:normal;
    background:#00b7ee;
    color:#fff;
    border-radius:4px;
    padding: 1px 10px;
}

/*모꼬지 버튼*/
.btn-moccozy {
    width:100%;
    background-color: #00B7EE;
    color:#fff;
    padding: 12px 22px;
}
.btn-moccozy:hover, .btn-moccozy:focus {
    color:#00B7EE;
    background-color:#fff;
    border:1px solid #00B7EE;
    
    -webkit-transition:background-color 0.3s;
    transition: background-color 0.3s;
}

/*자간:0 (영문, 숫자 일 때)*/
.no-letter-spacing {
    letter-spacing:0;
}

/*달력 CSS 시작*/
/*#tab-content {
    background-color: #f5f5f5;
}

.registTitle {
    background-color: #e6eaed !important;
}

#userInfo-modifyDesc .help-block {
    font-size: 13px;
}

    #userInfo-modifyDesc .help-block em {
        font-size: 14px;
        color: red;
    }
table.ui-datepicker-calendar th{
    text-align:center !important;
        color: #a0a0a0;
}
table.ui-datepicker-calendar td{
    text-align:center !important;
}
table.ui-datepicker-calendar .ui-state-disabled, .ui-widget-content .ui-state-disabled, .ui-widget-header .ui-state-disabled{
    text-align: center;
}
div#ui-datepicker-div {
    width: 280px;
    background-color: white;
    border-bottom-left-radius: 2px;
    border-bottom-right-radius: 2px;
    display:none;
}

div#ui-datepicker-div > div {
    border-top-left-radius: 2px;
    border-top-right-radius: 2px;
    border-bottom-left-radius: 0;
    border-bottom-right-radius: 0;
}

.ui-datepicker-calendar {
    width: 100%;
    margin-top:10px;
}
.ui-widget{
    font-size:13px;
}
a.ui-state-default.ui-state-active{
    color: #00bef7;
    font-weight: bold;
}
.ui-datepicker .ui-state-default, .ui-datepicker .ui-widget-content .ui-state-default, .ui-datepicker .ui-widget-header .ui-state-default {
    border: none;
    font-weight: 300;
    color: #666;
    text-decoration: none !important;
    top: -8px;
    border-radius: 20px;
    background: none;
    font-size: 14px;
}
.ui-datepicker-today{
    background-color: #ddd;
    opacity: 1 !important;
    border-radius: 4px;
}
.ui-datepicker-today>.ui-state-default{
    color:white;
}

div#slider-range-min .ui-state-default.ui-state-hover, div#slider-range-min .ui-widget-content .ui-state-default.ui-state-hover, div#slider-range-min .ui-state-header .ui-sate-default.ui-state-hover {
    border: solid 1px #00B7EE !important;
}

.ui-datepicker-prev ui-corner-all {
    float: left;
}

.ui-widget-header .ui-icon {
    margin: 2px;
}

span.ui-icon.ui-icon-circle-triangle-w {
    float: left;
    border-top: 4px solid #fff;
    border-left: 4px solid #fff;
    height: 13px;
    width: 13px;
    -webkit-transform: rotate(315deg);
    -moz-transform: rotate(315deg);
    transform: rotate(315deg);
    position: absolute;
    top: 4px;
    left: 11px;}

span.ui-icon.ui-icon-circle-triangle-e {
    float: right;
    border-top: 4px solid #fff;
    border-left: 4px solid #fff;
    height: 13px;
    width: 13px;
    -webkit-transform: rotate(135deg);
    -moz-transform: rotate(135deg);
    transform: rotate(135deg);
    position: absolute;
    top: 4px;
    right: 13px;
}

.ui-datepicker-title {
    text-align: center;
    padding-top: 4px;
    padding-bottom: 1px;
    font-size: 13px;
}*/
/*달력 CSS 끝*/


/*[비동기 통신] 로딩아이콘*/
.loading-spinner {
  margin: 20px auto 0;
  width: 54px;
  text-align: center;
  position: absolute;
  top: 50%; 
  left: 50%; 
  margin-top: -4px; 
  margin-left: -28px; 
}

.loading-spinner > div {
  width: 8px;
  height: 8px;
  margin:0 4px;
  background-color: #04BCF5;

  border-radius: 100%;
  display: inline-block;
  -webkit-animation: sk-bouncedelay 1.4s infinite ease-in-out both;
  animation: sk-bouncedelay 1.4s infinite ease-in-out both;
}

.loading-spinner .bounce1 {
  -webkit-animation-delay: -0.32s;
  animation-delay: -0.32s;
}

.loading-spinner .bounce2 {
  -webkit-animation-delay: -0.16s;
  animation-delay: -0.16s;
}

@-webkit-keyframes sk-bouncedelay {
  0%, 80%, 100% { -webkit-transform: scale(0) }
  40% { -webkit-transform: scale(1.0) }
}

@keyframes sk-bouncedelay {
  0%, 80%, 100% { 
    -webkit-transform: scale(0);
    transform: scale(0);
  } 40% { 
    -webkit-transform: scale(1.0);
    transform: scale(1.0);
  }
}

/*[비동기 통신] 틴트:움직이는형*/
.loading-overlay {
    background:rgba(255,255,255,0.9);
    width:100%;
    height:100%;
    position:absolute;
    top:0;
    left:0;
    z-index: 500;
    display:none;
    background-image:url('http://moccozy.blob.core.windows.net/resource/loading.gif');
    background-position:center;
    background-repeat:no-repeat;
}


/* 찜버튼 하트 효과 -- 최민수 */
/*최민수 추가*/
.heart {
    background: url(http://moccozy.blob.core.windows.net/resource/web_heart_animation.png);
    background-position: left;
    background-repeat: no-repeat;
    height: 50px;
    width: 50px;
    cursor: pointer;
    position: relative;
    top: -3px;
    left: 13px;
    background-size: 1450px;
    float: right;
}
.heart:hover
{
background-position: right; 
}
@-webkit-keyframes heartBlast 
{
0% {background-position: left;}
100% {background-position: right;}
}

@keyframes heartBlast 
{
0% {background-position: left;}
100% {background-position: right;}
}

.heartAnimation 
{
-webkit-animation-name: heartBlast; 
animation-name: heartBlast;
-webkit-animation-duration: 1.2s;
animation-duration: 1.1s;
-webkit-animation-iteration-count: 1;
animation-iteration-count: 1;
-webkit-animation-timing-function: steps(28); 
animation-timing-function: steps(28);
background-position: right;
}
.likeText {
    width: 50%;
    height:44px;
    float:left;
    text-align:left;
    padding:14px 0;
}
.likeText.disabled{
    display:none;
}
.likeText.enabled{
    display:block;
}

.heartWrapper.enabled{
    width: 57%; height:44px;float:left;
}
.heartWrapper.disabled{
    width: 50%; height:44px;float:left;
}

/*.likeIt { 
    border:1px solid rgba(255,0,0,0.4);
}
.likeCancel{
    color: rgb(102, 102, 102); 
}*/

/* 찜 버튼 스피너 css -- 최민수 */
.ball-pulse{
    width: 100%;
    height: 44px;
    padding: 15px;
}
.ball-pulse>div {
    background-color: #fff;
    width: 16px;
    height: 15px;
    border-radius: 100%;
    margin: 2px;
    -webkit-animation-fill-mode: both;
    animation-fill-mode: both;
    display: inline-block;
}
.ball-pulse>div:nth-child(1) {
    -webkit-animation: scale .75s -.24s infinite cubic-bezier(.2,.68,.18,1.08);
    animation: scale .75s -.24s infinite cubic-bezier(.2,.68,.18,1.08);
}
.ball-pulse>div:nth-child(2) {
    -webkit-animation: scale .75s -.12s infinite cubic-bezier(.2,.68,.18,1.08);
    animation: scale .75s -.12s infinite cubic-bezier(.2,.68,.18,1.08);
}
.ball-pulse>div:nth-child(3) {
    -webkit-animation: scale .75s 0s infinite cubic-bezier(.2,.68,.18,1.08);
    animation: scale .75s 0s infinite cubic-bezier(.2,.68,.18,1.08);
}

/*글자가 넓이보다 길 경우 ...으로 짜르기*/
.text-overflow{
    overflow: hidden;
    white-space: nowrap;
    text-overflow: ellipsis;
}

/*textarea 리사이징 막기*/
textarea{
    resize:none;
}

.placeholder { color: #aaa; }

/*등록페이지 설명글*/
.explanation {
    font-size:13px;
    margin: 5px 0;
    color: #757575;
}
.explanation em {
    padding-right: 4px;
    color: #00b7ee;
}
.loading_image_box {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(50,50,50,.6);
    z-index: 2000;
    display:none;
}
.loading_image {
    padding: 15px;
    border-radius: 100%;
    width: 90px;
    height: 90px;
    background-repeat: no-repeat;
    background-size: 100%;
    background-position: center;
    perspective:400px;
    z-index:1000;
    margin:0 auto;
    display:none;
}
.loding_study {
    background-image:url('https://moccozy.blob.core.windows.net/icon/icon_loading_study.png')
}
.loding_art {
    background-image:url('https://moccozy.blob.core.windows.net/icon/icon_loading_art.png')
}
.loding_bowling {
    background-image:url('https://moccozy.blob.core.windows.net/icon/icon_loading_bowling.png')
}
.loding_camera {
    background-image:url('https://moccozy.blob.core.windows.net/icon/icon_loading_camera.png')
}
.loding_cooking {
    background-image:url('https://moccozy.blob.core.windows.net/icon/icon_loading_cooking.png')
}

.loading_image.transferImage{
    display:block;
    transform:rotateY(0deg);
}
.loading_image_wrap{
    display:table-cell;
    vertical-align:middle;
}
.loading_image_overlay {
    background-color: #fff;
    width: 110px;
    height: 110px;
    border-radius: 100%;
    margin: 0 auto;
    padding: 10px;
}




/*모꼬지아이템*/

.pic-list a, .pic-list a:hover{
    text-decoration:none;
    color:inherit;
}


.study-item-overlay {
    width:100%;
    height:391px; /*pic-item 높이와 맞추기*/
    position:absolute;
    top:0;
    left:0;
    background-color:#1abc9d;
    z-index:9;
    opacity:0;
    transition:all 0.5s ;
    -webkit-transition:all 0.5s ;
    -o-transition:all 0.5s ;
    -moz-transition:all 0.5s ;
}

.study-item-overlay:hover {
    opacity:0.25;
}

.study-item-overlay.status-complete {
    background-color: #000;
    opacity: 0.8;
}

.status-complete-text{
    width: 104px;
    height: 40px;
    font-size:28px;
    color:#fff;
    position:absolute;
    top:50%;
    left:50%;
    margin-left:-52px;
    margin-top:-20px;
}

.study-item-wrap a{
    text-decoration:none;
}

.study-item{
    width:100%;
    height:auto;
    box-shadow: 2px 2px 2px #d0d0d0;
    border:1px solid #efefef;
    position:relative;
    overflow:hidden;
    background-color:#000;
    transition:background-color 2s ;
    -webkit-transition:background-color 2s ;
    -o-transition:background-color 2s ;
    -moz-transition:background-color 2s ;
}

.study-item .header-bg {
    width:100%;
    height:245px;
    background-size:cover;
    background-position:center;
    background-repeat:no-repeat;
    opacity:0.5;
}

.study-item .header-text-container {
    width:100%;
    height:260px;
    max-height:220px;
    position:absolute;
    top:0;
    left:0;
    background-size:cover;
    background-position:center;
    background-repeat:no-repeat;
    display:table;
}


.study-item .header-text {
    display:table-cell;
    vertical-align:middle;
    text-align:center;
    color:#fff;
    font-weight:300;
    padding: 0 20px;
}

.study-item .header-text .title{
    font-size:22px;
    font-weight:400;
}
@media screen and ( max-width : 768px ) {
    .study-item .header-text .title {
        font-size:17px;
    }
    .study-item .item-contents .user-name{
    padding-bottom:5px !important;
}
#pick-container .study-item .item-contents .location{
    font-size:15px;
}
#pick-container .study-item .item-contents .strong-info{
    font-size:15px !important;
}
   #pick-container .study-item .item-contents .user-name {
    font-size:13px !important;
}
}

.study-item .header-text .sub-title {
    font-size:18px;
    margin-top:10px;
    opacity:0.8;
}


.study-item .header-text .tag {
    font-size: 15px;
    position: absolute;
    bottom: -18px;
    left:0;
    width: 100%;
}

.study-item .header-text .tag > span {
    margin-right:6px;
}

.study-item .header-text .tag > span.last{
    margin-right:0;
}

.study-item .item-contents {
    width:100%;
    height:160px;
    background-color:#fff;
    border-top:1px solid #efefef;
    position:relative;
    padding-top:48px;
    text-align:center;
    font-weight:300;
    color:#666;
}

#pick-container .study-item .item-contents .user-name {
    font-size:14px;
}
.study-item .item-contents .user-name{
    font-size:16px;
    font-weight:400;
    padding:10px ;
    padding-bottom:14px;
}


.study-item .item-contents .location{
    font-size:17px;
    padding-bottom:4px;
    text-align:center;
    padding: 0 16px;
}

.study-item .item-contents .strong-info{
    font-size:16px;
    margin-top: 1px;
    color:#00b7ee;
    font-weight:500;
    text-align:center;
    padding: 0 16px;
}


.study-item .profile-image {
    width:96px;
    height:96px;
    position:absolute;
    top:0;
    left:50%;
    margin-top:-48px;
    margin-left:-48px;
    border:2px solid #efefef;
    background-color:#efefef;
    border-radius:50%;
    background-size:cover;
    background-repeat:no-repeat;
    background-position:center;
    z-index: 1;
}

.study-item .header-bg-overlay {
    width:100%;
    height:300px;
    position:absolute;
    background-color:#000;

}


/*왼쪽정렬 형식*/

.study-item.align-left .study-item-overlay{
    height:405px;
}

.study-item.align-left.place-item .study-item-overlay{
    height:379px;
}

.study-item.align-left .header-text-container {
    max-height:288px;
    display:block;
}

.study-item.align-left .header-bg{
     height: 288px;
}

.study-item.align-left .header-text{
    text-align:left;
    display:block;
    padding-left:25px;
    padding-right:25px;
    height: 100%;
}

.study-item .header-text.align-left .title-wrap {
    height:70%;
}
.study-item .header-text.align-left .title{
    font-size: 24px;
    height: 70%;
    padding-top: 65px;
    display: block;
    display: -webkit-box;
    max-width: 100%;
    height: 136px;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
    overflow: hidden;
    text-overflow: ellipsis;
}

.study-item .header-text.align-left .tag{
    position:relative;
    top:0;
    bottom:0;
    left:0;
    height:30%;
}

.study-item .item-contents.align-left{
    height:116px;
}

.study-item .item-contents.align-left .location, .study-item .item-contents.align-left .strong-info {
    text-align:left;
    padding-left:25px;
    padding-right:25px;
}


.study-item .item-contents.align-left .profile-image {
    left: inherit;
    right: 20px;
}

.study-item .item-contents.align-left .user-name{
    position: absolute;
    top: 0;
    right: 110px;
}

.study-item .item-contents .icon-container{
    position: absolute;
    right: 20px;
    bottom: 20px;
}

.study-item-wrap{padding:10px;}

.icon-img{
    width:15px;
    position:relative;
    top:-1px;
    margin-left:4px;
}

.study-item.place-item .item-contents {
    padding-top: 20px;
    height: 90px;
}

.study-item .header-text-container .isPayment{
    position:absolute;
    top:25px;
    left: 25px;
    color:#fff;
    font-size:12px;
    border:1px solid #fff;
    padding:4px 6px;
}
</style>


<script type="text/javascript">

function readBoard(num){
	var url="<%=cp%>/keyword/review/article?num="+num;
	$("#myModalBody").load(url);
	$("#myModal").modal("show");
	
};


</script>



<div style="margin: auto; width: 900px;">
	<div style="padding-top: 50px; font-size: 17px; ">
		<table class="tab_menu" style="width:100%; float: left; display: block; text-align: left;  border-bottom: 1px solid #e2e2e2; margin-bottom: 50px; ">
			<tr>
				<td style="height:50px; line-height:50px; border-bottom:2px solid #1abc9c;float: left; position: relative; list-style-type: none; font-family: 'BareunDotum',gulim,helvetica,sans-serif;" data-tab="exam" ><a style="cursor: pointer; color: #1abc9c;"  onclick="location.href='<%=cp%>/keyword/search?keyword=${keyword }'">통합검색</a></td>
				<td style="height:50px; line-height:50px; margin-left:30px; float: left; position: relative; list-style-type: none; font-family: 'BareunDotum',gulim,helvetica,sans-serif"><a style="cursor: pointer;" onclick="location.href='<%=cp%>/keyword/studySearch?keyword=${keyword }'">스터디</a></td>
				<td style="height:50px; line-height:50px; margin-left:30px; float: left; position: relative; list-style-type: none; font-family: 'BareunDotum',gulim,helvetica,sans-serif"><a style="cursor: pointer;" onclick="location.href='<%=cp%>/keyword/promoteSearch?keyword=${keyword }'">홍보</a></td>
				<td style="height:50px; line-height:50px; margin-left:30px; float: left; position: relative; list-style-type: none; font-family: 'BareunDotum',gulim,helvetica,sans-serif"><a style="cursor: pointer;" onclick="location.href='<%=cp%>/keyword/reviewSearch?keyword=${keyword }'">리뷰</a></td>
				<td style="height:50px; line-height:50px; margin-left:30px; float: left; position: relative; list-style-type: none; font-family: 'BareunDotum',gulim,helvetica,sans-serif"><a style="cursor: pointer;" onclick="location.href='<%=cp%>/keyword/marketSearch?keyword=${keyword }'">스터디마켓</a></td>
				<td style="height:50px; line-height:50px; margin-left:30px; float: left; position: relative; list-style-type: none; font-family: 'BareunDotum',gulim,helvetica,sans-serif"><a style="cursor: pointer;" onclick="location.href='<%=cp%>/keyword/whereSearch?keyword=${keyword }'">어디서하지</a></td>
				<td style="height:50px; line-height:50px; margin-left:30px; float: left; position: relative; list-style-type: none; font-family: 'BareunDotum',gulim,helvetica,sans-serif"><a style="cursor: pointer;" onclick="location.href='<%=cp%>/keyword/downloadSearch?keyword=${keyword }'">다운로드</a></td>
				<td style="height:50px; line-height:50px; margin-left:30px; float: left; position: relative; list-style-type: none; font-family: 'BareunDotum',gulim,helvetica,sans-serif"><a style="cursor: pointer;" onclick="location.href='<%=cp%>/keyword/downloadSearch?keyword=${keyword }'">중고장터</a></td>
				
			</tr>
		</table>
		
	</div>
	<h3 style="height:50px; position: relative; list-style-type: none; font-family: 'BareunDotum',gulim,helvetica,sans-serif; color: #1abc9c; font-size: 23px;">'${keyword }'검색결과</h3>
			
			<!-- 스터디 -->	
			<c:if test="${studyCount!='0' }">		
			<div style="clear: both; font-size: 16px; font-family:'BareunDotum'; font-weight: bolder; color: black; margin-bottom: 20px; margin-top: 79px;">스터디</div>
				<c:forEach var = "dto" items="${list}">
						<div class="col-lg-4 col-md-6 col-sm-12 col-xs-12 default-list-box study-item-wrap">
							<a href="javascript:location.href='<%=cp%>/study/myStudy/home/${dto.s_num}'">
							<div class="study-item list-item align-left" data-lat="" data-lng="" data-index="">
								<div class="study-item-overlay">
								</div>
								<div class="header-bg" style="background-image:url(<%=cp%>/uploads/member/userImg/${dto.imageFileName})">
								</div>
								<div class="header-text-container">
									<div class="isPayment">
				
											${dto.category}&nbsp; 
				
									</div>
									<div class="header-text align-left">
										<div class="title-wrap">
											<div class="title">
											${dto.studyName}
											</div>
										</div>
				
									</div>
								</div>
								<div class="item-contents align-left">
									<div class="profile-image" style="background-image:url(<%=cp%>/uploads/member/userImg/${dto.userImg})">
									</div>
									<div class="user-name">
									${dto.userName}
									</div>
									<div class="location">
									<c:if test="${dto.range=='0'}"><dt style="font-size:14px; margin-top: 8px;">[전체공개][${dto.gender }]</dt></c:if>
									<c:if test="${dto.range=='1'}"><dt style="font-size:14px; margin-top: 8px;">[비공개][${dto.gender }]</dt></c:if>
									</div>
									
									<div class="icon-container">
										<span class="commentIcon"><img class="icon-img" src="http://moccozy.blob.core.windows.net/icon/comment-icon.png"/></span><span class="info-comment">30</span>
									<i class="fa fa-user-o" aria-hidden="true"></i><span class="info-comment"> ${dto.recruit }</span>
									</div>
								</div>
							</div>
							
							</a>
							
						</div>
					</c:forEach>

				<%-- <div style="clear: both; font-size: 16px; font-family:'BareunDotum'; font-weight: bolder; color: black; margin-bottom: 20px; margin-top: 79px;">스터디</div>
				<div style="padding-left: 15px; text-overflow: ellipsis;">
				<c:forEach var="dto" items="${list }">
					<ul>
						<li style="clear: both;">
						<c:if test="${dto.imageFileName != null }">
							<div class="thumb" >
							<c:if test="${dto.imageFileName!='' }"><img src="<%=cp%>/uploads/member/userImg/${dto.imageFileName}" style="width: 82px; height: 82px;" onerror="this.src='<%=cp%>/resource/images/reviewPhoto/noImage.png'"></c:if>
							</div>
						</c:if>	
							<dl style="padding-top: 3px; overflow: hidden; line-height: 19px; display: block;">
								<c:if test="${dto.range=='0' }"><dt style="display: inline; clear: both; margin-right: 5px; "><a onclick="location.href='<%=cp%>/study/myStudy/home/${dto.s_num}'" style="cursor: pointer; color: #1abc9c; font-size: 15px; white-space: nowrap;overflow: hidden;text-overflow: ellipsis;">${dto.studyName }</a></dt>&nbsp;&nbsp;</c:if>
								<c:if test="${dto.range=='1' }"><dt style="display: inline; clear: both; margin-right: 5px; "><a style="cursor: pointer; color: #1abc9c; font-size: 15px; white-space: nowrap;overflow: hidden;text-overflow: ellipsis;">${dto.studyName }</a></dt>&nbsp;&nbsp;&nbsp;&nbsp;</c:if>
								<dd class="txt_inline" style="clear: both; margin: 2px 0 1px; font-size: 12px; line-height: 18px; display: inline;">생성일|${dto.created }</dd>
								<c:if test="${dto.range=='0'}"><dt style="font-size:11px; margin-top: 8px;">[전체공개][${dto.gender }][${dto.recruit }명]</dt></c:if>
								<c:if test="${dto.range=='1'}"><dt style="font-size:11px; margin-top: 8px;">[비공개][${dto.gender }][${dto.recruit }명]</dt></c:if>
								<dd style="white-space: nowrap;overflow: hidden;text-overflow: ellipsis;">&nbsp;&nbsp;&nbsp;${dto.study_Info }</dd>
													
								
							</dl>
						</li>
					</ul>		
				</c:forEach>
				</div> --%>
				<%-- <c:if test="${studyCount>=4 }"> --%>
				<div class="section_more"><a onclick="location.href='<%=cp %>/keyword/studySearch?keyword=${keyword }';" style="cursor: pointer;">더보기</a></div>
			<%-- 	</c:if> --%>
				
				<hr style="width: 100%; height: 1px; background:#e2e2e2; margin: 0px;">
				
			</c:if>	
			
			
			<!--홍보게시판  -->
			<c:if test="${promoteCount!='0' }">
				<div style="clear: both; font-size: 16px; font-family:'BareunDotum'; font-weight: bolder; color: black; margin-bottom: 20px; margin-top: 35px;">스터디홍보</div>
				<div style="padding-left: 15px;">
				<c:forEach var="dto" items="${promoteList }">
					<ul>
						<li style="clear: both;">
						<c:if test="${dto.imageFileName != null }">
							<div class="thumb" >
								<img src="<%=cp%>/uploads/photo/${dto.imageFileName}" style="width: 82px; height: 82px;" onerror="this.src='<%=cp%>/resource/images/reviewPhoto/noImage.png'">
							</div>
						</c:if>
							<dl style="padding-top: 3px; overflow: hidden; line-height: 19px; display: block;">
								<dt style="display: inline; clear: both; margin-right: 5px; "><a onclick="location.href='<%=cp%>/keyword/promote/article?num=${dto.num }'" style="cursor: pointer; color: #1abc9c; font-size: 15px; white-space: nowrap;overflow: hidden;text-overflow: ellipsis;">${dto.subject }</a>&nbsp;&nbsp;</dt>
								<dd class="txt_inline" style="clear: both; margin: 2px 0 1px; font-size: 12px; line-height: 18px; display: inline;">작성일|${dto.created }</dd>
							<dt style="font-size:11px; margin-top: 8px; white-space: nowrap;overflow: hidden;text-overflow: ellipsis;">[스터디명:${dto.studyName }][조회수&nbsp;&nbsp;${dto.hitCount }]</dt>								
								<dd style="white-space: nowrap;overflow: hidden;text-overflow: ellipsis;">&nbsp;&nbsp;&nbsp;${dto.content }</dd>																											
							</dl>
						</li>
					</ul>
				</c:forEach>
				</div>
				<%-- <c:if test="${studyCount>=4 }"> --%>
				<div class="section_more"><a onclick="location.href='<%=cp %>/keyword/promoteSearch?keyword=${keyword }';" style="cursor: pointer;">더보기</a></div>
			<%-- 	</c:if> --%>
				
					<hr style="width: 100%; height: 1px; background:#e2e2e2; margin: 0px;">
				
			</c:if>	
			
			<!--리뷰게시판  -->
			<c:if test="${reviewCount!='0' }">
				<div style="clear: both; font-size: 16px; font-family:'BareunDotum'; font-weight: bolder; color: black; margin-bottom: 20px; margin-top: 35px;">스터디리뷰</div>
				<div style="padding-left: 15px;">
				<c:forEach var="dto" items="${reviewList }">
					<ul>
						<li style="clear: both;">
						<c:if test="${dto.imageFileName != null }">
							<div class="thumb" >
								<img src="<%=cp%>/uploads/review/${dto.imageFileName}" style="width: 82px; height: 82px;" onerror="this.src='<%=cp%>/resource/images/reviewPhoto/noImage.png'">
							</div>
						</c:if>	
							<dl style="padding-top: 3px; overflow: hidden; line-height: 19px; display: block;">
								<c:if test="${dto.range=='0'}"><dt style="display: inline; clear: both; margin-right: 5px; "><a onclick="readBoard(${dto.num})" style="cursor: pointer; color: #1abc9c; font-size: 15px; white-space: nowrap;overflow: hidden;text-overflow: ellipsis;">제목:&nbsp;${dto.subject }</a></dt></c:if>
								<c:if test="${dto.range=='1'}"><dt style="display: inline; clear: both; margin-right: 5px; "><a onclick="" style="cursor: pointer; color: blue; white-space: nowrap;overflow: hidden;text-overflow: ellipsis;">${dto.subject }</a></dt></c:if>
								<dd class="txt_inline" style="clear: both; margin: 2px 0 1px; font-size: 12px; line-height: 18px; display: inline;">&nbsp;&nbsp;작성일|${dto.created }</dd>
								<c:if test="${dto.range=='0'}"><dt style="font-size:11px; margin-top: 8px;">[전체공개][조회수&nbsp;&nbsp;${dto.hitCount }]</dt></c:if>
								<c:if test="${dto.range=='1'}"><dt style="font-size:11px; margin-top: 8px;">[비공개][조회수&nbsp;&nbsp;${dto.hitCount }]</dt></c:if>

								<dd style="white-space: nowrap;overflow: hidden;text-overflow: ellipsis;">&nbsp;&nbsp;&nbsp;${dto.content }</dd>																															
							</dl>
						</li>
					</ul>
				</c:forEach>
				</div>
				<%-- <c:if test="${studyCount>=4 }"> --%>
				<div class="section_more"><a onclick="location.href='<%=cp %>/keyword/reviewSearch?keyword=${keyword }';" style="cursor: pointer;">더보기</a></div>
			<%-- 	</c:if> --%>
				
					<hr style="width: 100%; height: 1px; background:#e2e2e2; margin: 0px;">
				
			</c:if>	
			
			
			<!--스터디마켓  -->
			<c:if test="${studyMarketCount!='0' }">
				<div style="clear: both; font-size: 16px; font-family:'BareunDotum'; font-weight: bolder; color: black; margin-bottom: 20px; margin-top: 35px;">스터디마켓</div>
				<div style="padding-left: 15px;">
				<c:forEach var="dto" items="${marketList }">
					<ul>
						<li style="clear: both;">
						<c:if test="${dto.urlContent != null }">
							<div class="thumb" >
								<%-- <img style="width: 82px; height: 82px; background-image:url('http://img.youtube.com/vi/${dto.urlContent}/hqdefault.jpg'); background-size: contain;" onerror="this.src='<%=cp%>/resource/images/reviewPhoto/noImage.png'"> --%>
								<img src="http://img.youtube.com/vi/${dto.urlContent}/hqdefault.jpg" style="width: 82px; height: 82px;" onerror="this.src='<%=cp%>/resource/images/reviewPhoto/noImage.png'">
							</div>
						</c:if>	
							<dl style="padding-top: 3px; overflow: hidden; line-height: 19px; display: block;">
								<dt style="display: inline; clear: both; margin-right: 5px; "><a onclick="location.href='<%=cp %>/keyword/studyMarketBoard/article?num=${dto.num }'" style="cursor: pointer; color: #1abc9c; font-size: 15px; white-space: nowrap;overflow: hidden;text-overflow: ellipsis;">${dto.subject }</a></dt>
								<dd class="txt_inline" style="clear: both; margin: 2px 0 1px; font-size: 12px; line-height: 18px; display: inline;">&nbsp;&nbsp;작성일|${dto.created }</dd>
								<dt style="font-size:11px; margin-top: 8px;">[강사명:${dto.userId }][조회수&nbsp;&nbsp;${dto.hitCount }]</dt>

								<dd style="white-space: nowrap;overflow: hidden;text-overflow: ellipsis;">&nbsp;&nbsp;&nbsp;${dto.content }</dd>										
							</dl>
						</li>
					</ul>
				</c:forEach>
				</div>
				<%-- <c:if test="${studyCount>=4 }"> --%>
				<div class="section_more"><a onclick="location.href='<%=cp %>/keyword/marketSearch?keyword=${keyword }';" style="cursor: pointer;">더보기</a></div>
			<%-- 	</c:if> --%>
				
					<hr style="width: 100%; height: 1px; background:#e2e2e2; margin: 0px;">
				
			</c:if>	
			
			<!--어디서하지  -->
			<c:if test="${studyWhereCount!='0' }">
				<div style="clear: both; font-size: 16px; font-family:'BareunDotum'; font-weight: bolder; color: black; margin-bottom: 20px; margin-top: 35px;">어디서하지</div>
				<div style="padding-left: 15px;">
				<c:forEach var="dto" items="${whereList }">
					<ul>
						<li style="clear: both;">			
							<div class="thumb" >
								<img src="${dto.content }" style="width: 82px; height: 82px;" onerror="this.src='<%=cp%>/resource/images/reviewPhoto/noImage.png'">
							</div>
							<dl style="padding-top: 3px; overflow: hidden; line-height: 19px; display: block;">
								<dt style="display: inline; clear: both; margin-right: 5px; "><a onclick="location.href='<%=cp%>/keyword/studywhere/article?num=${dto.num }'" style="cursor: pointer; color: #1abc9c; font-size: 15px; white-space: nowrap;overflow: hidden;text-overflow: ellipsis;">${dto.subject }</a></dt>
								<dd class="txt_inline" style="clear: both; margin: 2px 0 1px; font-size: 12px; line-height: 18px; display: inline;">&nbsp;&nbsp;작성일|${dto.created }</dd>
								<dt style="font-size:11px; margin-top: 8px;">[매장명:${dto.placename }][지역:${dto.region }][영업시간:${dto.ocTime }]</dt>
								<dt style="font-size:11px; margin-top: 8px;">[주소:${dto.address }][전화번호:${dto.tel }]</dt>
								<%-- <dd>&nbsp;&nbsp;&nbsp;${dto.content }</dd> --%>
							</dl>
						</li>
					</ul>
				</c:forEach>
				</div>
				<%-- <c:if test="${studyCount>=4 }"> --%>
				<div class="section_more"><a onclick="location.href='<%=cp %>/keyword/whereSearch?keyword=${keyword }';" style="cursor: pointer;">더보기</a></div>
			<%-- 	</c:if> --%>
				
					<hr style="width: 100%; height: 1px; background:#e2e2e2; margin: 0px;">
				
			</c:if>	
			
			
			<!--다운로드게시판  -->
			<c:if test="${downloadCount!='0' }">
				<div style="clear: both; font-size: 16px; font-family:'BareunDotum'; font-weight: bolder; color: black; margin-bottom: 20px; margin-top: 35px;">다운로드게시판</div>
				<div style="padding-left: 15px;">
				<c:forEach var="dto" items="${downloadList }">
					<ul>
						<li style="clear: both;">
	
							<dl style="padding-top: 3px; overflow: hidden; line-height: 19px; display: block;">
								<dt style="display: inline; clear: both; margin-right: 5px; "><a onclick="location.href='<%=cp %>/keyword/downloadBoard/article?num=${dto.num }'" style="cursor: pointer; color: #1abc9c; font-size: 15px; white-space: nowrap;overflow: hidden;text-overflow: ellipsis;">${dto.subject }</a></dt>
								<dd class="txt_inline" style="clear: both; margin: 2px 0 1px; font-size: 12px; line-height: 18px; display: inline;">&nbsp;&nbsp;작성일|${dto.created }</dd>


								<dd style="white-space: nowrap;overflow: hidden;text-overflow: ellipsis;">&nbsp;&nbsp;&nbsp;${dto.content }</dd>
							</dl>
						</li>
					</ul>
				</c:forEach>
				</div>
				<%-- <c:if test="${studyCount>=4 }"> --%>
				<div class="section_more"><a onclick="location.href='<%=cp %>/keyword/downloadSearch?keyword=${keyword }';" style="cursor: pointer;">더보기</a></div>
			<%-- 	</c:if> --%>
				
					<hr style="width: 100%; height: 1px; background:#e2e2e2; margin: 0px;">
				
			</c:if>	
			
			
			<!-- 중고장터 -->
			<div style="clear: both; font-size: 16px; font-family:'BareunDotum'; font-weight: bolder; color: black; margin-bottom: 20px; margin-top: 35px;">중고장터</div>
			<c:forEach var="dto" items="${usedShopList }">
					<div class="col-sm-3">
						<div class="thum">
							<div
								style="width: 195x; height: 195px; background: gray; background-image: url('${dto.content}');
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
			</c:forEach>
			<div class="section_more"><a onclick="location.href='<%=cp %>/keyword/downloadSearch?keyword=${keyword }';" style="cursor: pointer;">더보기</a></div>
			
			
</div>

<!-- Modal --> 
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
  <div class="modal-dialog">
    <div class="modal-content" style="padding: 15px;">
      <div id="myModalBody" class="modal-body" style="height: 500px; "></div>
      <div class="modal-footer" style="margin-top: -5px;">
      		
         <button type="button" class="btn btn-default" style="width: 65px; height: 30px; background: #1abc9c; padding-top: 3px; padding-left: 13px;" onclick="deleteBoard();">삭제</button>
       
         <button type="button" class="btn btn-default" data-dismiss="modal" style="width: 65px; height: 30px; background: #1abc9c; padding-top: 3px; padding-left: 7px;">리스트</button>
         <button type="button" class="btn btn-default" style="width: 65px; height: 30px; background: #1abc9c; padding-top: 3px; padding-left: 13px;" onclick="insertStar();">평가</button>
      </div>
    </div>
  </div>
</div>
