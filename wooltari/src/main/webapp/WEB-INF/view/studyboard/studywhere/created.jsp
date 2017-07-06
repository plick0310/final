<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<script type="text/javascript" src="<%=cp%>/resource/se/js/HuskyEZCreator.js" charset="utf-8"></script>

<script type="text/javascript">
    function sendOk() {
        var f = document.write_form;

    	var str = f.subject.value;
        if(!str) {
            alert("제목을 입력하세요. ");
            f.subject.focus();
            return;
        }

    	str = f.content.value;
        if(!str) {
            alert("내용을 입력하세요. ");
            f.content.focus();
            return;
        }

    	f.action="<%=cp%>/bbs/${mode}";
    		
        f.submit();
    }
</script>


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

<form name="write_form" id="write_form" enctype="multipart/form-data" onsubmit="return submitContents(this);" method="post" style="margin: 60px auto; width: 900px;">
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
					class="subject" maxlength="100" style="width: 450px;" />
				
					
					</td> 
			</tr>
		 
			
			<tr style="border-top: 3px solid #eee">
				<th>장소정보</th>
				<td><small>장소이름&nbsp;&nbsp;</small><input type="text" name="placename" maxlength="13"
					style="width: 200px;" />
					<small>영엽시간&nbsp;&nbsp;</small><input type="text" name="ocTime" maxlength="13"
					style="width: 200px;" />
					<small>&nbsp;&nbsp;&nbsp;&nbsp;지역&nbsp;&nbsp;</small><input type="text" name="region" 
					style="width: 172px;" /></td>
			</tr>
			<tr>
				<th><small>주소</small></th>
				<td><input type="text" name="address" 
					style="    width: 507px;" />
					<small>&nbsp;&nbsp;&nbsp;&nbsp;전화번호&nbsp;&nbsp;</small><input type="text" name="tel" maxlength="13"
					style="width: 150px;" />
					
					</td>
			</tr>
		

			<tr> 
				<td colspan="2">
				<textarea name="content" id="content" style="width:95%; height: 270px;">${dto.content}</textarea>
				</td>
			</tr>

			<tr style="display: none;">
				<th>첨부파일</th>
				<td><input type="file" name="upload" id="file1" style="border: none;">
				</td>
			</tr>

			

		


		</tbody>
	</table>
	
	<div class="read_btnArea">
		<button class="clickbtn">등록하기</button>
		<button class="clickbtn">돌아가기</button>
	</div>
</form>
<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "content",
	sSkinURI: "<%=cp%>/resource/se/SmartEditor2Skin.html",	
	htParams : {bUseToolbar : true,
		fOnBeforeUnload : function(){
			//alert("아싸!");
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