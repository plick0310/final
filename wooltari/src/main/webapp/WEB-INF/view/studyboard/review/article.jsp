<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>



<form name="reviewForm"  method="POST">	
	<div>
	
		<ul>
  
			<li style="height: 900px; width: 900px; display: inline-block; position: relative; cursor: pointer; padding: 0;" onclick="">
				<a style="margin: 10px; text-decoration: none; color: inherit; position: absolute; right: 0; top: 0; z-index: 30;">
					<div class='icon' style="font-size: 30px; color: #fff;" >
						<span class="glyphicon glyphicon-heart-empty"></span>
					</div>
				</a>
					<div class='card-cover' style="left: 0; position: absolute; right: 0; top: 0; z-index: 20; height: 490px;">
					
						<div class='img-container' style="height: 400px; position: relative; ">
							<div class='content-top' style="cursor: default; position: absolute; top: 0;">
								<div class='label' style="font-size: 24px; margin: 10px; padding: 0 8px; background: #fff; border-radius: 4px; color: #757575; float: left; height: 30px; line-height: 30px;">${dto.studyName }</div>
							</div>
								<div class='expiry-date' style="background: #1abc9c; bottom: 0; color: #fff; display: inline-block; font-size: 14px; font-weight: 500; height: 22px; left: 0; line-height: 22px; padding: 0 10px; position: absolute;">작성일:${dto.created }</div>
								<img src="<%=cp%>/uploads/review/${dto.imageFileName}" onerror="this.src='<%=cp%>/resource/images/reviewPhoto/pp.jpg'" style="width: 100%; height: 100%;">
						</div>
						<div class='content-box' style="height: 90px; padding: 10px; border: 1px solid #e0e0e0; border-top: 0; position: relative; overflow: hidden;">
							<div class='name' style="font-size: 25px; color: #393635; font-weight: 600; line-height: 20px; text-overflow: ellipsis; overflow: hidden; word-wrap:break-word; display: -webkit-box; -webkit-line-clamp:2; height: 40px; -webkit-box-orient:vertical;">${dto.subject }</div>
								<div style="margin-top: 10px; font-size: 14px;">[카테고리:${dto.category }][조회수:${dto.hitCount }]&nbsp;[글쓴이:${dto.userName }]</div>
							<div class='price' style="bottom: -25px; right: 10px; color: #3e92d6; font-size: 18px; line-height: 19px; position: absolute;">
								<span id="countStar" style="font-size: 21px;">
							<c:if test="${star ==5}">
								<i class="glyphicon glyphicon-star" style="color: gray;"></i>
								<i class="glyphicon glyphicon-star" style="color: gray;"></i>
								<i class="glyphicon glyphicon-star" style="color: gray;"></i>
								<i class="glyphicon glyphicon-star" style="color: gray;"></i>
								<i class="glyphicon glyphicon-star" style="color: gray;"></i>
							</c:if>
							<c:if test="${star ==4}">
								<i class="glyphicon glyphicon-star" style="color: gray;"></i>
								<i class="glyphicon glyphicon-star" style="color: gray;"></i>
								<i class="glyphicon glyphicon-star" style="color: gray;"></i>
								<i class="glyphicon glyphicon-star" style="color: gray;"></i>
								<i class="glyphicon glyphicon-star-empty" style="color: gray;"></i>
							</c:if>
							<c:if test="${star ==3}">
								<i class="glyphicon glyphicon-star" style="color: gray;"></i>
								<i class="glyphicon glyphicon-star" style="color: gray;"></i>
								<i class="glyphicon glyphicon-star" style="color: gray;"></i>
								<i class="glyphicon glyphicon-star-empty" style="color: gray;"></i>
								<i class="glyphicon glyphicon-star-empty" style="color: gray;"></i>
							</c:if>
							<c:if test="${star ==2}">
								<i class="glyphicon glyphicon-star" style="color: gray;"></i>
								<i class="glyphicon glyphicon-star" style="color: gray;"></i>
								<i class="glyphicon glyphicon-star-empty" style="color: gray;"></i>
								<i class="glyphicon glyphicon-star-empty" style="color: gray;"></i>
								<i class="glyphicon glyphicon-star-empty" style="color: gray;"></i>
							</c:if>
							<c:if test="${star ==1}">
								<i class="glyphicon glyphicon-star" style="color: gray;"></i>
								<i class="glyphicon glyphicon-star-empty" style="color: gray;"></i>
								<i class="glyphicon glyphicon-star-empty" style="color: gray;"></i>
								<i class="glyphicon glyphicon-star-empty" style="color: gray;"></i>
								<i class="glyphicon glyphicon-star-empty" style="color: gray;"></i>
							</c:if>
							<c:if test="${star ==0}">
								<i class="glyphicon glyphicon-star-empty" style="color: gray;"></i>
								<i class="glyphicon glyphicon-star-empty" style="color: gray;"></i>
								<i class="glyphicon glyphicon-star-empty" style="color: gray;"></i>
								<i class="glyphicon glyphicon-star-empty" style="color: gray;"></i>
								<i class="glyphicon glyphicon-star-empty" style="color: gray;"></i>
							</c:if>
						</span>
					<%-- (<span style="font-size: 55px;" id="countMany">${many}</span>명) --%>
					<span>(</span><span style="font-size: 55px; color: #1abc9c;" id="countMany" >${many }</span><span>명)</span>
							</div>
						</div>
					
					</div>
					<div class="reviewContent" style="height: 347px; width: 100%; margin-top: 500px; padding-left: 10px; font-size: 17px;">
					${dto.content }
					</div>
		
			<span class="star-input" >
			   <span class="input" style="margin-top: 20px;">
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
		
		</li>
		
      </ul>
  
	</div>
	
	    </form>
	
	
