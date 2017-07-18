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

<div>

	<div>블로그</div>${dataCount }개
	<c:forEach var="dto" items="${list }">
		<ul>
			<li style="clear: both;">
				<div class="thumb">사진부분</div>
				<dl style="padding-top: 3px; overflow: hidden; line-height: 19px; display: block;">
					<dt style="display: inline; clear: both; margin-right: 5px; ">네이버 PC 통합검색 개편!${dto.studyName }</dt>
					<dd class="txt_inline" style="clear: both; margin: 2px 0 1px; font-size: 12px; line-height: 18px; display: inline;">2014.09.05.</dd>
					<dd>이종DB에 대하여 연결/병합 과정을 거쳤으며, 사용자의 검색의도에 따라 복수개의 컬렉션과 문서를 유기적으로 결합하였습니다. 네이버 통합검색은 앞으로도...</dd>
				</dl>
			</li>
		</ul>
	</c:forEach>
	<div class="section_more">더보기</div>
	
</div>

