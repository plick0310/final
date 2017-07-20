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
	color: blue;
	border-bottom: 1px solid blue;
}


</style>

<div style="margin: auto; width: 57%;">
	<div style="padding-top: 20px; font-size: 17px; ">
		<ul class="tab_menu" style="width:100%; float: left; display: block; text-align: left; border-top: 1px solid #f1f3f6; border-bottom: 1px solid #e2e2e2; padding-top: 10px; padding-bottom: 10px;">
			<li class="active" style="float: left; position: relative; list-style-type: none; font-family: '굴림',gulim,helvetica,sans-serif;" data-tab="exam" ><a style="cursor: pointer;" onclick="location.href='<%=cp%>/keyword/search?keyword=${keyword }'">통합검색</a></li>
			<li style="margin-left:30px; float: left; position: relative; list-style-type: none; font-family: '굴림',gulim,helvetica,sans-serif"><a style="cursor: pointer;" onclick="location.href='<%=cp%>/keyword/studySearch?keyword=${keyword }'">스터디</a></li>
			<li style="margin-left:30px; float: left; position: relative; list-style-type: none; font-family: '굴림',gulim,helvetica,sans-serif"><a style="cursor: pointer;" onclick="location.href='<%=cp%>/keyword/promoteSearch?keyword=${keyword }'">홍보</a></li>
			<li style="margin-left:30px; float: left; position: relative; list-style-type: none; font-family: '굴림',gulim,helvetica,sans-serif"><a style="cursor: pointer;" onclick="location.href='<%=cp%>/keyword/reviewSearch?keyword=${keyword }'">리뷰</a></li>
			<li style="margin-left:30px; float: left; position: relative; list-style-type: none; font-family: '굴림',gulim,helvetica,sans-serif"><a style="cursor: pointer;" onclick="location.href='<%=cp%>/keyword/marketSearch?keyword=${keyword }'">스터디마켓</a></li>
			<li style="margin-left:30px; float: left; position: relative; list-style-type: none; font-family: '굴림',gulim,helvetica,sans-serif"><a style="cursor: pointer; color: #1abc9c;" onclick="location.href='<%=cp%>/keyword/whereSearch?keyword=${keyword }'">어디서하지</a></li>
			<li style="margin-left:30px; float: left; position: relative; list-style-type: none; font-family: '굴림',gulim,helvetica,sans-serif"><a style="cursor: pointer;" onclick="location.href='<%=cp%>/keyword/downloadSearch?keyword=${keyword }'">다운로드</a></li>
			<li style="margin-left:30px; float: right; position: relative; list-style-type: none; font-family: '굴림',gulim,helvetica,sans-serif"><a href="#">도움말</a></li>
		</ul>
	</div>

	<div style="clear: both; font-size: 14px; font-weight: bolder; color: black; margin-bottom: 20px;">어디서하지[검색결과:${dataCount }개]</div>
	<c:forEach var="dto" items="${list }">
		<ul>
						<li style="clear: both;">			
							<div class="thumb" >
								<img src="${dto.content }" style="width: 82px; height: 82px;" onerror="this.src='<%=cp%>/resource/images/reviewPhoto/noImage.png'">
							</div>
							<dl style="padding-top: 3px; overflow: hidden; line-height: 19px; display: block;">
								<dt style="display: inline; clear: both; margin-right: 5px; "><a onclick="location.href='<%=cp%>/keyword/studywhere/article?num=${dto.num }'" style="cursor: pointer; color: blue;">제목:&nbsp;&nbsp;&nbsp;${dto.subject }</a></dt>
								<dd class="txt_inline" style="clear: both; margin: 2px 0 1px; font-size: 12px; line-height: 18px; display: inline;">&nbsp;&nbsp;작성일|${dto.created }</dd>
								<dt>[매장명:${dto.placename }][지역:${dto.region }][영업시간:${dto.ocTime }]</dt>
								<dt>[주소:${dto.address }][전화번호:${dto.tel }]</dt>
								<%-- <dd>&nbsp;&nbsp;&nbsp;${dto.content }</dd> --%>
							</dl>
						</li>
					</ul>
	</c:forEach>
	

	<div style="text-align: center;">${paging }</div>
</div>


