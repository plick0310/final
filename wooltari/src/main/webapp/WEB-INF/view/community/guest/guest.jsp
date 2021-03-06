<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<style>
	.btn {
		background-color: white;
	    border-style: solid;
	    padding: 5px 20px;
	    margin-right: 10px;
	    border: 1px solid #EAEAEA;
	}
</style>

<script type="text/javascript">
$(function(){
	listPage(1);
});

function listPage(page) {
	var url="<%=cp%>/guest/list";
	var query="pageNo="+page;
	
	$.ajax({
		type:"post",
		url:url,
		data:query,
		dataType:"json",
		success:function(data) {
			printGuest(data); // 아래 printGuest로
		}
		,error:function(e) {
			console.log(e.responseText);
		}
	});
}

function printGuest(data) {
	var uid="${sessionScope.member.userId}";
	var total_page=data.total_page;
	var dataCount=data.dataCount;
	var todayCount=data.todayCount;
	var pageNo=data.pageNo;
	var paging=data.paging;
	
	var out="<table style='width: 100%; margin: 10px auto 0px; border-spacing: 0px; border-collapse: collapse;'>";
	out+="  <tr height='35'>";
	out+="     <td width='50%'>";
	out+="        <span style='color: #3EA9CD; font-weight: 700;'>Total:  "+dataCount+"</span><br>";
//	out+=" 		  <span style='color: #3EA9CD; font-weight: 700;'>Today:  "+todayCount+"</span>";
	out+="        <span>["+pageNo+"/"+total_page+" 페이지]</span>";
	out+="      </td>";
	out+="      <td width='50%'>&nbsp;</td>";
	out+="   </tr>";
	if(dataCount!=0) {
		for(var idx=0; idx<data.list.length; idx++) {
			var num=data.list[idx].num;
			var userName=data.list[idx].userName;
			var userId=data.list[idx].userId;
			var content=data.list[idx].content;
			var created=data.list[idx].created;
			
			out+="    <tr height='35'>";
			out+="      <td width='50%' style='padding-left: 5px; border-top:1px solid #cccccc; border-right:none;'><strong>"+ userName+"</strong></td>";
			out+="      <td width='50%' align='right' style='padding-right: 5px; border-top:1px solid #cccccc; border-left:none;'>" + created;
			if(uid==userId || uid=="admin") {
				out+=" | <a onclick='deleteGuest(\""+num+"\", \""+pageNo+"\");'>삭제</a></td>" ;
			} else {
				out+=" | <a href='#'>신고</a></td>" ;
			}
			out+="    </tr>";
			out+="    <tr style='height: 50px;'>";
			out+="      <td colspan='2' style='padding: 5px;' valign='top'>"+content+"</td>";
			out+="    </tr>";
		}
		out+="    <tr style='height: 35px;'>";
		out+="      <td colspan='2' style='text-align: center;'>";
		out+=paging;
		out+="      </td>";
		out+="    </tr>";
	}
	
	$("#listGuest").html(out);
}

function sendGuest() {
	var url="<%=cp%>/guest/insert";
	var query=$("form[name=guestForm]").serialize();
	
	$.ajax({
		type:"post",
		url:url,
		data:query,
		dataType:"json", // 생략하면 Text/Html 방식이 됨 (← 기본 형식), JSON
		success:function(data) {
			var state=data.state;
			if(state=="loginFail") {
				lovation.href="<%=cp%>/member/login";
			} else {
				$("#content").val("");
				listPage(1);
			}
		}
		,beforeSend:check,
		error:function(e) {
			console.log(e.responseText);
		}
	});
}

function check() {
	var content=$("#content").val().trim();
	if(! content) {
		$("#content").focus();
		return false;
	}
	
	return true;
}

function deleteGuest(num, page) {
	var uid="${sessionScope.member.userId}";
	if(! uid) {
		alert("로그인이 필요합니다");
		return;
	}
	
	if(confirm("삭제 하시겠습니까 ?")) {
		var url="<%=cp%>/guest/delete";
		$.post(url,{num:num}, function(data) {
			var state = data.state;
			if(state=="loginFail") {
				location.href="<%=cp%>/member/login";
				return;
			}
			listPage(page);
		},"json");
	}
}
</script>

</head>

<div class="body-container" style="width: 900px; height: 100%; margin: 60px auto;">
    <div class="body-title">
        <h3><span style="font-family: Webdings">2</span> 한 줄 TALK?TALK! </h3>
    </div>
    
    <div>
             <form name="guestForm" method="post" action="">
             <div class="guest-write">
                 <div style="clear: both; padding-top: 10px;">
                       <textarea name="content" id="content" class="boxTF" rows="10" style="display:block; width: 100%; padding: 6px 12px; box-sizing:border-box;" required="required"></textarea>
                  </div>
                  <div style="text-align: right; padding-top: 10px;">
                       <button type="button" class="btn" onclick="sendGuest();" style="padding:8px 25px;"> 등록하기 </button>
                  </div>           
            </div>
           </form>
         
           <div id="listGuest">
                 
           </div>
 	 </div>
</div>