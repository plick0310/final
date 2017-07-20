<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<!-- 신고 건의 -->
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
<script type="text/javascript" src="<%=cp%>/resource/se/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
function check(){
	var f=document.write_form;
	
	var str=f.subject.value;
	if(!str){
		f.subject.focus();
		return false;
	}
	
	str = f.content.value;
	if(!str){
		f.content.focus();
		return false;
	}
	
	var mode="${mode}";
	if(mode=="created")
		f.action="<%=cp%>/report/created";
	else if(mode=="update")
		f.action="<%=cp%>/report/update";
	
	
	return true;
}

</script>
<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "content",
	sSkinURI: "<%=cp%>/resource/se/SmartEditor2Skin.html",	
	htParams : {bUseToolbar : true,
		fOnBeforeUnload : function(){
			// alert("아싸!");
		}
	}, //boolean
	fOnAppLoad : function(){
		//예제 코드
		//oEditors.getById["content"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
	},
	fCreator: "createSEditor2"
});

function pasteHTML() {
	var sHTML = "<span style='color:#FF0000;'>이미지도 같은 방식으로 삽입합니다.<\/span>";
	oEditors.getById["content"].exec("PASTE_HTML", [sHTML]);
}

function showHTML() {
	var sHTML = oEditors.getById["content"].getIR();
	alert(sHTML);
}
	
function submitContents(elClickedObj) {
	oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다.
	
	// 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("content").value를 이용해서 처리하면 됩니다.
	
	try {
		// elClickedObj.form.submit();
		return check();
	} catch(e) {}
}

function setDefaultFont() {
	var sDefaultFont = '돋움';
	var nFontSize = 24;
	oEditors.getById["content"].setDefaultFont(sDefaultFont, nFontSize);
}
</script>


<form name="write_form" id="write_form" onsubmit="return submitContents(this);"
enctype="multipart/form-data" method="post" style="margin: 60px auto; width: 900px;">

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
				<td style="">
				<select name="category">
					<option value="accuse">신고</option>
					<option value="suggest">건의</option>
				</select>
				</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${sessionScope.member.userId}</td>
			</tr>
             <tr>
                 <td class="td1" colspan="4" style="padding-bottom: 0px;">내용</td>
             </tr>			
             <tr>
                 <td colspan="4" class="td4">
                 	<textarea id="content" name="content" class="form-control" rows="15" style="max-width: 99%;">${dto.content}</textarea>
                 </td>
             </tr>
		</tbody>
	</table>
	
	<div class="read_btnArea">
		<button class="clickbtn">${mode=='update'?'수정완료':'등록하기'}</button>
		<button type="reset" class="clickbtn">다시입력</button>
		<button class="clickbtn">${mode=='update'?'수정취소':'등록취소'}</button>
		
		<%-- 
		<c:if test="${mode=='update'}">
			<input type="hidden" name="repNum" value="${dto.repNum}">
			<input type="hidden" name="pageNo" value="${pageNo}">
		</c:if>
		<c:if test="${mode=='reply'}">
			<input type="hidden" name="pageNo" value="${pageNo}">
			<input type="hidden" name="groupNum" value="${dto.groupNum}">
			<input type="hidden" name="orderNo" value="${dto.orderNo}">
			<input type="hidden" name="depth" value="${dto.depth}">
			<input type="hidden" name="parent" value="${dto.repNum}">
		</c:if>
		 --%>
	</div>
</form>