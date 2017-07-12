<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<style>
textarea {
    background: #FFF;
    border:1px solid #dddddd;
    color: #000;
}
</style>
<div class="panel-heading">
    <h3 class="panel-title">${dto.userName}님의 정보</h3>
    <hr>
</div>
<div class="panel-body">
    <div class="row">
        <div class="col-md-3 col-lg-3 " align="center">
            <c:if test="${empty sessionScope.member.userImg}">
                <img src="<%=cp%>/resource/img/noprofileimg.png" class="thumbnail" width="200px" height="200px"> </c:if>
            <c:if test="${not empty sessionScope.member.userImg}">
                <img src="<%=cp%>/uploads/member/userImg/${sessionScope.member.userImg}" class="thumbnail" width="200px" height="200px"> </c:if>
        </div>
        <div class=" col-md-9 col-lg-9 ">
            <table class="table table-user-information">
                <tbody>
                    <tr>
                        <td>
							이메일:
                        </td>
                        <td>
                            ${dto.userId}
                        </td>
                    </tr>
                    <tr>
                        <td>
							닉네임:
                        </td>
                        <td>
                            ${dto.userName}
                        </td>
                    </tr>
                    <tr>
                        <td>
							성별:
                        </td>
                        <c:if test="${dto.gender==0}">
                            <td>
                            </td>
                        </c:if>
                        <c:if test="${dto.gender==1}">
                            <td>
								남자
                            </td>
                        </c:if>
                        <c:if test="${dto.gender==2}">
                            <td>
								여자
                            </td>
                        </c:if>
                        <c:if test="${dto.gender==3}">
                            <td>
								비공개
                            </td>
                        </c:if>
                    </tr>
                    <tr>
                        <td>
							포인트:
                        </td>
                        <td>
                            ${dto.point}
                        </td>
                    </tr>
                    <tr>
                        <td>
							생일:
                        </td>
                        <td>
                            ${dto.birth}
                        </td>
                    </tr>
                    <tr>
                        <td>
							연락처:
                        </td>
                        <td>
                            ${dto.tel}
                        </td>
                    </tr>
                    <tr>
                        <td>
							주소:
                        </td>
                        <td>
                        	<c:if test="${not empty dto.zipcode}">
                            	(${dto.zipcode})&nbsp;&nbsp;${dto.addr1}&nbsp;&nbsp;${dto.addr2}
                            </c:if>
                        </td>
                    </tr>
                    <tr>
                        <td>
							자기소개:
                        </td>
                        <td>
                            <textarea rows="3" cols="65" disabled="disabled" style="resize: none;">${dto.introduce}</textarea>
                        </td>
                    </tr>
                    <tr>
                        <tr>
                            <td>
								회원가입일:
                            </td>
                            <td>
                                ${dto.created_date}
                            </td>
                        </tr>
                        <tr>
                            <td>
								정보수정일:
                            </td>
                            <td>
                                ${dto.modify_date}
                            </td>
                        </tr>
                        <tr>
                            <td>
								최근접속일:
                            </td>
                            <td>
                                ${dto.last_login}
                            </td>
                        </tr>
                        <tr>
                            <td>
								회원상태:
                            </td>
                            <c:if test="${dto.enabled==0}">
                                <td>
									탈퇴
                                </td>
                            </c:if>
                            <c:if test="${dto.enabled==1}">
                                <td>
									정상
                                </td>
                            </c:if>
                            <c:if test="${dto.enabled==2}">
                                <td>
									정지
                                </td>
                            </c:if>
                        </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>