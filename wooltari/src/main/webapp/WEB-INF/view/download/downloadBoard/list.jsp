<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>



<style type="text/css">

.clickbtn {
   background-color: white;
   border-style: solid;
   padding: 5px 20px;
   margin-left: 10px;
   font-size:13px;
   border: 1px solid #EAEAEA;
}

.pagination > .active > a, .pagination > .active > span, .pagination > .active > a:hover, .pagination > .active > span:hover, .pagination > .active > a:focus, .pagination > .active > span:focus {
    z-index: 2;
    color: #fff;
    cursor: default;
    background-color: #1abc9c;
    /* border-color: #337ab7; */
    /* text-align: center; */
}

.pagination-sm > li > a, .pagination-sm > li > span {
    padding: 8px 9px;
    
    font-size: 11px;
}
.pagination > li > a, .pagination > li > span {
    position: relative;
    float: left;
    padding: 6px 12px;
    margin-left: -1px;
    line-height: 1.42857143;
    color: #1abc9c;
    text-decoration: none;
    background-color: #fff;
  border: none;
}

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
function searchList() {
	var f=document.searchForm;
	f.action="<%=cp%>/download/downloadBoard/list";
	f.submit();
}

function check(){
	//document.array_form 객체를 f 변수에 대입
	var f=document.array_form;
	
	if(f.chk==undefined) 
		return;
	
	if(f.chk.length!=undefined){//체크 박스가 둘 이상인 경우
		for(var i=0;i<f.chk.length;i++){

			if(f.allCheck.checked)
				f.chk[i].checked=true;
			else
				f.chk[i].checked=false;			
		}
	}else{//체크박스가 하나인 경우
		if(f.allCheck.checked)
			f.chk.checked=true;
		else
			f.chk.checked=false;
	}
}

function deleteList(){
	var f=document.array_form;
	var cnt=0;
	
	if(f.chk==undefined){
		return false;
	}
	if(f.chk.length!=undefined){//체크 박스가 둘 이상인 경우
		for(var i=0; i<f.chk.length;i++){
			if(f.chk[i].checked)
				cnt++;
		}
		
	}else{
		//체크박스가 하나인 경우
		if(f.chk.checked)
			cnt++;
	}
	if(cnt==0){
		alert("선택한 게시물이 없습니다.");
		return false;
	}
	if(confirm("선택한 게시물을 삭제하시겠습니까?")){		
		f.action="<%=cp%>/download/downloadBoard/deleteList";
		f.submit();
	}
	
}

<%-- 
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

//체크박스를 통한 삭제
function deleteAction(){
	var  chk = "";
	$("input[name='chk']:checked").each(function(){
		chk+=$(this).val()+",";
	});
	chk=chk.substring(0,chk.lastIndexOf(","));//맨끝 콤마 지우기
	
	if(chk == ''){
		alert("삭제할 대상을 선택 하세요.");
		return false;
	}
	
	var query={"chk":chk};	
	var url="<%=cp%>/download/infoReqBoar/deleteList";
	//console.log("### chk => {"+chk+"}");
	
	$.ajax({
		type:"POST"
		,url:url
		,data:query
		,dataType:"JSON"
		,success:function(data){
			var state=data.state;
			if(state=="true"){
				deleteList(num);				
			}else if(state=="false") {
				alert("삭제할 대상을 선택 하세요.");
			} else if(state=="loginFail") {
				login();
			}
		}
		,error:function(e) {
			console.log(e.responseText);
		}
	});
}
 --%>


		
</script>

<div style="width: 900px; margin: 60px auto;">
<div  style="height:50px; font-size: 20px;text-align: center; ">
			<span style="font-size: 20px;color:#BDBDBD; font-weight: bold;">
			<span style="font-size: 19px; color: #1abc9c; " class="glyphicon glyphicon-pencil">
			</span>&nbsp;&nbsp;&nbsp;WOOLTARI&nbsp;&nbsp;&nbsp;</span>자료다운게시판</div> 
<form name="array_form" id="array_form" style="width: 900px;" method="post"> 
	<input type="hidden" name="page" value="${page}" />
	
	<!-- List Start-->
	<div class="settingArea">
		<table style="width:100%;" cellpadding="0" cellspacing="0" border="0">
			<tr>
				<td colspan="2" style="text-align:left;">
					<!-- 
					<ul id="category">
						<li><a href="">게시판</a></li>						
					</ul>
					 -->
					<div style="position:absolute; bottom:10px; right: -15px;">
						<c:if test="${sessionScope.member.userId=='admin'}">
							<input type="checkbox" id="allCheck" name="allCheck" class="checkbox-style" onclick="check()"/><label for="allCheck">전체선택</label>			
						</c:if>
					</div>
				</td>
			</tr>
		</table>
	</div>
	
	<table cellpadding="0" cellspacing="0" style="width:100%;" class="board_table array">
		<tbody>

	<c:forEach var="dto" items="${list}">
			<tr>
				
				<td style="text-align:right; width:65px; padding: 5px 18px;">
					<c:if test="${sessionScope.member.userId=='admin'}">
						<input type="checkbox" name="chk" value="${dto.num}">
					</c:if>
				</td>
				
				<td class="___number">${dto.listNum}</td>
				<td>
					<div style="position:relative;">
						<!--[category_name]-->
					
						<a href="${articleUrl}&num=${dto.num}" class="subject">${dto.subject}</a><span class="comment">(${dto.replyCount})</span>
					
						<div class="info">
							<strong>작성일 </strong> <span class="dateWrap" title="[datetime]">${dto.created}</span>
							<span class="__dotted"></span>
							<strong>작성자 </strong><span>${dto.userId}</span>
							<span class="__dotted"></span>
							<strong>조회수 </strong><span>${dto.hitCount}</span>
						</div>
												
						<div class="likes">
							${dto.likeCount}<br>
							<span class="num" style="color: #1abc9c;">추천</span>
							<!--[unlikes]-->
						</div>						
					</div>
				</td>
			</tr>
	</c:forEach>	
			
			
		
			
		</tbody>
	</table>

	
</form>	
	
<!--------------------s:loop�쁺�뿭-------------------->

	<div class="paging" style="width: 900px; margin: 20px auto;text-align: center;">
		<c:if test="${dataCount==0 }">
                            등록된 게시물이 없습니다.
        </c:if>
        <c:if test="${dataCount!=0 }">
        	${paging}
        </c:if></div>
	<div class="btnArea" style="float: right;">
	<c:if test="${sessionScope.member.userId=='admin'}">
		<input type="button" class="clickbtn" 
		 onclick="javascript:deleteList();" value="삭제">
	</c:if>	
		<input type="button" class="clickbtn"
		 onclick="javascript:location.href='<%=cp%>/download/downloadBoard/created';" value="글쓰기">
	</div>

<form action="" id="array_form" name="searchForm" method="post">
	<div class="scArea" style="margin: 30px 10px 30px 200px;"> 
		<select name="searchKey" class="where">
			<option value="subject">제목</option>
			<option value="content">내용</option>
			<option value="userId">작성자</option>
		</select>
		<input type="text" name="searchValue" class="keyword" placeholder="검색"  style="width:120px; "> <input type="button" class="submit">
	</div>
</form>
</div>