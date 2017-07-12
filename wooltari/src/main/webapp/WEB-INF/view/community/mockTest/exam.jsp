<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>

<table cellpadding="0" cellspacing="0" style="width: 100%;"
	class="board_table array">
	<c:forEach items="${examtestList }" var="dto" varStatus="status">
		<tbody>
			<tr>
			<c:if test="${sessionScope.member.userId eq 'admin' }">
				<td style="text-align: right; width: 65px; padding: 5px 18px;">
					<input type="checkbox" name="nums" value="${dto.num }">
				</td>
			</c:if>
				<td class="___number"
					style="font-size: 11px; color: #666; text-align: center; font-weight: bold;">${dto.examlistNum}</td>
				<td style="padding: 9px 5px; border-bottom: 1px solid #EEEEEE;">
					<div style="position: relative;">
						<!--[category_name]-->
	
						<a href="#" class="subject" 
							style="font-size: 15px; font-weight: bold; color: #373737;">${dto.examInfoName }</a>
						<span class="comment"
							style="display: inline-block; padding: 1px 7px 7px 7px; margin-left: 15px; color: #1abc9c; font-weight: bold; font-size: 15px; line-height: 8px; vertical-align: middle;">
							[ ${dto.questionSubject} ] </span>
	
						<div class="info">
							<strong>등록일 :</strong>&nbsp; <span class="dateWrap"
								title="[datetime]">${dto.created }</span> <span class="__dotted"></span>
	
							<strong>주최기관 :</strong> &nbsp; <span>${dto.examInfoOrgan }</span>
						</div>
	
						<div class="likes" style="font-size: 13px; width: 60px;">
							응시하기<br> <span class="num" style="color: #1abc9c;"> <a
								target="_blank" onclick="popupLink(550,1000)"
								style="width: 100px; height: 100px;"> <span
									class="glyphicon glyphicon-circle-arrow-right"></span>
							</a>
							</span>
						</div>
					</div>
				</td>
			</tr>
		</tbody>
	</c:forEach>
</table>
<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
   <tr height="35">
	<td align="center">
       <c:if test="${dataCount==0 }">
           등록된 게시물이 없습니다.
       </c:if>
       <c:if test="${dataCount!=0 }">
           ${paging}
       </c:if>
	</td>
   </tr>
</table>
