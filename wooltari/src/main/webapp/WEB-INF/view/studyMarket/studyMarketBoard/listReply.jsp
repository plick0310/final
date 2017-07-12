<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String cp=request.getContextPath();
%>
<style>
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
    color: #337ab7;
    text-decoration: none;
    background-color: #fff;
  border: none;
</style>

<table style='width: 900px; margin: 10px auto 30px; border-spacing: 0px;'>
<tr height="35">
    <td>
       <div style="clear: both;">
           <div style="float: left;"><span style="color: #1abc9c; font-weight: bold;">댓글 ${dataCount }개</span> <span>[댓글 목록, ${pageNo } / ${total_page } 페이지]</span></div>
           <div style="float: right; text-align: right;"></div>
       </div>
    </td>
</tr>

<c:forEach var="vo" items="${listReply }">
    <tr height='35' style='background: #eee;'>
       <td width='50%' style='padding:5px 5px; '>
           <span><b>${vo.userId }</b></span>
        </td>
       <td width='50%' style='padding:5px 5px;' align='right'>
           <span>${vo.created}</span> |
           <c:if test="${sessionScope.member.userId==dto.userId || sessionScope.member.userId=='admin' }">
           		<a onclick='deleteReply(${vo.replyNum}, ${pageNo })'>삭제</a>
			</c:if>
			
        </td>
    </tr>
    <tr>
        <td colspan='2' valign='top' style='padding:5px 5px;'>
            ${vo.content }
        </td>
    </tr>
</c:forEach>

     <tr height="40">
         <td colspan='2' style="    text-align: center;">
              ${paging }
         </td>
     </tr>
</table>
