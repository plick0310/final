<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<link rel="stylesheet" type="text/css" href="<%=cp%>/resource/css/studyhome.css">
<style type="text/css">
* {
	box-sizing: border-box;
}

.menu {
	width: 900px;
	text-align: center;
}

.menu li {
	padding: 5px 0;
	background: #eee;
	float: left;
	width: 225px;
}

.menu li:HOVER {
	background-color: #1abc9c;
	cursor: pointer;
	color: white;
}

.menu li:FOCUS {
	background-color: #1abc9c;
}

.cont {
	margin-left: 25px;
	width: 900px;
	float: left;
}
input.uploadBtn {
   opacity: 0; /*input type="file" tag 투명하게 처리*/
   position: relative;
   width: 0px;
}

</style>
<script type="text/javascript" src="<%=cp%>/resource/js/jquery.form.js"></script>

<script type="text/javascript">
$(document).ready(function(){
			$('.menu').on('click', 'a', function(){
				var fileName;
				fileName = $(this).parent().attr('class');
				
				$.ajax({
					dataType:"html"
					,url:"<%=cp%>/study/myStudy/" + fileName
					,success : function(data) {
						$('.cont').html(data);
				}
			});

		});
//////////////////

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
	
$(function(){
	listPage('5');
});	

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
	
			out+= 	"	<li><div class='timeline-badge primary'>" ;
			out+=	"			<a><i class='glyphicon glyphicon-record' rel='tooltip' title="+created+" id=''></i></a> " ;
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
			out+=	"			<a><i class='glyphicon glyphicon-thumbs-up'></i></a> &nbsp; 좋아요(255) &nbsp; " ;
			out+=	"			<a class='' data-toggle='collapse' href='#collapseExample_"+num+ "' " ;
			out+=   "               aria-expanded='false' aria-controls='collapseExample'> 댓글(35) </a> " ;
									
			if(uid==userId)		{
				out+=	"		<a class='pull-right'>삭제 </a>"   ;
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
			
			listPage(5);
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

</script>





<div style="width: 1140px; height: 1800px; margin: 60px auto;">
	<div style="height: 50px; font-size: 20px; text-align: center;">
		<span style="font-size: 20px; color: #BDBDBD; font-weight: bold;">
			<span style="font-size: 19px; color: #1abc9c;"
			class="glyphicon glyphicon-pencil"> </span>&nbsp;&nbsp;&nbsp;${dto.studyName }&nbsp;&nbsp;&nbsp;
		</span>S T U D Y
	</div>
	<div style="float: left; text-align: center;">
		<div
			style="width: 170px; height: 230px; box-shadow: 0px 3px 5px 1px #eee; font-size: 20px; font-size: 16px; line-height: 50px;">
			<div
				style="width: 170px; height: 170px; background-image: url('<%=cp%>/uploads/study/studyMainimage/${dto.imageFileName}'); background-size: cover;">
			</div>
			<div style="width: 170px; height: 3px; background-color: #1abc9c;"></div>
			<Strong>LEADER</Strong><span style="font-size: 14px;">&nbsp;&nbsp;${dto.userId }</span>
		</div>
		<div
			style="margin: 30px 0; border-top: 1px solid #eee; padding: 20px 0;">${dto.study_Info }</div>
	</div>

	<div id="wrap">
		<div id="box">
			<div
				style="width: 900px; box-shadow: 2px 3px 5px 1px #eee; float: left; margin: 0px 25px 35px;">
				<ul class="menu">
					<li ><a href="<%=cp%>/study/myStudy/home/${dto.s_num}">H O M E</a></li>
					<li class="calender"><a href="#">C A L E N D E R</a></li>
					<li class="s_member"><a href="#">M E M B E R</a></li>
					<li class="chating"><a href="#">C H A T H I N G</a></li>
				</ul>

			</div>
			<div class="cont">

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
								<form name="createForm" method="post" enctype="multipart/form-data" >
									<textarea name="content" id="content" placeholder="What are you doing right now?"></textarea>
									<ul>
										<li><a title="" data-toggle="tooltip"
											data-placement="bottom" data-original-title="Audio"><i
												class="fa fa-music"></i></a></li>
										<li><a title="" data-toggle="tooltip"
											data-placement="bottom" data-original-title="Video"><i
												class="fa fa-video-camera"></i></a></li>
										<li><a title="" data-toggle="tooltip"
											data-placement="bottom" data-original-title="Sound Record"><i
												class="fa fa-microphone"></i></a></li>
										<li>
										<label for ="uploadBtn" id="lable-li">
										<a title="" data-toggle="tooltip" data-placement="bottom" data-original-title="Picture"><i
												class="fa fa-picture-o"></i></a>
                     	
										</label>		
										</li>
									</ul>			
									<input type="file" name="upload" id="uploadBtn" class="uploadBtn tts" >
								
								
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
							<div class="timeline-heading">
								
							</div>
							<div class="timeline-body">
								<p>스터디 멤버들과 소통을 시작해 보세요!</p>

							</div>

							<div class="timeline-footer">
								<a><i class="glyphicon glyphicon-thumbs-up"></i></a> &nbsp; 좋아요(0) &nbsp; 
								<a class="" data-toggle="collapse"
									href="#collapseExample2" aria-expanded="false"
									aria-controls="collapseExample"> 댓글(0) </a> 
								<a class="pull-right">작성자 </a>
								
							
							<div class="collapse" id="collapseExample2">
								<div class="well">댓글댓글</div>
							</div>
							
							
							</div>
						</div>
					</li>
					
					
					<li class="clearfix" style="float: none;"></li>
					
				</ul>


			</div>
		</div>
	</div>
</div>

