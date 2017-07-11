<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>

<table cellpadding="0" cellspacing="0" style="width: 100%;"
	class="board_table array">
	<c:forEach items="${examwishList }" var="dto" varStatus="status">
		<tbody>
			<tr>
				<td class="___number"
					style="font-size: 11px; color: #666; text-align: center; font-weight: bold;">1</td>
				<td style="padding: 9px 5px; border-bottom: 1px solid #EEEEEE;">
					<div style="position: relative;">
						<!--[category_name]-->
	
						<a href="#" class="subject" 
							style="font-size: 15px; font-weight: bold; color: #373737;">정보처리기사</a>
						<span class="comment"
							style="display: inline-block; padding: 1px 7px 7px 7px; margin-left: 15px; color: #1abc9c; font-weight: bold; font-size: 15px; line-height: 8px; vertical-align: middle;">
							[17년 2회차 ] </span>
	
						<div class="info">
							<strong>등록일 :</strong>&nbsp; <span class="dateWrap"
								title="[datetime]">2017-06-19</span> <span class="__dotted"></span>
	
							<strong>주최기관 :</strong> &nbsp; <span>큐넷(Q-net)</span>
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
<div style="width: 900px; margin: 20px auto; text-align: center;">1 2 3</div>

<div class="scArea" style="float: right;margin-top: -163px;width: 152px;">
	<label class="sr-only" for="exampleInputAmount">Amount (in dollars)</label>
	<div class="input-group" style="width: 151px;">
		<input type="text" class="form-control" id="exampleInputAmount" placeholder="시험명으로 검색" 
			style="height:28px; border:1px solid gray; border-right:none; padding-right: 0; padding-left: 3px; border-radius: 0;">
			<div class="input-group-addon"
			style="background:none; border:1px solid gray; border-left:none; cursor: pointer;padding-left: 1px; padding-right: 5px; border-radius: 0;"
			onclick=""><i class="fa fa-search"></i></div>
	</div>
</div>
