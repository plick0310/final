<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<style>
input.userImgUpload {
   opacity: 0; /*input type="file" tag 투명하게 처리*/
   position: relative;
   width: 0px;
}
.single-line {
	border-bottom: 3px solid #0dad8d;
    height: 12px;
    margin: 7px 0 20px;
    position: relative;
    text-align: center;
}
abbr.timestamp {
    background: #0dad8d  none repeat scroll 0 0;
    color: #fff;
    padding: 0 11px;
}

#zipcode, #addr1{
	background: #FFF;
}
</style>
<script type="text/javascript" src="<%=cp%>/resource/js/jquery.form.js"></script>
<script>

$(document).ready(function(){
	if('${dto.gender}' == 1){
		$('#gender-0').prop("checked", true);
	}else if('${dto.gender}' == 2){
		$('#gender-1').prop("checked", true);
	}
});

function update_submit() {
	var flag = true;
	
	if(!userCheckForm()){
		flag = false;
	}
	if(flag){
		var introduce = document.getElementById("introduce");
		fnChkByte(introduce, 100, 'introduce');
		var f= document.updateform;
		var formdata = new FormData(f);
		$.ajax({
			type:"POST",
			url:"<%=cp%>/member/update_submit",
			processData: false,  // file 전송시 필수
		    contentType: false,  // file 전송시 필수
			data : formdata,
			dataType: "json",
			success : function(data) {
				var state = data.state;
				if(state == 'true'){
    				alert("수정 성공!");
				}else{
					alert("수정 실패!");
				}
			},
			error: function(e){
				console.log(e.responseText);
			} 
		});
	}
}

function userCheckForm(){
	//닉네임 검사
	var userName=$.trim($("#userName").val());
	var regex=/[~!@\#$%<>^&*\()\-=+_\’]/gi;
	if(!userName) { 
		$("#userName").focus();
		var str="<span style='color:red;font-weight: bold;'>닉네임을 입력해주세요.</span>";
		$("#userName + .help-block").html(str);
		return false;
	}else if(regex.test(userName)){
		$("#userName").focus();
		var str="<span style='color:red;font-weight: bold;'>특수문자는 사용이 불가합니다.</span>";
		$("#userName + .help-block").html(str);
		return false;
	}else{
		var str="<span style='color:blue;font-weight: bold;'>입력하신 닉네임은 '" + userName + "' 입니다.</span>";
		$("#userName + .help-block").html(str);
	}
	//패스워드 형식 검사			
	var userPwd=$("#userPwd").val();
	var regex=/^(?=.*[a-z])(?=.*[!@#$%^*+=-]|.*[0-9]).{5,10}$/;
	if(!regex.test(userPwd)) { 
		$("#userPwd").focus();
		var str="<span style='color:red;font-weight: bold;'>패스워드는 5~10자이며 하나 이상의 숫자나 특수문자가 포함되어야 합니다.</span>";
		$("#userPwd + .help-block").html(str);
		return false;
	}else{
		var str="<span style='color:blue;font-weight: bold;'>패스워드 조건에 만족합니다.<span>";
		$("#userPwd + .help-block").html(str);
	}
	//패스워드 2차 확인
	if($("#userPwd").val() != $("#userPwd2").val()) {
		$("#userPwd2").focus();
		var str="<span style='color:red;font-weight: bold;'>패스워드가 일치하지 않습니다.</span>";
		$("#userPwd2 + .help-block").html(str);
		return false;
	}else{
		var str="<span style='color:blue;font-weight: bold;'>패스워드가 일치합니다.</span>";
		$("#userPwd2 + .help-block").html(str);
	}
	return true;
}

// 전화번호 문자 입력 제한
function onlyNumber(event){
	event = event || window.event;
	var keyID = (event.which) ? event.which : event.keyCode;
	if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
		return;
	else
		return false;
}
function removeChar(event) {
	event = event || window.event;
	var keyID = (event.which) ? event.which : event.keyCode;
	if ( keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
		return;
	else
		event.target.value = event.target.value.replace(/[^0-9]/g, "");
}

// 자릿수 제한
function fnChkByte(obj, maxByte, id){
	var str = obj.value;
	var str_len = str.length;
	var rbyte = 0;
	var rlen = 0;
	var one_char = "";
	var str2 = "";
	/* 
	if(id == 'userName'){
		$('#'+id).val($('#'+id).val().trim());
	}
	 */
	for(var i=0; i<str_len; i++){
		one_char = str.charAt(i);
		
		if(escape(one_char).length > 4){
		    rbyte += 2; //한글2Byte
		}else{
		    rbyte++; //영문 등 나머지 1Byte
		}

		if(rbyte <= maxByte){
		    rlen = i+1; //return할 문자열 갯수
		}
	}
	if(rbyte > maxByte){
		var str="<span style='color:red;font-weight: bold;'>허용된 입력 범위 초과(" + rbyte + "/" + maxByte + ")</span>";
		$('#'+id+" + .help-block").html(str);
	    str = obj.value.substr(0,rlen); //문자열 자르기 
	    obj.value = str;
	    fnChkByte(obj, maxByte);
	}else{
		$('#'+id+" + .help-block").html("허용된 입력 범위(" + rbyte + "/" + maxByte + ")");
	}
} 

// 이미지 미리보기
$(function() {
    $("#userImgUpload").on('change', function(){
    	var src = getFileExtension($(this).val());
		if(!((src.toLowerCase() == "gif") || (src.toLowerCase() == "jpg") || (src.toLowerCase() == "jpeg"))){
		        alert('gif 와 jpg 파일만 지원합니다.');
		        return;
		}
        $("#userImgUpload").empty();
        readURL(this);
    });
});

//파일의 확장자를 가져옴
function getFileExtension(filePath){  
    var lastIndex = -1;
    lastIndex  = filePath.lastIndexOf('.');
    var extension = "";

	if(lastIndex != -1){
	 extension = filePath.substring( lastIndex+1, filePath.len );
	}else{
	 extension = "";
	}
    return extension;
}

function readURL(input) {
    if (input.files && input.files[0]) {
    var reader = new FileReader();

    reader.onload = function (e) {
            $('#blah').attr('src', e.target.result);
        }

      reader.readAsDataURL(input.files[0]);
    }
}

// 다음 우편번호 서비스
$("#addrBtn").click(function(){
	new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullAddr = ''; // 최종 주소 변수
            var extraAddr = ''; // 조합형 주소 변수

            // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                fullAddr = data.roadAddress;

            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                fullAddr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
            if(data.userSelectedType === 'R'){
                //법정동명이 있을 경우 추가한다.
                if(data.bname !== ''){
                    extraAddr += data.bname;
                }
                // 건물명이 있을 경우 추가한다.
                if(data.buildingName !== ''){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('zipcode').value = data.zonecode; //5자리 새우편번호 사용
            document.getElementById('addr1').value = fullAddr;

            // 커서를 상세주소 필드로 이동한다.
            document.getElementById('addr2').focus();
        }
    }).open();
});
</script>

<div class="panel-heading">
	<h3 class="panel-title">${dto.userName}님의 정보 수정</h3>
	<hr>
</div>
<div class="panel-body">
    <div class="row">
		<form class="form-horizontal" name="updateform" enctype="multipart/form-data" method="post">
		<fieldset>
			<div class="col-md-4 col-lg-4">
                <div class="single-line">
					<abbr class="timestamp">프로필 이미지</abbr>
				</div>
                <div class="form-group" id="imgbox"> 
					<label for="userImgUpload" class="btn btn-large uploadLabel">
						<c:if test="${empty sessionScope.member.userImg}"> 
							<img  id="blah" src="<%=cp%>/resource/img/noprofileimg.png" class="thumbnail" width="250px" height="250px">
						</c:if>
	                      
						<c:if test="${not empty sessionScope.member.userImg}">
							<img id="blah" src="<%=cp%>/uploads/member/userImg/${sessionScope.member.userImg}" class="thumbnail" width="250px" height="250px">
						</c:if>
					</label>
					<input type="hidden" name="userImg" id="userImg" value="${dto.userImg}">
					<input type="file" name="userImgUpload" id="userImgUpload" class="userImgUpload tts">
					<span class="help-block">사진을 변경하시려면 이미지를 클릭하세요.</span> 
				</div>
	        </div>
			<div class=" col-md-8 col-lg-8"> 
			
				<div class="single-line">
					<abbr class="timestamp">필수 입력</abbr>
				</div>
				
				<!-- UserName input-->
				<div class="form-group">
				  <label class="col-md-3 control-label" for="userName">닉네임</label>  
				  <div class="col-md-8">
				  <input type="text" id="userName" name="userName" placeholder="Name" class="form-control input-md" maxlength="6" required="required" value="${dto.userName}">
				  <span class="help-block">닉네임을 입력하세요.(한/영/숫자 조합 최대 6글자)</span>  
				  </div>
				</div>
				
				<!-- Password input-->
				<div class="form-group">
				  <label class="col-md-3 control-label" for="userPwd">패스워드</label>
				  <div class="col-md-8">
				    <input type="password" id="userPwd" name="userPwd" placeholder="Password" class="form-control input-md" required="required">
				    <span class="help-block">패스워드를 입력해주세요.</span>
				  </div>
				</div>
				
				<!-- Password input-->
				<div class="form-group">
				  <label class="col-md-3 control-label" for="userPwd2">패스워드 확인</label>
				  <div class="col-md-8">
				    <input type="password" id="userPwd2" name="userPwd2" placeholder="Password Confirm" class="form-control input-md" required="required">
				    <span class="help-block">패스워드를 한번 더 입력해주세요.</span>
				  </div>
				</div>
				
				<!-- Gender input -->
				<div class="form-group">
				  <label class="col-md-3 control-label" for="gender">성별</label>
				  <div class="col-md-8"> 
				    <label class="radio-inline" for="gender-0">
				      <input type="radio" name="gender" id="gender-0" value="1" required="required">남자
				    </label> 
				    <label class="radio-inline" for="gender-1">
				      <input type="radio" name="gender" id="gender-1" value="2" required="required">여자
				    </label>
				  </div>
				</div>
				
				
				<div class="single-line">
					<abbr class="timestamp">선택 입력</abbr>
				</div>
				
				<!-- Birth input-->
				<div class="form-group">
				  <label class="col-md-3 control-label" for="birth">생년월일</label>
				  <div class="col-md-8">
				    <input type="date" id="birth" name="birth" class="form-control input-md" required="required" value="${dto.birth}">
				    <span class="help-block">생년월일을 입력해주세요.</span>
				  </div>
				</div>
				
				<!-- Tel input-->
				<div class="form-group">
					<label class="col-sm-3 control-label" for="inputNumber">연락처</label>
					<div class="col-sm-8">
						<div class="input-group">
							<input type="tel" id="tel" name="tel" class="form-control" placeholder="- 없이 입력해 주세요" onkeydown="return onlyNumber(event)" onkeyup="removeChar(event)" value="${dto.tel}"/>
						</div>
					</div>
				</div>
				
				<!-- Introduce input -->
				<div class="form-group">
				  <label class="col-md-3 control-label" for="introduce">자기소개</label>
				  <div class="col-md-8">                     
				    <textarea class="form-control" id="introduce" name="introduce" onKeyUp="javascript:fnChkByte(this,'100', 'introduce')" style="resize: none;">${dto.introduce}</textarea>
				    <span class="help-block" id="help-block">100자 이내로 자기를 소개하세요.</span>
				  </div>
				</div>
				
				<!-- Zipcode/Address input -->
				<div class="form-group">
					<label class="col-sm-3 control-label" for="addrBtn">주소</label>
					<div class="col-sm-8">
						<div class="input-group">
							<input type="text" id="zipcode" name="zipcode" class="form-control" placeholder="우편번호" readonly="readonly" required="required" value="${dto.zipcode}">
							<span class="input-group-btn">
								<input type="button" id="addrBtn" name="addrBtn" class="btn btn-success" value="우편번호 찾기">
							</span>
						</div>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label" for="addr1"></label>
					<div class="col-sm-8">
						<input type="text" id="addr1" name="addr1" class="form-control" placeholder="주소" readonly="readonly" value="${dto.addr1}">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label" for="addr2"></label>
					<div class="col-sm-8">
						<input type="text" id="addr2" name="addr2" class="form-control" placeholder="상세주소" required="required" value="${dto.addr2}">
					</div>
				</div>
				
				<!-- Submit Btn -->
				<div class="form-group">
					<div class="col-sm-12 text-center">
						<button class="btn btn-primary" type="button" onclick="update_submit()">수정완료<i class="fa fa-check spaceLeft"></i></button>
					</div>
				</div>
			</div>
		</fieldset>
		</form>
	</div>
</div>