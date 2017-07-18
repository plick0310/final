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

<div>

	<div>��α�</div>${dataCount }��
	<c:forEach var="dto" items="${list }">
		<ul>
			<li style="clear: both;">
				<div class="thumb">�����κ�</div>
				<dl style="padding-top: 3px; overflow: hidden; line-height: 19px; display: block;">
					<dt style="display: inline; clear: both; margin-right: 5px; ">���̹� PC ���հ˻� ����!${dto.studyName }</dt>
					<dd class="txt_inline" style="clear: both; margin: 2px 0 1px; font-size: 12px; line-height: 18px; display: inline;">2014.09.05.</dd>
					<dd>����DB�� ���Ͽ� ����/���� ������ ��������, ������� �˻��ǵ��� ���� �������� �÷��ǰ� ������ ���������� �����Ͽ����ϴ�. ���̹� ���հ˻��� �����ε�...</dd>
				</dl>
			</li>
		</ul>
	</c:forEach>
	<div class="section_more">������</div>
	
</div>

