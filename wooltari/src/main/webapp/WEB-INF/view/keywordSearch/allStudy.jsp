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
				<td style="height:50px; line-height:50px; float: left; position: relative; list-style-type: none; font-family: 'BareunDotum',gulim,helvetica,sans-serif;" data-tab="exam" ><a style="cursor: pointer; "  onclick="location.href='<%=cp%>/keyword/search?keyword=${keyword }'">���հ˻�</a></td>
				<td style="height:50px; line-height:50px; margin-left:30px; float: left; position: relative; list-style-type: none; font-family: 'BareunDotum',gulim,helvetica,sans-serif; border-bottom:2px solid #1abc9c;"><a style="cursor: pointer;  color: #1abc9c;" onclick="location.href='<%=cp%>/keyword/studySearch?keyword=${keyword }'">���͵�</a></td>
				<td style="height:50px; line-height:50px; margin-left:30px; float: left; position: relative; list-style-type: none; font-family: 'BareunDotum',gulim,helvetica,sans-serif"><a style="cursor: pointer;" onclick="location.href='<%=cp%>/keyword/promoteSearch?keyword=${keyword }'">ȫ��</a></td>
				<td style="height:50px; line-height:50px; margin-left:30px; float: left; position: relative; list-style-type: none; font-family: 'BareunDotum',gulim,helvetica,sans-serif"><a style="cursor: pointer;" onclick="location.href='<%=cp%>/keyword/reviewSearch?keyword=${keyword }'">����</a></td>
				<td style="height:50px; line-height:50px; margin-left:30px; float: left; position: relative; list-style-type: none; font-family: 'BareunDotum',gulim,helvetica,sans-serif"><a style="cursor: pointer;" onclick="location.href='<%=cp%>/keyword/marketSearch?keyword=${keyword }'">���͵���</a></td>
				<td style="height:50px; line-height:50px; margin-left:30px; float: left; position: relative; list-style-type: none; font-family: 'BareunDotum',gulim,helvetica,sans-serif"><a style="cursor: pointer;" onclick="location.href='<%=cp%>/keyword/whereSearch?keyword=${keyword }'">�������</a></td>
				<td style="height:50px; line-height:50px; margin-left:30px; float: left; position: relative; list-style-type: none; font-family: 'BareunDotum',gulim,helvetica,sans-serif"><a style="cursor: pointer;" onclick="location.href='<%=cp%>/keyword/downloadSearch?keyword=${keyword }'">�ٿ�ε�</a></td>
				<td style="height:50px; line-height:50px; margin-left:30px; float: right; position: relative; width:306px; text-align:right; list-style-type: none; font-family: 'BareunDotum',gulim,helvetica,sans-serif"><a href="#">����</a></td>
			</tr>
		</table>
		
	</div>

	<div style="clear: both; font-size: 16px; font-family:'BareunDotum'; font-weight: bolder; color: black; margin-bottom: 20px; margin-top: 79px;">���͵�[�˻����:${studyCount }��]</div>
	<div style="padding-left: 15px;">
	<c:forEach var="dto" items="${list }">
		<ul>
			<li style="clear: both;">
				<c:if test="${dto.imageFileName != null }">
					<div class="thumb" >
						<c:if test="${dto.imageFileName!='' }"><img src="<%=cp%>/uploads/member/userImg/${dto.imageFileName}" style="width: 82px; height: 82px;" onerror="this.src='<%=cp%>/resource/images/reviewPhoto/noImage.png'"></c:if>
					</div>
				</c:if>	
				<dl style="padding-top: 3px; overflow: hidden; line-height: 19px; display: block;">
					<c:if test="${dto.range=='0' }"><dt style="display: inline; clear: both; margin-right: 5px; "><a onclick="location.href='<%=cp%>/study/myStudy/home/${dto.s_num}'" style="cursor: pointer; color: #1abc9c; font-size: 15px; white-space: nowrap;overflow: hidden;text-overflow: ellipsis;">${dto.studyName }</a></dt>&nbsp;&nbsp;</c:if>
					<c:if test="${dto.range=='1' }"><dt style="display: inline; clear: both; margin-right: 5px; "><a style="cursor: pointer; color: #1abc9c; font-size: 15px; white-space: nowrap;overflow: hidden;text-overflow: ellipsis;">${dto.studyName }</a></dt>&nbsp;&nbsp;&nbsp;&nbsp;</c:if>
					<dd class="txt_inline" style="clear: both; margin: 2px 0 1px; font-size: 12px; line-height: 18px; display: inline;">������${dto.created }</dd>
					<c:if test="${dto.range=='0'}"><dt style="font-size:11px; margin-top: 8px;">[��ü����][${dto.gender }][${dto.recruit }��]</dt></c:if>
					<c:if test="${dto.range=='1'}"><dt style="font-size:11px; margin-top: 8px;">[�����][${dto.gender }][${dto.recruit }��]</dt></c:if>
					<dd style="white-space: nowrap;overflow: hidden;text-overflow: ellipsis;">&nbsp;&nbsp;&nbsp;${dto.study_Info }</dd>
	
				</dl>
			</li>
		</ul>
	</c:forEach>
	</div>

	<div style="text-align: center;">${paging }</div>
</div>



