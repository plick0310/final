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

input[class=chk1] {  
    display: none;  
}

input[class=chk1] + label{
    display: inline-block;  
    cursor: pointer;  
    position: relative;  

    font-size: 13px;
}

input[class=chk1]+ label:before {     

    content: "";  
    display: inline-block;  
  
    width: 13px;  
    height: 13px;  
  

    position: absolute;  

   
    background-color: #ccc;  
    border-radius: 16px; 
    box-shadow: inset 0px 1px 1px 0px rgba(0, 0, 0, .3), 0px 1px 0px 0px rgba(255, 255, 255, .8);  
}
input[class=chk1]:checked + label:before { 

    
    text-shadow: 1px 1px 1px rgba(0, 0, 0, .2);  
    font-size: 7px; 
    font-weight:800; 
    color: #fff;  
    background:#1abc9c;
    text-align: center;  
    line-height: 15px;  

} 

           
</style>
<script>
$(document).ready(function(){
    //최상단 체크박스 클릭
  
    $("#allCheck").click(function(){
        //클릭되었으면
        if($("#allCheck").prop("checked")){
            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
            $("input[name=chk]").prop("checked",true);
            //클릭이 안되있으면
        }else{
            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
            $("input[name=chk]").prop("checked",false);
        }
    });

 
});


</script>

<div style="width: 900px; margin: 60px auto;">
<form name="array_form" id="array_form" style="width: 900px;">
	<input type="hidden" name="article" value="[article_value]" />
	<input type="hidden" name="category" value="[category_value]" />
	<input type="hidden" name="board_id" value="[board_id_value]" />
	<input type="hidden" name="page" value="[page_value]" />
	<!-- List Start-->
	<div class="settingArea">
		<table style="width:100%;" cellpadding="0" cellspacing="0" border="0">
			<tr>
				<td colspan="2" style="text-align:left;">
					<ul id="category">
						<li><a href="">게시판</a></li>
						<li><a href="">게시판</a></li>
						<li><a href="">게시판</a></li>
					
					</ul>
					<div style="position:absolute; bottom:10px; right:0; ">
						<input type="checkbox" id="allCheck" name="allCheck" class="checkbox-style" /><label for="allCheck">전체선택</label>
					
						
						
					</div>
				</td>
			</tr>
		</table>
	</div>
	<table cellpadding="0" cellspacing="0" style="width:100%;" class="board_table array">
		<tbody>

		
			<tr>
				
				<td style="text-align:right; width:50px; padding: 5px 18px;"><input type="checkbox" name="chk"  class="chk1"><label for="chk1"></label></td>
				
				<td class="___number">11</td>
				<td>
					<div style="position:relative;">
						<!--[category_name]-->
					
						<a href="[link]" class="subject">제목입니다</a><span class="comment" style="background: #1abc9c;">[16]</span>
						
						<div class="info">
							<strong>작성일 </strong> <span class="dateWrap" title="[datetime]">2017-06-19</span>
							<span class="__dotted"></span>
							<strong>작성자 </strong><span>홍길동</span>
							<span class="__dotted"></span>
							<strong>조회수 </strong><span>30</span>
						</div>
						
						
						<div class="likes">
							25<br>
							<span class="num" style="color: #1abc9c; ">추천</span>
							<!--[unlikes]-->
						</div>
						
					</div>
				</td>
			</tr>
		
			
		</tbody>
	</table>
	
	
	
<!--------------------s:loop�쁺�뿭-------------------->

	<div style="width: 900px; margin: 20px auto;text-align: center;">1 2 3</div>
	<div class="btnArea">
		<input type="button" style="background-color: #1abc9c;" onclick="javascript:location.href='<%=cp%>/help/report/created';" value="글쓰기">
	
	</div>
	<div class="scArea">
		<select name="where" class="where">
			<option value="subject">제목</option>
			<option value="ment">내용</option>
			<option value="writer">작성자</option>
		</select>
		<input type="text" name="keyword" class="keyword" value="검색" style="width:120px;"> <input type="button" class="submit">
	</div>
</form>
</div>