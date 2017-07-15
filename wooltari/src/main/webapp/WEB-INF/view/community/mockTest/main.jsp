<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC"-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%
   String cp = request.getContextPath();
%>
<link rel="stylesheet" href="<%=cp%>/resource/css/mock.css" />

<style>
 .footer {
 	clear: both;
 }
 
 .pagination > .active > a, .pagination > .active > span, .pagination > .active > a:hover, .pagination > .active > span:hover, .pagination > .active > a:focus, .pagination > .active > span:focus {
    z-index: 2;
    color: #fff;
    cursor: default;
    background-color: #1abc9c;
}

.pagination-sm > li > a, .pagination-sm > li > span {
    padding: 8px 9px;
    
    font-size: 11px;
}
.pagination > li > a, .pagination > li > span {
    position: relative;
    float: left;
    padding: 6px 12px;
    margin-left: -1px;
    line-height: 1.42857143;
    color: #1abc9c;
    text-decoration: none;
    background-color: #fff;
  border: none;
}
 .scArea {
 	margin-bottom: -28px;
 }
	ui.tab_menu {
		margin:0;
		padding:0;
		float:left;
		list-style:none;
		height:32px;
		border-left:1px solid #eee;
		width:900px;
		font-family: "dotum";
		font-size: 12px;
 }
	 .tab_menu li {
 	padding: 5px 18px;
 	border: 1px solid #eeeeee;
 	border-bottom: none;
 }
 
  .tab_menu li a:active{
  	color: #1abc9c;
  }
</style>
 
 <!-- 먼저 실행되야 할 것들 -->
<script type="text/javascript">
$(document).ready(function() {
    //최상단 체크박스 클릭

    $("#allCheck").click(function() {
       //클릭되었으면
       if ($("#allCheck").prop("checked")) {
          //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
          $("input[name=nums]").prop("checked", true);
          //클릭이 안되있으면
       } else {
          //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
          $("input[name=nums]").prop("checked", false);
       }
    });

 });

$(function(){
		var $tab = $(".tab_menu .active");
		var tab = $tab.attr("data-tab");
		var url = "<%=cp%>/mockTest/"+tab;

		$("#exam a").css("color", "#1abc9c");
		$("#challengeList").css("background-color", "#eeeeee");
		$("#examSearch").attr({
			style : 'margin-top:0; float:right;'
		});
		
        $.ajax({
            dataType:"html"
            ,url:url
            ,success : function(data) {
               $('.tab_cont').html(data);
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
	   var query="name="+name+"&date="+date;
	    
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
	    	 $("#exampleModal").modal("hide");
	         var state=data.state;
	         location.href="<%=cp%>/mockTest/main";
	      }
	   });
	}

	// 수정 처리(DB)
	function updateOk(num) {
	   var f = document.modalForm;
	   
	   var name = f.examInfoName.value;
	   var date = f.examwishDate.value;
	   
	   var url = "<%=cp%>/mockTest/updateList";
	   var query = "name=" + name + "&date=" + date;

			if (!name || name == '시험선택') {
				alert("시험을 선택하세요");
				return;
			}

			if (!date) {
				alert("응시일을 지정하세요.");
				return;
			}
			$.ajax({
				type : "post",
				url : url,
				data : query,
				dataType : "json",
				success : function(data) {
					$("#exampleModal").modal("hide");
					var state = data.state;
					location.href="<%=cp%>/mockTest/main";
				}
			});
		}
</script>

 <!-- 문제은행 탭 -------------------------------------------------------------------->
<script>
$(function(){
	$('.tab_menu li').on('click', 'a', function(){
        $('.tab_menu li').each(function(index){
            $(this).removeClass("active").css("background-color", "#eeeeee");
      		 $(".tab_menu a").removeClass("active").css("color", "black");
        });
            
      		$(this).addClass("active").css("color", "#1abc9c");
      		//$(".tab_cont").hide();
            var activeTab = $(this).attr("data-tab");
            $("#" + activeTab).fadeIn();
        	 
         	 $(this).parent().addClass("active").css("background-color","white");
        
            $tab = $(".tab_menu .active");
            tab = $tab.attr("data-tab");           
    		url = "<%=cp%>/mockTest/"+tab;
    		 
        $.ajax({
           dataType:"html"
           ,url:"<%=cp%>/mockTest/"+tab
           ,success : function(data) {
              $('.tab_cont').html(data);
      		if(tab != 'exam') {
    			$("#examSearch").attr({
    				style : 'display:none;'
    				
    			});
    		} else if(tab == 'exam') {
    			$("#examSearch").attr({
    				style : 'margin-top:0; float:right;'
    			});
    		}
           }
        });
     }); 
});	 
	function popupLink(popHeight,popWidth){ 
	var winHeight = document.body.clientHeight;   // 현재창의 높이
	var winWidth = document.body.clientWidth;   // 현재창의 너비
	var winX = window.screenX || window.screenLeft || 0;   // 현재창의 x좌표
	var winY = window.screenY || window.screenTop || 0;   // 현재창의 y좌표
	
	var popX = winX + (winWidth - popWidth)/2;
	var popY = winY + (winHeight - popHeight)/2;
	window.open("<%=cp%>/mockTest/mockExam", "popup",
			"width="+ popWidth + "px,height=" + popHeight + "px,top=" + popY+ ",left=" + popX);
	}
</script>


<!-- 음.. 임시 -->
<script>
function listPage(page) {
	var $tab = $(".tabs .active");
	var tab = $tab.attr("data-tab");
	var url="<%=cp%>/mockTest/exam";
	
	var query="pageNo="+page;
	var search=$('form[name=mockTestSearchForm]').serialize();
	query=query+"&"+search;
	
	ajaxHTML(url, "get", query);
}

function ajaxHTML(url, type, query) {
	$.ajax({
		type:type
		,url:url
		,data:query
		,success:function(data) {
			if($.trim(data)=="error") {
				listPage(1);
				return;
			}
			$(".tab_cont").html(data);
		}
	});
}

function searchList() {
	var f=document.mockTestSearchForm;
	f.searchKey.value=$("#searchKey").val();
	f.searchValue.value=$.trim($("#searchValue").val());

	listPage(1);
}
</script>

<!--
<script>
var startDate = new Date();
updateTime();

function updateTime() {
		var now = new Date();
		var t = now.getTime() - startDate.getTime();
		var s = Math.round(t/1000);

		min.innerHTML = Math.floor(s/60);
		sec.innerHTML = s%60;
		setTimeout("updateTime()",500);
	}
</script>
-->

<div style="width: 900px; height: 100%; margin: 60px auto;">
	<div style="height: 50px; font-size: 20px; text-align: center;">
		<span style="font-size: 20px; color: #BDBDBD; font-weight: bold;">
			<span style="font-size: 19px; color: #1abc9c;"
			class="glyphicon glyphicon-pencil"> </span>&nbsp;&nbsp;&nbsp;WOOLTARI&nbsp;&nbsp;&nbsp;
		</span>E X A M
	</div>

		<strong style="font-size: 20px;">
		<span style="color: rgba(183, 183, 183, 0.65); font-size: 20px;"> 
		<i class="glyphicon glyphicon-align-left"
			style="color: #1abc9c; margin-bottom: 20px;"></i>&nbsp;&nbsp;${sessionScope.member.userName }
		</span>님의 응시할 시험 목록입니다.</strong>
		
		
		<span style="font-size: 11px; color: #D9418C;">&nbsp;&nbsp;(최대  <strong style="font-size: 13px;">5</strong> 개까지 등록 가능합니다)</span>

	<form name="array_form" id="array_form" style="width: 900px; border-top: 1px solid #4b4b4b;">
		<div class="settingArea">
			<table style="width: 100%;" cellpadding="0" cellspacing="0"
				border="0">
				<tr>
					<td colspan="2" style="text-align: left;">
						<div style="position: absolute; bottom: 10px; right: 1px; top: -22px;">
							<input type="checkbox" id="allCheck" name="allCheck" class="checkbox-style" />
							<label for="allCheck">전체선택</label>
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
									style="padding-left: 10px; line-height: 27px; float: left;">${dto.examInfoName }</a>
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
									style="float: left; padding: 0; line-height: 25px; margin-left: 32px; float: left; padding: ;">
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
												<button id="modalbtn" type="button" onclick="create()" class="glyphicon glyphicon-plus">
												</button>
											</c:otherwise>
										</c:choose>
									</c:if>

									<!-- 응시할 리스트 수정 -->
									
									<button id="modalbtn" type="button" onclick="change('${dto.examInfoName}', '${dto.examwishDate}')"
										class="glyphicon glyphicon-edit">
									</button>
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
	</form>		
	
		<!-- 문제  / 응시내역 탭 -->
			<div style="margin-bottom: 5px;">
				<span style="font-size: 20px; color: #1abc9c; font-weight: bolder;">문제은행</span>
			</div>
			
		<!--  검색: '시험' 탭만 사용 가능. -->
		<form name="searchForm" action="" method="post">
			<div id="examSearch" class="scArea" style="margin-top:0;float:right;"> 
				<label class="sr-only" for="exampleInputAmount">Amount (in dollars)</label>
					<div class="input-group" style="width: 151px;">
						<input type="hidden" id="searchKey" name="searchKey" value="examInfoName" />
						<input type="text" class="form-control" name="searchValue" id="searchValue" placeholder="시험명으로 검색" 
							style="height:28px; border:1px solid gray; border-right:none; padding-right: 0; padding-left: 3px; border-radius: 0;"/>
						<div class="input-group-addon" style="background:none; border:1px solid gray; border-left:none;
							cursor: pointer;padding-left: 1px; padding-right: 5px; border-radius: 0;" onclick="searchList();">
							<i class="fa fa-search"></i>
						</div>
					</div>
				</div> 
         </form>			
         
	<form name="array_form" id="array_form" style="width: 900px;">
			<div id="wrap">
				<div id="box">
					<div style="width: 100%;float: left;margin: 0px auto;">
						<ul class="tab_menu">
			               <li class="active" id="exam" style="border-right:none; float:left;" data-tab="exam"><a href="#">문 제</a></li>
			               <li id="challengeList" style="border-right:none; float:left;" data-tab="challengeList"><a href="#">응시내역</a></li>
						</ul>
						
						<div class="tab_cont"></div>
					</div>
				</div>
			</div>	
		</form>
			<form name="mockTestSearchForm" action="" method="post">
			    <input type="hidden" name="searchKey" value="examInfoName"/>
			    <input type="hidden" name="searchValue" value=""/>
			</form>
<!-- 	
			<div class="tab_container">
				<div id="tab1" class="tab_content">
				</div>
					
				<div id="tab2" class="tab_content">
				</div>
			</div>
 -->

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
							style="margin-bottom: 15px; margin-top: 22px;">
							<label for="recipient-name" class="control-label">시험명</label>
							&nbsp;&nbsp; <select id="examSelect" name="examInfoName"
								style="border: 1px solid #D4D4D4; padding-bottom: 3px; padding-top: 1px;">
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