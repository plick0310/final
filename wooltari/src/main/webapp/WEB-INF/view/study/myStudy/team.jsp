<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<script>

</script>
<style>
.addon {
width:45%;
float:left;
background: #fff;
border: 1px solid #eeeeee	;
margin: 22px;
border-radius: 3px;
-moz-border-radius: 3px;
-webkit-border-radius: 3px;
box-shadow: 0 1px 6px rgba(0, 0, 0, 0.175);
}

.addon li {
padding: 10px;
border-top: 1px solid #eee;
overflow: hidden;
}
.addon li {
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
.addon li em {
background: url(http://d1dls1ko4h0b59.cloudfront.net/assets/campaign-legend-d95e12bce50a8e18d8bd3c96383c352f.png) no-repeat;
display: block;
height: 48px;
width: 49px;
float: left;
}
.addon li em.extra {
background-position: -118px 0;
}
.addon li em.hot {
background-position: -58px 0;
}
.addon p {
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

.addon li .legend-info {
float: left;
margin-left: 10px;
width: 200px;
}

.addon strong {
display: block;
margin: 0 0 4px;
}

strong {
font-weight: bold;
}

/* .d3 {background: #F9F0DA;} */
.d3 form {
  background: #eee;
}
.d3 input, .d3 button {
  border: none;
  outline: none;
  background: transparent;
}
.d3 input {
  width: 88%;
  height: 42px;
  padding-left: 15px;
}
.d3 button {
  height: 42px;
  width: 42px;

  top: 0;
  right: 0;
  cursor: pointer;
}
.d3 button:before {
  content: "\f002";
  font-family: FontAwesome;
  font-size: 16px;
  color: #1abc9d;
}
#a_check{
    
    padding-left: 46px;

    font-size: 14px;
}
.form-control{
width:85%;}
.img_bt{
  opacity: 0; /*input type="file" tag 투명하게 처리*/
   position: relative;
   width: 0px;
   padding :0;
   border: 0px;
}
</style>

<script>
var waitCount =${waitCount};
var teamCount =${teamCount};
var uid="${sessionScope.member.userId}";
var leader ="${leader}";
$(function () {
	listTeam();
	listWait();
});

function listWait() {
	var url ="<%=cp%>/${s_num}/listWait";
	
	$.ajax({
		type:"post"
		,url:url
		//,data:query
		,dataType:"json"
		,success:function(data){
			printWait(data);
		}
		,error:function(e){
			console.log(e.responseText);
		}
	});
}

function printWait(data){
	

	var out ="";
	if(waitCount!=0){
		for(var idx=0; idx<data.list.length; idx++){
			var imageFileName = data.list[idx].imageFileName;
			var userName=data.list[idx].userName;
			var content=data.list[idx].content;
			var userId=data.list[idx].userId;
			
			out+=	"<li class='clearfix'><img class='round'";
			out+=		"src='<%=cp%>/uploads/study/"+${s_num}+"_TeamImg/"+imageFileName+"'>";
			out+=	"<div class='legend-info'>";
			out+=	"<strong>"+userName+"</strong>"+content;	
			out+= "</div>";
		
		if (leader == uid) {
					out += "<p id='a_check'><a>승인 </a>|<a> 거절</a></p></li>";
				}

			}
		}
		$(addon2).html(out);

	}
	
	
function listTeam() {
	var url ="<%=cp%>/${s_num}/listTeam";
	
	$.ajax({
		type:"post"
		,url:url
		//,data:query
		,dataType:"json"
		,success:function(data){
			printTeam(data);
		}
		,error:function(e){
			console.log(e.responseText);
		}
	});
}
function printTeam(data) {
	var out ="";
	if(teamCount !=0){
		for(var idx=0; idx<data.list.length; idx++){
			var imageFileName = data.list[idx].imageFileName;
			var userName=data.list[idx].userName;
			var content=data.list[idx].content;
			var userId=data.list[idx].userId;
			
			out+="<li class='clearfix'><img class='round'";
			out+=		"src='<%=cp%>/uploads/study/"+${s_num}+"_TeamImg/"+imageFileName+"'>";
			out+=	"<div class='legend-info'>";
			out+=	"<strong>"+userName+"</strong>"+content;	
			out+= "</div>";
			
			if (userId == uid) {
				out+="<p id='a_check'><label for='ct' class='btn btn-large uploadLabel'> <img";
				out+=		" alt='' src='<%=cp%>/resource/img/set.png'>";
				out+=	"</label>"
			}else{
			out+="<p id='a_check'><label for='at' class='btn btn-large uploadLabel'> <img";
			out+=		" alt='' src='<%=cp%>/resource/img/information.png'>";
			out+=	"</label> <label for='bt' class='btn btn-large uploadLabel'> <img";
			out+=		" alt='' src='<%=cp%>/resource/img/envelope.png'></a>";
			out+="</label></p>";
			}
				
			out+="<button class='img_bt' type='button' id='at' onclick='' />";
			out+="<button class='img_bt' type='button' id='bt' onclick='' />";
			out+="<button class='img_bt' type='button' id='ct' onclick='' /></li>";
		
			}
	}
	
	$(addon1).html(out);
	
}
</script>
<div class="addon 1">
	<p id="" style="border-bottom: 1px solid #eee;">
		스터디 멤버 <span style="color: #1abc9c;">${teamCount}</span>명 <a class=""
			data-toggle="collapse" href="#collapseExample2" aria-expanded="false"
			aria-controls="collapseExample"><i class="fa fa-ellipsis-v"
			style="float: right;"></i></a>


	</p>
	<div class="collapse" id="collapseExample2">
		<div class="d3">
			<form class="d3">
				<input type="text" placeholder="멤버 ID 혹은 이름을 검색해보세요">
				<button type="submit"></button>
			</form>
		</div>
	</div>

	<ul id="addon1"></ul>
</div>



<div class="addon 2">
	<p>
		대기중인 스터디 멤버<span style="color: #1abc9c;">${waitCount}</span>명 <a
			href="#myModal" data-toggle="modal" data-placement="top"
			title="Add Contact"><i class="glyphicon glyphicon-plus"
			style="float: right;"></i></a>
	</p>

	<ul id="addon2"></ul>
</div>



<!-- Modal -->
			<div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModal" class="modal fade" style="display: none;">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button aria-hidden="true" data-dismiss="modal" class="close" type="button">×</button>
							<h4 class="modal-title">멤버 초대하기</h4>
						</div>
						<div class="modal-body">
							<form role="form" id="form-horizontal" class="form-horizontal" method="post">
								<div class="form-group">
									<label class="col-lg-2 control-label">받는 사람</label>
									<div class="col-lg-10">
										<input type="text" placeholder="받는 분의 아이디(example@example.com)" class="form-control" id="recv_Id" name="recv_Id" required="required">
									</div>
								</div>
								<div class="form-group">
									<label class="col-lg-2 control-label">보낸 사람</label>
									<div class="col-lg-10">
										<input type="text" class="form-control" id="sent_Id" name="sent_Id" readonly="readonly" value="${sessionScope.member.userName}(${sessionScope.member.userId})">
									</div>
								</div>
								<div class="form-group">
									<label class="col-lg-2 control-label">내용</label>
									<div class="col-lg-10">
										<textarea rows="10" cols="30" placeholder="보내실 내용을 입력해주세요." class="form-control" id="content" name="content" required="required"></textarea>
									</div>
								</div>
								<div class="form-group">
									<div class="col-lg-offset-2 col-lg-10 text-right">
										<button id="send-btn" name="send-btn" class="btn btn-send" type="button" onclick="submitMsg()">Send</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- /.modal -->