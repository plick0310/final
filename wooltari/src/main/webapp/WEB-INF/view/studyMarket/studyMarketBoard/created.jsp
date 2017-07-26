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
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script type="text/javascript">
$( function() {
    $( "#datepicker1").datepicker();
  } );
  
$( function() {
    $( "#datepicker2").datepicker();
  } );
  
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
	//동적으로 추가된 태그도 이벤트 처리 가능(파일 추가)
 $(function(){
	$("body").on("change", "input[name=upload]", function(){
		if(! $(this).val()) {
			return;	
		}
		
		var b=false;
		$("input[name=upload]").each(function(){
			if(! $(this).val()) {
				b=true;
				return;
			}
		});
		if(b)
			return;

		var $tr, $td, $input;
		
	    $tr=$("<tr>");
	    $td=$("<td>", {class:"td1", html:"첨부"});
	    $tr.append($td);
	    $td=$("<td>", {class:"td3", colspan:"3"});
	    $input=$("<input>", {type:"file", name:"upload", class:"form-control input-sm", style:"height: 35px;"});
	    $td.append($input);
	    $tr.append($td);
	    
	    $("#tb").append($tr);
	});
 });
	//post
	<c:if test="${mode=='update'}">
	function deleteFile(fileNum){
		var url="<%=cp%>/studyMarket/studyMarketBoard/deleteFile";
		$.post(url,{fileNum:fileNum}, function(data){
			$("#f"+fileNum).remove();
		},"JSON");
	}
	
	</c:if>
	
	function cancel() {
		location.href="<%=cp%>/studyMarket/studyMarketBoard/list?page="+'${page}'; 
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
	
		<tbody id="tb" >
			<tr>
				<th style="width: 100px; ">제목</th>
				<td><input type="text" name="subject" 
					class="subject" maxlength="100" style="width: 450px;" value="${dto.subject}" /></td>
			</tr>
			<%-- 
			<tr>
				<th>작성자</th>
				<td>${sessionScope.member.userId}</td>
			</tr>			

			<tr>
				<th>시작, 종료일</th>				
				<td><a>StartDate: <input type="text" name="startdate" id="datepicker1" value="${dto.startdate}"></a>&nbsp;
				    <a>EndDate: <input type="text"  name="enddate" id="datepicker2" value="${dto.enddate}"></a></td>
			</tr>
			<tr>
				<th>강의실 주소</th>
				<td><input type="text" name="address" 
					style="width: 200px;" value="${dto.address}"/></td>
			</tr>
			 --%>
			<tr>
				<th>url</th>				
				<td><input type="text" name="urlContent"  style="width: 200px;"value="${dto.urlContent}" /></td>
			</tr>

			<tr>
				
				<td colspan="2"><textarea name="content" id="ment" 
						style="width: 100%; height: 300px;"> ${dto.content}</textarea></td>
			</tr>

			<tr>
				<td class="td1">첨부</td>
                <td colspan="3" class="td3">
                    <input type="file" name="upload" class="form-control input-sm" style="height: 35px;">
                </td>
			</tr>
			
			<c:if test="${mode=='update'}"> 
   				<c:forEach var="dto" items="${listFile}">
                  <tr id="f${dto.fileNum}"> 
                      <td class="td1">첨부파일</td>
                      <td colspan="3" class="td3"> 
                          ${dto.originalFilename}
                          | <a href="javascript:deleteFile('${dto.fileNum}');">삭제</a>	        
                      </td>
                  </tr>
 			 </c:forEach>
			</c:if>
		</tbody>
	</table>
	
	<div class="read_btnArea">
		<button class="clickbtn">${mode='update'?'수정하기':'등록하기'}</button>
		<input type="button" class="clickbtn" onclick="cancel();" value="${mode='update'?'수정취소':'등록취소'}">
		<c:if test="${mode=='update'}">
			<input type="hidden" name="num" value="${dto.num}">
			<input type="hidden" name="page" value="${page}">
		</c:if>
	</div>
</form>