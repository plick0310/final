<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<style type="text/css">
* {
	box-sizing: border-box;
}

body {
	margin: 0;
}


.span4{
	float: left;
}

.d3 {
	background: #F9F0DA;
}

.d3 form {
	background: #3e3a39;
	margin-top: 5px;
}

.d3 input, .d3 button {
	border: none;
	outline: none;
	background: transparent;
}

.d3 input {
	width: 100%;
	height: 42px;
	padding: 5px 0px 5px 15px;
}

.d3 button {
	height: 42px;
	width: 42px;
	position: absolute;
	top: 0;
	right: 0;
	cursor: pointer;
}

.d3 button:before {
	content: "\f002";
	font-family: FontAwesome;
	font-size: 16px;
	color: #F9F0DA;
}



.nav a, .nav a:link, .nav a:visited, .nav a:hover, .nav a:focus, span {
	color: #3e3a39;
}

.headerbody {
	width: 1140px;
	margin: 0px auto;
}
input[id=allCheck] {  
    display: none;  
}

input[id=allCheck] + label{
    display: inline-block;  
    cursor: pointer;  
    position: relative;  
    padding-left: 25px;  
    margin-right: 15px;  
    font-size: 13px;
}

input[id=allCheck]+ label:before {     

    content: "";  
    display: inline-block;  
  
    width: 13px;  
    height: 13px;  
  
    margin-right: 10px;  
    position: absolute;  
    left: 0; 
    top: 3px; 
    bottom: 1px;  
    background-color: #ccc;  
    border-radius: 16px; 
    box-shadow: inset 0px 1px 1px 0px rgba(0, 0, 0, .3), 0px 1px 0px 0px rgba(255, 255, 255, .8);  
}
input[id=allCheck]:checked + label:before { 

    
    text-shadow: 1px 1px 1px rgba(0, 0, 0, .2);  
    font-size: 7px; 
    font-weight:800; 
    color: #fff;  
    background:#1abc9c;
    text-align: center;  
    line-height: 15px;  

} 
.clickbtn{
background-color: white;
border-style: solid;
padding: 5px 20px;

margin-right: 10px;
border: 1px solid #EAEAEA;  

}
.panel-heading{
border-radius: 0px;
background-color: #eee;
}
.conttd td{
margin: 0px 10px;
} 

 

           
</style>
<div  style="height:50px; font-size: 20px;text-align: center; margin: 60px 0px;">
			<span style="font-size: 20px;color:#BDBDBD; font-weight: bold;">
			<span style="font-size: 19px; color: #1abc9c; " class="glyphicon glyphicon-pencil">
			</span>&nbsp;&nbsp;&nbsp;WOOLTARI&nbsp;&nbsp;&nbsp;</span>S T U D Y M A R K E T</div> 
			<div style="margin-bottom: 60px;">
<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true" style="width: 900px; margin: 0px auto;">
  <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="headingOne" style="border-radius: 0px; background-color: #eee;">
      <h4 class="panel-title">
        <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
         <table class="conttd">
         <tr>
         <td style="padding-right: 20px;"><small>No.1</small></td>
         <td style="padding-right: 20px;"><Strong>오세훈의 정보처리기사 필승전략</Strong></td>
         <td style="padding-right: 20px;"><small>작성일 : 2017-06-28</small></td>
         </tr>
         </table>
        </a>
      </h4>
    </div>
    <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
      <div class="panel-body"> 
       	<div style="float: left;"><img alt="" src="http://via.placeholder.com/150x150"></div><div style="float: left; margin-left: 15px;"><strong>CONTENT</strong> : 안연하세요 오세훈입니다. 단기간 자격층 취득 필승전략 입니다 </div>
      </div>
    </div>
  </div>
  </div>
</div>