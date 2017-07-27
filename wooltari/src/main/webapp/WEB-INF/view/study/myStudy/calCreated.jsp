<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>

<style>
.form-container div, .form-container  span {
	font-family: Calibri, Candara, Segoe, 'Segoe UI', Optima, Arial,
		sans-serif;
}

.form-container ::-webkit-input-placeholder { /* WebKit, Blink, Edge */
	color: #999;
}

.form-container :-moz-placeholder { /* Mozilla Firefox 4 to 18 */
	color: #999;
	opacity: 1;
}

.form-container ::-moz-placeholder { /* Mozilla Firefox 19+ */
	color: #999;
	opacity: 1;
}

.form-container :-ms-input-placeholder { /* Internet Explorer 10-11 */
	color: #999;
}

.form-container :placeholder-shown {
	/* Standard (https://drafts.csswg.org/selectors-4/#placeholder) */
	color: #999;
}

.oauth-buttons {
	text-align: center;
}

#login-form {
	min-width: 375px;
}

.login-container {
	width: 400px;
	height: 330px;
	display: inline-block;
	margin-top: -165px;
	top: 50%;
	left: 50%;
	position: absolute;
	margin-left: -200px;
}

.form-container .create-account:hover {
	opacity: .7;
}

.form-container .create-account {
	color: inherit;
	margin-top: 15px;
	display: inline-block;
	cursor: pointer;
	text-decoration: none;
}

.oauth-buttons .fa {
	cursor: pointer;
	margin-top: 10px;
	color: inherit;
	width: 30px;
	height: 30px;
	text-align: center;
	line-height: 30px;
	margin: 5px;
	margin-top: 15px;
}

.oauth-buttons .fa:hover {
	color: white;
}

.oauth-buttons .fa-google-plus:hover {
	background: #dd4b39;
}

.oauth-buttons .fa-facebook:hover {
	background: #8b9dc3;
}

.oauth-buttons .fa-linkedin:hover {
	background: #0077b5;
}

.oauth-buttons .fa-twitter:hover {
	background: #55acee;
}

.form-container .req-input .input-status {
	display: inline-block;
	height: 40px;
	width: 40px;
	float: left;
}

.form-container .input-status::before {
	content: " ";
	height: 20px;
	width: 20px;
	position: absolute;
	top: 10px;
	left: 10px;
	color: white;
	border-radius: 50%;
	background: white;
	-webkit-transition: all .3s ease-in-out;
	-moz-transition: all .3s ease-in-out;
	-o-transition: all .3s ease-in-out;
	transition: all .3s ease-in-out;
}

.form-container .input-status::after {
	content: " ";
	height: 10px;
	width: 10px;
	position: absolute;
	top: 15px;
	left: 15px;
	color: white;
	border-radius: 50%;
	background: #00BCD4;
	-webkit-transition: all .3s ease-in-out;
	-moz-transition: all .3s ease-in-out;
	-o-transition: all .3s ease-in-out;
	transition: all .3s ease-in-out;
}

.form-container .req-input {
	width: 100%;
	float: left;
	position: relative;
	background: #00BCD4;
	height: 40px;
	display: inline-block;
	border-radius: 0px;
	margin: 5px 0px;
	-webkit-transition: all .3s ease-in-out;
	-moz-transition: all .3s ease-in-out;
	-o-transition: all .3s ease-in-out;
	transition: all .3s ease-in-out;
}

.form-container div .row .invalid:hover {
	background: #EF9A9A;
}

.form-container div .row .invalid {
	background: #E57373;
}

.form-container .invalid .input-status:before {
	width: 20px;
	height: 4px;
	top: 19px;
	left: 10px;
	background: white; /*#F44336;*/
	border-radius: 0px;
	-ms-transform: rotate(45deg); /* IE 9 */
	-webkit-transform: rotate(45deg); /* Chrome, Safari, Opera */
	transform: rotate(45deg);
}

.form-container .invalid .input-status:after {
	width: 20px;
	height: 4px;
	background: white;
	border-radius: 0px;
	top: 19px;
	left: 10px;
	-ms-transform: rotate(-45deg); /* IE 9 */
	-webkit-transform: rotate(-45deg); /* Chrome, Safari, Opera */
	transform: rotate(-45deg);
}

.form-container div .row  .valid:hover {
	background: #A5D6A7;
}

.form-container div .row .valid {
	background: #1abc9d;
}

.form-container .valid .input-status:after {
	border-radius: 0px;
	width: 17px;
	height: 4px;
	background: white;
	top: 16px;
	left: 15px;
	-ms-transform: rotate(-45deg);
	-webkit-transform: rotate(-45deg);
	transform: rotate(-45deg);
}

.form-container .valid .input-status:before {
	border-radius: 0px;
	width: 11px;
	height: 4px;
	background: white;
	top: 19px;
	left: 10px;
	-ms-transform: rotate(45deg);
	-webkit-transform: rotate(45deg);
	transform: rotate(45deg);
}

.form-container .input-container {
	padding: 50px 20px;
}

.form-container .row-input {
	padding: 0px 5px;
}

.form-container .req-input.input-password {
	margin-bottom: 0px;
}

.form-container .req-input.confirm-password {
	margin-top: 0px;
}

.form-container {
	padding: 20px;
	border-radius: 0px;
	background: #B3E5FC;
	color: #00838F;
	-webkit-transition: all .3s ease-in-out;
	-moz-transition: all .3s ease-in-out;
	-o-transition: all .3s ease-in-out;
	transition: all .3s ease-in-out;
}

.form-container .form-title {
	font-size: 25px;
	color: inherit;
	text-align: center;
	margin-bottom: 10px;
	-webkit-transition: all .3s ease-in-out;
	-moz-transition: all .3s ease-in-out;
	-o-transition: all .3s ease-in-out;
	transition: all .3s ease-in-out;
}

.form-container .submit-row {
	padding: 0px 0px;
}

.form-container .btn.submit-form {
	margin-top: 15px;
	padding: 12px;
	background: #00BCD4;
	color: white;
	border-radius: 0px;
	-webkit-transition: all .3s ease-in-out;
	-moz-transition: all .3s ease-in-out;
	-o-transition: all .3s ease-in-out;
	transition: all .3s ease-in-out;
}

.form-container .btn.submit-form:focus {
	outline: 0px;
	color: white;
}

.form-container .btn.submit-form:hover {
	background: #00cde5;
	color: white;
}

.form-container .tooltip.top .tooltip-arrow {
	border-top-color: #00BCD4 !important;
}

.form-container .tooltip.top.tooltip-invalid .tooltip-arrow {
	border-top-color: #E57373 !important;
}

.form-container .tooltip.top.tooltip-invalid .tooltip-inner::before {
	background: #E57373;
}

.form-container .tooltip.top.tooltip-invalid .tooltip-inner {
	background: #FFEBEE !important;
	color: #E57373;
}

.form-container .tooltip.top.tooltip-valid .tooltip-arrow {
	border-top-color: ##75ccbb !important;
}

.form-container .tooltip.top.tooltip-valid .tooltip-inner::before {
	background: ##75ccbb;
}

.form-container .tooltip.top.tooltip-valid .tooltip-inner {
	background: #E8F5E9 !important;
	color: ##75ccbb;
}

.form-container .tooltip.top .tooltip-inner::before {
	content: " ";
	width: 100%;
	height: 6px;
	background: #00BCD4;
	position: absolute;
	bottom: 5px;
	right: 0px;
}

.form-container .tooltip.top .tooltip-inner {
	border: 0px solid #00BCD4;
	background: #E0F7FA !important;
	color: #00ACC1;
	font-weight: bold;
	font-size: 13px;
	border-radius: 0px;
	padding: 10px 15px;
}

.form-container .tooltip {
	max-width: 150px;
	opacity: 1 !important;
}

.form-container .message-box {
	width: 100%;
	height: auto;
}

.form-container textarea:focus, .form-container textarea:hover {
	background: #fff;
	outline: none;
	border: 0px;
}

.form-container .req-input textarea {
	max-width: calc(100% - 50px);
	width: 100%;
	height: 80px;
	border: 0px;
	color: #777;
	padding: 10px 9px 0px 9px;
	float: left;
}

.form-container input[type=text]:focus, .form-container input[type=password]:focus,
	.form-container input[type=email]:focus, .form-container input[type=tel]:focus,
	.form-container select {
	background: #fff;
	color: #777;
	border-left: 0px;
	outline: none;
}

.form-container input[type=text]:hover, .form-container input[type=password]:hover,
	.form-container input[type=email]:hover, .form-container input[type=tel]:hover,
	. form-container select {
	background: #fff;
}

.form-container input[type=text], .form-container input[type=password],
	.form-container input[type=email], input[type=tel], form-container select
	{
	width: calc(100% - 50px);
	float: left;
	border-radius: 0px;
	border: 0px solid #ddd;
	padding: 0px 9px;
	height: 40px;
	line-height: 40px;
	color: #777;
	background: #fff;
	-webkit-transition: all .3s ease-in-out;
	-moz-transition: all .3s ease-in-out;
	-o-transition: all .3s ease-in-out;
	transition: all .3s ease-in-out;
}

.row {
	margin: 0;
	padding: 0;
	text-align: center;
}
</style>


<form name="calForm" id="calForm" method="post">
	<div id="contact-form" class="form-container" data-form-container
		style="color: rgb(46, 125, 50);background:rgba(200, 230, 225, 0.67);height: 395px;border-radius: 5px 5px 0px 0px;">
		<div class="row">
			<div class="form-title">
				<span style="color:#1abc9d; font-size: 30px;"> Create a schedule </span>
			</div>
		</div>
		<div class="input-container">
		
		<table style=" margin-top: -30px; margin-bottom: 15px;">
			<tr style="font-size: 19px; ">
				<td style="color: #1abc9c; padding-left: 20px;">start-day<br>
					<input type="text" style=" height:28px; width:130px; text-align:center;  border: none; color: gray" value="${sdate }" name="sdate" readonly="readonly">
					<i class="glyphicon glyphicon-calendar" aria-hidden="true" style="padding-left:10px;"/>
				</td>
				<td style="color: #1abc9c; padding-left: 50px;">end-day<br>
					<input type="text" style="height:28px;  width:130px; text-align:center; border: none; color: gray" value="${edate }" name="edate" readonly="readonly">
					<i class="glyphicon glyphicon-calendar" aria-hidden="true" style="padding-left:10px;"/>
				</td>
			</tr></table>
		
			<div class="row">
				<span class="req-input valid"> <span class="input-status"
					data-toggle="tooltip" data-placement="top"
					title="Input your post title."> </span> <input type="text"
					data-min-length="8" placeholder="일정 제목" name="subject">
				</span>
			</div>
	
			<div class="row">
				<span class="req-input message-box valid"> <span
					class="input-status" data-toggle="tooltip" data-placement="top"
					title="Post Contents."> </span> <textarea type="textarea"
						data-min-length="10" placeholder="일정 내용"  name="content"></textarea>
			</div>

		</div>
	</div>
	<input type="hidden" name="month" value="${month }">
	<input type="hidden" name="s_num" value="${s_num }">
</form>
