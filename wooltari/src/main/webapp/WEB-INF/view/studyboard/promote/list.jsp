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




           
</style>
<script>
/* $(document).ready(function(){
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

}); */

function search(){
	var f=document.searchForm;
	f.action="<%=cp%>/promote/list";
	f.submit();
};


</script>

<div style="width: 900px; margin: 60px auto;">
<div  style="height:50px; font-size: 20px;text-align: center; ">
			<span style="font-size: 20px;color:#BDBDBD; font-weight: bold;">
			<span style="font-size: 19px; color: #1abc9c; " class="glyphicon glyphicon-pencil">
			</span>&nbsp;&nbsp;&nbsp;STUDY&nbsp;&nbsp;&nbsp;</span>P R O M O T I O N</div>
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
					<div style="position:absolute; bottom:10px; right: -15px; top: 9px;">
						
					
						
						
					</div>
				</td>
			</tr>
		</table>
	</div>
	
	<table cellpadding="0" cellspacing="0" style="width:100%;" class="board_table array">
		<tbody>	
		<c:forEach var="dto" items="${list }">
			<tr>			
				<td class="___number">${dto.listNum }</td>
				<td>
					<div style="position:relative;">
						
						<a href="${articleUrl}&num=${dto.num}" class="subject">IT/컴퓨터&nbsp;&nbsp;&nbsp;&nbsp;서울&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${dto.subject}&nbsp;&nbsp; </a><span class="comment">[${dto.replyCount}]</span>
					
						<div class="info">
							<strong>작성일 </strong> <span class="dateWrap" title="[datetime]">${dto.created}</span>
							<span class="__dotted"></span>
							<strong>작성자 </strong><span>${dto.userName }</span>
							<span class="__dotted"></span>
							<strong>조회수 </strong><span>${dto.hitCount}</span>
						</div>
						
					</div>	
				</td>		
			</tr>
			</c:forEach>

		</tbody>
	</table>
	
	
	
<!--------------------s:loop�쁺�뿭-------------------->

	<div style="width: 900px; margin: 20px auto;text-align: center;">${paging }</div>
	<div class="btnArea">
		
		<input type="button" class="clickbtn"
		 onclick="javascript:location.href='<%=cp%>/promote/created';" value="글쓰기">
	</div>
</form>
<form name="searchForm" id="array_form" method="post" style="width: 900px;">
	<div class="scArea">
		<select name="searchKey" class="where">
			<option value="subject">제목</option>
			<option value="content">내용</option>
			<option value="userName">작성자</option>
		</select>
		<input type="text" name="searchValue" class="keyword" placeholder="검색"  style="width:120px; "> <input type="button" class="submit" onclick="search();">
	</div>
</form>	

</div>