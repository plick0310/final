<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<script type="text/javascript">
$(document).ready(function() {
    var panels = $('.user-infos');
    var panelsButton = $('.dropdown-user');
    panels.hide();

    //Click dropdown
    panelsButton.click(function() {
        //get data-for attribute
        var dataFor = $(this).attr('data-for');
        var idFor = $(dataFor);

        //current button
        var currentButton = $(this);
        idFor.slideToggle(400, function() {
            //Completed slidetoggle
            if(idFor.is(':visible'))
            {
                currentButton.html('<i class="glyphicon glyphicon-chevron-up text-muted"></i>');
            }
            else
            {
                currentButton.html('<i class="glyphicon glyphicon-chevron-down text-muted"></i>');
            }
        })
    });


    $('[data-toggle="tooltip"]').tooltip();

});
</script>
<style>
.user-row {
    margin-bottom: 14px;
}

.user-row:last-child {
    margin-bottom: 0;
}

.dropdown-user {
    margin: 13px 0;
    padding: 5px;
    height: 100%;
}

.dropdown-user:hover {
    cursor: pointer;
}

.table-user-information > tbody > tr {
    border-top: 1px solid rgb(221, 221, 221);
}

.table-user-information > tbody > tr:first-child {
    border-top: 0;
}


.table-user-information > tbody > tr > td {
    border-top: 0;
}
.toppad
{margin-top:20px;
}

</style>
<div class="container">
	<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xs-offset-0 col-sm-offset-0 col-md-offset-3 col-lg-offset-3 toppad" >
		<div class="panel panel-info">
    		<div class="panel-heading">
      			<h3 class="panel-title">${dto.userName}님의 정보</h3>
    		</div>
    		<div class="panel-body">
      			<div class="row">
        			<div class="col-md-3 col-lg-3 " align="center">
        				<c:if test="${empty sessionScope.member.userImg}">
							<img src="<%=cp%>/resource/img/noprofileimg.png" class="thumbnail" width="125px" height="125px">
						</c:if>
						<c:if test="${not empty sessionScope.member.userImg}">
							<img src="<%=cp%>/uploads/member/userImg/${sessionScope.member.userImg}" class="thumbnail" width="125px" height="125px">
						</c:if>
        			</div>
            			<div class=" col-md-9 col-lg-9 "> 
              				<table class="table table-user-information">
				                <tbody>
				                  <tr>
				                    <td>이메일:</td>
				                    <td><a href="${dto.userId}">${dto.userId}</a></td>
				                  </tr>
				                  <tr>
				                    <td>닉네임:</td>
				                    <td>${dto.userName}</td>
				                  </tr>
				                  <tr>
				                    <td>성별:</td>
				                    <c:if test="${dto.enabled == 1}">
					                    <td>남자</td>
				                    </c:if>
				                    <c:if test="${dto.enabled == 2}">
					                    <td>여자</td>
				                    </c:if>
				                    <c:if test="${dto.enabled == 0}">
					                    <td>비공개</td>
				                    </c:if>
				                  </tr>
				                  <tr>
				                    <td>포인트:</td>
				                    <td>${dto.point}</td>
				                  </tr>
				                  <tr>
				                    <td>생일:</td>
				                    <td>${dto.birth}</td>
				                  </tr>
				                  <tr>
				                    <td>연락처:</td>
				                    <td>${dto.tel}</td>
				                  </tr>
				                  <tr>
				                    <td>자기소개:</td>
				                    <td><textarea rows="3" cols="33" disabled="disabled" style="resize: none;">${dto.introduce}</textarea></td>
				                  </tr>
				                  <tr>
				                  <tr>
				                    <td>회원가입일:</td>
				                    <td>${dto.created_date}</td>
				                  </tr>
				                  <tr>
				                    <td>정보수정일:</td>
				                    <td>${dto.modify_date}</td>
				                  </tr>
				                  <tr>
				                    <td>최근접속일:</td>
				                    <td>${dto.last_login}</td>
				                  </tr>
				                  <tr>
				                    <td>회원상태:</td>
				                    <c:if test="${dto.enabled == 1}">
					                    <td>정상</td>
				                    </c:if>
				                    <c:if test="${dto.enabled != 1}">
					                    <td>정지</td>
				                    </c:if>
				                  </tr>
				                </tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="panel-footer" style="height: 50px;">
                    <c:if test="${sessionScope.member.userId != dto.userId or sessionScope.member.userId == 'admin'}"><a href="#" data-original-title="Send this Message" data-toggle="tooltip" type="button" class="btn btn-sm btn-primary"><i class="glyphicon glyphicon-envelope"></i></a></c:if>
                    <span class="pull-right"> 
                        <c:if test="${sessionScope.member.userId == dto.userId}"><a href="#" data-original-title="Edit this user" data-toggle="tooltip" type="button" class="btn btn-sm btn-warning"><i class="glyphicon glyphicon-edit"></i></a></c:if>
                        <c:if test="${sessionScope.member.userId == 'admin'}"><a href="#" data-original-title="Remove this user" data-toggle="tooltip" type="button" class="btn btn-sm btn-danger"><i class="glyphicon glyphicon-remove"></i></a></c:if>
                    </span>
                </div>
			</div>
		</div>
	</div>
</div>