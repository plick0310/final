<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC"-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%
   String cp = request.getContextPath();
%>
<link rel="stylesheet" href="<%=cp%>/resource/css/mock.css" />

<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/highcharts-3d.js"></script>
 
 <!-- 먼저 실행되야 할 것들 -->
<script type="text/javascript">
	$(document).ready(function(){
		// 문제은행 쪽 문제 / 응시내역 탭버튼처리
		$(function() {
		    $(".tab_content").hide();
		    $(".tab_content:first").show();
		
		    $("ul.tabs li").click(function() {
		       $("ul.tabs li").removeClass("active").css("color", "#333");
		       $(this).addClass("active").css("color", "#1abc9c");
		       $(".tab_content").hide()
		       var activeTab = $(this).attr("rel");
		       $("#" + activeTab).fadeIn()
		    });
		});
		
	    $("#allCheck").click(function(){
	        //클릭되었으면
	        if($("#allCheck").prop("checked")){
	            //input태그의 name이 nums인 태그들을 찾아서 checked옵션을 true로 정의
	            $("input[name=nums]").prop("checked",true);
	            //클릭이 안되있으면
	        }else{
	            //input태그의 name이 nums인 태그들을 찾아서 checked옵션을 false로 정의
	            $("input[name=nums]").prop("checked",false);
	        }
	    });
	});
</script>
 
 <!-- 응시할 시험리스트 -------------------------------------------------------------------->
<script>
  // 모달 이벤트
  $('#exampleModal').on('show.bs.modal', function (event) {
     var button = $(event.relatedTarget) // Button that triggered the modal
     var recipient = button.data('whatever') // Extract info from data-* attributes
     var modal = $(this)
     modal.find('.modal-title').text('New message to ' + recipient)
     modal.find('.modal-body input').val(recipient)
   });

  // 삭제 체크박스 조건처리
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

  // 삭제
	function deleteList() {
	   var f=document.array_form;
	   var cnt=0;
	   
	   if(f.nums==undefined) {
	      return false;      
	   }
	   
	   if(f.nums.length!=undefined) {// 체크박스가 둘 이상인 경우
	      for(var i=0; i<f.nums.length; i++) {
	         if(f.nums[i].checked)
	            cnt++;
	      }
	   } else {
	      // 체크박스가 하나인 경우
	      if(f.nums.checked)
	         cnt++;
	   }
	   
	   if(cnt==0) {
	      alert("선택한 게시물이 없습니다.");
	      return false;
	   }
	   
	   if(confirm("선택한 게시물을 삭제하시겠습니까 ? ")) {
	      f.action="<%=cp%>/mockTest/deleteList";
	      f.submit();
	   }
	}
  
	// 글쓰기 폼
	function create(){
		$("#examSelect").val("시험선택");
		$("#examDate").val("");
		$("#createBtn").attr('style','display');
		$("#updateBtn").attr('style','display: none;');
		$("#exampleModal").modal("show");
		
	}

	// 수정 폼
	function change(examInfoName,examwishDate){
		$("#examSelect").val(examInfoName);
		$("#examDate").val(examwishDate);
		$("#createBtn").attr('style','display: none;');
		$("#updateBtn").attr('style','display');
		$("#exampleModal").modal("show");
	}
	
	// 작성 처리(DB)
	function createOk() {
	    var f = document.modalForm;
	   var name = f.examInfoName.value;
	   var date = f.examwishDate.value;
	   
	   var url = "<%=cp%>/mockTest/createdList";
	   var query="Name="+name+"&Date="+date;
	   
	    if(!name || name=='시험선택') {
	        alert("시험을 선택하세요");
	        return;
	    }

	    if(!date) { 
	        alert("응시일을 지정하세요. ");
	        return;
	    }

	    $.ajax({
	      type:"post"
	      ,url:url
	      ,data: query
	      ,dataType:"json"
	      ,success:function(data) {
	         var state=data.state;
	      }
	   });
	   
	    f.submit();
	}

	// 수정 처리(DB)
	function updateOk() {
	    var f = document.modalForm;
	   var name = f.examInfoName.value;
	   var date = f.examwishDate.value;
	   
	   var url = "<%=cp%>/mockTest/updateList";
	   var query = "Name=" + name + "&Date=" + date;

			if (!name || name == '시험선택') {
				alert("시험을 선택하세요");
				return;
			}

			if (!date) {
				alert("응시일을 지정하세요. ");
				return;
			}

			$.ajax({
				type : "post",
				url : url,
				data : query,
				dataType : "json",
				success : function(data) {
					var state = data.state;
				}
			});

			f.submit();
		}
</script>

 <!-- 문제은행 탭 -------------------------------------------------------------------->
<script>
// 통계 처리 함수 - 첫번째
$(function(){
   var url="<%=cp%>/exam/firstChart";
   $.getJSON(url, function (csv) {
      $('#firstChart').highcharts({
    	  colors: ['#eee','#FF5E00','BLUE','#666666'],
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

 <!-- 모의 테스트 새 창 -------------------------------------------------------------------->
<script type="text/javascript">
	function popupLink(popHeight,popWidth){ 
	var winHeight = document.body.clientHeight;   // 현재창의 높이
	var winWidth = document.body.clientWidth;   // 현재창의 너비
	var winX = window.screenX || window.screenLeft || 0;   // 현재창의 x좌표
	var winY = window.screenY || window.screenTop || 0;   // 현재창의 y좌표
	
	var popX = winX + (winWidth - popWidth)/2;
	var popY = winY + (winHeight - popHeight)/2;
	window.open("<%=cp%>/community/exam/examFiles", "popup",
			"width="+ popWidth + "px,height=" + popHeight + "px,top=" + popY+ ",left=" + popX);
	}
</script>

<div style="width: 900px; height: 100%; margin: 60px auto;">
	<div style="height: 50px; font-size: 20px; text-align: center;">
		<span style="font-size: 20px; color: #BDBDBD; font-weight: bold;">
			<span style="font-size: 19px; color: #1abc9c;"
			class="glyphicon glyphicon-pencil"> </span>&nbsp;&nbsp;&nbsp;WOOLTARI&nbsp;&nbsp;&nbsp;
		</span>E X A M
	</div>

		<strong style="font-size: 20px;">
		<span style="color: rgba(183, 183, 183, 0.65); font-size: 20px;"> <i
			class="glyphicon glyphicon-align-left"
			style="color: #1abc9c; margin-bottom: 20px;"></i>&nbsp;&nbsp;${sessionScope.member.userName }
		</span> 님의 응시할 시험 목록입니다.</strong>
		
		
		<span style="font-size: 11px; color: #D9418C;">&nbsp;&nbsp;(최대  <strong style="font-size: 13px;">5</strong> 개까지 등록 가능합니다)</span>

	<form name="array_form" id="array_form" style="width: 900px; border-top: 1px solid #4b4b4b;">
		<div class="settingArea">
			<table style="width: 100%;" cellpadding="0" cellspacing="0"
				border="0">
				<tr>
					<td colspan="2" style="text-align: left;">
						<div
							style="position: absolute; bottom: 10px; right: 1px; top: -22px;">
							<input type="checkbox" id="allCheck" name="allCheck"
								class="checkbox-style" /> <label for="allCheck">전체선택</label>
						</div>
					</td>
				</tr>
			</table>
		</div>

		<table cellpadding="0" cellspacing="0"
			style="width: 100%;
			class="board_table array">
			<c:forEach items="${examwishList }" var="dto" varStatus="status">
				<tbody>
					<tr>
						<td style="text-align: right; width: 65px; padding: 5px 18px;">
							<input type="checkbox" name="nums" value="${dto.num }">
						</td>

						<td class="___number">${dto.wishlistNum}</td>
						<td>
							<div style="position: relative;">

								<a href="#" class="subject"
									style="line-height: 27px; float: left;">${dto.examInfoName }</a>
								<span class="comment" style="line-height: 16px;"> <c:choose>
										<c:when test="${dto.dday eq 0 }">
											<span style="color: red;">D-day ! ! !</span>
										</c:when>
										<c:when test="${dto.dday < 0 }">
											<span style="color: #BDBDBD;">END..</span>
										</c:when>
										<c:otherwise>
                              D-day ${dto.dday }
                           </c:otherwise>
									</c:choose>
								</span>

								<div class="info"
									style="float: left; padding: 0; line-height: 25px; margin-left: 32px; float: left; padding: none;">
									<strong>주최기관: </strong><span>${dto.examInfoOrgan }</span> <span
										class="__dotted"></span> <strong>응시일: </strong><span>${dto.examwishDate }</span>
								</div>
								<div style="float: right; margin: 4px;">

									<c:if test="${status.last}">
										<c:choose>
											<c:when test="${status.count eq 5 }">
												<!-- 리스트 5개가 되면 추가버튼 없애버리기 -->
											</c:when>
											<c:otherwise>
												<!-- 응시할 리스트 추가 -->
												<button id="modalbtn" type="button" onclick="create()"
													class="glyphicon glyphicon-plus">
												</button>
											</c:otherwise>
										</c:choose>
									</c:if>

									<!-- 응시할 리스트 수정 -->
									<button id="modalbtn" type="button"
										onclick="change('${dto.examInfoName}', '${dto.examwishDate}')"
										class="glyphicon glyphicon-edit"></button>
								</div>
							</div>
						</td>
					</tr>
				</tbody>
			</c:forEach>
		</table>
		<c:if test="${empty examwishList }">
			<br>
			<div class="row" style="margin-top: -10px;">
				<div style="text-align: center; width: 900px;" class="col-sm-6">
					<span style="color:#BDBDBD; letter-spacing: 2px;">등록한 시험 목록이 없습니다. <strong style="color: #1abc9c;">
						<button id="modalbtn" type="button" onclick="create()" style="font-size: 20px;">추가버튼</button></strong>을 눌러주세요 </span>
				</div>
			</div>		
			<br><br><br>
		</c:if>
		<c:if test="${!empty examwishList}">
			<div class="btnArea">
				<input type="button" id="deleteListBtn" class="clickbtn"
					onclick="deleteList();" value="삭제"></input>
			</div>
		</c:if>
		<!-- 응시할 시험 리스트 끝 ----------------------------------------------------------------------->
		
		
		
		<!-- 문제  / 응시내역 탭 -->
			<div style="margin-bottom: 5px;">
				<span style="font-size: 20px; color: #1abc9c; font-weight: bolder;">문제은행</span>
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
											<a href="#" class="subject" style="font-size: 15px; font-weight: bold; color: #373737;">정보처리기사</a>
												<span class="comment" style="display: inline-block; padding: 1px 7px 7px 7px; margin-left: 15px;
													color: #1abc9c; font-weight: bold; font-size: 15px; line-height: 8px; vertical-align: middle;">
													[17년 2회차 ]
												</span>
	
											<div class="info">
												<strong>등록일 :</strong>&nbsp;<span class="dateWrap" title="[datetime]">2017-06-19</span>
												<span class="__dotted"></span>
												<strong>주최기관 :</strong>&nbsp;<span>큐넷(Q-net)</span>
											</div>
	
											<div class="likes" style="font-size: 13px; width: 60px;"> 응시하기
												<br>
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
						<div style="margin-bottom: 5px; font-size: 15px; width: 100%; text-align: left; margin-top: 20px;">
							<span style="font-size: 20px; color: #1abc9c; font-weight: bolder;">
								『 2017년 06월 29일 』</span> 을 기준으로 총 합격률은 80%입니다.<br>
							<span style="font-size: 10px; color: red; margin-left: 236px;">(※최초 응시할 때의 응시 정보만 반영됩니다)</span>
						</div>
						<br><br> 
						
						<span style="font-size: 20px; margin-left: 50px;">
							<strong>"응시 수가 많은 시험&nbsp;Best 3"</strong></span> <br><br>
							<!-- 통계 처리하기 -->
							<div style="clear: both; margin-left: 130px;">
								<div id="firstChart" style="width: 300px; height: 500px; float: left; margin: 10px;"></div>
								<div id="secondChart" style="width: 300px; height: 250px; float: left; margin: 66px 10px 30px;"></div>
								<div id="lastChart" style="width: 300px; height: 250px; float: left; margin: 10px;"></div>
							</div> <br><br><br><br>
							
							<table cellpadding="0" cellspacing="0" style="width: 100%;" class="board_table array">
								<tr>
								<td class="___number" style="font-size: 11px; color: #666; text-align: center; font-weight: bold;">11</td>
								<td style="padding: 9px 5px; border-bottom: 1px solid #EEEEEE;">
									<div style="position: relative;">
										<a href="<%=cp%>/help/report/article" class="subject" style="font-size: 15px; font-weight: bold; color: #373737;">정보처리기사</a>
										<span class="comment" style="display: inline-block; padding: 1px 7px 7px 7px; margin-left: 15px; color: #1abc9c;
											font-weight: bold; font-size: 15px; line-height: 8px; vertical-align: middle;">
											[17년 3회차]
										</span>
	
										<div class="info">
											<strong>응시일: &nbsp;&nbsp;</strong>
											<span class="dateWrap" title="[datetime]">2017-06-29</span>
											<span class="__dotted"></span>
											<strong>주최기관:&nbsp;&nbsp;</strong><span>큐넷</span> <span class="__dotted"></span>
											<strong>성적: &nbsp;&nbsp;</strong> <spanstyle="font-size: 20px;">82점</span>&nbsp;
										</div>
										
										<div class="likes" style="line-height: 23px; position: absolute; top: -8px; right: 10px; background: #fff;
											padding: 9px 5px 5px 5px; display: block; width: 45px; height: 41px; text-align: center; font-size: 16px;
											letter-spacing: -1px; color: #666666; font-weight: bold;">
											<br>
											<span class="num" style="color: #1abc9c; font-size: 18px; font-weight: bold; font-family: tahoma;">합격</span>
											<!--[unlikes]-->
										</div>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
					</div>
					<!-- #tab2 -->
					<!-- .tab_container -->
				</div>
				<!-- #container -->
	
	
				<!------------------------------------->
				<div style="width: 900px; margin: 20px auto; text-align: center;">1	2 3</div>
	
				<div class="scArea">
					<select name="where" class="where">
						<option value="subject">시험명</option>
						<option value="subject">주최기관</option>
	
					</select>
					
					<input type="text" name="keyword" class="keyword" placeholder="검색" style="width: 120px;">
					<input type="button" class="submit">
				</div>
			</div>
		</form>

	<!-- -------------------------------------------------------------------------------------------------------------------- -->
	<!-- 모달 -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
	
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="exampleModalLabel">
						<div
							style="height: 50px; font-size: 20px; text-align: center; margin-top: 18px;">
							<span style="font-size: 20px; color: #BDBDBD; font-weight: bold;">
								<span style="font-size: 19px; color: #1abc9c;"
								class="glyphicon glyphicon-pencil"></span>
								&nbsp;&nbsp;&nbsp;WOOLTARI&nbsp;&nbsp;&nbsp;
							</span>E X A M
						</div>
					</h4>
				</div>
	
				<form name="modalForm" method="post" enctype="multipart/form-data">
					<div class="modal-body" style="margin-left: 121px;">
						<div class="form-group"
							style="margin-bottom: 28px; margin-top: 22px;">
							<label for="recipient-name" class="control-label">시험명</label>
							&nbsp;&nbsp; <select id="examSelect" name="examInfoName"
								style="border: 1px solid #D4D4D4">
								<option value="시험선택">시험선택</option>
								<c:forEach var="dto" items="${examinfoList }">
									<option value="${dto.examInfoName}">${dto.examInfoName }</option>
								</c:forEach>
							</select>
	
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label"
								style="margin-right: 8px;">응시일</label>
							<div class="calendar_wrap">
								<input type="Date" name="examwishDate"
									value="${dto.examwishDate }" id="examDate"
									style="margin-top: -15px; height: 26px; border: 1px solid #D4D4D4;" />
							</div>
						</div>
						
					</div>
	
					<div class="modal-footer">
							<button id="createBtn" type="button" class="clickbtn" onclick="createOk();">등록하기</button>
							<button id="updateBtn" type="button" class="clickbtn" onclick="updateOk();">수정완료</button>
							
						<button type="button" class="clickbtn" data-dismiss="modal">닫기</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>