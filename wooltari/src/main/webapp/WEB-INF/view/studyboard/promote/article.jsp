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
function login() {
	location.href="<%=cp%>/main";
}


function deleteBoard(){
<c:if test="${sessionScope.member.userId=='admin'||sessionScope.member.userId==dto.userId}">	
	var num="${dto.num}";
	var page="${page}";
	var query="num="+num+"&page="+page;
	var url="<%=cp%>/promote/delete?"+query;
	
	
	if(confirm("글을 삭제하시겠습니까?"))
		location.href=url;
</c:if>

<c:if test="${sessionScope.member.userId!='admin'&&sessionScope.member.userId!=dto.userId}">	
	alert("게시물을 삭제할 수 없습니다.");
</c:if>
	
}

$(function(){
	listPage(1);
});

//댓글리스트
function listPage(page) {
	var url="<%=cp%>/promote/listReply";
	var num="${dto.num}";
	$.post(url, {num:num, pageNo:page}, function(data){
		$("#listReply").html(data);
	});
	
}

//댓글추가
function insertReply(){
	var userId="${sessionScope.member.userId}";
	if(! userId) {
		login();
		return false;
	}
	
	
	var num="${dto.num}";
	var content=$.trim($("#replyContent").val());
	if(! content ) {
		alert("내용을 입력하세요");
		$("#content").focus();
		return false;
	}
	var query="num="+num+"&content="+encodeURIComponent(content);
	
	$.ajax({
		type:"post"
		,url:"<%=cp%>/promote/insertReply"
		,data:query
		,dataType:"json"
		,success:function(data){
			$("#replyContent").val("");
			var state=data.state;
			
			if(state=="true"){
				listPage(1);
			}else if(state=="false"){
				alert("댓글 등록에 실패하였습니다")
			}else if(state=="loginFail"){
				login();
			}
		}
		,error:function(e){
			console.log(e.responseText);
		}
			
		
		
	});
	
}

//댓글삭제
function deleteReply(prNum,pageNo){
	
	if(!confirm("삭제하시겠습니까?")){
		return;
	}
	
	var query="prNum="+prNum+"&page="+pageNo;
	$.ajax({
		type:"post"
		,url:"<%=cp%>/promote/deleteReply"
		,data:query
		,dataType:"json"
		 ,success:function(data){
			
			 var state=data.state;
			
			if( state=="true"){
				listPage(pageNo);
			}else if(state=="false"){
				alert("삭제에 실패하였습니다.")
			}else if(state=="loginFail"){
				alert("로그인하세요");
				location.href="<%=cp%>/main";
			}
			
		}
		,error:function(e){
			console.log(e.responseText);
		}
	});
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
				${dto.subject }
				<span class="inforArea">
					<strong>작성일</strong> [${dto.created }]
					<span class="__dotted"></span>
					<strong>작성자</strong> [${dto.userName }]
					<span class="__dotted"></span>
					<strong>조회수</strong> [${dto.hitCount }]
				</span>
				<div style="float: right; font-size: 10px;">
					<input class="dnu" type="button" onclick="deleteBoard();" value="삭제">
					<input class="dnu" type="button" value="수정">
				</div>
			</th>
			
		</tr>
	</thead>
	<tbody>

		<tr>
			<td>
				<img src="<%=cp%>/uploads/photo/${dto.imageFileName}" style="max-width: 400px; height: auto; resize: both;" onerror="this.src='<%=cp%>/resource/images/reviewPhoto/promote.PNG'">
			</td>
		</tr>
		<tr>		
			<td class="read_contArea">
				
				
				<div id="board_memo_area" style="min-height: 200px;">
				
					${dto.content}
				</div>
		
				<form name="read_likeAreaForm" class="_read_likesArea" ajaxAction="modules/board/read.likes.submit.php" ajaxType="html">
					<input type="hidden" name="board_id" value="[board_id_value]" />
					<input type="hidden" name="read_idno" value="[read_value]" />
					<input type="hidden" name="mode" value="" />

				</form>
<!-- 				<tr> -->
<!-- 				<td> 이전글</td> -->
<!-- 				</tr> -->
				
<!-- 				<tr> -->
<!-- 				<td>다음글</td> -->
<!-- 				</tr> -->
				<!-- <ul>
					
					<li>
						<strong>이전글 :</strong>
					</li>
		
					
					
				</ul>
				<ul>
					
					<li>
						<strong>다음글 :</strong>
					</li>
		
					
					
				</ul> -->
				

				
		
				<div class="commentBox">
					<div class="_CALLING_COMMENT"><strong style="font-size: 18px;">
					<span style="font-size: 25px; color: #1abc9c; " class="glyphicon glyphicon-pencil"></span>리플입니다...</strong>
					</div>
					<textarea id="replyContent" style="width: 543px; height: 73px;"></textarea>
					<button type="button" onclick="insertReply();">등록</button>
				</div> 
			</td>
		</tr>
	</tbody>
</table>	

<div id=listReply style="width: 550px; margin-left: 320px; margin-top: -40px;"></div>

