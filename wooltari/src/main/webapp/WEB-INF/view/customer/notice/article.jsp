<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<!-- wooltari 공지사항 게시판 -->
<style>

.clickbtn {
   background-color: white;
   border-style: solid;
   padding: 5px 20px;
   margin-left: 10px;
   font-size:13px;
   border: 1px solid #EAEAEA;
}

.pagination > .active > a, .pagination > .active > span, .pagination > .active > a:hover, .pagination > .active > span:hover, .pagination > .active > a:focus, .pagination > .active > span:focus {
    z-index: 2;
    color: #fff;
    cursor: default;
    background-color: #1abc9c;
    /* border-color: #337ab7; */
    /* text-align: center; */
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
	var url="<%=cp%>/customer/notice/delete?"+query;
	
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
	var url = "<%=cp%>/customer/notice/update?"+query;
	
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
			</span>&nbsp;&nbsp;&nbsp;WOOLTARI&nbsp;&nbsp;&nbsp;</span>W R I T E . . .
</div>

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
					${dto.content}
				</div>
							
				<ul>
				
					<li>
						<strong>이전글 :</strong>
						<c:if test="${not empty preReadDto }">
                            <a href="<%=cp%>/customer/notice/article?${query}&num=${preReadDto.num}">
                            ${preReadDto.subject}</a>
                        </c:if>						
					</li>
				</ul>
				<ul>
					<li>
						<strong>다음글 :</strong>
						<c:if test="${not empty nextReadDto }">
                            <a href="<%=cp%>/customer/notice/article?${query}&num=${nextReadDto.num}">
                            ${nextReadDto.subject}</a>
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
			
				</td>
			</tr>
</tbody>

</table>
