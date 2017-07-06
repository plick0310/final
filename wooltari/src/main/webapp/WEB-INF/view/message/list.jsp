<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<div class="mail-option">
    <div class="chk-all">
        <input type="checkbox" class="mail-checkbox mail-group-checkbox">
        <div class="btn-group">
            <a data-toggle="dropdown" href="#" class="btn mini all" aria-expanded="false">
            	 전체 <i class="fa fa-angle-down "></i>
            </a>
            <ul class="dropdown-menu">
                <li><a href="#">읽지 않은 쪽지</a></li>
                <li><a href="#">읽은 쪽지</a></li>
            </ul>
        </div>
    </div>

    <div class="btn-group">
        <a data-original-title="Refresh" data-placement="top" data-toggle="dropdown" href="#" class="btn mini tooltips">
            <i class=" fa fa-refresh"></i>
        </a>
    </div>
    <div class="btn-group hidden-phone">
        <a data-toggle="dropdown" href="#" class="btn mini blue" aria-expanded="false">
          		작업
            <i class="fa fa-angle-down "></i>
        </a>
        <ul class="dropdown-menu">
            <li><a href="#"><i class="fa fa-pencil"></i> 읽음표시</a></li>
            <li><a href="#"><i class="fa fa-ban"></i> 스팸</a></li>
            <li class="divider"></li>
            <li><a href="#"><i class="fa fa-trash-o"></i> 휴지통</a></li>
        </ul>
    </div>
    <div class="btn-group">
        <a data-toggle="dropdown" href="#" class="btn mini blue">
            	이동
            <i class="fa fa-angle-down "></i>
        </a>
        <ul class="dropdown-menu">
            <li><a href="#"><i class="fa fa-pencil"></i> 읽음표시</a></li>
            <li><a href="#"><i class="fa fa-ban"></i> 스팸</a></li>
            <li class="divider"></li>
            <li><a href="#"><i class="fa fa-trash-o"></i> 휴지통</a></li>
        </ul>
    </div>

    <ul class="unstyled inbox-pagination">
        <li><span>전체 개수 : ${dataCount}</span></li>
        <li>
            <a class="np-btn" href="#"><i class="fa fa-angle-left  pagination-left"></i></a>
        </li>
        <li>
            <a class="np-btn" href="#"><i class="fa fa-angle-right pagination-right"></i></a>
        </li>
    </ul>
</div>
<table class="table table-inbox table-hover">
	<tbody>
		<c:forEach var="dto" items="${list}">
			<c:if test="${dto.read == 0}">
				<tr class="unread">
			</c:if>
			<c:if test="${dto.read == 1}">
				<tr class="">
			</c:if>
					<td class="inbox-small-cells">
						<input type="checkbox" class="mail-checkbox">
					</td>
					<td class="inbox-small-cells">
						<i class="fa fa-star"></i>
					</td>
					${dto.recv_Id}
					${dto.sent_Id}
					<c:if test="${dto.recv_Id == sessoinScope.member.userId}">
						<td class="view-message  dont-show"><a href="javascript:dialogChat();">보낸이 : ${dto.sent_Id}</a></td>
					</c:if>
					<c:if test="${dto.sent_Id == sessoinScope.member.userId}">
						<td class="view-message  dont-show"><a href="javascript:dialogChat();">받는이 : ${dto.recv_Id}</a></td>
					</c:if>
					
					<td class="view-message ">${dto.content}</td>
					<td class="view-message  inbox-small-cells"><i class="fa fa-paperclip"></i></td>
					<td class="view-message  text-right">${dto.date_Sent}</td>
				</tr>
		</c:forEach>
	</tbody>
</table>
<div style="text-align: center;">${paging}</div>