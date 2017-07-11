<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<!-- 다음 우편번호 서비스 -->
<script>
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
                document.getElementById('postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('address').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('address2').focus();
            }
        }).open();
    });
</script>

<form class="form-horizontal">
<fieldset>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-3 control-label" for="userName">닉네임</label>  
  <div class="col-md-6">
  <input id="userName" name="userName" type="text" placeholder="Name" class="form-control input-md" required="required" value="${dto.userName}">
  <span class="help-block">다른 회원들에게 보여질 별명입니다.</span>  
  </div>
</div>

<!-- Password input-->
<div class="form-group">
  <label class="col-md-3 control-label" for="userPwd">패스워드</label>
  <div class="col-md-6">
    <input id="userPwd" name="userPwd" type="password" placeholder="Password" class="form-control input-md" required="required">
    <span class="help-block">패스워드를 입력해주세요.</span>
  </div>
</div>

<!-- Password input-->
<div class="form-group">
  <label class="col-md-3 control-label" for="userPwd2">패스워드 확인</label>
  <div class="col-md-6">
    <input id="userPwd2" name="userPwd2" type="password" placeholder="Password Confirm" class="form-control input-md" required="required">
    <span class="help-block">패스워드를 한번 더 입력해주세요.</span>
  </div>
</div>

<!-- Multiple Radios (inline) -->
<div class="form-group">
  <label class="col-md-3 control-label" for="gender">성별</label>
  <div class="col-md-6"> 
    <label class="radio-inline" for="gender-0">
      <input type="radio" name="gender" id="gender-0" value="1" checked="checked">남자
    </label> 
    <label class="radio-inline" for="gender-1">
      <input type="radio" name="gender" id="gender-1" value="2">여자
    </label>
  </div>
</div>

<!-- Textarea -->
<div class="form-group">
  <label class="col-md-3 control-label" for="introduce">자기소개</label>
  <div class="col-md-6">                     
    <textarea class="form-control" id="introduce" name="introduce">${dto.introduce}</textarea>
    <span class="help-block">100자 이내로 자기를 소개하세요.</span>
  </div>
</div>

<div class="form-group">
	<label class="col-sm-3 control-label" for="inputNumberCheck">주소</label>
	<div class="col-sm-6">
		<div class="input-group">
			<input class="form-control" id="postcode" type="text" placeholder="우편번호" readonly="readonly">
			<span class="input-group-btn">
				<input class="btn btn-success" id="addrBtn" type="button" value="우편번호 찾기">
			</span>
		</div>
	</div>
</div>

<div class="form-group">
	<label class="col-sm-3 control-label" for="inputNumberCheck"></label>
	<div class="col-sm-6">
		<input class="form-control" type="text" id="address" placeholder="주소" readonly="readonly" value="">
	</div>
</div>
<div class="form-group">
	<label class="col-sm-3 control-label" for="inputNumberCheck"></label>
	<div class="col-sm-6">
		<input class="form-control" type="text" id="address2" placeholder="상세주소" value="">
	</div>
</div>

<div class="form-group">
	<div class="col-sm-12 text-center">
		<button class="btn btn-danger" type="submit">가입취소<i class="fa fa-times spaceLeft"></i></button>
		<button class="btn btn-primary" type="submit">수정완료<i class="fa fa-check spaceLeft"></i></button>
	</div>
</div>

</fieldset>
</form>