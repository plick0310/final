<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<style>
select:focus {
	outline:  none;
}
.wrapper {
  display: block;
  margin: 10px auto;
  border: 1px solid #555;
  width: 550px;
  height: 350px;
  position: relative;
}
p{text-align:center;}
.label {
  height: 1em;
  padding: .3em;
  background: rgba(255, 255, 255, .8);
  position: absolute;
  display: none;
  color:#333;
}
</style>




<!-- 차트 -->
	<div style="clear: both;">
    	<div id="lineContainer1" style="width: 450px; height: 300px; float: left; margin: 10px;"></div>
    </div>

<form name="challListForm">
	<table cellpadding="0" cellspacing="0" style="width: 430px;margin-bottom: 60px;float: right;"
		class="board_table array">
		<c:forEach items="${challengeList }" var="dto" varStatus="status" >
			<tr>
				<td class="___number"
					style="font-size: 11px; color: #666; text-align: center; font-weight: bold;">${dto.challNum }</td>
				<td style="padding: 9px 5px; border-bottom: 1px solid #EEEEEE;">
					<div style="position: relative;">
						<a href="#" class="subject"
							style="font-size: 15px; font-weight: bold; color: #373737;">${dto.examinfoName }</a>
						<span class="comment"
							style="display: inline-block; padding: 1px 7px 7px 7px; margin-left: 15px; color: #1abc9c; font-weight: bold; font-size: 15px; line-height: 8px; vertical-align: middle;">
							[ ${dto.questionSubject } ] </span>
		
						<div class="info" id="totalResult">
							<strong>응시일: &nbsp;&nbsp;</strong> <span class="dateWrap" id="examdate"
								title="[datetime]">${dto.examdate }</span> <span class="__dotted"></span>
							<strong>주최기관:&nbsp;&nbsp;</strong><span>${dto.examinfoOrgan }</span> <br>
							<strong>성적: &nbsp;&nbsp;</strong>
							<span style="font-size: 20px; color:red;" id="result">${dto.result }점</span>&nbsp; 
						</div>
		
						<div class="likes"
							style="line-height: 23px; position: absolute; top: -8px; right: 10px; background: #fff; padding: 9px 5px 5px 5px; display: block; width: 61px; height: 41px; text-align: center; font-size: 16px; letter-spacing: -1px; color: #666666; font-weight: bold;">
							<br> 
							<span class="num" style="color: #1abc9c; font-size: 18px; font-weight: bold; font-family: tahoma;">${dto.pass}</span>
						</div>
					</div>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</form>
${paging2 }