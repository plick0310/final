<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<script type="text/javascript">
function chkAll() {
	
}
</script>
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
$(document).ready(function(){
    $("#chkAll").click(function(){
        if($("#chkAll").prop("checked")){
            $("input[id=checkbox]").prop("checked",true);
        }else{
            $("input[id=checkbox]").prop("checked",false);
        }
    });
});

function moveKeep() {
	var f=document.array_form;
	var cnt=0;
	
	if(f.chk==undefined){
		return false;
	}
	if(f.chk.length!=undefined){//체크 박스가 둘 이상인 경우
		for(var i=0; i<f.chk.length;i++){
			if(f.chk[i].checked)
				cnt++;
		}
		
	}else{
		//체크박스가 하나인 경우
		if(f.chk.checked)
			cnt++;
	}
	if(cnt==0){
		alert("선택한 게시물이 없습니다.");
		return false;
	}
	if(confirm("선택한 게시물을 보관함으로 이동하시겠습니까?")){		
		f.action="<%=cp%>/message/movekeep";
		f.submit();
	}
}

</script>
<div class="mail-option">
    <div class="chk-all">
        <input id="chkAll" type="checkbox" class="mail-checkbox mail-group-checkbox">
        <div class="btn-group">
            <a href="#" class="btn mini all" aria-expanded="false">전체선택</a>
        </div>
    </div>
	
    <div class="btn-group"> 
        <a data-original-title="Refresh" href="javascript:reload();" class="btn mini tooltips">
            <i class=" fa fa-refresh"></i>
        </a>
    </div>
    <div class="btn-group hidden-phone">
        <a data-toggle="dropdown" href="#" class="btn mini blue" aria-expanded="false">
          		작업
            <i class="fa fa-angle-down "></i>
        </a>
        <ul class="dropdown-menu">
        	<li><a href="javascript:moveKeep();"><i class="fa fa-folder-o"></i> 보관함으로 이동</a></li>
            <li><a href="#"><i class="fa fa-trash-o"></i> 휴지통으로 이동</a></li>
        </ul>
    </div>

    <ul class="unstyled inbox-pagination">
        <li><span>전체 개수 : ${dataCount}</span></li>
    </ul>
</div>
<form name="array_form" id="array_form" method="post"> 	
	<table class="table table-inbox table-hover" style="text-align: center;">
		<tbody>
			<tr>
			<td class="inbox-small-cells"><strong>선택</strong></td>
			<td class="inbox-small-cells"><strong>분류</strong></td>
			<td class="view-message"><strong>이름</strong></td>
			<td class="view-message"><strong>제목</strong></td>
			<td class="inbox-small-cells"><strong>날짜</strong></td>
			<td class="inbox-small-cells"><strong>읽음</strong></td>
			</tr>
			<c:forEach var="dto" items="${list}">
				<c:if test="${dto.read == 0}">
					<tr class="unread" onclick="readMsg(${dto.num});"> 
				</c:if>
				<c:if test="${dto.read == 1}">
					<tr class="" onclick="readMsg(${dto.num});">
				</c:if>
						<td class="inbox-small-cells">
							<input id="checkbox" name="chk" type="checkbox" class="mail-checkbox" value="${dto.num}">
						</td>
						<td class="inbox-small-cells">
							<c:if test="${(mode == 'all' && dto.recv_Id == sessionScope.member.userId) || mode == 'receive' || mode == 'keep' || mode == 'trash'}">
							받음
							</c:if>
							<c:if test="${(mode == 'all' && dto.sent_Id == sessionScope.member.userId) || mode == 'send'}">
							보냄
							</c:if>
						</td>
						<td class="view-message">
							<c:if test="${(mode == 'all' && dto.recv_Id == sessionScope.member.userId) || mode == 'receive' || mode == 'keep' || mode == 'trash'}">
								<a href="javascript:sendMsg('${dto.sent_Id}');" data-toggle="modal">${dto.sent_Name}</a>
							</c:if>
							<c:if test="${(mode == 'all' && dto.sent_Id == sessionScope.member.userId) || mode == 'send'}">
								<a href="javascript:sendMsg('${dto.recv_Id}');" data-toggle="modal">${dto.recv_Name}</a>
							</c:if>
						</td>
						<td class="view-message text-left">
							<a href="javascript:readMsg('${dto.num}');" data-toggle="modal">${dto.content}</a>
						</td>
						<td class="inbox-small-cells">${dto.date_Sent}</td>
						<td class="view-message">
							<c:if test="${dto.read == 1}"><i class="fa fa-envelope-open-o" aria-hidden="true"></i></c:if>
							<c:if test="${dto.read == 0}"><i class="fa fa-envelope-o" aria-hidden="true"></i></c:if>
						</td>
					</tr>
			</c:forEach>
		</tbody>
	</table>
</form>
<div style="text-align: center;">${paging}</div>
