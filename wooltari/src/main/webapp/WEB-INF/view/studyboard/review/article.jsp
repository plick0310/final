<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>

<form name="reviewForm" method="post">
	<div>
		<table>
			<tr style="height: 150px;">
				<td style="width: 270px;">제목:${dto.subject }<br>스터디명:${dto.studyName }<br>작성자:${dto.userName }<br>평점:<span id="countStar">${star}</span>(<span id="countMany">${many}</span>명)<br>조회수:${dto.hitCount }</td>
				<td><img src="<%=cp%>/uploads/review/${dto.imageFileName}" onerror="this.src='<%=cp%>/resource/images/reviewPhoto/pp.jpg'" style="height: 176px; width: 200px; margin-bottom: 3px; margin-top: -10px; border-radius: 10%;"></td>
		
			</tr>
			<tr>
				<td colspan="2"><textarea style="width: 471px; height: 290px;" readonly="readonly">${dto.content }</textarea></td>
			</tr>
		

		</table>
	</div>
	
	 
	<span class="star-input" >
	   <span class="input">
			    <input type="radio" name="star-input" id="p1" value="1"><label for="p1">1</label>
			    <input type="radio" name="star-input" id="p2" value="2"><label for="p2">2</label>
			    <input type="radio" name="star-input" id="p3" value="3"><label for="p3">3</label>
			    <input type="radio" name="star-input" id="p4" value="4"><label for="p4">4</label>
			    <input type="radio" name="star-input" id="p5" value="5"><label for="p5">5</label>
			    <input type="radio" name="star-input" id="p6" value="6"><label for="p6">6</label>
			    <input type="radio" name="star-input" id="p7" value="7"><label for="p7">7</label>
			    <input type="radio" name="star-input" id="p8" value="8"><label for="p8">8</label>
			    <input type="radio" name="star-input" id="p9" value="9"><label for="p9">9</label>
			    <input type="radio" name="star-input" id="p10" value="10"><label for="p10">10</label>
			   
				<input type="hidden" name="num" value="${dto.num }">
				<input type="hidden" name="page" value=${page }>
				<input type="hidden" name="userId" value="${dto.userId }">
			    
	    </span>
	 </span>
</form>	 