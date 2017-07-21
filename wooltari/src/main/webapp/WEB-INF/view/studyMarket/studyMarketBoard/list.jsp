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
.bestbar{
width: 900px;
height: 200px;
background: #eee;
box-shadow: 0px 3px 12px 3px #eee;
}

.bestbarsome{
width: 150px;
height: 150px;
background-color: white;
margin: 0 auto;
padding: 40px;

}
.bestbar td{

}
           
</style>
<script type="text/javascript">



</script>
<!-- 게시판 이름 -->
<div style="width:900px; margin: 60px auto; ">
<div  style="height:50px; font-size: 20px;text-align: center; margin: 60px 0px 20px;"> 
			<span style="font-size: 20px;color:#BDBDBD; font-weight: bold;">
			<span style="font-size: 19px; color: #1abc9c; " class="glyphicon glyphicon-pencil">
			</span>&nbsp;&nbsp;&nbsp;WOOLTARI&nbsp;&nbsp;&nbsp;</span>S T U D Y M A R K E T</div> 
<strong style="font-size: 20px;"><span style="color:rgba(183, 183, 183, 0.65); font-size: 20px;">
<i class="glyphicon glyphicon-align-left" style="color: #1abc9c; margin-bottom: 20px;"></i>&nbsp;&nbsp;B E S T</span> 스 터 디</strong>

<!-- 베스트 강좌 -->
<div class="row"
		style="margin-bottom: 20px; width: 900px; margin-left: 0;">
		<c:forEach var="dto" items="${bestlist}">
		<div class="col-sm-6 col-md-4">
			<div class="thumbnail" onclick="javascript:location.href='${articleUrl}&num=${dto.num}'">
			
			<div
					style="width:100%; height:200px; background-image:url('http://img.youtube.com/vi/${dto.urlContent}/hqdefault.jpg');background-size: contain;">
				<%-- <div
					style="width:100%; height:200px; background-image:url('<%=cp%>/uploads/member/userImg/${dto.userImg}');background-size: contain;"> --%>
					<img alt="" src="<%=cp%>/resource/images/no${dto.bestlistNum }.png"
						style="width: 50px; height: 50px; margin: -1px;">
				</div>

				<div class="caption">
					<h3 style="font-size: 18px;">
						${dto.subject} <small style="margin-left: 33px;">추천&nbsp;&nbsp;</small><span
							style="font-size: 35px; color: #1abc9c; font-weight: lighter;">${dto.likeCount }</span>
					</h3>
					<p>강사명  : ${dto.userId}</p>
					<p style="text-align: right;">
						<a href="#" style="color: #1abc9c;">+MORE</a>
					</p>
				</div>
			</div>
		</div>
		</c:forEach>
	</div>
</div>
<hr style="width: 100%; height: 1px; background-color: #eee; margin-bottom: 50px;">

<div style="text-align: center; width: 900px; margin: 10px auto;">



<!-- 게시판 중간 제목  -->
<strong style="font-size: 20px;"><span style="color:rgba(183, 183, 183, 0.65); font-size: 20px;">
<i class="glyphicon glyphicon-align-left" style="color: #1abc9c;margin-top:50px; margin-bottom: 20px;"></i>&nbsp;&nbsp;M A R K E T</span> L I S T</strong>
<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true" style="width: 900px; margin: 0px auto">
  
  
<!-- 게시판  --> 
<c:forEach var="dto" items="${list}">
 <div class="panel panel">
    <div class="panel-heading" role="tab" id="heading${dto.listNum}">
      <h4 class="panel-title">
        <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapse${dto.listNum}" aria-expanded="false" aria-controls="collapse${dto.listNum}">
        <span><small>${dto.listNum}</small></span> &nbsp;&nbsp;&nbsp;<span>${dto.subject}</span> <small>작성자 : ${dto.userId} </small>&nbsp;&nbsp;&nbsp;<small>작성일 : ${dto.created}</small>
        <small>조회수 : ${dto.hitCount} </small><small class="likes"> 추천 : ${dto.likeCount} </small>
        <input type="button" class="clickbtn" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo"
		 onclick="javascript:location.href='${articleUrl}&num=${dto.num}';" value="동영상 보기">
        </a>
      </h4>
    </div>
    <div id="collapse${dto.listNum}" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading${dto.listNum}">
      <div class="panel-body">
        <div style="width: 150px;height: 150px;background-color: #eee;padding: 30px;float: left; background-size:cover; background-image: url('http://img.youtube.com/vi/${dto.urlContent}/hqdefault.jpg');">
        <!-- <div style="width: 150px;height: 150px;background-color: #eee;padding: 30px;float: left; background-size:cover; background-image: url('<%=cp%>/uploads/member/userImg/${dto.userImg}');"> -->
        </div>
        <div style="float: left; margin-left: 15px;">C O N T E N T : ${dto.content} </div>
        
        	<div class="tbl_st1">
			<table>
				<colgroup>
					<col width="100px">
					<col width="100px">
				</colgroup>
				<tr>
					<th>제목</th>
					<th>작성일</th>
				</tr>
				 <c:forEach var="vo" items="${dto.innerList}"><!--${dto.innerList}에서 dto는 부모 forEach의 var="dto"의 dto   -->
				<tr>
					<td class="subject"><a href="${articleUrl}&num=${vo.num}">${vo.subject}</a></td>
					<td class="created">${vo.created}</td>
				</tr>
				</c:forEach>
				
			</table>
		</div>
        
      </div>
    </div>
  </div>
</c:forEach> 
  

  
  <!-- 페이지, 글쓰기 삭제 버튼  -->
  
  <div style="width: 900px; margin: 20px auto;text-align: center;">
  		<c:if test="${dataCount==0}">
  		등록된 게시물이 없습니다.
  		</c:if>
  		<c:if test="${dataCount!=0}">
  		${paging}
  		</c:if>
  </div>
	<div class="btnArea" style="float: right;">
			
		<input type="button" class="clickbtn" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo"
		 onclick="javascript:location.href='<%=cp%>/studyMarket/studyMarketBoard/created?page='+${page};" value="글쓰기">
	
	</div>
	
	<!-- 찾기  -->	
  <form action="" id="array_form" name="searchForm" method="post">
	<div class="scArea" style="margin: 30px 10px 30px 80px;"> 
		<select name="searchKey" class="where">
			<option value="subject">제목</option>
			<option value="content">내용</option>
			<option value="userId">작성자</option>
		</select>
		<input type="text" name="searchValue" class="keyword" placeholder="검색"  style="width:120px; "> <input type="button" class="submit">
	</div>
	</form>
</div>	
</div>


