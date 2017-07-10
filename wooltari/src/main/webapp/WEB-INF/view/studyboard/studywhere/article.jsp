<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<script type="text/javascript">
function deleteBoard() {
	
	  var num = "${dto.num}";
	  var page = "${page}";
	  var query = "num="+num+"&page="+page;
	  var url = "<%=cp%>/studyboard/studywhere/delete?" + query;

	  if(confirm("위 자료를 삭제 하시 겠습니까 ? "))
	  	location.href=url;
	   
	<c:if test="${sessionScope.member.userId!='admin' && sessionScope.member.userId!=dto.userId}">
	  alert("게시물을 삭제할 수  없습니다.");
	</c:if>
	}
</script>

<script>
	$(function(){
		listPage(1);
	});

	function listPage(page) {
		var url="<%=cp%>/studyboard/studywhere/listReply";
		var num="${dto.num}";
		
		// text/html
		$.post(url,{num:num, pageNo:page}, function(data){
			$("#listReply").html(data);
		});
	}
</script>

<script>
	//게시물 공감 추가 및 개수
	function sendLikeStudyWhere(num) {
		var msg="게시물에 공감하시겠습니까?";
		if(!confirm(msg)) {
			return;
		}
		var query="num="+num;
		var url="<%=cp%>/studyboard/studywhere/insertLikeStudyWhere";
		
		$.ajax({
			type:"post",
			url:url,
			data:query,
			dataType:"json",
			success:function(data) {
				var state=data.state;
				if(state=="true") {
					var count=data.countLikeStudyWhere;
					$("#countLikeStudyWhere").html(count);
				} else if(state=="false") {
					alert("이미 공감하셨습니다!!");
				} else if(state=="loginFail"){
					location.href="<%=cp%>/member/login";
				}
			}
		,error:function(e) {
			console.log(e.responseText);
		}
	});
}

	function sendReply() {
		var num="${dto.num}";
		var content=$("#replyContent").val().trim();
		if(! content) {
			$("#replyContent").focus();
			return;
		}
		
		// va
		var query="num="+num;
		query+="&content="+encodeURIComponent(content);
		query+="&answer=0";
		
		$.ajax({
			type:"post",
			url:"<%=cp%>/studyboard/studywhere/createdReply",
			data:query,
			dataType:"json",
			success:function(data) {
				var state=data.state;
				$("#replyContent").val("");
				
				if(state=="true") {
					listPage(1);
				} else if(state=="false") {
					alert("댓글을 추가하지 못했습니다");
				} else if(state=="loginFail") {
					location.href="<%=cp%>/member/login";
				}
			}
			,beforeSend : function(e){
				e.setRequestHeader("AJAX",true);
			}
			,error:function(e) {
				if(e.status==403){
					location.href="<%=cp%>/member/login";
					return;
				}
				
				console.log(e.responseText);
			}
		});
	}
	
	function deleteReply(reNum, page) {
		var msg="게시물을 삭제하시겠습니까?";
		if(!confirm(msg)) {
			return;
		}
		
		var url="<%=cp %>/studyboard/studywhere/deleteReply"
		$.post(url, {reNum:reNum, mode:"reply"}, function(data){ 
			listPage(page);
		}, "json");
	} 
</script>
<style>
.dnu{
border: none;
background: none;
}

.clickbtn {
	background-color: white;
	border-style: solid;
	padding: 5px 20px;
	margin-left: 10px;
	font-size:13px;
	border: 1px solid #EAEAEA;
}
.board_table tbody td{
padding: 0;
border: none;
padding-bottom: 2px;
}
#countLikeStudyWhere{
    line-height: 10px;
    font-size: 16px;
    font-weight: bold;
    letter-spacing: -1px;
    text-align: center;
    color: #666666;
    display: block;
    width: 50px;
    height: 20px;
    padding-top: 5px;}
    .board_table{
    border: none;
    }
    .board_table tbody td.read_contArea{
    
    padding: 0;}
    
    .col-md-4{
    text-align: center;
    }
    .infobo{
    font-weight: bold;
    color: #1abc9c;
    }
    .col-md-12{
    text-align: center;
    }
    #board_memo_area{
line-height: normal; 
}
</style>

<div  style=" margin: 60px auto; height:50px; font-size: 20px;text-align: center;">
			<span style="font-size: 20px;color:#BDBDBD; font-weight: bold;">
			<span style="font-size: 19px; color: #1abc9c; " class="glyphicon glyphicon-pencil">
			</span>&nbsp;&nbsp;&nbsp;WOOLTARI&nbsp;&nbsp;&nbsp;</span>W R I T E . . .</div>
<table cellpadding="0" cellspacing="0" id="read_table" class="board_table" style="width: 900px; margin: -45px auto 0;">

	<thead>
		<tr>
			<th class="informations" style="    border-top: 2px solid rgba(56, 54, 53, 0.23);">
				제목 : [${dto.placename}] ${dto.subject } 
				<span class="inforArea">
					<strong>작성일</strong> ${dto.created }
					<span class="__dotted"></span>
					<strong>작성자</strong> ${dto.userId }
					<span class="__dotted"></span>
					<strong>조회수</strong> ${dto.hitCount }
				</span>
			</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td class="read_contArea" style="padding: 15px;">
				<div id="board_memo_area">
					${dto.content }
				</div>
				<div style="background: #eee; width: 100%; padding: 10px;line-height: 25px;">
				<div class="row" >
				 <div class="col-md-4"><span class="infobo"><i class="glyphicon glyphicon-flag"></i>지역 :</span> ${dto.region }</div>
				  <div class="col-md-4"><span class="infobo"><i class="glyphicon glyphicon-time"></i>영업시간 :</span> ${dto.ocTime }</div>
				   <div class="col-md-4"><span class="infobo"><i class="glyphicon glyphicon-phone-alt"></i> 전화번호 :</span> ${dto.tel }</div>
				  
					</div>
					<div class="row">
				 <div class="col-md-12"><span class="infobo"><i class="glyphicon glyphicon-map-marker"></i>주소 :</span> ${dto.address }</div>
					</div>
					</div>
					<ul class="_read_likesArea" style="margin-top:20px; margin-bottom:0;padding-bottom: 10px;">
						<li class="_likes_btn">
							<div title="" id="countLikeStudyWhere"  style="height: 20px;">
								${countLikeBoard }<br/>
							</div>
								<span class="__count" style="cursor:pointer; color: #1abc9c;font-size: 18px;" onclick="sendLikeStudyWhere('${dto.num}');">
								<strong>추천</strong></span>
						</li>
						
					</ul>
				

				</td>
			
					<tr style=" border-top: 1px solid #eee;">
						<td style="padding-top: 6px;"><strong>이전글 :
						<c:if test="${not empty preReadDto }">
			       		<a href="<%=cp%>/studyboard/studywhere/article?${query }&num=${preReadDto.num}">${preReadDto.subject }</a>
			       </c:if>
						</strong></td>
					</tr>
		
					<tr>
					<td>
						<strong>다음글 :
					<c:if test="${not empty nextReadDto }">
						<a href="<%=cp%>/studyboard/studywhere/article?${query }&num=${nextReadDto.num}">${nextReadDto.subject }</a>
					</c:if>
						</strong></td>
					</tr>
		
					
				
				
				<tr class="fileBox">
					
					<td>
						 
					<c:if test="${not empty dto.imageFileName }">
						<a href="<%=cp%>/studyboard/studywhere/download?num=${dto.num}">${dto.imageFileName }</a>
			       </c:if>
					</td>
				</tr>
					</table>
					
				<table style="width: 900px; margin: 0px auto 20px; border-spacing: 0px;">
			<tr height="45" style="    border-top: 1px solid #eee;">
			    <td width="300" align="left">
			    	<c:if test="${sessionScope.member.userId==dto.userId }">
			          <button type="button" class="clickbtn" onclick="javascript:location.href='<%=cp%>/studyboard/studywhere/update?num=${dto.num}&page=${page}';" 
			          style="margin-left: 0;">수정</button>
			    	</c:if>
			    	<c:if test="${sessionScope.member.userId==dto.userId || sessionScope.member.userId=='admin'}">
			          <button type="button" class="clickbtn" onclick="deleteBoard(${dto.num});" style="    margin-left: 5px;">삭제</button> 
			    	</c:if>
			    </td>
			
			    <td align="right">
			        <button type="button" class="clickbtn" onclick="javascript:location.href='<%=cp%>/studyboard/studywhere/list?${query }';">리스트</button>
			    </td>
			</tr>
				
		
				
			
		
		
            <tr height='30' style="width: 900px; margin: 0 auto;"> 
	            <td align='left' colspan="2" style="    padding-top: 41px;">
	            	<span style='font-weight: bold; color: #1abc9c;' >댓글쓰기</span><span> - 타인을 비방하거나 개인정보를 유출하는 글의 게시를 삼가 주세요.</span>
	            </td>
            </tr>
            <tr>
               <td style='padding:5px 5px 0px;' colspan="2">
                    <textarea id='replyContent' class='boxTA' style='width:99%; height: 70px;'></textarea>
                </td>
            </tr>
            <tr>
               <td align='right' colspan="2">
                    <button type='button' class='clickbtn' style="padding:10px 20px;     border: none;" onclick='sendReply();'>댓글 등록</button>
                </td>
            </tr>
            
	</tbody>
			</table>
	

            <div id="listReply"></div>
