<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
   String cp=request.getContextPath();
%>


<div style="clear: both; padding-top: 20px;">
    <div style="float: left;"><span style="color: #3EA9CD; font-weight: bold;">댓글 ${dataCount}개</span></div>
    <div style="float: right; text-align: right;"></div>
</div>

<div style="clear: both; padding-top: 5px;">

<c:forEach var="vo" items="${listReply}">

    <div style="clear:both; margin-top:5px; padding: 10px;  min-height: 90px; border: none">
        <div style="clear: both;">
            <div style="float: left;">${vo.userName} | ${vo.created}</div>
            <div style="float: right;  text-align: rigth;">
	<c:if test="${sessionScope.member.userId==vo.userId || sessionScope.member.userId=='admin'}">		   
                <a  href="#" onclick='deleteReply("${vo.prNum}","${pageNo }"); return false'>삭제</a>
                     <%-- <a onclick='deleteReply("${vo.prNum}", "${pageNo}");'>삭제</a> --%>
	</c:if>
            </div>
        </div>
        <br>
        <textarea style="width: 525px; height: 55px;" readonly="readonly">${vo.content }</textarea>

        <!-- 답글 시작 -->
                              
    </div>
</c:forEach>
<div style="text-align: center">${paging }</div>

</div>