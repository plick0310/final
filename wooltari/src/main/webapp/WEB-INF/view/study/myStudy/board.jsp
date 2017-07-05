
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<style>
#image_loading img{
 	width: 65px; height: 65px;


} 
</style>
<script>

var bbs_count =5;
var dataCount =${dataCount};


$(function(){
	listPage('5');
	
});	

//게시물 공감 개수
 function countLikeBoard(num) {
	var url="<%=cp%>/study/myStudy/${s_num}/countboardLike";
	
	$.post(url, {num:num}, function(data){
		var count=data.countLikeBoard;
		//alert(count);
		$("#countLikeBoard_"+num).html(count);
	}, "json");
}


function likeBoard(num){
	var url="<%=cp%>/study/myStudy/${s_num}/boardLike";
	$.ajax({
		type:"post"
		,url:url
		,data:"num="+num
		,dataType:"json"
		,success:function(data){
			alert("좋아요?");
			countLikeBoard(num);
			$("#like_up_"+num).css('color','red');
		}
		,error:function(e){
			//alert("이미하셨자나욨!!!");
			console.log(e.responseText);
		}
	});
	
} 

function listPage(bbs_count) {
	var url="<%=cp%>/study/myStudy/${s_num}/boardList";
	var query="bbs_count="+bbs_count;//화면에 띄울 글 개수
	
	$.ajax({
		type:"post"
		,url:url
		,data:query
		,dataType:"json"
		,success:function(data){
			printBoard(data);
		}
		,error:function(e){
			console.log(e.responseText);
		}
	});
}

function printBoard(data){
	
	var dataCount=data.dataCount;
	var uid="${sessionScope.member.userId}";
	
	var out ="";
	
	if(dataCount!=0 ){
		for(var idx=0; idx<data.list.length; idx++) {
			var num=data.list[idx].num;
			var userId=data.list[idx].userId;
			var content=data.list[idx].content;
			var created=data.list[idx].created;
			var imageFileName = data.list[idx].imageFileName;
			var s_num = data.list[idx].s_num;
			var hitCount = data.list[idx].hitCount;
			var likeCount = data.list[idx].likeCount;
			
			
			out+= 	"	<li><div class='timeline-badge primary'>" ;
			out+=	"			<a><i  class='glyphicon glyphicon-record' rel='tooltip' title="+created+" id=''></i></a> " ;
			out+=	"		</div><div class='timeline-panel'>" ;
						
						//이미지
	 		if(imageFileName!=null){
				out+=	" <div class='timeline-heading'>";
				out+=   "<img class='img-responsive' src='<%=cp%>/uploads/study/"+ s_num +"_Board/"+ imageFileName +" ' style='width: 810px; height: 400px;'/>";
				out+=   "</div> " ;
			}	
					
						//내용
			out+=	"		<div class='timeline-body'><p>"+content+"</p></div>" ;
	
			out+=	"	    <div class='timeline-footer'> " ;
							//좋아요
			out+=	"			<a onclick='likeBoard(\""+num+"\")'><i id='like_up_"+num+ "' class='glyphicon glyphicon-thumbs-up'></i></a> &nbsp; 좋아요( <span id='countLikeBoard_"+num+"'>"+likeCount+"</span>)&nbsp; " ;
			out+=	"			<a class='' data-toggle='collapse' href='#collapseExample_"+num+ "' " ;
			out+=   "               aria-expanded='false' aria-controls='collapseExample'> 댓글(35) </a> " ;
									
			if(uid==userId)		{
				out+=	"		<a class='pull-right' onclick='deleteBoard(\""+num+"\")'>삭제 </a>"   ;
				out+=	"		<a class='pull-right'>수정  |&nbsp;</a>" ;
				} else {
				out+=	"		<a class='pull-right'>"+userId+"</a>" ;
				}
			
			out+=	"	<div class='collapse' id='collapseExample_" +num+ "'> ";
			out+=	"	<div class='well'>댓글댓글</div>";
			out+=	" </div></div></div></li> ";
	
			out+="<li class='clearfix' style='float: none;'></li>"
			}
		}
		$("#listBoard").html(out);
		
	}
	
	
function createBoard() {
		
		//var query =$("form[name=createForm]").serialize(); //폼태그내 자동 인코더
		var f= document.createForm;
		var query = new FormData(f); //파일처리
		
		$.ajax({
			type:"POST"
			,url:"<%=cp%>/study/myStudy/home/${s_num}/boardCreated"
			,processData: false  // file 전송시 필수
			,contentType: false  // file 전송시 필수
			,data : query
			,success:function(data){
				alert("성공");
			
				$("#content").val("");
				$("#uploadBtn").val("");
				
				listPage(bbs_count);
				
				
		}		
		,beforeSend:check
		,error:function(e){
			alert(e.responsText);
		}
	});
}

function check(){
	var content=$("#content").val().trim;
	if(!content){
		$("#content").focus();
		return false;
	}
	return true;
}	

function deleteBoard(num){
	if(confirm("게시물을 삭제하시겠습니까 ?")){
		
		$.ajax({
			type:"POST"
			,url:"<%=cp%>/study/myStudy/${s_num}/boardDelete"
			,data:"num="+num
			,dataType:"JSON"
			,success:function(data){
				
				bbs_count = bbs_count - 1;
				listPage(bbs_count);
			}
			,error: function(e) {
				console.log(e.reponseText);
			}
		});
		
	}
}

var submit_chk = true;	// 이중 호출을 방지하기 위한 변수

$(document).ready(function () {

	$(window).scroll(function aa() {
		/* 현재 데이터가 전체 데이터를 넘지 않아야 함 */
		if(bbs_count < dataCount) {
			/* 스크롤이 가장 아래를 찍은 경우 */
		    if ($(window).scrollTop() == $(document).height() - $(window).height()) {
				if(submit_chk == true) {
			    	submit_chk = false;		// 이벤트가 실행될때 false로 변경해주어 이중실행이 되지 않게 막는다.
			    	/* 로딩중 이미지 띄움 */
			    	$('#image_loading').html('<img src="<%=cp%>/resource/img/loading.gif">');
			    	bbs_count = parseInt(bbs_count) + 5;
			    	/* 로딩 대기 시간 */
			    	setTimeout(function() {
			    		$('#image_loading').html('');
			    		listPage(bbs_count);
						submit_chk = true;
					}, 1200);
			    }
			}
		}
	});
	
	
	
	$("[data-toggle=tooltip]").tooltip();

	var my_posts = $("[rel=tooltip]");

	var size = $(window).width();
	for(i=0;i<my_posts.length;i++){
		the_post = $(my_posts[i]);

	/* 	if(the_post.hasClass('invert') && size >=767 ){
			the_post.tooltip({ placement: 'left'});
			the_post.css("cursor","pointer");
		} else{
			the_post.tooltip({ placement: 'rigth'});
			the_post.css("cursor","pointer");
		}  */
	}

	
	
});
</script>


<div class="input-group">

	<input type="text" class="form-control" id="exampleInputAmount"
		placeholder="검색어를 입력하세요..."
		style="border: 3px solid rgba(26, 188, 156, 0.66); border-right: none; border-top-left-radius: 20px; border-bottom-left-radius: 20px;">
	<div class="input-group-addon"
		style="background: none; border: 3px solid rgba(26, 188, 156, 0.66);; border-left: none; cursor: pointer; border-top-right-radius: 20px; border-bottom-right-radius: 20px;"
		onclick="">
		<i class="fa fa-search"></i>
	</div>
</div>


<div class="row">
	<div class="col-md-10">
		<div class="widget-area no-padding blank">
			<div class="status-upload">
				<form name="createForm" method="post" enctype="multipart/form-data">
					<textarea name="content" id="content"
						placeholder="What are you doing right now?"></textarea>
					<ul>
						<li><a title="" data-toggle="tooltip" data-placement="bottom"
							data-original-title="Audio"><i class="fa fa-music"></i></a></li>
						<li><a title="" data-toggle="tooltip" data-placement="bottom"
							data-original-title="Video"><i class="fa fa-video-camera"></i></a></li>
						<li><a title="" data-toggle="tooltip" data-placement="bottom"
							data-original-title="Sound Record"><i
								class="fa fa-microphone"></i></a></li>
						<li><label for="uploadBtn" id="lable-li"> <a title=""
								data-toggle="tooltip" data-placement="bottom"
								data-original-title="Picture"><i class="fa fa-picture-o"></i></a>

						</label></li>
					</ul>
					<input type="file" name="upload" id="uploadBtn"
						class="uploadBtn tts">


					<button type="button" class="" onclick="createBoard();">
						<i class="fa fa-share"></i> 등록하기
					</button>
				</form>
			</div>
			<!-- Status Upload  -->
		</div>
		<!-- Widget Area -->
	</div>

</div>
<!-- ----------------------------------피드 ----------------------------------------->

<ul class="timeline" id="listBoard">

	<li>
		<div class="timeline-badge primary">
			<a><i class="glyphicon glyphicon-record" rel="tooltip"
				title="1시간전" id=""></i></a>
		</div>
		<div class="timeline-panel">
			<div class="timeline-heading"></div>
			<div class="timeline-body">
				<p>스터디 멤버들과 소통을 시작해 보세요!</p>

			</div>

			<div class="timeline-footer">
				<a><i class="glyphicon glyphicon-thumbs-up"></i></a> &nbsp; 좋아요(0)
				&nbsp; <a class="" data-toggle="collapse" href="#collapseExample2"
					aria-expanded="false" aria-controls="collapseExample"> 댓글(0) </a> <a
					class="pull-right">작성자 </a>


				<div class="collapse" id="collapseExample2">
					<div class="well">댓글댓글</div>
				</div>
			</div>
		</div>
	</li>

	<li class="clearfix" style="float: none;"></li>
</ul>
	<div id="image_loading"></div>
