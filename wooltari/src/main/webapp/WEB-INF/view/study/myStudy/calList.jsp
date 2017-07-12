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
<div style="text-align: left; color: red; font-weight: 300;">일정${dataCount }개</div>
<c:forEach var="vo" items="${list}">
<table style='width: 444px; margin-bottom: 10px; border: 1px solid #1abc9c;'>

    <tr  height='35' style="">
        <td colspan="2" width='80%;' style='padding:5px 5px;'>
           <span style="font-size: 17px; color:#1abc9c; ">${vo.sdate }&nbsp;&nbsp;&nbsp;~&nbsp;&nbsp;&nbsp;${vo.edate}</span>
           
           	<img src="<%=cp%>/resource/images/reviewPhoto/calendarDelete.png" style="width: 10px; float: right;" onclick="deleteBoard('${vo.num}','${page }');">
           		

        </td>
        
    </tr>
    <tr style="">
 		 <td width='20%;' style='padding:5px 5px; color: black' align='center'>
           <span >${vo.subject}</span> 		    
        </td>
 		
        <td valign='top' style='padding:5px 5px; text-align: center; color: black' >
           ${vo.content }
        </td>
    </tr>
</table>

</c:forEach>

${paging }
