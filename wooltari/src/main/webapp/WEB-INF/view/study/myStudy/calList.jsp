<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String cp=request.getContextPath();
%>
<style>
p{
margin: 2px;
}
.callist{
border-left: 3.5px solid #1abc9c; 
font-family:'Bareundotum';   
background: #eee; 
height: 98px ; 
width:100%;  
margin-top:10px; 
padding: 7px 0px 17px 24px;  
clear:both; 
text-align: left;}
</style>



  <c:forEach var="vo" items="${list}">
<div class="callist">
<p style="font-size: 20px; margin-bottom: 9px; padding-right: 5px;">${vo.subject} <img src="<%=cp%>/resource/images/reviewPhoto/calendarDelete.png" style="width: 10px; float: right;" onclick="deleteBoard('${vo.num}','${page }');">
         </p> 
<p style="color: #9c9c9c;"><span class="glyphicon glyphicon-calendar" aria-hidden="true"></span>&nbsp;&nbsp;${vo.sdate } ~ ${vo.edate }</p>
<p style="color: #9c9c9c;"><span class="glyphicon glyphicon-ok" aria-hidden="true"></span>&nbsp;&nbsp;${vo.content }</p>
</div>
      
    </c:forEach>
