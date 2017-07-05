<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<style>
.dnu{
border: none;
background: none;
}
</style>
<script type="text/javascript">
function deleteBoard(){
<c:if test="${sessionScope.member.userId=='admin'||sessionScope.member.userId==dto.userId}">
	var num="${dto.num}";
	var page="${page}";
	var query="num="+num+"&page="+page;
	var url="<%=cp%>/download/infoReqBoard/delete?"+query;
	
	if(confirm("위 자료를 삭제 하시 겠습니까 ? "))
	  	location.href=url;
</c:if>    
<c:if test="${sessionScope.member.userId!='admin' && sessionScope.member.userId!=dto.userId}">
 alert("게시물을 삭제할 수  없습니다.");
</c:if>
}



function updateBoard(){
<c:if test="${sessionScope.member.userId==dto.userId}">
	var num="${dto.num}";
	var page = "${page}";
	var query="num="+num+"&page="+page;
	var url = "<%=cp%>/download/infoReqBoard/update?"+query;
	
	location.href=url;	
</c:if>
<c:if test="${sessionScope.member.userId!=dto.userId}">
	alert("게시물을 수정할 수 없습니다.");
</c:if>
}
</script>
<script type="text/javascript">
//게시물 공감 개수
function countLikeBoard(num){
	var url="<%=cp%>/download/infoReqBoard/countLikeBoard";
	$.post(url,{num:num},function(data){
		var count=data.countLikeBoard;
		
		$("#countLikeBoard").html(count);		
	},"json");	
}

//게시물 공감 추가
function sendLikeBoard(num){
	
	var uid="${sessionScope.member.userId}";
	if(!uid){
		login();
		return;
	}
	
	msg="게시물에 공감하십니까?";
	if(!confirm(msg))
		return;
	
	var query="num="+num;
	
	$.ajax({
		type:"post"
		,url:"<%=cp%>/download/infoReqBoard/insertLikeBoard"
		,data:query
		,dataType:"json"
		,success:function(data){
			var state=data.state;
			if(state=="true"){
				countLikeBoard(num);				
			}else if(state=="false"){
				alert("좋아요는 한번만 가능합니다.!!!");
			}else if(state=="loginFail"){
				login();
			}
		}
		,error:function(e){
			console.log(e.responseText);
		}
	});
	
}

//-------------------------------------
//댓글
function login() {
	location.href="<%=cp%>/member/login";
}

//댓글 리스트
$(function(){
	listPage(1);
});

function listPage(page){
	var url="<%=cp%>/download/infoReqBoard/listReply";
	var num="${dto.num}";
	$.post(url, {num:num, pageNo:page}, function(data){
		$("#listReply").html(data);
	});
}

//댓글 추가
function sendReply(){
	var uid="${sessionScope.member.userId}";
	if(!uid){
		login();
		return false;
	}
	var num="${dto.num}";//해당 게시물 번호
	var content =$.trim($("#content").val());
	if(! content ){
		alert("내용을 입력하세요!!!");
		$("content").focus();
		return false;
	}
	
	var query="num="+num;
	query+="&content="+encodeURIComponent(content);
	
	$.ajax({
		type:"post"
		,url:"<%=cp%>/download/infoReqBoard/createdReply"
		,data:query
		,dataType:"json"
		,success:function(data){
			$("#content").val("");
			
			var state = data.state;
			if(state=="true"){
				listPage(1);
			}else if(state=="false"){
				alert("댓글을 등록하지 못했습니다.!!!");
			}else if(state=="loginFail"){
				login();
			}
		}
		,error:function(e){
			console.log(e.responseText)
		}
	});
	
}

//댓글 삭제
function deleteReply(replyNum, page){
	var uid="${sessionScope.member.userId}";
	if(!uid){
		login();
		return false;
	}
	
	if(confirm("게시물을 삭제하시겠습니까?")){
		var url="<%=cp%>/download/infoReqBoard/deleteReply"
		$.post(url, {replyNum:replyNum, mode:"reply"}, function(data){
			var state=data.state;
			
			if(state=="loginFail"){
				login();
			}else{
				listPage(page);
			}			
		},"json");		
	}	
}
</script>


<div  style=" margin: 60px auto; height:50px; font-size: 20px;text-align: center;">
			<span style="font-size: 20px;color:#BDBDBD; font-weight: bold;">
			<span style="font-size: 19px; color: #1abc9c; " class="glyphicon glyphicon-pencil">
			</span>&nbsp;&nbsp;&nbsp;WOOLTARI&nbsp;&nbsp;&nbsp;</span>W R I T E . . .</div>
<table cellpadding="0" cellspacing="0" id="read_table" class="board_table" style="width: 900px; margin: -45px auto 0;">

	<thead>
		<tr>
			<th class="informations">
				${dto.subject}
				<span class="inforArea">
					<strong>작성일</strong> ${dto.created}
					<span class="__dotted"></span>
					<strong>작성자</strong> ${dto.userId}
					<span class="__dotted"></span>
					<strong>조회수</strong> ${dto.hitCount}
				</span>
			</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td class="read_contArea">
				<div id="board_memo_area">
					${dto.content}
				</div>
		
				
					<ul class="_read_likesArea" style="border-bottom: 1px solid #eee;">
						<li class="_likes_btn" >
							<a href="javascript:sendLikeBoard('${dto.num}');" title="" >
								<span id="countLikeBoard">${countLikeBoard}<br/></span>
								<span class="__count" style="color: #1abc9c;" >추천</span>
							</a>
						</li>						
					</ul>				
				<ul>
					<li>
					<strong>첨부파일 :<br> </strong>
				<c:forEach var="dto" items="${listFile}">	
					  <a href="<%=cp%>/download/infoReqBoard/download?fileNum=${dto.fileNum}">${dto.originalFilename}<span class="glyphicon glyphicon-download-alt"></span><br></a>
				</c:forEach>	 
					</li>					
					<li>
						<strong>이전글 :</strong>
						<c:if test="${not empty preReadDto }">
                            <a href="<%=cp%>/download/infoReqBoard/article?${query}&num=${preReadDto.num}">${preReadDto.subject}</a>
                        </c:if>						
					</li>
				</ul>
				<ul>
					<li>
						<strong>다음글 :</strong>
						<c:if test="${not empty nextReadDto }">
                            <a href="<%=cp%>/download/infoReqBoard/article?${query}&num=${nextReadDto.num}">${nextReadDto.subject}</a>
                        </c:if>	
					</li>
					<li>
					<div style="float: right;">
		<c:if test="${sessionScope.member.userId==dto.userId}">
					
           		    <button type="button" class="" onclick="updateBoard();">수정</button>
		</c:if>
		<c:if test="${sessionScope.member.userId==dto.userId || sessionScope.member.userId=='admin'}">
           		    <button type="button" class="" onclick="deleteBoard();">삭제</button>
        </c:if>   		    
					</div>
					</li>
					
				</ul>
				<%-- <c:forEach var="dto" items="${listFile}">
				<ul class="fileBox">					
					<li>
						<strong>첨부파일</strong><a>${dto.originalFilename}</a>
					</li>		
				</ul>
				</c:forEach> --%>
		<div class="bbs-reply">
           <div class="bbs-reply-write">
               <div style="clear: both;">
           	       <div style="float: left;"><span style="font-weight: bold;">댓글쓰기</span><span> - 타인을 비방하거나 개인정보를 유출하는 글의 게시를 삼가 주세요.</span></div>
           	       <div style="float: right; text-align: right;"></div>
               </div>
               <div style="clear: both; padding-top: 10px;">
                   <textarea id="content" class="form-control" rows="3"></textarea>
               </div>
               <div style="text-align: right; padding-top: 10px;">
                   <button type="button" class="btn btn-primary btn-sm" onclick="sendReply();"> 댓글등록 <span class="glyphicon glyphicon-ok"></span></button>
               </div>           
           </div>
       
           <div id="listReply"></div>
       </div>
			</td>
		</tr>
				
	</tbody>
</table>	
