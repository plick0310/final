<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
			<c:forEach var="dto" items="${list}">
				 <div class="panel panel">
				    <div class="panel-heading" role="tab" id="heading${dto.listNum}">
				      <h4 class="panel-title">
				        <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapse${dto.listNum}" aria-expanded="false" aria-controls="collapse${dto.listNum}">
				        <span><small><input type="checkbox" name="chk" value="${dto.num}"></small></span>
				        <span><small>${dto.listNum}</small></span> &nbsp;&nbsp;&nbsp;<span>제목 : ${dto.subject}</span>
				         <small>작성자 : ${dto.userId} </small>&nbsp;&nbsp;&nbsp;<small>작성일 : ${dto.created}</small>&nbsp;&nbsp;&nbsp;
				         <small>카테고리 : ${dto.category}</small>
				        </a>
				      </h4>
				    </div>
				    <div id="collapse${dto.listNum}" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading${dto.listNum}">
				      <div class="panel-body">				        
				        <div style="float: left; margin-left: 15px;">C O N T E N T : ${dto.content} </div>
				      </div>
				    </div>
				  </div>
			 </c:forEach>
