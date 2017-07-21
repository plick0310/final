<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>


<style>
.timeline {
  list-style: none;
  padding: 20px 0 20px;
  position: relative;
}
.timeline:before {
  top: 0;
  bottom: 0;
  position: absolute;
  content: " ";
  width: 3px;
  background-color: #eeeeee;
  left: 50%;
  margin-left: -1.5px;
}
.timeline > li {
  margin-bottom: 20px;
  position: relative;
  width: 50%;
  float: left;
  clear: left;
  margin-left: 0;
}
.timeline > li:before,
.timeline > li:after {
  content: " ";
  display: table;
}
.timeline > li:after {
  clear: both;
}
.timeline > li:before,
.timeline > li:after {
  content: " ";
  display: table;
}
.timeline > li:after {
  clear: both;
}
.timeline > li > .timeline-panel {
  width: 95%;
  float: left;
  border: 1px solid #d4d4d4;
  /*border-radius: 2px;*/
  /*padding: 20px;*/
  position: relative;
  -webkit-box-shadow: 0 1px 6px rgba(0, 0, 0, 0.175);
  box-shadow: 0 1px 6px rgba(0, 0, 0, 0.175);
}

.timeline > li > .timeline-panel:before {
  position: absolute;
  top: 26px;
  right: -15px;
  display: inline-block;
  border-top: 15px solid transparent;
  border-left: 15px solid #ccc;
  border-right: 0 solid #ccc;
  border-bottom: 15px solid transparent;
  content: " ";
}
.timeline > li > .timeline-panel:after {
  position: absolute;
  top: 27px;
  right: -14px;
  display: inline-block;
  border-top: 14px solid transparent;
  border-left: 14px solid #fff;
  border-right: 0 solid #fff;
  border-bottom: 14px solid transparent;
  content: " ";
}
.timeline > li > .timeline-badge {
  color: #fff;
  width: 24px;
  height: 24px;
  line-height: 50px;
  font-size: 1.4em;
  text-align: center;
  position: absolute;
  top: 16px;
  right: -12px;
  /*background-color: #999999;*/
  z-index: 100;
  /*
  border-top-right-radius: 50%;
  border-top-left-radius: 50%;
  border-bottom-right-radius: 50%;
  border-bottom-left-radius: 50%;
  */
}
.timeline > li.timeline-inverted > .timeline-panel {
  float: right;
}
.timeline > li.timeline-inverted > .timeline-panel:before {
  border-left-width: 0;
  border-right-width: 15px;
  left: -15px;
  right: auto;
}
.timeline > li.timeline-inverted > .timeline-panel:after {
  border-left-width: 0;
  border-right-width: 14px;
  left: -14px;
  right: auto;
}
.timeline-badge > a {
  color: #C5C7C5 !important;
}
.timeline-badge a:hover {
  color: #000 !important;
}
.timeline-title {
  margin-top: 0;
  color: inherit;
}
.timeline-body > p,
.timeline-body > ul {
    padding:20px;
    margin-bottom: 0;
}
.timeline-body > p + p {
  margin-top: 5px;
}
.timeline-footer{
    padding:20px;
    background-color:#f4f4f4;
}
.timeline-footer > a{
    cursor: pointer;
    text-decoration: none;
}
.tooltip{

    position:absolute;
    z-index:1020;
    display:block;
    visibility:visible;
    padding:5px;
    font-size:11px;
    opacity:0;
    filter:alpha(opacity=0);
    
}
.tooltip.in{
    /*opacity:0;
    filter:alpha(opacity=80);*/
    
}
.tooltip.top{
    margin-top:-2px;
}
.tooltip.right{
    margin-left:2px;
}
.tooltip.bottom{
    margin-top:2px;
}
.tooltip.left{
    margin-left:-2px;
}
.tooltip.top .tooltip-arrow{
    bottom:0;
    left:0;
    margin-left:0;
    border-left:0 solid transparent;
    border-right:5px solid transparent;
    border-top:0 solid #000;
}
.tooltip.left .tooltip-arrow{
    bottom:0;
    left:0;
    margin-left:0;
    border-left:0 solid transparent;
    border-right:5px solid transparent;
    border-top:0 solid #000;
}
.tooltip.bottom .tooltip-arrow{
    bottom:0;
    left:0;
    margin-left:0;
    border-left:0 solid transparent;
    border-right:5px solid transparent;
    border-top:0 solid #000;
}
.tooltip.right .tooltip-arrow{
    bottom:0;
    left:0;
    margin-left:0;
    border-left:0 solid transparent;
    border-right:5px solid transparent;
    border-top:0 solid #000;
}
.tooltip-inner{
    width:200px;
    padding:3px 8px;
    color:#fff;
    text-align:center;
    text-decoration:none;
    background-color:#313131;
    -webkit-border-radius:0px;
    -moz-border-radius:0px;
    border-radius:0px;
}

.tooltip-arrow{
    position:absolute;
    width:0;
    height:0;
}
.timeline > li.timeline-inverted{
  float: right; 
  clear: right;
  margin-top: 30px;
  margin-bottom: 30px;
}
.timeline > li:nth-child(2){
  margin-top: 60px;
}
.timeline > li.timeline-inverted > .timeline-badge{
  left: -12px;
}

@media (max-width: 767px) {
    ul.timeline:before {
        left: 40px;
    }

    ul.timeline > li {
      margin-bottom: 20px;
      position: relative;
      width:100%;
      float: left;
      clear: left;
    }
    ul.timeline > li > .timeline-panel {
        width: calc(100% - 90px);
        width: -moz-calc(100% - 90px);
        width: -webkit-calc(100% - 90px);
    }

    ul.timeline > li > .timeline-badge {
        left: 28px;
        margin-left: 0;
        top: 16px;
    }

    ul.timeline > li > .timeline-panel {
        float: right;
    }

        ul.timeline > li > .timeline-panel:before {
            border-left-width: 0;
            border-right-width: 15px;
            left: -15px;
            right: auto;
        }

        ul.timeline > li > .timeline-panel:after {
            border-left-width: 0;
            border-right-width: 14px;
            left: -14px;
            right: auto;
        }
    
.timeline > li.timeline-inverted{
  float: left; 
  clear: left;
  margin-top: 30px;
  margin-bottom: 30px;
}

.timeline > li.timeline-inverted > .timeline-badge{
  left: 28px;
}
}
.timeline > li{
margin-left: 0;
}

#lable-li{
position: absolute; height: 80px; margin:0px; font-size: 15px; font-weight: 700; color: #999; width: 80px; top: 0; border-radius: 0; height: 80px;
}
</style>


<script>

$(document).ready(function(){
   var my_posts = $("[rel=tooltip]");

   var size = $(window).width();
   for(i=0;i<my_posts.length;i++){
      the_post = $(my_posts[i]);

      if(the_post.hasClass('invert') && size >=767 ){
         the_post.tooltip({ placement: 'left'});
         the_post.css("cursor","pointer");
      }else{
         the_post.tooltip({ placement: 'rigth'});
         the_post.css("cursor","pointer");
      }
   }
});



var bbs_count =5;
var dataCount =${dataCount};


$(function(){
	
	listPage('5');
	$('#b_image').hide();
	$('#plus_box').hide();
	
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




//댓글리스트
function listReply(num){
	//alert(num+"눌렸당");
	
	var url="<%=cp%>/study/myStudy/${s_num}/listReply";
	var num;
	$.post(url,{num:num},function(data){
		$("#listReply_"+num).html(data);
	});
	 
}

//조아요
function likeBoard(num){
	var url="<%=cp%>/study/myStudy/${s_num}/boardLike";
	$.ajax({
		type:"post"
		,url:url
		,data:"num="+num
		,dataType:"json"
		,success:function(data){
			var state = data.state;
			if(state=="true") {
			alert("좋아요?");			
			countLikeBoard(num);
			$("#like_up_"+num).css('color','red');
				
			} else if(state=="false") {
				alert("좋아요는 한번만 가능합니다. "); }
		}
		,error:function(e){
			
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
			//printCheckLike(data);
		}
		,error:function(e){
			console.log(e.responseText);
		}
	});
}


function printCheckLike(data){
	var url ="<%=cp%>/study/myStudy/${s_num}/checkLike";
	
}

function printBoard(data){
	
	var dataCount=data.dataCount;
	var uid="${sessionScope.member.userId}";
	
	var out ="";
	
	if(dataCount!=0 ){
		for(var idx=0; idx<data.list.length; idx++) {
			var num=data.list[idx].num;
			var userId=data.list[idx].userId;
			var userName=data.list[idx].userName;
			var content=data.list[idx].content;
			var created=data.list[idx].created;
			var imageFileName = data.list[idx].imageFileName;
			var s_num = data.list[idx].s_num;
			var hitCount = data.list[idx].hitCount;
			var likeCount = data.list[idx].likeCount;
			var replyCount =data.list[idx].replyCount;
		
			if(num%2==0){
				out+=" <li  class='timeline-inverted'>";
			}
			else{
				out+= 	"<li>";
			}
			out+=    "<div class='timeline-badge primary'>" ;
			out+=	"			<a><i  class='glyphicon glyphicon-record' rel='tooltip' title="+created+" id=''></i></a> " ;
			out+=	"		</div><div class='timeline-panel'>" ;
						
						//이미지
	 		if(imageFileName!=null){
				out+=	" <div class='timeline-heading'>";
				out+=   "<img style='width: 810px; height: 400px;' class='img-responsive' src='<%=cp%>/uploads/study/"+${s_num}+"_Board/"+imageFileName+"'/>";
				out+=   "</div> " ;
			}	
					
						//내용
			out+=	"		<div class='timeline-body'><p>"+content+"</p></div>" ;
	
			out+=	"	    <div class='timeline-footer'> " ;
							//좋아요
			
		out+=	"			<a onclick='likeBoard(\""+num+"\")'><i id='like_up_"+num+ "' class='glyphicon glyphicon-thumbs-up'></i></a> &nbsp; 좋아요( <span id='countLikeBoard_"+num+"'>"+likeCount+"</span>)&nbsp; " ;
			
			out+=	"			<a onclick='listReply(\""+num+"\")' data-toggle='collapse' href='#collapseExample_"+num+ "' " ;
			out+=   "               aria-expanded='false' aria-controls='collapseExample'> 댓글( <span id='countReplyBoard_"+num+"'>"+replyCount+"</span>) </a> " ;
									
			if(uid==userId)		{
				out+=	"		<a class='pull-right' onclick='deleteBoard(\""+num+"\")'>삭제 </a>"   ;
				out+=	"		<a class='pull-right'>수정  |&nbsp;</a>" ;
				} else {
				out+=	"		<a class='pull-right'> 글쓴이 "+userName+"</a>" ;
				}
			
			out+=	"	<div class='collapse' id='collapseExample_" +num+ "'> ";
			out+=	"	<div class='well' id='listReply_" +num+ "'></div>";
			out+=	" </div></div></div></li> ";
	
			out+="<li class='clearfix' style='float: none; height:30px;'></li>"
			}
		}
		$("#listBoard").html(out);
		
	}
	
	
function createBoard() {
	if(confirm("게시물을 등록하시겠습니까 ?")){
		//var query =$("form[name=createForm]").serialize(); //폼태그내 자동 인코더
		var f= document.createForm;
		var query = new FormData(f); //파일처리
		//alert(f.upload2.value);
		$.ajax({
			type:"POST"
			,url:"<%=cp%>/study/myStudy/home/${s_num}/boardCreated"
			,processData: false  // file 전송시 필수
			,contentType: false  // file 전송시 필수
			,data : query
			,dataType:"json"
			,success:function(data){
				
			
				$("#content2").val("");
				$('#c_photo').show();
				$('#plus_box').hide();
				
				for(var i=3; i < f.upload2.length+3;  i++ ){
					$('#b_image'+i).removeAttr('src');
					$('#b_image'+i).remove();
					$("#uploadBtn"+i).val("");
					$("#uploadBtn"+i).remove();
				}
				
				idx=2;
				listPage(bbs_count);
				
				
		}		
		,beforeSend:check
		,error:function(e){
			alert(e.responsText);
		}
	});
	}
}

function check() {
	if(! $.trim($("#content2").val()) ) {
		alert("내용을 입력하세요");
		$("#content2").focus();
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
				alert("삭제성공");
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
					}, 1500);
			    }
			}
		}
	});
	
	
	
 	$("[data-toggle=tooltip]").tooltip();

	var my_posts = $("[rel=tooltip]");

	var size = $(window).width();
	for(i=0;i<my_posts.length;i++){
		the_post = $(my_posts[i]);

	}

	
	
});
var idx= 2;
//이미지 미리보기
$(function() {

   /*  $("#uploadBtn2").on('change', function(){ */
  $("body").on("change", "input[name=upload2]", function(){
	  idx++;

	var src = getFileExtension($(this).val());
					if (!((src.toLowerCase() == "gif")
							|| (src.toLowerCase() == "jpg") || (src
							.toLowerCase() == "jpeg"))) {
						alert('gif 와 jpg 파일만 지원합니다.');
						return;
					}

				/* 	$("#uploadBtn2").empty(); */
					$(this).empty();
					$('#c_photo').hide();
					$('#plus_box').show();
					
					
					var out="";
					out+="<img id='b_image"+idx+"' src=''  width='80px' height='80px' style='float: left;  margin-left: 10px;' >";
					out+="<input type='file' name='upload2' id='uploadBtn"+idx+"' class='uploadBtn tts' style='display:none;'>";
					$('#plus_box').before(out);
		
					
					var out2="";
					out2+="<label for='uploadBtn"+idx+"' id='lable-li'>";
					out2+="<img alt='' src='<%=cp%>/resource/img/add.png' style='margin: 28px 0;'> </label>";
					$('#plus_box').append(out2);
					
					
					readURL2(this , idx);
					
				});
});

function readURL2(input , idx) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();

			reader.onload = function(e) {
				
				
				$('#b_image'+idx).show().attr('src', e.target.result);
				
				
			}

			reader.readAsDataURL(input.files[0]);
		}
	}	



</script>



<div class="container" style="padding: 0">
 <!-- ----------------------------------입력창 ---------------------------------------->
<div class="row" style="margin-left: 10px;">
	<div class="col-md-10" style="    width: 810px; padding: 0;    padding-left: 10px;">
		<div class="widget-area no-padding blank">
			<div class="status-upload">
					<form name="createForm" method="post" enctype="multipart/form-data"
						style="width: 100%;">

						<!-- 	
					<img id="content1"
						style="width: 35%; height: 250px; background: white; float: left;  border: 0;"
						></img>
 -->
						<div>
							<textarea name="content" id="content2"
								placeholder="What are you doing right now?"></textarea>
						</div>
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
							<li><a title="" data-toggle="collapse" href="#clickphoto"><i
									class="fa fa-picture-o"></i></a></li>
						</ul>

						<button type="button" class="" onclick="createBoard();">
							<i class="fa fa-share"></i> 등록하기
						</button>

						
						<div id="clickphoto" class="pannel-collapse collapse"
							style="clear: both;">

							<div
								style="position: relative; border: 1px solid #d9d9d9; background: #fff;">

								<div
									style="margin: 20px; overflow: hidden; position: relative; height: 80px;">

									<div id="c_photo">
										<label for="uploadBtn2" id="lable-li" style="margin:0px; width: 100%; mardisplay: inline-block; overflow: hidden; position: relative; height: 80px; font-size: 15px; font-weight: 700; color: #999;">
											<img id="a_image" alt="" src="<%=cp%>/resource/img/camera.png" style="width: 50px; height: 50px;"> <br>
											<span style="color: #1abc9d;">사진 추가하기</span>
										</label>
									</div>

								
										
									<div id="plus_box" style="margin-left:10px; width: 80px; height: 80px; border: 1px solid #ccc; float: left; ">
										
									</div>
									
									
								</div>
							</div>


						</div>

						<input type="file" name="upload2" id="uploadBtn2" class="uploadBtn tts" style="opacity: 0; position: relative; width: 0px; margin: -15px;">
							
						<!-- 	
						<input type="file" name="upload2" id="uploadBtn3"
							class="uploadBtn tts"
							style="opacity: 0; position: relative; width: 0px; margin: -15px;"> -->

					</form>

				</div>
			<!-- Status Upload  -->
		</div>
		<!-- Widget Area -->
	</div>

</div>


<!-- ----------------------------------피드 ----------------------------------------->
 

  
    <ul class="timeline" style="width: 900px;" id="listBoard">
    </ul>
</div>

<div id="image_loading"></div>