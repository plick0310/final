<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    color: #1abc9c;
    text-decoration: none;
    background-color: #fff;
  border: none;
}
</style>
<script type="text/javascript">

</script>
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
<table class="table table-inbox table-hover" style="text-align: center;">
	<tbody>
		<tr>
		<td class="inbox-small-cells"><strong>선택</strong></td>
		<td class="inbox-small-cells"><strong>분류</strong></td>
		<td class="view-message"><strong>제목</strong></td>
		<td class="inbox-small-cells"><strong>날짜</strong></td>
		<td class="inbox-small-cells"><strong>읽음</strong></td>
		</tr>
		
		<c:forEach var="dto" items="${list}">
			<c:if test="${dto.read == 0}">
				<tr class="unread">
			</c:if>
			<c:if test="${dto.read == 1}">
				<tr class="">
			</c:if>
					<td class="inbox-small-cells">
						<input type="checkbox" class="mail-checkbox" value="${dto.num}">
					</td>
					<td class="inbox-small-cells">
						<c:if test="${dto.recv_Id == sessionScope.member.userId}">받음</c:if>
						<c:if test="${dto.sent_Id == sessionScope.member.userId}">보냄</c:if>
					</td>
					<c:if test="${dto.recv_Id == sessoinScope.member.userId}">
						<td class="view-message dont-show"><a href="javascript:dialogChat();">보낸이 : ${dto.sent_Id}</a></td>
					</c:if>
					<c:if test="${dto.sent_Id == sessoinScope.member.userId}">
						<td class="view-message dont-show"><a href="javascript:dialogChat();">받는이 : ${dto.recv_Id}</a></td>
					</c:if>
					
					<td class="view-message text-left">${dto.content}</td>
					<td class="inbox-small-cells">${dto.date_Sent}</td>
					<td class="view-message">
						<c:if test="${dto.read == 1}">O</c:if>
						<c:if test="${dto.read == 0}">X</c:if>
					</td>
				</tr>
		</c:forEach>
	</tbody>
</table>
<div style="text-align: center;">${paging}</div>