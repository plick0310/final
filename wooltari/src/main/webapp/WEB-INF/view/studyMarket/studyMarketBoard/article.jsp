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
var url="<%=cp%>/studyMarket/studyMarketBoard/delete?"+query;

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
	var url = "<%=cp%>/studyMarket/studyMarketBoard/update?"+query;
	
	location.href=url;	
</c:if>
<c:if test="${sessionScope.member.userId!=dto.userId}">
	alert("게시물을 수정할 수 없습니다.");
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
				<div id="" >
					${dto.startdate}
					
				</div>
				<div id="" >
					${dto.enddate}
					
				</div>
				<div id="" >
					${dto.address}
					
				</div>
				<div id="" >
					${dto.urlContent}
					
				</div>
				<div id="board_memo_area">
					${dto.content}
					
				</div>
		
				<form name="read_likeAreaForm" class="_read_likesArea" ajaxAction="modules/board/read.likes.submit.php" ajaxType="html">
					<input type="hidden" name="board_id" value="[board_id_value]" />
					<input type="hidden" name="read_idno" value="[read_value]" />
					<input type="hidden" name="mode" value="" />
					<ul class="_read_likesArea" style="border-bottom: 1px solid #eee;">
						<li class="_likes_btn">
							<a href="#" title="">
								13<br/>
								<span class="__count" style="color: #1abc9c;">추천</span>
							</a>
						</li>
						
					</ul>
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
						<c:if test="${not empty preReadDto}">
							<a href="<%=cp%>/studyMarket/studyMarketBoard/article?${query}&num=${preReadDto.num}">
							${preReadDto.subject}</a>
						</c:if>
					</li>
				</ul>
				
				<ul>
					<li>
						<strong>다음글 :</strong>
						<c:if test="${not empty nextReadDto}">
							<a href="<%=cp%>/studyMarket/studyMarketBoard/article?${query}&num=${nextReadDto.num}">
							${nextReadDto.subject}</a>
						</c:if>
					</li>
				</ul>
				
				<ul class="fileBox">
					<li>
						<strong>첨부파일</strong>
						<c:forEach var="dto" items="${listFile}">
						<a href="<%=cp%>/studyMarket/studyMarketBoard/download?fileNum=${dto.fileNum}">
					  ${dto.originalFilename}<span class="glyphicon glyphicon-download-alt"></span><br></a>
						</c:forEach>
					</li>
				</ul>
				
				<div style="float: right;">
			<c:if test="${sessionScope.member.userId==dto.userId}">	
					<button type="button" class="dnu" onclick="updateBoard();">수정</button>
			</c:if>
			<c:if test="${sessionScope.member.userId==dto.userId}">		
					 <button type="button" class="dnu" onclick="deleteBoard();">삭제</button>
			</c:if>		
					</div>
		
		<!-- 답글 -->
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
					<strong>조회수</strong> [hit]
					</span>
					<div style="float: right;">
					<input class="dnu" type="button" value="수정">
					<input class="dnu" type="button" value="삭제">
					</div>
					</div>
					
				</div> 
			</td>
		</tr>
	</tbody>
</table>	
<div class="read_btnArea">

</div>
