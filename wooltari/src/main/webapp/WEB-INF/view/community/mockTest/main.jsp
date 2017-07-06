<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC"-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%
   String cp = request.getContextPath();
%>
<link rel="stylesheet" href="<%=cp%>/resource/css/mock.css"/>
<style>

</style>

<script>
$(document).ready(function(){
    //최상단 체크박스 클릭
  
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

$('#exampleModal').on('show.bs.modal', function (event) {
     var button = $(event.relatedTarget) // Button that triggered the modal
     var recipient = button.data('whatever') // Extract info from data-* attributes
     var modal = $(this)
     modal.find('.modal-title').text('New message to ' + recipient)
     modal.find('.modal-body input').val(recipient)
   });

</script>
<script>
function updateScore(num) {
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

    	var str = f.examInfoName.value;
    	var st= f.examwishDate.value;
 
        if(!str || str=='시험선택') {
            alert("시험을 선택하세요");
            return;
        }

        if(!str) {
            alert("응시일을 지정하세요. ");
            return;
        }

    	var url = "<%=cp%>/mockTest/createdList";
    	var query="Name="+str+"&Date="+st;
    	
    	$.ajax({
    		type:"post"
    		,url:url
    		,data: query
    		,dataType:"json"
    		,success:function(data) {
    			var state=data.state;
                if(state=="false")
                    alert("게시물을 추가(수정)하지 못했습니다. !!!");
				if(mode=="created" || mode=="reply") {
            		reloadBoard()
            	} else {
            		listPage(page);
            	}
    		}
    		
    	});
    	
    	
    	
    }
</script>
<script type="text/javascript">
	$(function(){
		$("#tab-test").addClass("active");
		listPage(1);
		
		$("ul.tabs li").click(function(){
			tab = $(this).attr("data-tab");
			
			$("ul.tabs li").each(function(){
				$(this).removeClass("active")
			});
			$("#tab-"+tab).addClass("active");
			
			listPage(1);
		});
	});

	// 글 리스트 및 페이징 처리
	function listPage(page) {
		var $tab = $(".tabs .active");
		var tab = $tab.attr("data-tab");
		var url="<%=cp%>/mockTest/"+tab+"/list";
		
		var query="pageNo="+page;
		var search=$('form[name=packTestSearchForm]').serialize();
		query=query+"$"+search;
		
		ajaxHTML(url,"get",query);
	}
	
	// 글리스트 및 글쓰기폼, 글보기, 글수정폼 ajax
	function ajaxHTML(url, type, query) {
		$.ajax({
			type : type
			,url : url
			,data : query
			,success:function(data) {
				if($.trim(data)=="error") {
					listPage(1);
					return;
				}
				$("#tab-content").html(data);
			}
			,beforeSend : function(jqXHR) {
				jqXHR.setRequestHeader("AJAX",true);
			}
			,error : function(jqXHR) {
				if(jqXHR.status == 401) {
					console.log(jqXHR);
				} else if (jqXHR.status == 403) {
					location.href="<%=cp%>/member/login";
				} else {
					console.log(jqXHR.responseText);
				}
			}
		});
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
             
             ${sessionScope.member.userName }
             
             &nbsp;&nbsp;</span>님의 응시할 시험 목록입니다.
   </div>

   <form name="array_form" id="array_form" style="width: 900px;">
      <div class="settingArea">
         <table style="width: 100%;" cellpadding="0" cellspacing="0" border="0">
            <tr>
               <td colspan="2" style="text-align: left;">
                  <div style="position: absolute;bottom: 10px;right: 1px;top: -22px;">
                     <input type="checkbox" id="allCheck" name="allCheck"class="checkbox-style" />
                     <label for="allCheck">전체선택</label>
                  </div>
               </td>
            </tr>
         </table>
      </div>

      <table cellpadding="0" cellspacing="0" style="width: 100%; border-top: 1px solid #4b4b4b;" class="board_table array">
		<c:forEach var="dto" items="${examwishList }">
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
                     <span class="comment" style="line-height: 16px;"> 
                     	<c:choose>
                     		<c:when test="${dto.dday eq 0 }">
                     			<span style="color: red;">D-day ! ! !</span>
                     		</c:when>
                     		<c:otherwise>
                     			D-day ${dto.dday }
                     		</c:otherwise>
                     	</c:choose>
                     </span>

                     <div class="info"
                        style="float: left; padding: 0; line-height: 25px; margin-left: 32px; float: left; padding: none;">
                        <strong>주최기관: </strong><span>${dto.examInfoOrgan }</span>
                        <span class="__dotted"></span>
                        <strong>응시일: </strong><span>${dto.examwishDate }</span>
                     </div>
                     <div style="float: right; margin: 4px;">
                        <button id="modalbtn" type="button"
                           class="glyphicon glyphicon-plus" data-toggle="modal"
                           data-target="#exampleModal" data-whatever="@mdo" value="regist"></button>
                        <button id="modalbtn" type="button"
                           class="glyphicon glyphicon-edit" data-toggle="modal"
                           data-target="#exampleModal" data-whatever="@mdo" value="change"></button>
                     </div>
                  </div>
               </td>
            </tr>
         </tbody>
      </c:forEach>
    </table>
      
      
      <div class="btnArea">
         <input type="button" id="deleteListBtn" class="clickbtn" onclick="deleteList();" value="삭제"></input>
      </div>
      
      <div style="margin-bottom: 5px;">
         <span style="font-size: 20px; color: #1abc9c; font-weight: bolder;">문제은행</span>
      </div>
      
      <div>
	   	<div id="tabwrap" style="width: 900px; margin: 0px auto;">
			<ul class="tabs">
				<li id="tab-test" data-tab="test">문제</li>
				<li id="tab-myList" data-tab="myList">응시내역</li>
			</ul>
		</div>
		<div id="tab-content" style="clear: both; padding: 20px 10px 0px;"></div>
      </div>
   </form>
</div>  
      <form name="mockSearchForm" action="" method="post">
      	<input type="hidden" name="searchKey" value="subject">
      	<input type="hidden" name="searchValue" value="">
      </form>
      
<!-- -------------------------------------------------------------------------------------------------------------------- -->      
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
                        <span style="font-size: 20px; color: #BDBDBD; font-weight: bold;">
                           <span style="font-size: 19px; color: #1abc9c;" class="glyphicon glyphicon-pencil"></span>
                           &nbsp;&nbsp;&nbsp;WOOLTARI&nbsp;&nbsp;&nbsp;
                        </span>E X A M
                     </div>
                  </h4>
               </div>
               
               <form name="modalForm" method="post" enctype="multipart/form-data">
	               <div class="modal-body">
	                     <div class="form-group" style="margin-bottom: 28px; margin-top: 22px;">
	                        <label for="recipient-name" class="control-label">시험명</label>
	                        &nbsp;&nbsp; 
	                        
                        	<select id="examSelect" name="examInfoName" style="border: 1px solid #D4D4D4">
                        		<option value="시험선택">시험선택</option>
	                       		<c:forEach var="dto" items = "${examinfoList }">
	                       			<option value="${dto.examInfoName}">${dto.examInfoName }</option>
	                       		</c:forEach>
	                       	</select>
	
	                     </div>
	                     <div class="form-group">
	                        <label for="message-text" class="control-label"
	                           style="margin-right: 8px;">응시일</label>
	                            <div class="calendar_wrap">
									<input type="date" name="examwishDate" value="${dto.examwishDate }"
										style="margin-top: -15px; height: 26px; border: 1px solid #D4D4D4;"/>
	                        	</div>
	                     </div>
	               </div>
	               <div class="modal-footer">
	
	                  <button type="button" class="clickbtn" onclick="sendOk();">${mode=='update'?'수정완료':'등록하기' }</button>
	                  <button type="button" class="clickbtn" data-dismiss="modal">닫기</button>
	
	               </div>
   				</form>
	          </div>
	       </div>
		</div>
		
		
