<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<!-- wooltari 신고 건의 게시판  -->
<style>
.dnu{
border: none;
background: none;
}
</style>
<script type="text/javascript">
//alert('${preReadDto.subject}');
function replyForm() {
//alert("repNum:" + '${repNum}' + " / pageNo:" + '${pageNo}');
	location.href="<%=cp%>/customer/report/reply?pageNo="+'${pageNo}'+"&repNum="+'${repNum}';
}

function updateForm() {
	location.href="<%=cp%>/customer/report/update?pageNo=" + '${pageNo}' + "&repNum=" + '${repNum}';
}

function deleteReport(){
	location.href="<%=cp%>/customer/report/delete?pageNo=" + '${pageNo}' + "&repNum=" + '${repNum}';
}
function listPage(){
	location.href="<%=cp%>/customer/report/list?pageNo=" + '${pageNo}' + "&repNum=" + '${repNum}';
	
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
					
				</span>
			</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td class="read_contArea">
				<div id="board_memo_area">
				<c:if test="${dto.depth!=0}">
	     		  [Re]
	  			 </c:if>
					${dto.content}
				</div>
		
				<form name="read_likeAreaForm" class="_read_likesArea" ajaxAction="modules/board/read.likes.submit.php" ajaxType="html">
					<input type="hidden" name="board_id" value="[board_id_value]" />
					<input type="hidden" name="read_idno" value="[read_value]" />
					<input type="hidden" name="mode" value="" />
					<ul class="_read_likesArea" style="border-bottom: 1px solid #eee;">
						<li class="_likes_btn">
							
						</li>
						
					</ul>
				</form>
				<ul>
					<li>
						<strong>이전글 : </strong>
						<c:if test="${not empty preReadDto}">
							<a href="<%=cp%>/customer/report/article?${query}&repNum=${preReadDto.repNum}">
							${preReadDto.subject}</a>
						</c:if>
					</li>
				</ul>
				<ul>
					<li>
						<strong>다음글 : </strong>
						<c:if test="${not empty nextReadDto}">
							<a href="<%=cp%>/customer/report/article?${query}&repNum=${nextReadDto.repNum}">
							${nextReadDto.subject}</a>
						</c:if>
					</li>
				</ul>
		
			<div style="float: right;">
				<%-- <c:if test="${sessionScope.member.userId=='admin' }"> --%>
					<input class="dnu" type="button" value="답변" onclick="javaScript:location.href='<%=cp%>/customer/report/reply?pageNo=${pageNo}&repNum=${repNum}';">
				<%-- </c:if> --%>
				<%-- <c:if test=	"${sessionScope.member.userId=='admin' }"> --%>
					<button class="dnu" type="button" onclick="updateForm();">수정</button>
				<%-- </c:if> --%>
				<%-- <c:if test="${sessionScope.member.userId=='' ||sessionScope.member.userId=='admin' }"> --%>
					<button class="dnu" type="button"  onclick="deleteReport();">삭제</button>
				<%-- </c:if> --%>
					<button class="dnu" type="button" onclick="listPage();">리스트</button>
			</div>	
			
			</td>
		</tr>
	</tbody>
</table>	
<div class="read_btnArea">

</div>
