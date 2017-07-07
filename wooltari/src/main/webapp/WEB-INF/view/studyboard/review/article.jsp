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
				<td style="width: 270px; font-size: 15px; font-weight: bold;" >
					제목:${dto.subject }<br>
					<br>스터디명:${dto.studyName }<br>
					<br>작성자:${dto.userName }<br>
					<br>평점:
						<span id="countStar">
							<c:if test="${star ==5}">
								<i class="glyphicon glyphicon-star" style="color: #F15F5F;"></i>
								<i class="glyphicon glyphicon-star" style="color: #F15F5F;"></i>
								<i class="glyphicon glyphicon-star" style="color: #F15F5F;"></i>
								<i class="glyphicon glyphicon-star" style="color: #F15F5F;"></i>
								<i class="glyphicon glyphicon-star" style="color: #F15F5F;"></i>
							</c:if>
							<c:if test="${star ==4}">
								<i class="glyphicon glyphicon-star" style="color: #F15F5F;"></i>
								<i class="glyphicon glyphicon-star" style="color: #F15F5F;"></i>
								<i class="glyphicon glyphicon-star" style="color: #F15F5F;"></i>
								<i class="glyphicon glyphicon-star" style="color: #F15F5F;"></i>
								<i class="glyphicon glyphicon-star-empty" style="color: #F15F5F;"></i>
							</c:if>
							<c:if test="${star ==3}">
								<i class="glyphicon glyphicon-star" style="color: #F15F5F;"></i>
								<i class="glyphicon glyphicon-star" style="color: #F15F5F;"></i>
								<i class="glyphicon glyphicon-star" style="color: #F15F5F;"></i>
								<i class="glyphicon glyphicon-star-empty" style="color: #F15F5F;"></i>
								<i class="glyphicon glyphicon-star-empty" style="color: #F15F5F;"></i>
							</c:if>
							<c:if test="${star ==2}">
								<i class="glyphicon glyphicon-star" style="color: #F15F5F;"></i>
								<i class="glyphicon glyphicon-star" style="color: #F15F5F;"></i>
								<i class="glyphicon glyphicon-star-empty" style="color: #F15F5F;"></i>
								<i class="glyphicon glyphicon-star-empty" style="color: #F15F5F;"></i>
								<i class="glyphicon glyphicon-star-empty" style="color: #F15F5F;"></i>
							</c:if>
							<c:if test="${star ==1}">
								<i class="glyphicon glyphicon-star" style="color: #F15F5F;"></i>
								<i class="glyphicon glyphicon-star-empty" style="color: #F15F5F;"></i>
								<i class="glyphicon glyphicon-star-empty" style="color: #F15F5F;"></i>
								<i class="glyphicon glyphicon-star-empty" style="color: #F15F5F;"></i>
								<i class="glyphicon glyphicon-star-empty" style="color: #F15F5F;"></i>
							</c:if>
							<c:if test="${star ==0}">
								<i class="glyphicon glyphicon-star-empty" style="color: #F15F5F;"></i>
								<i class="glyphicon glyphicon-star-empty" style="color: #F15F5F;"></i>
								<i class="glyphicon glyphicon-star-empty" style="color: #F15F5F;"></i>
								<i class="glyphicon glyphicon-star-empty" style="color: #F15F5F;"></i>
								<i class="glyphicon glyphicon-star-empty" style="color: #F15F5F;"></i>
							</c:if>
						</span>
					(<span id="countMany">${many}</span>명)<br>
					<br>조회수:${dto.hitCount }
				</td>
				
				<td><img src="<%=cp%>/uploads/review/${dto.imageFileName}" onerror="this.src='<%=cp%>/resource/images/reviewPhoto/pp.jpg'" style="height: 176px; width: 200px; margin-bottom: 3px; margin-top: -10px; border-radius: 10%;"></td>
		
			</tr>
			<tr>
				<td colspan="2"><textarea style="width: 471px; height: 290px;" readonly="readonly">${dto.content }</textarea></td>
			</tr>
			

		</table>
	</div>
	
	<span class="star-input" >
	   <span class="input">
			    <input type="radio" name="star-input" id="p2" value="1"><label for="p2">1</label>
			    <input type="radio" name="star-input" id="p4" value="2"><label for="p4">2</label>
			    <input type="radio" name="star-input" id="p6" value="3"><label for="p6">3</label>
			    <input type="radio" name="star-input" id="p8" value="4"><label for="p8">4</label>
			    <input type="radio" name="star-input" id="p10" value="5"><label for="p10">5</label>
			    
			    <!-- <input type="radio" name="star-input" id="p6" value="6"><label for="p6">6</label>
			    <input type="radio" name="star-input" id="p7" value="7"><label for="p7">7</label>
			    <input type="radio" name="star-input" id="p8" value="8"><label for="p8">8</label>
			    <input type="radio" name="star-input" id="p9" value="9"><label for="p9">9</label>
			    <input type="radio" name="star-input" id="p10" value="10"><label for="p10">10</label> -->
			   
				<input type="hidden" name="num" value="${dto.num }">
				<input type="hidden" name="page" value=${page }>
				<input type="hidden" id="userId" value="${dto.userId }">
			    
	    </span>
	 </span>
</form>	 