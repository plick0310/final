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

 #map {
       height: 400px;
       width: 100%;
      }
</style>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script type="text/javascript">
$( function() {
    $( "#datepicker1").datepicker();
  } );
  
$( function() {
    $( "#datepicker2").datepicker();
  } );
  
$(function(){
	$('#collapse1').on('shown.bs.collapse', function () {
		initMap();
   });		
});

  
 function check(){
	 var f=document.boardForm;
	 
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
	 var mode="${mode}";
	 if(mode="created")
		 f.action="<%=cp%>/studyMarket/studyMarketBoard/created";
		 else if(mode=="update")
			 f.action="<%=cp%>/studyMarket/studyMarketBoard/update";
			 
	return true;
 }   

</script>
<script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAcO1EZpm4c5VVFmWf1h0dwX1QVbsx3Gb4&callback=initMap">
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
				<th>작성자</th>
				<td><input type="text" name="writer" maxlength="8"
					style="width: 200px;" /></td>
			</tr>			

			<tr>
				<th>강의 시작일, 종료일</th>				
				<td><a>StartDate: <input type="text" id="datepicker1"></a>&nbsp;
				    <a>EndDate: <input type="text" id="datepicker2"></a></td>
			</tr>
			<tr>
				<th>오프라인 강의실 주소</th>
				<td><input type="text" name="writer" maxlength="8"
					style="width: 200px;" /></td>
			</tr>
			<tr>
				<th>url</th>				
				<td><input type="text" name="url" maxlength="8" style="width: 200px;" /></td>
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

			
		</tbody>
	</table>
	
	<div class="read_btnArea">
		<button class="clickbtn">${mode='update'?'수정하기':'등록하기'}</button>
		<button class="clickbtn">${mode='update'?'수정취소':'등록취소'}</button>
		
		<c:if test="${mode=='update'}">
			<input type="hidden" name="num" value="">
			<input type="hidden" name="page" value="">
		</c:if>
	</div>
</form>