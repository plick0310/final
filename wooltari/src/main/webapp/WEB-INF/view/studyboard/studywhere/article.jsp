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
</style>

<div  style=" margin: 60px auto; height:50px; font-size: 20px;text-align: center;">
			<span style="font-size: 20px;color:#BDBDBD; font-weight: bold;">
			<span style="font-size: 19px; color: #1abc9c; " class="glyphicon glyphicon-pencil">
			</span>&nbsp;&nbsp;&nbsp;WOOLTARI&nbsp;&nbsp;&nbsp;</span>W R I T E . . .</div>
<table cellpadding="0" cellspacing="0" id="read_table" class="board_table" style="width: 900px; margin: -45px auto 0;">

	<thead>
		<tr>
			<th class="informations">
				${dto.subject }
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
			<td class="read_contArea">
				<div id="board_memo_area">
					${dto.content }
				</div>
		
				
					
					<ul class="_read_likesArea" style="border-bottom: 1px solid #eee;">
						<li class="_likes_btn">
							<a href="#" title="" id="countLikeStudyWhere" >
								${countLikeBoard }<br/>
							</a>
								<span class="__count" style="color: #1abc9c;font-size: 18px;" onclick="sendLikeStudyWhere('${dto.num}');">추천</span>
						</li>
						
					</ul>
				
<!-- 				<tr> -->
<!-- 				<td> 이전글</td> -->
<!-- 				</tr> -->
				
<!-- 				<tr> -->
<!-- 				<td>다음글</td> -->
<!-- 				</tr> -->
				<ul>
					
					<li>
						<strong>이전글 :
						<c:if test="${not empty preReadDto }">
			       		<a href="<%=cp%>/studyboard/studywhere/article?${query }&num=${preReadDto.num}">${preReadDto.subject }</a>
			       </c:if>
						</strong>
					</li>
		
					
					
				</ul>
				<ul>
					
					<li>
						<strong>다음글 :
					<c:if test="${not empty nextReadDto }">
						<a href="<%=cp%>/studyboard/studywhere/article?${query }&num=${nextReadDto.num}">${nextReadDto.subject }</a>
					</c:if>
						</strong>
					</li>
		
					
					
				</ul>
				
				<ul class="fileBox">
					
					<li>
						<strong>첨부파일</strong>  
					<c:if test="${not empty dto.imageFileName }">
						<a href="<%=cp%>/studyboard/studywhere/download?num=${dto.num}">${dto.imageFileName }</a>
			       </c:if>
					</li>
		
					
					
				</ul>
				<table style="width: 100%; margin: 0px auto 20px; border-spacing: 0px;">
			<tr height="45">
			    <td width="300" align="left">
			    	<c:if test="${sessionScope.member.userId==dto.userId }">
			          <button type="button" class="btn" onclick="updateBoard();">수정</button>
			    	</c:if>
			    	<c:if test="${sessionScope.member.userId==dto.userId || sessionScope.member.userId=='admin'}">
			          <button type="button" class="btn" onclick="deleteBoard(${dto.num});">삭제</button> 
			    	</c:if>
			    </td>
			
			    <td align="right">
			        <button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/studyboard/studywhere/list?${query }';">리스트</button>
			    </td>
			</tr>
			</table>
				
		
				
			</td>
		</tr>
		
            <tr height='30' style="width: 900px; margin: 0 auto;"> 
	            <td align='left'>
	            	<span style='font-weight: bold;' >댓글쓰기</span><span> - 타인을 비방하거나 개인정보를 유출하는 글의 게시를 삼가 주세요.</span>
	            </td>
            </tr>
            <tr>
               <td style='padding:5px 5px 0px;'>
                    <textarea id='replyContent' class='boxTA' style='width:99%; height: 70px;'></textarea>
                </td>
            </tr>
            <tr>
               <td align='right'>
                    <button type='button' class='btn' style='padding:10px 20px;' onclick='sendReply();'>댓글 등록</button>
                </td>
            </tr>
            
	</tbody>
	
</table>	
<div class="read_btnArea">

</div>
            <div id="listReply"></div>
