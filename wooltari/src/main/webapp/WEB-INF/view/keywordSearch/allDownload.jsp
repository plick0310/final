<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
   request.setCharacterEncoding("utf-8");
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
    color: #1abc9c;
    text-decoration: none;
    background-color: #fff;
  border: none;
}
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

dl > dt:FIRST-OF-TYPE {
	color: #1abc9c;
	border-bottom: 1px solid #1abc9c;
}

dl  a{
	color:#1abc9c;
}


</style>

<div style="margin: auto; width: 900px;">
	<div style="padding-top: 50px; font-size: 17px; ">
		<table class="tab_menu" style="width:100%; float: left; display: block; text-align: left;  border-bottom: 1px solid #e2e2e2; margin-bottom: 50px; ">
			<tr>
				<td style="height:50px; line-height:50px; float: left; position: relative; list-style-type: none; font-family: 'BareunDotum',gulim,helvetica,sans-serif;" data-tab="exam" ><a style="cursor: pointer;"  onclick="location.href='<%=cp%>/keyword/search?keyword=${keyword }'">통합검색</a></td>
				<td style="height:50px; line-height:50px; margin-left:30px; float: left; position: relative; list-style-type: none; font-family: 'BareunDotum',gulim,helvetica,sans-serif"><a style="cursor: pointer;" onclick="location.href='<%=cp%>/keyword/studySearch?keyword=${keyword }'">스터디</a></td>
				<td style="height:50px; line-height:50px; margin-left:30px; float: left; position: relative; list-style-type: none; font-family: 'BareunDotum',gulim,helvetica,sans-serif"><a style="cursor: pointer;" onclick="location.href='<%=cp%>/keyword/promoteSearch?keyword=${keyword }'">홍보</a></td>
				<td style="height:50px; line-height:50px; margin-left:30px; float: left; position: relative; list-style-type: none; font-family: 'BareunDotum',gulim,helvetica,sans-serif"><a style="cursor: pointer;" onclick="location.href='<%=cp%>/keyword/reviewSearch?keyword=${keyword }'">리뷰</a></td>
				<td style="height:50px; line-height:50px; margin-left:30px; float: left; position: relative; list-style-type: none; font-family: 'BareunDotum',gulim,helvetica,sans-serif"><a style="cursor: pointer;" onclick="location.href='<%=cp%>/keyword/marketSearch?keyword=${keyword }'">스터디마켓</a></td>
				<td style="height:50px; line-height:50px; margin-left:30px; float: left; position: relative; list-style-type: none; font-family: 'BareunDotum',gulim,helvetica,sans-serif"><a style="cursor: pointer;" onclick="location.href='<%=cp%>/keyword/whereSearch?keyword=${keyword }'">어디서하지</a></td>
				<td style="height:50px; border-bottom:2px solid #1abc9c; line-height:50px; margin-left:30px; float: left; position: relative; list-style-type: none; font-family: 'BareunDotum',gulim,helvetica,sans-serif"><a style="cursor: pointer;  color: #1abc9c;" onclick="location.href='<%=cp%>/keyword/downloadSearch?keyword=${keyword }'">다운로드</a></td>
				<td style="height:50px; line-height:50px; margin-left:30px; float: right; position: relative; width:306px; text-align:right; list-style-type: none; font-family: 'BareunDotum',gulim,helvetica,sans-serif"><a href="#">도움말</a></td>
			</tr>
		</table>
		
	</div>
	

	<div style="clear: both; font-size: 16px; font-family:'BareunDotum'; font-weight: bolder; color: black; margin-bottom: 20px; margin-top: 79px;">다운로드게시판[검색결과:${dataCount }개]</div>
	<div style="padding-left: 15px;">
	<c:forEach var="dto" items="${list }">
		<ul>
			<li style="clear: both;">
	
				<dl style="padding-top: 3px; overflow: hidden; line-height: 19px; display: block;">
					<dt style="display: inline; clear: both; margin-right: 5px; "><a onclick="location.href='<%=cp %>/keyword/downloadBoard/article?num=${dto.num }'" style="cursor: pointer; color: #1abc9c; font-size: 15px; white-space: nowrap;overflow: hidden;text-overflow: ellipsis;">${dto.subject }</a></dt>
					<dd class="txt_inline" style="clear: both; margin: 2px 0 1px; font-size: 12px; line-height: 18px; display: inline;">&nbsp;&nbsp;작성일|${dto.created }</dd>

					<dd style="white-space: nowrap;overflow: hidden;text-overflow: ellipsis;">&nbsp;&nbsp;&nbsp;${dto.content }</dd>
				</dl>
			</li>
		</ul>
	</c:forEach>
	</div>

	<div style="text-align: center;">${paging }</div>
</div>


	