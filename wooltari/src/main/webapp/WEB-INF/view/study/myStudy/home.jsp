<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
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
/*text area*/
body {
	background: #fafafa;
}

.widget-area.blank {
	background: none repeat scroll 0 0 rgba(0, 0, 0, 0);
	-webkit-box-shadow: none;
	-moz-box-shadow: none;
	-ms-box-shadow: none;
	-o-box-shadow: none;
	box-shadow: none;
}

body .no-padding {
	padding: 0;
}

.row {
	margin-right: -60px;
	margin-left: 70px;
}

.widget-area {
	background-color: #fff;
	-webkit-border-radius: 4px;
	-moz-border-radius: 4px;
	-ms-border-radius: 4px;
	-o-border-radius: 4px;
	border-radius: 4px;
	-webkit-box-shadow: 0 0 16px rgba(0, 0, 0, 0.05);
	-moz-box-shadow: 0 0 16px rgba(0, 0, 0, 0.05);
	-ms-box-shadow: 0 0 16px rgba(0, 0, 0, 0.05);
	-o-box-shadow: 0 0 16px rgba(0, 0, 0, 0.05);
	box-shadow: 0 0 16px rgba(0, 0, 0, 0.05);
	float: left;
	margin-top: 30px;
	padding: 25px 30px;
	position: relative;
	width: 100%;
}

.status-upload {
	background: none repeat scroll 0 0 #f5f5f5;
	-webkit-border-radius: 4px;
	-moz-border-radius: 4px;
	-ms-border-radius: 4px;
	-o-border-radius: 4px;
	border-radius: 4px;
	float: left;
	width: 100%;
}

.status-upload form {
	float: left;
	width: 100%;
}

.status-upload form textarea {
	background: none repeat scroll 0 0 #fff;
	border: medium none;
	-webkit-border-radius: 4px 4px 0 0;
	-moz-border-radius: 4px 4px 0 0;
	-ms-border-radius: 4px 4px 0 0;
	-o-border-radius: 4px 4px 0 0;
	border-radius: 4px 4px 0 0;
	color: #777777;
	float: left;
	font-family: Lato;
	font-size: 14px;
	height: 142px;
	letter-spacing: 0.3px;
	padding: 20px;
	width: 100%;
	resize: vertical;
	outline: none;
	border: 1px solid #F2F2F2;
}

.status-upload ul {
	float: left;
	list-style: none outside none;
	margin: 0;
	padding: 0 0 0 15px;
	width: auto;
}

.status-upload ul>li ,#lable-li {
	float: left;
}

.status-upload ul>li>a ,#lable-li{
	-webkit-border-radius: 4px;
	-moz-border-radius: 4px;
	-ms-border-radius: 4px;
	-o-border-radius: 4px;
	border-radius: 4px;
	color: #777777;
	float: left;
	font-size: 14px;
	height: 30px;
	line-height: 30px;
	margin: 10px 0 10px 10px;
	text-align: center;
	-webkit-transition: all 0.4s ease 0s;
	-moz-transition: all 0.4s ease 0s;
	-ms-transition: all 0.4s ease 0s;
	-o-transition: all 0.4s ease 0s;
	transition: all 0.4s ease 0s;
	width: 30px;
	cursor: pointer;
}

.status-upload ul>li>a:hover ,#lable-li:hover{
	background: none repeat scroll 0 0 #606060;
	color: #fff;
}

.status-upload form button {
	border: medium none;
	-webkit-border-radius: 4px;
	-moz-border-radius: 4px;
	-ms-border-radius: 4px;
	-o-border-radius: 4px;
	border-radius: 4px;
	color: #fff;
	float: right;
	font-family: Lato;
	font-size: 14px;
	letter-spacing: 0.3px;
	margin-right: 9px;
	margin-top: 9px;
	padding: 6px 15px;
}

.dropdown>a>span.green:before {
	border-left-color: #2dcb73;
}

.status-upload form button>i {
	margin-right: 7px;
}


/*      feed       */

.timeline {
  list-style: none;
  padding: 50px 0 20px;
  position: relative;
}
.timeline:before {
  top: 0;
  bottom: 0;
  position: absolute;
  content: " ";
  width: 3px;
  background-color: #eeeeee;
  left: 98%;
  margin-left: -1.5px;
}
.timeline > li {
    margin-bottom: 20px;
    position: relative;
    width: 95%;
    float: left;
    clear: left;
    margin-left: 27px;
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
</style>

<script type="text/javascript">
	$(document).ready(function(){
			$('.menu').on('click', 'a', function(){
				var fileName;
				fileName = $(this).parent().attr('class');
				
				$.ajax({
					dataType:"html",
					url:"<%=cp%>/study/myStudy/" + fileName,
				success : function(data) {
					$('.cont').html(data);
				}
			});

		});
//////////////////
		$("[data-toggle=tooltip]").tooltip();
//////////////////
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
								<form name="createForm" method="post">
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
									<button type="submit" class="">
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
				
				<ul class="timeline">
			
			
					<li>
						<div class="timeline-badge primary">
							<a><i class="glyphicon glyphicon-record" rel="tooltip"
								title="1시간저" id=""></i></a>
						</div>
						<div class="timeline-panel">
							<div class="timeline-heading">
								<img class="img-responsive"
									src="http://lorempixel.com/1600/500/sports/2" />

							</div>
							<div class="timeline-body">
								<p>아아</p>

							</div>

							<div class="timeline-footer">
								<a><i class="glyphicon glyphicon-thumbs-up"></i></a> &nbsp; 좋아요(255) &nbsp; 
								<a class="" data-toggle="collapse"
									href="#collapseExample" aria-expanded="false"
									aria-controls="collapseExample"> 댓글(35) </a> 
								<a class="pull-right">삭제 </a>
								<a class="pull-right">수정  |&nbsp;</a>
							
							<div class="collapse" id="collapseExample">
								<div class="well">댓글댓글</div>
							</div>
							
							
							</div>
						</div>
					</li>
					<!-- 
					<li>
						<div class="timeline-badge primary">
							<a><i class="glyphicon glyphicon-record" rel="tooltip"
								title="11 hours ago via Twitter" id=""></i></a>
						</div>
						<div class="timeline-panel">
							<div class="timeline-heading">
								<img class="img-responsive"
									src="http://lorempixel.com/1600/500/sports/2" />

							</div>
							<div class="timeline-body">
								<p>ㅇ아아아</p>

							</div>

							<div class="timeline-footer">
								<a><i class="glyphicon glyphicon-thumbs-up"></i></a> <a><i
									class="glyphicon glyphicon-share"></i></a> <a class="pull-right">Continuar
									Lendo</a>
							</div>
						</div>
					</li>

			 -->				<li>
						<div class="timeline-badge primary">
							<a><i class="glyphicon glyphicon-record" rel="tooltip"
								title="1시간저" id=""></i></a>
						</div>
						<div class="timeline-panel">
							<div class="timeline-heading">
								
							</div>
							<div class="timeline-body">
								<p>아아</p>

							</div>

							<div class="timeline-footer">
								<a><i class="glyphicon glyphicon-thumbs-up"></i></a> &nbsp; 좋아요(255) &nbsp; 
								<a class="" data-toggle="collapse"
									href="#collapseExample2" aria-expanded="false"
									aria-controls="collapseExample"> 댓글(35) </a> 
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

