<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<style>
input {
	height: 30px;
	border-radius: 5px; 
	border-style: solid;	
	border: 1px solid #EAEAEA;  
}
textarea {
	border: none;
	border-radius: 5px;
	border: 1px solid #EAEAEA; 
	
}
.clickbtn{
background-color: white;
border-style: solid;
padding: 5px 20px;

margin-right: 10px;
border: 1px solid #EAEAEA;  

}
</style>

<script type="text/javascript">
function insertBoard(){
	var f=document.write_form;
	
	var str=f.subject.value;
	if(!str){
		f.subject.focus();
		return false;
	}
	
	str=f.content.value;
	if(!str){
		f.content.focus();
		return false;
	}
	
	if(f.file1.value==""||f.file1.value==null){
		var msg="기본사진으로 대신합니다.";
		
	}else if(! /(\.gif|\.jpg|\.png|\.jpeg)$/i.test(f.file1.value)) {	
		alert('이미지 파일만 가능합니다.');
		f.upload.focus();
		return false;
	}
	
	var query = { "info":"리뷰글 작성", "value":30}
	$.ajax({
	   url:"<%=cp%>/point/update",
	   data:query,
	   type:"post",
	   dataType:"json",
	   success : function(data) {
	     
	   }
	});
	
	f.action="<%=cp%>/review/created";
	f.submit();
	
}

</script>

<form name="write_form" id="write_form" enctype="multipart/form-data" method="post" style="margin: 60px auto; width: 900px;">
<div  style="height:50px; font-size: 20px;text-align: center; border-bottom: 1px solid #eee;">
			<span style="font-size: 20px;color:#BDBDBD; font-weight: bold;">
			<span style="font-size: 19px; color: #1abc9c; " class="glyphicon glyphicon-pencil">
			</span>&nbsp;&nbsp;&nbsp;WOOLTARI&nbsp;&nbsp;&nbsp;</span>W R I T E . . .</div>
	<table cellpadding="0" cellspacing="0" id="read_table"
		style="background-color:#F5F5F5; color: #353535; border-top: none;
		box-shadow: 60px 0px 100px -90px #000000, -60px 0px 100px -90px #000000;"class="board_table">
	
		<tbody>
			
		
			<tr>
				<th style="width: 100px; ">제목</th>
				<td><input type="text" name="subject" 
					class="subject" maxlength="100" style="width: 450px;" /></td>
			</tr>
			
			<tr>
				<th>스터디</th>
				<td>
					<select style="width: 100px;" name="s_num">
						<c:forEach var="dto" items="${list }">
							<option value=${dto.s_num }>${dto.studyName }</option>
						</c:forEach>	
					</select>
				</td>
			</tr>
			
			<tr>
				<th>작성자</th>
				<td style="width: 200px;">${sessionScope.member.userName}</td>
			</tr>
			

			<tr>
				<td colspan="2"><textarea name="content" id="ment" 
						style="width: 100%; height: 300px;" ></textarea></td>
			</tr>

			<tr>
				<th>이미지</th>
				<td><input type="file" name="upload" id="file1" style="border: none;">
				</td>
			</tr>


		</tbody>
	</table>
	
	<div class="read_btnArea">
		<button class="clickbtn" onclick="insertBoard();">등록하기</button>
		<button class="clickbtn" onclick="javascript:location.href='<%=cp%>/review/list';">돌아가기</button>
	</div>
</form>