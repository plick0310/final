<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<form class="form-horizontal">
<fieldset>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="userName">Name</label>  
  <div class="col-md-4">
  <input id="userName" name="userName" type="text" placeholder="Name" class="form-control input-md" required="">
  <span class="help-block">다른 회원들에게 보여질 별명입니다.</span>  
  </div>
</div>

<!-- Password input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="userPwd">Password</label>
  <div class="col-md-4">
    <input id="userPwd" name="userPwd" type="password" placeholder="Password" class="form-control input-md" required="">
    <span class="help-block">패스워드를 입력해주세요.</span>
  </div>
</div>

<!-- Password input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="userPwd2">Password Confirm</label>
  <div class="col-md-4">
    <input id="userPwd2" name="userPwd2" type="password" placeholder="Password Confirm" class="form-control input-md" required="">
    <span class="help-block">패스워드를 한번 더 입력해주세요.</span>
  </div>
</div>

<!-- Multiple Radios (inline) -->
<div class="form-group">
  <label class="col-md-4 control-label" for="gender">Gender</label>
  <div class="col-md-4"> 
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
  <label class="col-md-4 control-label" for="introduce">Introduce</label>
  <div class="col-md-4">                     
    <textarea class="form-control" id="introduce" name="introduce"></textarea>
  </div>
</div>

</fieldset>
</form>