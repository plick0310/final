<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<script type="text/javascript">

function login() {
	location.href="<%=cp%>/main";
}


function deleteBoard(){
<c:if test="${sessionScope.member.userId=='admin'||sessionScope.member.userId==dto.userId}">	
	var num="${dto.num}";
	var page="${page}";
	var query="num="+num+"&page="+page;
	var url="<%=cp%>/promote/delete?"+query;
	
	
	if(confirm("글을 삭제하시겠습니까?"))
		location.href=url;
</c:if>

<c:if test="${sessionScope.member.userId!='admin'&&sessionScope.member.userId!=dto.userId}">	
	alert("게시물을 삭제할 수 없습니다.");
</c:if>
	
}

$(function(){
	listPage(1);
});

//댓글리스트
function listPage(page) {
	var url="<%=cp%>/promote/listReply";
	var num="${dto.num}";
	$.post(url, {num:num, pageNo:page}, function(data){
		$("#listReply").html(data);
	});
	
}

//댓글추가
function insertReply(){
	var userId="${sessionScope.member.userId}";
	if(! userId) {
		login();
		return false;
	}
	
	
	var num="${dto.num}";
	var content=$.trim($("#replyContent").val());
	if(! content ) {
		$("#content").focus();
		return false;
	}
	
	var query = { "info":"홍보댓글 작성", "value":10}
	$.ajax({
	   url:"<%=cp%>/point/update",
	   data:query,
	   type:"post",
	   dataType:"json",
	   success : function(data) {
	     
	   }
	});
	
	var query="num="+num+"&content="+encodeURIComponent(content);
	
	$.ajax({
		type:"post"
		,url:"<%=cp%>/promote/insertReply"
		,data:query
		,dataType:"json"
		,success:function(data){
			$("#replyContent").val("");
			var state=data.state;
			
			if(state=="true"){
				listPage(1);
			}else if(state=="false"){
				alert("댓글 등록에 실패하였습니다")
			}else if(state=="loginFail"){
				login();
			}
		}
		,error:function(e){
			console.log(e.responseText);
		}
			
		
		
	});
	
}

//댓글삭제
function deleteReply(prNum,pageNo){
	
	if(!confirm("삭제하시겠습니까?")){
		return;
	}
	
	var query = { "info":"홍보댓글 삭제", "value":-30}
	$.ajax({
	   url:"<%=cp%>/point/update",
	   data:query,
	   type:"post",
	   dataType:"json",
	   success : function(data) {
	     
	   }
	});
	
	var query="prNum="+prNum+"&page="+pageNo;
	$.ajax({
		type:"post"
		,url:"<%=cp%>/promote/deleteReply"
		,data:query
		,dataType:"json"
		 ,success:function(data){
			
			 var state=data.state;
			
			if( state=="true"){
				listPage(pageNo);
			}else if(state=="false"){
				alert("삭제에 실패하였습니다.")
			}else if(state=="loginFail"){
				location.href="<%=cp%>/main";
			}
			
		}
		,error:function(e){
			console.log(e.responseText);
		}
	});
}


function updateBoard(){
	var num=$("#hiddenNum").val();
	var query="num="+num;
	
	var url="<%=cp%>/promote/updateBoard?"+query;
	
	location.href=url;
}

</script>

<style>
.dnu{
border: none;
background: none;
}

.clickbtn {
	background-color: white;
	border-style: solid;
	padding: 5px 20px;
	margin-left: 10px;
	font-size:13px;
	border: 1px solid #EAEAEA;
}
.board_table tbody td{
padding: 0;
border: none;
padding-bottom: 2px;
}
#countLikeStudyWhere{
    line-height: 10px;
    font-size: 16px;
    font-weight: bold;
    letter-spacing: -1px;
    text-align: center;
    color: #666666;
    display: block;
    width: 50px;
    height: 20px;
    padding-top: 5px;}
    .board_table{
    border: none;
    }
    .board_table tbody td.read_contArea{
    
    padding: 0;}
    
    .col-md-4{
    text-align: center;
    }
    .infobo{
    font-weight: bold;
    color: #1abc9c;
    }
    .col-md-12{
    text-align: center;
    }
    #board_memo_area{
line-height: normal; 
}
</style>

<div  style=" margin: 60px auto; height:50px; font-size: 20px;text-align: center;">
			<span style="font-size: 20px;color:#BDBDBD; font-weight: bold;">
			<span style="font-size: 19px; color: #1abc9c; " class="glyphicon glyphicon-pencil">
			</span>&nbsp;&nbsp;&nbsp;WOOLTARI&nbsp;&nbsp;&nbsp;</span>P R O M O T I O N . . .</div>
<table cellpadding="0" cellspacing="0" id="read_table" class="board_table" style="width: 900px; margin: -45px auto 0;">

	<thead>
		<tr>
			<th class="informations" style="    border-top: 2px solid rgba(56, 54, 53, 0.23);">
				스터디명>${dto.studyName } &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;제목 > ${dto.subject } 
				<span class="inforArea">
					<strong>작성일</strong> ${dto.created }
					<span class="__dotted"></span>
					<strong>작성자</strong> ${dto.userName }
					<span class="__dotted"></span>
					<strong>조회수</strong> ${dto.hitCount }
				</span>
			</th>
		</tr>
	</thead>
	<tbody>
		<tr>
		
			<td class="read_contArea" style="padding: 15px;">
				<div id="board_memo_area">
				<c:if test="${dto.imageFileName!=null }">
				<img src="<%=cp%>/uploads/photo/${dto.imageFileName}" style="max-width: 400px; height: 160px; margin-bottom:10px; resize: both;">
				</c:if>
					<br>${dto.content }
				</div>
			<div style="background: #eee; width: 100%; padding: 10px;line-height: 25px; margin-top: 70px; margin-bottom: -60px;" >
				<div class="row" >
					<div class="col-md-12" style="width: 30%;"><span class="infobo"><i class="glyphicon glyphicon-pencil"></i>카테고리 :${dto.name }</span></div>
				 	<div class="col-md-4" style="width: 30%;"><span class="infobo"><i class="glyphicon glyphicon-flag"></i>지역 :</span></div>
				  	<div class="col-md-4" style="width: 30%;"><span class="infobo"><i class="glyphicon glyphicon-heart"></i>성별 :${dto.gender }</span></div>
				</div>
					
				<div class="row">
				 <%-- 	<div class="col-md-4" style="width: 30%;"><span class="infobo"><i class="glyphicon glyphicon-filter"></i>대상 :${dto.target }</span></div> --%>
				 	<div class="col-md-4" style="width: 30%;"><span class="infobo"><i class="glyphicon glyphicon-user"></i> 정원 :${dto.recruit }명</span> </div>
				</div>
			</div>
					
					<ul class="_read_likesArea" style="margin-top:20px; margin-bottom:0;padding-bottom: 10px;">
						<li class="_likes_btn">
							<div title="" id="countLikeStudyWhere"  style="height: 20px;">
								<br/>
							</div>	
						</li>					
					</ul>
				
						<input type="hidden" id="hiddenNum" value="${dto.num }">
						
				</td>
			
					
				
					</table>
					
				<table style="width: 900px; margin: 0px auto 20px; border-spacing: 0px;">
			<tr height="45" style="    border-top: 1px solid #eee;">
			    <td width="300" align="left">
			    	<c:if test="${sessionScope.member.userId==dto.userId }">
			          <button type="button" class="clickbtn" onclick="updateBoard();" style="    margin-left: 0;">수정</button>
			    	</c:if>
			    	<c:if test="${sessionScope.member.userId==dto.userId || sessionScope.member.userId=='admin'}">
			          <button type="button" class="clickbtn" onclick="deleteBoard();" style="    margin-left: 5px;">삭제</button> 
			    	</c:if>
			    </td>
			
			    <td align="right">
			        <button type="button" class="clickbtn" onclick="javascript:location.href='<%=cp%>/promote/list';">리스트</button>
			    </td>
			</tr>
				
		
				
			
		
		
            <tr height='30' style="width: 900px; margin: 0 auto;"> 
	            <td align='left' colspan="2" style="    padding-top: 41px;">
	            	<span style='font-weight: bold; color: #1abc9c;' >댓글쓰기</span><span> - 타인을 비방하거나 개인정보를 유출하는 글의 게시를 삼가 주세요.</span>
	            </td>
            </tr>
            <tr>
               <td style='padding:5px 5px 0px;' colspan="2">
                    <textarea id='replyContent' class='boxTA' style='width:99%; height: 70px;'></textarea>
                </td>
            </tr>
            <tr>
               <td align='right' colspan="2">
                    <button type='button' class='clickbtn' style="padding:10px 20px;     border: none;" onclick='insertReply();'>댓글 등록</button>
                </td>
            </tr>
            
	</tbody>
			</table>
	

            <div id="listReply"></div>
