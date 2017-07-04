<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC"-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%
   String cp = request.getContextPath();
%>
<style>
/* date pick */
.calendar_wrap {
   display: inline-block;
   height: 30px;
   vertical-align: middle;
}

.calendar_wrap .btn_cha {
   position: relative;
   top: 4px;
   margin-left: 3px;
}
 
.calendar_wrap input[type=text] {
   float: left;
   border: 1px solid #D4D4D4;
   height: 28px
}

.calendar_wrap button {
   width: 28px;
   height: 28px;
   float: left;
   margin-left: -1px;
   cursor: pointer;
   border: 0;
   background-image: url(../images/btn_calendar_on.png);
   background-repeat: no-repeat;
   background-position: 0 0;
   text-indent: -999999px
}

.calendar_wrap button:hover, .calendar_wrap button.on {
   background-image: url(../images/btn_calendar_on.png)
}

.calendar_wrap.w_150 {
   width: 150px
}

.calendar_wrap input[type=text] {
   width: 120px
}

.ui-datepicker {
   margin-top: 6px;
   width: 245px;
   display: none;
   background-color: #fff;
   border: 1px solid #e8e8e8;
   border-bottom: 0;
   background: #fff
}

.ui-datepicker .ui-datepicker-header {
   position: relative;
   padding: 5px 0;
   height: 30px
}

.ui-datepicker .ui-datepicker-prev span, .ui-datepicker .ui-datepicker-next span
   {
   display: block;
   position: absolute;
   background-image: url(../images/calendar_btns.png);
   background-repeat: no-repeat;
   background-position: 0 0;
   width: 16px;
   height: 15px;
   text-indent: -999999px;
   cursor: pointer
}

.ui-datepicker .ui-datepicker-prev span {
   top: 7px;
   left: 35px
}

.ui-datepicker .ui-datepicker-next span {
   top: 7px;
   right: 35px;
   background-position: -16px 0
}

.ui-datepicker .ui-datepicker-title {
   font-weight: bold;
   color: #5c5c5c;
   font-size: 12px;
   text-align: center
}

.ui-datepicker .ui-datepicker-title select {
   height: 20px;
   margin-left: 3px;
}

.ui-datepicker table {
   width: 100%;
   border-collapse: collapse
}

.ui-datepicker table tr td:nth-last-child(1) a {
   
}

.ui-datepicker table tr td:nth-last-child(2) a {
   
}

.ui-datepicker th {
   text-align: center;
   font-weight: 700;
   border: 0;
   background-color: #676b70;
   color: #fff;
   width: 35px;
   height: 25px
}

.ui-datepicker th span {
   display: block;
   height: 25px;
   line-height: 25px;
   color: #fff;
}

.ui-datepicker td {
   border: 1px solid #e8e8e8
}

.ui-datepicker td span, .ui-datepicker td a {
   display: block;
   padding-top: 5px;
   width: 29px;
   height: 22px;
   text-align: left;
   text-decoration: none
}

.ui-datepicker td a:hover {
   color: #e31d1a;
   border: 2px solid #e31d1a;
   padding-top: 2px;
   width: 25px;
   height: 20px
}

.ui-datepicker td a.ui-state-default.ui-state-highlight {
   color: #e31d1a;
   border: 2px solid #e31d1a;
   padding-left: 3px;
   padding-top: 3px;
   width: 27px;
   height: 20px
}

.ui-datepicker .ui-datepicker-buttonpane {
   background-image: none;
   border-left: 0;
   border-right: 0;
   border-bottom: 0
}

.ui-datepicker .ui-datepicker-buttonpane button {
   float: right;
   cursor: pointer;
   width: auto;
   overflow: visible
}

.ui-datepicker .ui-datepicker-buttonpane button.ui-datepicker-current {
   float: left
}
</style>

<style type="text/css">
* {
	box-sizing: border-box;
}

body {
	margin: 0;
}

.d3 {
   background: #F9F0DA;
}

.d3 form {
   background: #3e3a39;
   margin-top: 5px;
}

.d3 input, .d3 button {
   border: none;
   outline: none;
   background: transparent;
}

.d3 input {
   width: 100%;
   height: 42px;
   padding: 5px 0px 5px 15px;
}

.d3 button {
   height: 42px;
   width: 42px;
   position: absolute;
   top: 0;
   right: 0;
   cursor: pointer;
}

.d3 button:before {
   content: "\f002";
   font-family: FontAwesome;
   font-size: 16px;
   color: #F9F0DA;
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

.clickbtn {
   background-color: white;
   border-style: solid;
   padding: 5px 20px;
   margin-right: 10px;
   border: 1px solid #EAEAEA;
}

#modalbtn {
   background: none;
   border: none;
   outline: none;
}

</style>

<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/highcharts-3d.js"></script>


<script>
// 통계 처리 함수 - 첫번째
$(function(){
   var url="<%=cp%>/exam/firstChart";
   $.getJSON(url, function (csv) {
      $('#firstChart').highcharts({
    	  colors: ['#FFBB00','#FF5E00','BLUE','#666666'],
    	  chart: {
               type: 'pie',
               plotBackgroundColor:null,
               plotBorderWidth:null,
               plotShadow:false,
               type:'pie'
           },
           title: {
               text: '# 응시 수 <br> 1위: 정보처리기사 <br> [ 10 회 ]'
           },
           tooltip: {
               pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
           },
           plotOptions: {
               pie: {
                   allowPointSelect: true,
                   cursor: 'pointer',
                   dataLabels: {
                       enabled: false
                   },
                   showInLegend: true
               }
           },
           credits:{
        	 enabled:false  
           },
           series:csv
      });
   });
});

//통계 처리 함수 - 두번째
$(function(){
   var url="<%=cp%>/exam/secondChart";
   $.getJSON(url, function (csv) {
      $('#secondChart').highcharts({
    	  colors: ['#FFBB00','#FF5E00','BLUE','#666666'],
    	  chart: {
               type: 'pie',
               plotBackgroundColor:null,
               plotBorderWidth:null,
               plotShadow:false,
               type:'pie'
           },
           title: {
               text: '# 합격률 <br> 1위: 정보처리기사 <br> [ 80% ]'
           },
           tooltip: {
               pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
           },
           plotOptions: {
               pie: {
                   allowPointSelect: true,
                   cursor: 'pointer',
                   dataLabels: {
                       enabled: false
                   },
                   showInLegend: true
               }
           },
           credits:{
        	 enabled:false  
           },
           series:csv
      });
   });
});

//통계 처리 함수 - 세번째
$(function(){
   var url="<%=cp%>/exam/lastChart";
   $.getJSON(url, function (csv) {
      $('#lastChart').highcharts({
    	  colors: ['#FFBB00','#FF5E00','BLUE','#666666'],
    	  chart: {
               type: 'pie',
               plotBackgroundColor:null,
               plotBorderWidth:null,
               plotShadow:false,
               type:'pie'
           },
           title: {
               text: '# 오답율 <br> 1위: 한국사 능력 검정시험 <br> [ 40% ]'
           },
           tooltip: {
               pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
           },
           plotOptions: {
               pie: {
                   allowPointSelect: true,
                   cursor: 'pointer',
                   dataLabels: {
                       enabled: false
                   },
                   showInLegend: true
               }
           },
           credits:{
        	 enabled:false  
           },
           series:csv
      });
   });
});
</script>
<script>
$(document).ready(function(){
    //최상단 체크박스 클릭
  
    $("#allCheck").click(function(){
        //클릭되었으면
        if($("#allCheck").prop("checked")){
            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
            $("input[name=chk]").prop("checked",true);
            //클릭이 안되있으면
        }else{
            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
            $("input[name=chk]").prop("checked",false);
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

$('#exampleModal').on('show.bs.modal', function (event) {
     var button = $(event.relatedTarget) // Button that triggered the modal
     var recipient = button.data('whatever') // Extract info from data-* attributes
     // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
     // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
     var modal = $(this)
     modal.find('.modal-title').text('New message to ' + recipient)
     modal.find('.modal-body input').val(recipient)
   });

</script>

<script>
function deleteScore(hak) {
   var url="<%=cp%>/exam/delete?hak="+hak+"&page=${page}";
   if(confirm("자료를 삭제 하시겠습니까?")) {
      location.href=url;
   }
}

function updateScore(hak) {
   var url="<%=cp%>/score/update?hak="+hak+"&page=${page}";
   location.href=url;
}

function check() {
   var f=document.scoreListForm;
   
   if(f.wishlistNum==undefined)
      return;
   
   if(f.wishlistNum.length!=undefined) { // 체크박스가 둘 이상인 경우
      for(var i=0; i<f.wishlistNum.length; i++) {
         if(f.chkAll.checked)
            f.wishlistNum[i].checked=true;
         else
            f.wishlistNum[i].checked=false;
      }
   } else { // 체크박스가 하나인 경우
      if(f.chkAll.checked)
         f.wishlistNum.checked=true;
      else
         f.wishlistNum.checked=false;
   }
}

function deleteList() {
   var f=document.array_form;
   var cnt=0;
   
   if(f.wishlistNum==undefined) {
      return false;      
   }
   
   if(f.wishlistNum.length!=undefined) {// 체크박스가 둘 이상인 경우
      for(var i=0; i<f.wishlistNum.length; i++) {
         if(f.wishlistNum[i].checked)
            cnt++;
      }
   } else {
      // 체크박스가 하나인 경우
      if(f.wishlistNum.checked)
         cnt++;
   }
   
   if(cnt==0) {
      alert("선택한 게시물이 없습니다.");
      return false;
   }
   
   if(confirm("선택한 게시물을 삭제하시겠습니까 ? ")) {
      f.action="<%=cp%>/score/deleteList";
      f.submit();
   }
}

</script>

<script type="text/javascript">
	function popupLink(popHeight,popWidth){ 
	var winHeight = document.body.clientHeight;   // 현재창의 높이
	var winWidth = document.body.clientWidth;   // 현재창의 너비
	var winX = window.screenX || window.screenLeft || 0;   // 현재창의 x좌표
	var winY = window.screenY || window.screenTop || 0;   // 현재창의 y좌표
	
	var popX = winX + (winWidth - popWidth)/2;
	var popY = winY + (winHeight - popHeight)/2;
	window.open("<%=cp%>/community/exam/examFiles","popup","width="+popWidth+"px,height="+popHeight+"px,top="+popY+",left="+popX);
}
</script>

<script type="text/javascript">
    function sendOk() {
        var f = document.modalForm;

    	var str = f.wishlistName.value;
        if(!str) {
            alert("시험을 선택하세요");
            return;
        }

    	str = f.wishlistDate.value;
        if(!str) {
            alert("응시일을 지정하세요. ");
            return;
        }

    	f.action="<%=cp%>/exam/${mode}";
    		
        f.submit();
    }
</script>

<div style="width: 900px; height:600px; margin: 60px auto;">
   <div style="height: 50px; font-size: 20px; text-align: center;">
      <span style="font-size: 20px; color: #BDBDBD; font-weight: bold;">
         <span style="font-size: 19px; color: #1abc9c;"
         class="glyphicon glyphicon-pencil"> </span>&nbsp;&nbsp;&nbsp;WOOLTARI&nbsp;&nbsp;&nbsp;
      </span>E X A M
   </div>
   <div style="margin-bottom: 5px; font-size: 15px;">
      <span style="font-size: 20px; color: #1abc9c; font-weight: bolder;">
         홍길동&nbsp;&nbsp;</span>회원님의 응시할 시험 목록입니다.
   </div>

   <form name="array_form" id="array_form" style="width: 900px;">
      <!-- List Start-->
      <div class="settingArea">
         <table style="width: 100%;" cellpadding="0" cellspacing="0"
            border="0">
            <tr>
               <td colspan="2" style="text-align: left;">
                  <div
                     style="position: absolute;bottom: 10px;right: 1px;top: -22px;">
                     <input type="checkbox" id="allCheck" name="allCheck"
                        class="checkbox-style" /><label for="allCheck">전체선택</label>
                  </div>
               </td>
            </tr>
         </table>
      </div>
      <table cellpadding="0" cellspacing="0"
         style="width: 100%; border-top: 1px solid #4b4b4b;"
         class="board_table array">
         <tbody>
            <tr>
               <td style="text-align: right; width: 65px; padding: 5px 18px;"><input
                  type="checkbox" name="chk"></td>

               <td class="___number">1</td>
               <!-- 여기에 wishlistNum 들어가야함 -->
               <td>
                  <div style="position: relative;">
                     <!--[category_name]-->

                     <a href="<%=cp%>/help/report/article" class="subject"
                        style="line-height: 27px; float: left;">한국사능력검정시험 1급</a> <span
                        class="comment" style="line-height: 16px;">D-day 16</span>

                     <div class="info"
                        style="float: left; padding: 0; line-height: 25px; margin-left: 32px; float: left; padding: none;">
                        <strong>주최기관 </strong><span>국사편찬위원회</span> <span class="__dotted"></span>
                        <strong>응시일 </strong><span>2017-07-20</span>
                     </div>
                     <div style="float: right; margin: 4px;">
                        <button id="modalbtn" type="button"
                           class="glyphicon glyphicon-plus" data-toggle="modal"
                           data-target="#exampleModal" data-whatever="@mdo" value="regist"></button>
                        <button id="modalbtn" type="button"
                           class="glyphicon glyphicon-edit" data-toggle="modal"
                           data-target="#exampleModal" data-whatever="@mdo" value="change"></button>
                        <!-- <a href=""class="glyphicon glyphicon-edit" style="margin-left: 13px;"></a>-->
                     </div>

                  </div>

               </td>

            </tr>
         </tbody>
      </table>


<!-- 데이터만 가져오도록 만든 목록 -->
 <table cellpadding="0" cellspacing="0"
         style="width: 100%; border-top: 1px solid #4b4b4b;"
         class="board_table array">
         <tbody>
            <tr>
              <th width="60" style="color: #787878;">ㅁ</th>
		      <th style="color: #787878;">제목</th>
		      <th width="100" style="color: #787878;">작성자</th>
		      <th width="80" style="color: #787878;">작성일</th>
		      <th width="60" style="color: #787878;">조회수</th>
		      <th width="50" style="color: #787878;">첨부</th>
			</tr>
			<c:forEach var="dto" items = "${examinfoList }">
				<option value="${dto.examInfoName}">${dto.examInfoName }</option>
			</c:forEach>
			

		</tbody>
 </table>


<!-- 테스트용 샘플목록 생성 -->
 <table cellpadding="0" cellspacing="0"
         style="width: 100%; border-top: 1px solid #4b4b4b;"
         class="board_table array">
         <tbody>
            <tr>
               <td style="text-align: right; width: 65px; padding: 5px 18px;"><input
                  type="checkbox" name="chk"></td>

               <td class="___number">1</td>
               <!-- 여기에 wishlistNum 들어가야함 -->
               <td>
                  <div style="position: relative;">
                     <!--[category_name]-->

                     <a href="<%=cp%>/help/report/article" class="subject"
                        style="line-height: 27px; float: left;">정보처리기사</a> <span
                        class="comment" style="line-height: 16px;">D-day 6</span>

                     <div class="info"
                        style="float: left; padding: 0; line-height: 25px; margin-left: 32px; float: left; padding: none;">
                        <strong>주최기관 </strong><span>큐넷</span> <span class="__dotted"></span>
                        <strong>응시일 </strong><span>2017-05-03</span>
                     </div>
                     <div style="float: right; margin: 4px;">
                        <button id="modalbtn" type="button"
                           class="glyphicon glyphicon-plus" data-toggle="modal"
                           data-target="#exampleModal" data-whatever="@mdo" value="regist"></button>
                        <button id="modalbtn" type="button"
                           class="glyphicon glyphicon-edit" data-toggle="modal"
                           data-target="#exampleModal" data-whatever="@mdo" value="change"></button>
                        <!-- <a href=""class="glyphicon glyphicon-edit" style="margin-left: 13px;"></a>-->
                     </div>

                  </div>

               </td>

            </tr>
         </tbody>
      </table>















      <!--------------------------------------->


      <div class="btnArea">
         <input type="button" id="deleteListBtn" class="clickbtn"
            onclick="deleteList();" value="삭제"></input>
      </div>

   </form>


      <!-- ajax 탭 기능 소스 -->

   <form name="array_form" id="array_form" style="width: 900px;">
      <div style="margin-bottom: 5px;">
         <span style="font-size: 20px; color: #1abc9c; font-weight: bolder;">
            문제은행</span>
      </div>
   	<div id="tabwrap" style="width: 900px; margin: 0px auto;">
		<ul class="tabs">
			<li class="active" rel="tab1">문제</li>
			<li rel="tab2">응시내역</li>
			
		</ul>
		<div class="tab_container">
			<div id="tab1" class="tab_content">

				<table cellpadding="0" cellspacing="0" style="width: 100%;" class="board_table array">
					<tbody>
						<tr>
							<td class="___number"
								style="font-size: 11px; color: #666; text-align: center; font-weight: bold;">1</td>
							<td style="padding: 9px 5px; border-bottom: 1px solid #EEEEEE;">
								<div style="position: relative;">
									<!--[category_name]-->
	
									<a href="#" class="subject"
										style="font-size: 15px; font-weight: bold; color: #373737;">정보처리기사</a><span
										class="comment"
										style="display: inline-block; padding: 1px 7px 7px 7px; margin-left: 15px; color: #1abc9c; font-weight: bold; font-size: 15px; line-height: 8px; vertical-align: middle;">[ 17년 2회차 ]</span>
	
									<div class="info">
										<strong>등록일 :</strong>&nbsp; <span class="dateWrap" title="[datetime]">2017-06-19</span>
										<span class="__dotted"></span>
										<strong>주최기관 :</strong> &nbsp;<span>큐넷(Q-net)</span>
									</div>
	
	 								<div class="likes" style="font-size: 13px; width: 60px;">
                                           	  응시하기<br> 
                                           	 <span class="num" style="color: #1abc9c;">
                                           	 	<a target="_blank" onclick="popupLink(550,1000)" style="width: 100px; height: 100px;">
                                                   <span class="glyphicon glyphicon-circle-arrow-right"></span>
                                                </a>
                                             </span>
                                    </div>
								</div>
							</td>
						</tr>
					</tbody>
				</table>

			</div>
			<!-- #tab1 -->
			<div id="tab2" class="tab_content">
			
				<div style="margin-bottom: 5px;font-size: 15px;width: 100%;text-align: left;margin-top: 20px;">
      				<span style="font-size: 20px; color: #1abc9c; font-weight: bolder;">『 2017년 06월 29일 』</span>
        			 을 기준으로 총 합격률은 80%입니다.<br>
        			 <span style="font-size: 10px; color: red; margin-left: 236px;">(※최초 응시할 때의 응시 정보만 반영됩니다)</span>
   				</div>
				<br><br>
				<span style="font-size: 20px; margin-left: 50px;"><strong>"응시 수가 많은 시험&nbsp;Best 3"</strong></span>
				
				
				<br><br>
				
				<!-- 통계 처리하기 -->
				<div style="clear:both; margin-left: 130px;">
					<div id="firstChart" style="width: 300px; height: 500px; float: left; margin: 10px;"></div>
					
					<div id="secondChart" style="width: 300px;height: 250px; float: left; margin: 66px 10px 30px;"></div>
					
					<div id="lastChart" style="width: 300px; height: 250px; float: left; margin: 10px;"></div>
				</div>
				
				
				
				<br><br><br><br>
						
				
				<table cellpadding="0" cellspacing="0" style="width: 100%;"
					class="board_table array">
					<tr>
						<td class="___number"
							style="font-size: 11px; color: #666; text-align: center; font-weight: bold;">11</td>
						<td style="padding: 9px 5px; border-bottom: 1px solid #EEEEEE;">
							<div style="position: relative;">
								<!--[category_name]-->

								<a href="<%=cp%>/help/report/article" class="subject"
									style="font-size: 15px; font-weight: bold; color: #373737;">정보처리기사</a><span
									class="comment"
									style="display: inline-block; padding: 1px 7px 7px 7px; margin-left: 15px; color: #1abc9c; font-weight: bold; font-size: 15px; line-height: 8px; vertical-align: middle;">[17년 3회차]</span>

								<div class="info">
									<strong>응시일: &nbsp;&nbsp;</strong> <span class="dateWrap" title="[datetime]">2017-06-29</span>
									<span class="__dotted"></span> <strong>주최기관: &nbsp;&nbsp;</strong><span>큐넷</span>
									<span class="__dotted"></span> <strong>성적: &nbsp;&nbsp;</strong>
									<span style="font-size: 20px;" >82점</span>&nbsp; 
 								</div>


								<div class="likes"
									style="line-height: 23px; position: absolute; top: -8px; right: 10px; background: #fff; padding: 9px 5px 5px 5px; display: block; width: 45px; height: 41px; text-align: center; font-size: 16px; letter-spacing: -1px; color: #666666; font-weight: bold;">
									<br> <span class="num"
										style="color: #1abc9c; font-size: 18px; font-weight: bold; font-family: tahoma;">합격</span>
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




      <!------------------------------------->

      <div style="width: 900px; margin: 20px auto; text-align: center;">1
         2 3</div>

      <div class="scArea">
         <select name="where" class="where">
            <option value="subject">시험명</option>
            <option value="subject">주최기관</option>

         </select> <input type="text" name="keyword" class="keyword" placeholder="검색"
            style="width: 120px;"> <input type="button" class="submit">
      </div>


      <!-- 모달 -->
      <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
         aria-labelledby="exampleModalLabel" aria-hidden="true">
         <div class="modal-dialog">
            <div class="modal-content">

               <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                     <span aria-hidden="true">&times;</span>
                  </button>
                  <h4 class="modal-title" id="exampleModalLabel">
                     <div style="height: 50px; font-size: 20px; text-align: center; margin-top: 18px;">
                        <span
                           style="font-size: 20px; color: #BDBDBD; font-weight: bold;">
                           <span style="font-size: 19px; color: #1abc9c;"
                           class="glyphicon glyphicon-pencil"> </span>&nbsp;&nbsp;&nbsp;WOOLTARI&nbsp;&nbsp;&nbsp;
                        </span>E X A M
                     </div>
                  </h4>
               </div>
               
               <form name="modalForm" method="post" enctype="multipart/form-data">
	               <div class="modal-body">
	                     <div class="form-group" style="margin-bottom: 28px; margin-top: 22px;">
	                        <label for="recipient-name" class="control-label">시험명</label>
	                        &nbsp;&nbsp; 
	                        
                        	<select id="examSelect" style="border: 1px solid #D4D4D4">
	                       		<c:forEach var="dto" items = "${examinfoList }">
	                       			<option value="${dto.examInfoName}">${dto.examInfoName }</option>
	                       		</c:forEach>
	                       	</select>
	                     </select>
	
	                     </div>
	                     <div class="form-group">
	                        <label for="message-text" class="control-label"
	                           style="margin-right: 8px;">응시일</label>
	                            <div class="calendar_wrap">
									<input type="date" name="tryDate" value="${dto.birth }"
										style="margin-top: -15px; height: 26px; border: 1px solid #D4D4D4;"/>
	                        	</div>
	                     </div>
	               </div>
	               <div class="modal-footer">
	
	                  <button type="button" class="clickbtn">등록 완료</button>
	                  <button type="button" class="clickbtn" data-dismiss="modal">닫기</button>
	
	               </div>
   				</form>
	          </div>
	       </div>
		</div>
	</form>
</div>