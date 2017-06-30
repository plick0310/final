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
	var url="<%=cp%>/promote/delete?"+query;
	
	
	if(confirm("글을 삭제하시겠습니까?"))
		location.href=url;
</c:if>

<c:if test="${sessionScope.member.userId!='admin'&&sessionScope.member.userId!=dto.userId}">	
	alert("게시물을 삭제할 수 없습니다.");
</c:if>
	
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
			</th>
		</tr>
	</thead>
	<tbody>

		<tr>
			<td>
				<img src="<%=cp%>/uploads/photo/${dto.imageFileName}" style="max-width: 400px; height: auto; resize: both;">
			</td>
		</tr>
		<tr>		
			<td class="read_contArea">
				
				
				<div id="board_memo_area">
				
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
				<ul>
					
					<li>
						<strong>이전글 :</strong>
					</li>
		
					
					
				</ul>
				<ul>
					
					<li>
						<strong>다음글 :</strong>
					</li>
		
					
					
				</ul>
				

				
		
				<div class="commentBox">
					<div class="_CALLING_COMMENT"><strong style="font-size: 18px;">
					<span style="font-size: 25px; color: #1abc9c; " class="glyphicon glyphicon-pencil"></span>리플입니다...</strong>
					</div>
					<div class="_CALLING_COMMENT">
					<span class="inforArea">
					<strong>작성일</strong> [datetime]
					<span class="__dotted"></span>
					<strong>작성자</strong> [writer]
					<span class="__dotted"></span>
					<strong>조회수</strong> []
					</span>
					<div style="float: right;">
					<input class="dnu" type="button" onclick="deleteBoard();" value="삭제">
					<input class="dnu" type="button" value="수정">
					</div>
					</div>
					
				</div> 
			</td>
		</tr>
	</tbody>
</table>	
<div class="read_btnArea">

</div>
