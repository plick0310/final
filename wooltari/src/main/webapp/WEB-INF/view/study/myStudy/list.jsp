<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<style type="text/css">
* {
	box-sizing: border-box;
}

body {
	margin: 0;
}
.mymain td{
padding: 5px 0;
background: #eee;
}

.mymain td:HOVER {
	background-color: #1abc9c;
	cursor: pointer;
	color: white;
}
.mymain td:FOCUS {
	background-color: #1abc9c;
}
</style>
<script>
	$(document).ready(function() {
		//최상단 체크박스 클릭

		$("#allCheck").click(function() {
			//클릭되었으면
			if ($("#allCheck").prop("checked")) {
				//input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
				$("input[name=chk]").prop("checked", true);
				//클릭이 안되있으면
			} else {
				//input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
				$("input[name=chk]").prop("checked", false);
			}
		});

	});
</script>

<div style="width: 1140px; margin: 60px auto;">
	<div style="height: 50px; font-size: 20px; text-align: center;">
		<span style="font-size: 20px; color: #BDBDBD; font-weight: bold;">
			<span style="font-size: 19px; color: #1abc9c;"
			class="glyphicon glyphicon-pencil"> </span>&nbsp;&nbsp;&nbsp;WOOLTARI&nbsp;&nbsp;&nbsp;
		</span>M Y S T U D Y
	</div>
<div style="float: left;text-align: center;">
	<div
		style="width: 170px; height: 230px; box-shadow: 0px 3px 5px 1px #eee;   font-size: 20px; font-size: 16px; line-height: 50px;">
		<div style="width: 170px; height: 170px; background-image: url('http://cfile9.uf.tistory.com/image/2505973556AB0AD0335902'); background-size: cover;">
			</div>
		<div style="width: 170px; height: 3px; background-color: #1abc9c;"></div>
		<Strong>LEADER</Strong><span style="font-size: 14px;">&nbsp;&nbsp;자바킹</span> 
	</div>
	<div style="margin: 30px 0; border-top: 1px solid #eee; padding: 20px 0;">자바를 정말 잘합니다.</div>
</div>
	<div style="width: 700px;  box-shadow: 2px 3px 5px 1px #eee; float: left; margin: 0px 25px 100px;">
		<table style="width: 700px; text-align: center;" class="mymain">
		<tr>
		<td>H O M E</td>
		<td>N A M E</td>
		<td>M E M B E R</td>
		<td>A D M I N</td>
		</tr>
		</table>
		<div style="padding: 20px;"><strong>세훈이와 함께하는 C언어</strong></div>
	</div>
	<div style="width: 170px; height: 200px;  float: left;">
	채팅

	</div>



</div>