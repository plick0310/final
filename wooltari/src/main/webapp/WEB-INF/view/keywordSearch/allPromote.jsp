<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
   request.setCharacterEncoding("utf-8");
   String cp=request.getContextPath();
%>

<style>
.thumb {
    float: left;
    left: 0;
    top: 0;
    z-index: 2;
    margin: 0 16px 0 0;
    position: relative;
    width: 82px;
    height: 82px;
}

.section_more {
    position: relative;
    overflow: hidden;
    clear: both;
    padding: 14px 0 0 0;
    font-size: 12px;
    text-align: right;
    zoom: 1;
}

.txt_inline {
    display: inline;
}


</style>

<div style="margin-left: 400px; margin-right: 600px;">

	<div>홍보게시판[검색결과:${dataCount }개]</div>
	<c:forEach var="dto" items="${list }">
		<ul>
			<li style="clear: both;">
				<div class="thumb" >
					<img src="<%=cp%>/uploads/photo/${dto.imageFileName}" style="width: 82px; height: 82px;" onerror="this.src='<%=cp%>/resource/images/reviewPhoto/noImage.png'">
				</div>
				<dl style="padding-top: 3px; overflow: hidden; line-height: 19px; display: block;">
					<dt style="display: inline; clear: both; margin-right: 5px; ">스터디명:&nbsp;&nbsp;&nbsp;${dto.subject }</dt>&nbsp;&nbsp;&nbsp;&nbsp;
					<dd class="txt_inline" style="clear: both; margin: 2px 0 1px; font-size: 12px; line-height: 18px; display: inline;">작성일${dto.created }</dd>
					<c:if test="${dto.range=='0'}"><dt>[전체공개][${dto.subject }][${dto.subject }명]</dt></c:if>
					<c:if test="${dto.range=='1'}"><dt>[비공개][${dto.subject }][${dto.subject }명]</dt></c:if>
					<dd>&nbsp;&nbsp;&nbsp;${dto.subject }</dd>
										
					<c:if test="${dto.range=='0' }"><dd><a onclick="location.href'<%=cp%>/keyword/promote/article?${dto.num }'">글 보기</a></dd></c:if>										

				</dl>
			</li>
		</ul>
	</c:forEach>
	

	<div style="text-align: center;">${paging }</div>
</div>

