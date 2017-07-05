<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<link rel="stylesheet" type="text/css" href="<%=cp%>/resource/css/studyhome.css">
<style type="text/css">
* {
	box-sizing: border-box;
}

.menu {
	width: 900px;
	text-align: center;
}

.menu li {
	padding: 5px 0;
	background: #eee;
	float: left;
	width: 225px;
}

.menu li:HOVER {
	background-color: #1abc9c;
	cursor: pointer;
	color: white;
}

.menu li:FOCUS {
	background-color: #1abc9c;
}

.cont {
	margin-left: 25px;
	width: 900px;
	float: left;
}
input.uploadBtn {
   opacity: 0; /*input type="file" tag 투명하게 처리*/
   position: relative;
   width: 0px;
}

</style>
<script type="text/javascript" src="<%=cp%>/resource/js/jquery.form.js"></script>

<script type="text/javascript">
$(document).ready(function(){
		$.ajax({
			url:"<%=cp%>/study/myStudy/${s_num}/board",
			dataType:"html",
			success : function(data) {
			$('.cont').html(data);
			}
		});
		
	
	
		$('.menu').on('click', 'a', function(){
			var fileName;
			fileName = $(this).parent().attr('class');
				
			$.ajax({
				dataType:"html"
				,url:"<%=cp%>/study/myStudy/${s_num}/" + fileName
				,success : function(data) {
					$('.cont').html(data);
				}
			});

		});

	});

</script>





<div style="width: 1140px; overflow: hidden;  margin: 60px auto;">
	<div style="height: 50px; font-size: 20px; text-align: center;">
		<span style="font-size: 20px; color: #BDBDBD; font-weight: bold;">
			<span style="font-size: 19px; color: #1abc9c;"
			class="glyphicon glyphicon-pencil"> </span>&nbsp;&nbsp;&nbsp;${dto.studyName }&nbsp;&nbsp;&nbsp;
		</span>S T U D Y
	</div>
	<div style="float: left; text-align: center;">
		<div
			style="width: 170px; height: 230px; box-shadow: 0px 3px 5px 1px #eee; font-size: 20px; font-size: 16px; line-height: 50px;">
			<div
				style="width: 170px; height: 170px; background-image: url('<%=cp%>/uploads/study/studyMainimage/${dto.imageFileName}'); background-size: cover;">
			</div>
			<div style="width: 170px; height: 3px; background-color: #1abc9c;"></div>
			<Strong>LEADER</Strong><span style="font-size: 14px;">&nbsp;&nbsp;${dto.userId }</span>
		</div>
		<div
			style="margin: 30px 0; border-top: 1px solid #eee; padding: 20px 0;">${dto.study_Info }</div>
	</div>

	<div id="wrap">
		<div id="box">
			<div
				style="width: 900px; box-shadow: 2px 3px 5px 1px #eee; float: left; margin: 0px 25px 35px;">
				<ul class="menu">
					<li class="board"><a href="#">H O M E</a></li>
					<li class="calender"><a href="#">C A L E N D E R</a></li>
					<li class="s_member"><a href="#">M E M B E R</a></li>
					<li class="chating"><a href="#">C H A T H I N G</a></li>
				</ul>

			</div>
			
			<div class="cont"></div>
			
			
		</div>
	</div>
</div>

