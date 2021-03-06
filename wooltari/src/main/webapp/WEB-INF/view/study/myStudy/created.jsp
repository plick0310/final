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
				<th>카테고리</th>
				<td style=""><input type="checkbox" value="ww">
					<input type="checkbox" value="ww">
					<input type="checkbox" value="ww">
				</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><input type="text" name="writer" maxlength="8"
					style="width: 200px;" /></td>
			</tr>
			<tr>
				<th>패스워드</th>
				<td><input type="password" name="password" maxlength="20"
					style="width: 200px;"/><span style="font-size: 13px; font-weight:200;">&nbsp;&nbsp;글 삭제시 필요합니다.</span></td>
			</tr>

			<tr>
				<th>E-MAIL</th>
				<td><input type="text" name="email" style="width: 300px;" /></td>
			</tr>

			<tr>
				<td colspan="2"><textarea name="ment" id="ment" 
						style="width: 100%; height: 300px;" ></textarea></td>
			</tr>

			<tr>
				<th>첨부파일</th>
				<td><input type="file" name="file1" id="file1" style="border: none;">
				</td>
			</tr>

			<tr>
				<th>파일이름</th>
				<td><input type="checkbox"
					name="file1_del" id="file1_del"><label for="file1_del"></label>
				</td>
			</tr>

		


		</tbody>
	</table>
	
	<div class="read_btnArea">
		<button class="clickbtn">등록하기</button>
		<button class="clickbtn">돌아가기</button>
	</div>
</form>