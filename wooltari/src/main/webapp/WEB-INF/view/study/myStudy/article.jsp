<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<link rel="stylesheet" type="text/css" href="<%=cp%>/resource/css/studyarticle.css">
<style>
.dnu{
border: none;
background: none;
}

</style>
<script type="text/javascript">

$(function(){
	
	
});

</script>

<div  class="container2" style=" margin: 60px auto; height:50px; font-size: 20px;text-align: center;">
			<span style="font-size: 20px;color:#BDBDBD; font-weight: bold;">
			<span style="font-size: 19px; color: #1abc9c; " class="glyphicon glyphicon-pencil">
			</span>&nbsp;&nbsp;&nbsp;WOOLTARI&nbsp;&nbsp;&nbsp;</span>W R I T E . . .</div>
<table cellpadding="0" cellspacing="0" id="read_table" class="board_table" style="width: 800px; margin: -45px auto 0;">

	
	<div class="container3" data-am-fadeshow="next-prev-navigation" style="height: 500px;" >

		<!-- Radio -->
		<input type="radio" name="css-fadeshow" id="slide-1" />
		<input type="radio" name="css-fadeshow" id="slide-2" />
		<input type="radio" name="css-fadeshow" id="slide-3" />

		<!-- Slides -->
		<div class="fs-slides">
		<c:forEach var="photo" items="${photolist}">
			<div class="fs-slide" style="background-image: url(<%=cp%>/uploads/study/${s_num}_Board/${photo});">
			</div>
		</c:forEach>
			</div>
		<!-- Quick Navigation -->
		<div class="fs-quick-nav">
			<label class="fs-quick-btn" for="slide-1"></label>
			<label class="fs-quick-btn" for="slide-2"></label>
			<label class="fs-quick-btn" for="slide-3"></label>
		</div>
		
		<!-- Prev Navigation -->
		<div class="fs-prev-nav">
			<label class="fs-prev-btn" for="slide-1"></label>
			<label class="fs-prev-btn" for="slide-2"></label>
			<label class="fs-prev-btn" for="slide-3"></label>
		</div>
		
		<!-- Next Navigation -->
		<div class="fs-next-nav">
			<label class="fs-next-btn" for="slide-1"></label>
			<label class="fs-next-btn" for="slide-2"></label>
			<label class="fs-next-btn" for="slide-3"></label>
		</div>

	</div>
	
</div>

	<thead>
		<tr>
			<th class="informations">
				제목입니다...
				<span class="inforArea">
					<strong>작성일</strong> ${dto.created }
					<span class="__dotted"></span>
					<strong>작성자</strong> ${dto.userName }
					<span class="__dotted"></span>
					<strong>좋아요♡</strong> ${countLike }
				</span>
			</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td class="read_contArea">
				<div id="board_memo_area">
					${dto.content}
				</div>
		
			
			</td>
		</tr>
	</tbody>
</table>	

