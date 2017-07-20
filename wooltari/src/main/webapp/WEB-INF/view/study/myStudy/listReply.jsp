
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<style>

.reply-list {
background: #fff;
    margin-top: 20px;
margin-bottom: 20px;
border-radius: 3px;
-moz-border-radius: 3px;
-webkit-border-radius: 3px;
}
.reply-list ul{
    clear: both;
    background: white;
}

.reply-list li {
padding: 0px 10px 1px;
    border-top: 1px solid #eee;
    overflow: hidden;
    line-height: 25px;
}
.reply-list li {
list-style:none;
}

.clearfix {
display: block;
}
.clearfix:after {
content: " ";
display: block;
height: 0;
clear: both;
visibility: hidden;
overflow: hidden;
}

li {
display: list-item;
text-align: -webkit-match-parent;
} ul {
margin: 0;
padding: 0;
border: 0;
font-size: 100%;
font: inherit;
vertical-align: baseline;
}
 ul {
list-style: none;
}
.round {
border-radius:100%;
  display: block;
height: 48px;
width: 49px;
float: left;
}
.reply-content{
    border: 1px solid #C0CAE3;
}

.reply-list li em {
background: url(http://d1dls1ko4h0b59.cloudfront.net/assets/campaign-legend-d95e12bce50a8e18d8bd3c96383c352f.png) no-repeat;
display: block;
height: 48px;
width: 49px;
float: left;
}
.reply-list li em.extra {
background-position: -118px 0;
}
.reply-list li em.hot {
background-position: -58px 0;
}
.reply-list p {
padding: 10px 15px;
margin: 0;
font: 600 16px/22px "myriad-pro",Arial,"Helvetica Neue",Helvetica,sans-serif;
}
p {
display: block;
-webkit-margin-before: 1em;
-webkit-margin-after: 1em;
-webkit-margin-start: 0px;
-webkit-margin-end: 0px;
}

.reply-list li .legend-info {
float: left;
margin-left: 17px;

}

.reply-list strong {
margin-right: 5px;
}

strong {
font-weight: bold;
}

#delete{
    margin: 15px;
    float: right;
    font-size: 15px;
}
</style>
<script>

var replyCount =${replyCount};

$(function () {
	listPage2(replyCount,'${num}');
});

//게시물 댓글 개수
function countReplyBoard(num) {
	var url="<%=cp%>/study/myStudy/${s_num}/countboardReply";
	
	$.post(url, {num:num}, function(data){
		var count=data.countReplyBoard;
		//alert(count);
		$("#countReplyBoard_"+num).html(count);
	}, "json");
}

function sendReply(num){
	var content = $.trim($('#rcontent_'+num).val());
	if(! content ) {
		alert("내용을 입력하세요");
		$("#rcontent_"+num).focus();
		return;
	}
	
	query="content="+encodeURIComponent(content);
	
	query+="&num="+num;
	$.ajax({
		type:"POST"
		,url:"<%=cp%>/study/myStudy/home/${s_num}/replyCreated"
		,data:query
		,dataType:"json"
		,success:function(data){
			//alert("성공");
			$("#rcontent_"+num).val("");
			//리스트 띄우기
			 listPage2(replyCount, num);
			 countReplyBoard(num);
		}

		,error:function(e){
			alert(e.responsText);
		}
	});
}

function listPage2(replyCount, num) {
	var url="<%=cp%>/study/myStudy/${s_num}/reply_List";
	
	$.ajax({
		type:"post"
		,url:url
		,dataType:"json"
		,data:"num="+num
		,success:function(data){
			printReply(data, num);
		}
		,error:function(e){
			console.log(e.responseText);
		}
	});
}  

 function printReply(data, num){
	var uid="${sessionScope.member.userId}";
	var out ="";
	
	for(var idx=0; idx<data.list.length; idx++) {
		var userId = data.list[idx].userId;
		var userName = data.list[idx].userName;
		var content=data.list[idx].content;
		var created=data.list[idx].created;
		var imageFileName = data.list[idx].imageFileName;
		var reNum = data.list[idx].reNum;
		
			out += "<li class='clearfix'> ";
			out += "<img class='round' src='<%=cp%>/uploads/member/userImg/"+imageFileName+"'>";
			out += "<div class='legend-info'>";
			out += "<strong>" + userName + "</strong>" + created;
			out += "<br>" + content + "</div>";
			
			if (uid == userId) {
				out += "<div id='delete'> <a onclick='deleteReply("+num+","+reNum+")';>삭제</a></div></li>"
			} else {
				out += "<div id='delete'> <a onclick='';>신고</a></div></li>"
			}

		}
		$("#reply-content_"+num).html(out);
		
	}
 
 function deleteReply(num,reNum) {
	//alert(num+"삭제");
	if(confirm("댓글을 삭제하시겠습니까? ")){ 
		var url="<%=cp%>/study/myStudy/home/${s_num}/replyDelete";
		$.post(url,{reNum:reNum}, function(data){
			countReplyBoard(num);
			listPage2(replyCount, num);
		});
		
	}
}
</script>


<div id="reply-insert">
	<div style="clear: both;">
		<span style="font-weight: bold;">댓글 쓰기</span><span style="font-size: 13px;"> - 타인을 비방하거나
			개인정보를 유출하는 글의 게시를 삼가 주세요.</span>
	</div>
	<div style="clear: both; padding-top: 10px; float: left; width: 620px;">
		<textarea id="rcontent_${num}" name ="content"  rows="1"  
			style="resize:none; display: block; width: 57%;padding: 6px 12px;border:none; box-sizing: border-box;height: 38px;"></textarea>
	</div>
	<div style="text-align: right; padding-top: 10px;  ">
		<button type="button" class="" onclick="sendReply(${num});"
			style="padding: 8px 25px; background: white; border: 1px solid #eee; ">등록하기</button>
	</div>
</div>

<div class="reply-list">

	<ul id="reply-content_${num}" class="reply-content" style="border: none;font-family: 'BareunDotum';">
	
	</ul>
	
</div>