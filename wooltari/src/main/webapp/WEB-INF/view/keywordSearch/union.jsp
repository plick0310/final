<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
   request.setCharacterEncoding("utf-8");
   String cp=request.getContextPath();
%>

<style>
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


</style>

<div style="margin-left: 400px; margin-right: 600px;">
	<div>
		<ul style="float: left; display: block; text-align: left;">
			<li style="float: left; position: relative; list-style-type: none; font-family: '����',gulim,helvetica,sans-serif">���հ˻�</li>
			<li style="float: left; position: relative; list-style-type: none; font-family: '����',gulim,helvetica,sans-serif">���͵�</li>
			<li style="float: left; position: relative; list-style-type: none; font-family: '����',gulim,helvetica,sans-serif">ȫ��</li>
		</ul>
	</div>
			<c:if test="${dataCount!='0' }">
				<div style="clear: both;">���͵�</div>
				<c:forEach var="dto" items="${list }">
					<ul>
						<li style="clear: both;">
							<div class="thumb" >
								<img src="<%=cp%>/uploads/member/userImg/${dto.imageFileName}" style="width: 82px; height: 82px;" onerror="this.src='<%=cp%>/resource/images/reviewPhoto/noImage.png'">
							</div>
							<dl style="padding-top: 3px; overflow: hidden; line-height: 19px; display: block;">
								<dt style="display: inline; clear: both; margin-right: 5px; ">���͵��:&nbsp;&nbsp;&nbsp;${dto.studyName }</dt>&nbsp;&nbsp;&nbsp;&nbsp;
								<dd class="txt_inline" style="clear: both; margin: 2px 0 1px; font-size: 12px; line-height: 18px; display: inline;">������|2014.09.05.</dd>
								<c:if test="${dto.range=='0'}"><dt>[��ü����][${dto.gender }][${dto.recruit }��]</dt></c:if>
								<c:if test="${dto.range=='1'}"><dt>[�����][${dto.gender }][${dto.recruit }��]</dt></c:if>
								<dd>&nbsp;&nbsp;&nbsp;${dto.study_Info }</dd>
													
								<c:if test="${dto.range=='1' }"><dd><a onclick="alert('����� ���͵��Դϴ�.');">���͵� �����ϱ�</a></dd></c:if>
							</dl>
						</li>
					</ul>
				</c:forEach>
				
				<c:if test="${dataCount>=4 }">
				<div class="section_more"><a onclick="location.href='<%=cp %>/keyword/studySearch?keyword=${keyword }';">������</a></div>
				</c:if>
				
				<hr style="width: 100%; background: gray; height: 1px;">
				
			</c:if>	
</div>

