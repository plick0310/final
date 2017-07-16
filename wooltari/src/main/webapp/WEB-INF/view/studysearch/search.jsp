<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<link rel="stylesheet" href="<%=cp%>/resource/css/search.css">

<div class="container">
	<div class="section-question">
	   <div class="question-title">스터디 인원을 입력해 주세요</div>
	   <div class="question-answer">
	      <select name="recruit">
	         <option value="2">2명</option>
	         <option value="3">3명</option>
	         <option value="4">4명</option>
	         <option value="5">5명</option>
	         <option value="6">6명 이상</option>
	      </select>
	   </div>
	</div>

	<div class="section-question">
		<div class="question-title">스터디 대상을 선택해 주세요</div>
		<div class="question-answer">
			<div class="row targetWrap">
				<div class="col-lg-3 col-md-3 col-sm-4 col-xs-6 targetBox" style="padding: 2px;">
					<input type="checkbox" name="target" id="LTA00" value="초등학생" />
					<label class="targetProperty" for="LTA00">초등학생</label>
				</div>
				<div class="col-lg-3 col-md-3 col-sm-4 col-xs-6 targetBox" style="padding: 2px;">
					<input type="checkbox" name="target" id="LTA01" value="중학생" />
					<label class="targetProperty" for="LTA01">중학생</label>
				</div>
	
				<div class="col-lg-3 col-md-3 col-sm-4 col-xs-6 targetBox" style="padding: 2px;">
					<input type="checkbox" name="target" id="LTA02" value="고등학생" />
		            <label class="targetProperty" for="LTA02">고등학생</label>
				</div>
	
				<div class="col-lg-3 col-md-3 col-sm-4 col-xs-6 targetBox" style="padding: 2px;">
					<input type="checkbox" name="target" id="LTA03" value="대학생" />
					<label class="targetProperty" for="LTA03">대학생</label>
				</div>
	
				<div class="col-lg-3 col-md-3 col-sm-4 col-xs-6 targetBox" style="padding: 2px;">
					<input type="checkbox" name="target" id="LTA04" value="직장인" />
					<label class="targetProperty" for="LTA04">직장인</label>
				</div>
	         
	         	<div class="col-lg-3 col-md-3 col-sm-4 col-xs-6 targetBox" style="padding: 2px;">
					<input type="checkbox" name="target" id="LTA05" value="주부" />
					<label class="targetProperty" for="LTA05">주부</label>
				</div>
	         
				<div class="col-lg-3 col-md-3 col-sm-4 col-xs-6 targetBox" style="padding: 2px;">
					<input type="checkbox" name="target" id="LTA06" value="입시생" />
					<label class="targetProperty" for="LTA06">입시생</label>
				</div>
			</div>
		</div>
	</div>

	<div class="section-question">
		<div class="question-title">스터디 성별를 선택해 주세요</div>
		<div class="question-answer">
			<div class="row targetWrap">
				<div class="col-lg-3 col-md-3 col-sm-4 col-xs-6 targetBox" style="padding: 2px;">
					<input type="radio" name="gender" id="LTB00" value="무관" />
					<label class="targetProperty" for="LTB00">무관</label>
				</div>

				<div class="col-lg-3 col-md-3 col-sm-4 col-xs-6 targetBox" style="padding: 2px;">
					<input type="radio" name="gender" id="LTB01" value="여자" />
					<label class="targetProperty" for="LTB01">여자</label>
				</div>

				<div class="col-lg-3 col-md-3 col-sm-4 col-xs-6 targetBox" style="padding: 2px;">
					<input type="radio" name="gender" id="LTB02" value="남자" />
					<label class="targetProperty" for="LTB02">남자</label>
				</div>
			</div>
		</div>
	</div>


	<div class="section-question">
		<div class="question-title">스터디 카테고리를 선택해 주세요</div>
		<div class="question-answer">
			<div class="row targetWrap">
				<select id="bigCategory" class="selectField" onchange="themeList();" style="width: 45%;">
					<option value="">:: 대분류 ::</option>
					<%-- 
					<c:foreach var="vo" items="${listBigCategory}">
						<option value="${vo.categoryNum}">${vo.subject}</option>
					</c:foreach>
					 --%>
				</select>
				<select id="smallCategory" class="selectField" style="width: 45%;">
					<option value="">:: 중분류 ::</option>
				</select>
				<div id="select_category">
				</div>
			</div>
		</div>
	</div>
	<div class="section-question">
		<div class="question-title">스터디 활동 지역을 선택해 주세요</div>
		<div class="question-answer">
			<div class="row targetWrap">
				<select id="bigCity" class="selectField" onchange="cityList();" style="width: 45%;">
					<option value="">:: 대분류 ::</option>
					<%-- 
					<c:foreach var="vo" items="${listBigCity}">
						<option value="${vo.cityNum}">${vo.cityName}</option>
					</c:foreach>
					 --%>
				</select>
				<select id="smallCity" class="selectField" style="width: 45%;">
					<option value="">:: 중분류 ::</option>
				</select>
				<div id="select_city">
				</div>
			</div>
		</div>
	</div>
               
	<c:forEach begin="1" end="10" step="1">
		<div class="col-lg-4 col-md-6 col-sm-12 col-xs-12 default-list-box study-item-wrap">
			<a href="/teacher/12">
				<div class="study-item list-item align-left" data-lat="" data-lng="" data-index="">
					<div class="study-item-overlay">
					</div>
					<div class="header-bg" style="background-image:url('')">
					</div>
					<div class="header-text-container">
						<div class="isPayment">
						카테고리
						</div>
						<div class="header-text align-left">
							<div class="title-wrap">
								<div class="title">
								스터디 제목
								</div>
							</div>
							<div class="tag">
								<span class="last">#해시태그</span>
							</div>
						</div>
					</div>
					<div class="item-contents align-left">
						<div class="profile-image" style="background-image:url('resource/img/noprofileimg.png')">
						</div>
						<div class="user-name">
						오세훈씨씨
						</div>
						<div class="location">
						서울 동작구 사당동
						</div>
						<div class="strong-info">
							<span class="payment"></span> 200,000원 <span class="count"></span>
						</div>
						<div class="icon-container">
							<span class="commentIcon"><img class="icon-img" src="http://moccozy.blob.core.windows.net/icon/comment-icon.png"/></span><span class="info-comment">30</span>
							<span class="commentIcon"><img class="icon-img" src="http://moccozy.blob.core.windows.net/icon/comment-icon.png"/></span><span class="info-comment">30</span>
						</div>
					</div>
				</div>
			</a>
		</div>
	</c:forEach>
</div>