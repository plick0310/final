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
$(document).ready(function(){
    $("#chkAll").click(function(){
        if($("#chkAll").prop("checked")){
            $("input[id=checkbox]").prop("checked",true);
        }else{
            $("input[id=checkbox]").prop("checked",false);
        }
    });
});

function msgRead() {
	var f=document.array_form;
	var cnt=0;
	
	if(f.chk==undefined){
		return false;
	}
	if(f.chk.length!=undefined){
		//체크 박스가 둘 이상인 경우
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
	if(confirm("선택한 게시물을 읽은 쪽지로 표시하시겠습니까?")){		
		// name이 같은 체크박스의 값들을 배열에 담는다.
	    var checkboxValues = [];
	    $("input[name='chk']:checked").each(function(i) {
	        checkboxValues.push($(this).val());
	    });
		// 사용자 ID(문자열)와 체크박스 값들(배열)을 name/value 형태로 담는다.
	    var chkarray = { "checkArray": checkboxValues };
		
	    $.ajax({
	        url:"<%=cp%>/message/msgread",
	        type:'POST',
	        data: chkarray,
	        success:function(data){
	            msgLoad();
	        },
	        error:function(jqXHR, textStatus, errorThrown){
	            alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
	            self.close();
	        }
	    });
	}
}

function msgKeep() {
	var f=document.array_form;
	var cnt=0;
	
	if(f.chk==undefined){
		return false;
	}
	if(f.chk.length!=undefined){
		//체크 박스가 둘 이상인 경우
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
		// name이 같은 체크박스의 값들을 배열에 담는다.
	    var checkboxValues = [];
	    $("input[name='chk']:checked").each(function(i) {
	        checkboxValues.push($(this).val());
	    });
		// 사용자 ID(문자열)와 체크박스 값들(배열)을 name/value 형태로 담는다.
	    var chkarray = { "checkArray": checkboxValues };
		
	    $.ajax({
	        url:"<%=cp%>/message/msgkeep",
	        type:'POST',
	        data: chkarray,
	        success:function(data){
	            msgLoad();
	        },
	        error:function(jqXHR, textStatus, errorThrown){
	            alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
	            self.close();
	        }
	    });
	}
}

function msgTrash() {
	var f=document.array_form;
	var cnt=0;
	
	if(f.chk==undefined){
		return false;
	}
	if(f.chk.length!=undefined){
		//체크 박스가 둘 이상인 경우
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
	if(confirm("선택한 게시물을 휴지통으로 이동하시겠습니까?")){		
		// name이 같은 체크박스의 값들을 배열에 담는다.
	    var checkboxValues = [];
	    $("input[name='chk']:checked").each(function(i) {
	        checkboxValues.push($(this).val());
	    });
		// 사용자 ID(문자열)와 체크박스 값들(배열)을 name/value 형태로 담는다.
	    var chkarray = { "checkArray": checkboxValues };
		
	    $.ajax({
	        url:"<%=cp%>/message/msgtrash",
	        type:'POST',
	        data: chkarray,
	        success:function(data){
	            msgLoad();
	        },
	        error:function(jqXHR, textStatus, errorThrown){
	            alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
	            self.close();
	        }
	    });
	}
}

function msgReceive() {
	var f=document.array_form;
	var cnt=0;
	
	if(f.chk==undefined){
		return false;
	}
	if(f.chk.length!=undefined){
		//체크 박스가 둘 이상인 경우
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
	if(confirm("선택한 게시물을 받은 쪽지함으로 이동하시겠습니까?")){		
		// name이 같은 체크박스의 값들을 배열에 담는다.
	    var checkboxValues = [];
	    $("input[name='chk']:checked").each(function(i) {
	        checkboxValues.push($(this).val());
	    });
		// 사용자 ID(문자열)와 체크박스 값들(배열)을 name/value 형태로 담는다.
	    var chkarray = { "checkArray": checkboxValues };
		
	    $.ajax({
	        url:"<%=cp%>/message/msgreceive",
	        type:'POST',
	        data: chkarray,
	        success:function(data){
	            msgLoad();
	        },
	        error:function(jqXHR, textStatus, errorThrown){
	            alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
	            self.close();
	        }
	    });
	}
}

function msgDelete() {
	var f=document.array_form;
	var cnt=0;
	
	if(f.chk==undefined){
		return false;
	}
	if(f.chk.length!=undefined){
		//체크 박스가 둘 이상인 경우
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
	if(confirm("선택한 게시물을 완전히 삭제하시겠습니까?")){		
		// name이 같은 체크박스의 값들을 배열에 담는다.
	    var checkboxValues = [];
	    $("input[name='chk']:checked").each(function(i) {
	        checkboxValues.push($(this).val());
	    });
		// 사용자 ID(문자열)와 체크박스 값들(배열)을 name/value 형태로 담는다.
	    var chkarray = { "checkArray": checkboxValues };
		
	    $.ajax({
	        url:"<%=cp%>/message/msgdelete",
	        type:'POST',
	        data: chkarray,
	        success:function(data){
	            msgLoad();
	        },
	        error:function(jqXHR, textStatus, errorThrown){
	            alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
	            self.close();
	        }
	    });
	}
}

function msgSendDelete() {
	var f=document.array_form;
	var cnt=0;
	
	if(f.chk==undefined){
		return false;
	}
	if(f.chk.length!=undefined){
		//체크 박스가 둘 이상인 경우
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
	if(confirm("선택한 게시물을 완전히 삭제하시겠습니까?")){		
		// name이 같은 체크박스의 값들을 배열에 담는다.
	    var checkboxValues = [];
	    $("input[name='chk']:checked").each(function(i) {
	        checkboxValues.push($(this).val());
	    });
		// 사용자 ID(문자열)와 체크박스 값들(배열)을 name/value 형태로 담는다.
	    var chkarray = { "checkArray": checkboxValues };
		
	    $.ajax({
	        url:"<%=cp%>/message/msgsenddelete",
	        type:'POST',
	        data: chkarray,
	        success:function(data){
	            msgLoad();
	        },
	        error:function(jqXHR, textStatus, errorThrown){
	            alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
	            self.close();
	        }
	    });
	}
}
</script>
<div class="mail-option">
	<c:if test="${mode != 'all'}">
	    <div class="chk-all">
	        <input id="chkAll" type="checkbox" class="mail-checkbox mail-group-checkbox">
	        <div class="btn-group">
	            <a href="#" class="btn mini all" aria-expanded="false">전체선택</a>
	        </div>
	    </div>
		
	    <div class="btn-group"> 
	        <a data-original-title="Refresh" href="javascript:msgLoad();" class="btn mini tooltips">
	            <i class=" fa fa-refresh"></i>
	        </a>
	    </div>
	    <div class="btn-group hidden-phone">
	        <a data-toggle="dropdown" href="#" class="btn mini blue" aria-expanded="false">
	          		작업
	            <i class="fa fa-angle-down "></i>
	        </a>
	        <ul class="dropdown-menu">
	        	<c:if test="${mode == 'receive'}">
	            	<li><a href="javascript:msgRead();"><i class="fa fa-envelope-open-o"></i> 읽음 표시</a></li>
	        		<li><a href="javascript:msgKeep();"><i class="fa fa-folder-o"></i> 보관함으로 이동</a></li>
	            	<li><a href="javascript:msgTrash();"><i class="fa fa-trash-o"></i> 휴지통으로 이동</a></li>
	        	</c:if>
	            <c:if test="${mode == 'trash' || mode == 'keep'}">
	            	<li><a href="javascript:msgReceive();"><i class="fa fa-inbox"></i> 쪽지함으로 이동</a></li>
	            </c:if>
	            <c:if test="${mode == 'trash'}">
					<li><a href="javascript:msgDelete();"><i class="fa fa-inbox"></i> 삭제</a></li>
	            </c:if>
	            <c:if test="${mode == 'send'}">
	            	<li><a href="javascript:msgSendDelete();"><i class="fa fa-trash-o"></i> 삭제</a></li>
	            </c:if>
	        </ul>
    	</div>
	</c:if>
	
    <ul class="unstyled inbox-pagination">
        <li><span>전체 개수 : ${dataCount}</span></li>
    </ul>
</div>
<form name="array_form" id="array_form" method="post"> 	
	<table class="table table-inbox table-hover" style="text-align: center; table-layout: fixed;">
		<tbody>
			<tr>
			<c:if test="${mode != 'all'}">
				<td class="inbox-small-cells" width="55px;"><strong>선택</strong></td>
			</c:if>
			<td class="inbox-small-cells" width="55px;"><strong>읽음</strong></td>
			<td class="inbox-small-cells" width="55px;"><strong>분류</strong></td>
			<td class="view-message" width="80px;"><strong>이름</strong></td>
			<td class="view-message" width="220px;"><strong>제목</strong></td>
			<td class="inbox-small-cells"><strong>보낸날짜</strong></td>
			<td class="inbox-small-cells"><strong>읽은날짜</strong></td>
			</tr>
			<c:forEach var="dto" items="${list}">
				<c:if test="${dto.read == 0}">
					<tr class="unread"> 
				</c:if>
				<c:if test="${dto.read == 1}">
					<tr class="">
				</c:if>
						<c:if test="${mode != 'all'}">
							<td class="inbox-small-cells">
								<input id="checkbox" name="chk" type="checkbox" class="mail-checkbox" value="${dto.num}">
							</td>
						</c:if>
						<td class="view-message">
							<c:if test="${dto.read == 1}"><i class="fa fa-envelope-open-o" aria-hidden="true"></i></c:if>
							<c:if test="${dto.read == 0}"><i class="fa fa-envelope-o" aria-hidden="true"></i></c:if>
						</td>
						<td class="inbox-small-cells">
							<c:if test="${(mode == 'all' && dto.recv_Id == sessionScope.member.userId) || mode == 'receive' || mode == 'keep' || mode == 'trash'}">
							받음
							</c:if>
							<c:if test="${(mode == 'all' && dto.sent_Id == sessionScope.member.userId) || mode == 'send'}">
							보냄
							</c:if>
						</td>
						<td class="view-message" style="text-overflow:ellipsis; overflow:hidden">
							<c:if test="${(mode == 'all' && dto.recv_Id == sessionScope.member.userId) || mode == 'receive' || mode == 'keep' || mode == 'trash'}">
								<nobr><a href="javascript:sendMsg('${dto.sent_Id}');" data-toggle="modal">${dto.sent_Name}</a></nobr>
							</c:if>
							<c:if test="${(mode == 'all' && dto.sent_Id == sessionScope.member.userId) || mode == 'send'}">
								<nobr><a href="javascript:sendMsg('${dto.recv_Id}');" data-toggle="modal">${dto.recv_Name}</a></nobr>
							</c:if>
						</td>
						<td class="view-message text-left" style="text-overflow:ellipsis; overflow:hidden"> 
							<nobr><a href="javascript:readMsg('${dto.num}');" data-toggle="modal">${dto.content}</a></nobr>
						</td>
						<td class="inbox-small-cells">${dto.date_Sent}</td>
						<td class="inbox-small-cells">${dto.date_Read}</td>
					</tr>
			</c:forEach>
		</tbody>
	</table>
</form>
<div style="text-align: center;">${paging}</div>
