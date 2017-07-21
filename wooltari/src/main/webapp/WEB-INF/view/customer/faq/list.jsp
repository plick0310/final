<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
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


           
</style>
<script type="text/javascript">
$(document).ready(function() {
});
function deleteList(){
	var f=document.searchForm;
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
		f.action="<%=cp%>/customer/faq/deleteList?pageNo=" + '${pageNo}' + "&category=" + '${category}'; 
		f.submit();
	}
}
</script>
<div class="container" style="height: 50px; font-size: 20px; text-align: auto;">
	<form action="" id="array_form" name="searchForm" method="post">
			<c:forEach var="dto" items="${list}">
				 <div class="panel panel">
				    <div class="panel-heading" role="tab" id="heading${dto.listNum}">
				      <h4 class="panel-title">
				        <span><small><input type="checkbox" id="chk" name="chk" value="${dto.num}"></small></span>
				        <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapse${dto.listNum}" aria-expanded="false" aria-controls="collapse${dto.listNum}">
				        <span><small>[${dto.category}]</small></span> &nbsp;&nbsp;&nbsp;<span><small>${dto.subject}</small></span>
				         
				         
				         	<input type="button" class="clickbtn"
							 onclick="javascript:location.href='<%=cp%>/customer/faq/update?pageNo=${pageNo}&num=${dto.num}';" value="수정하기">
				        </a>
				      </h4>
				    </div>
				    <div id="collapse${dto.listNum}" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading${dto.listNum}">
				      <div class="panel-body">				        
				        <div style="float: left; margin-left: 15px;">C O N T E N T : ${dto.content} </div>
				      </div>
				    </div>
				  </div>
			 </c:forEach>

			 
			 	<!-- 페이징 처리, 글쓰기, 삭제 버튼 -->
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
		 onclick="deleteList();" value="삭제">
	</c:if>	
		<input type="button" class="clickbtn"
		 onclick="javascript:location.href='<%=cp%>/customer/faq/created';" value="글쓰기">
	</div>
	
	<!-- 서치키 -->
		<div class="scArea" style="margin: 30px 10px 30px 200px;">
			<select name="searchKey" class="where">
				<option value="subject">제목</option>
				<option value="content">내용</option>
			</select>
			<input type="text" name="searchValue" class="keyword" placeholder="검색"  style="width:120px; ">
			<input type="button" class="submit" onclick="listPage(1);">
		</div>
	</form>
			 
</div>