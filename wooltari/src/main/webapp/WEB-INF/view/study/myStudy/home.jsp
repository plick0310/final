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
.footer{
clear:  both;
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
	margin-bottom: 60px;
}
input.uploadBtn {
   opacity: 0; /*input type="file" tag 투명하게 처리*/
   position: relative;
   width: 0px; 
   margin: -15px;
} 
li .active{
	background-color: #1abc9c;
}
.clickbtn {
   background-color: white;
   border-style: solid;
   padding: 5px 20px;
   margin-left: 10px;
   font-size:13px;
   border: 1px solid #EAEAEA;
}

.btn-compose {
    background: none repeat scroll 0 0 #1abc9d;
    color: #fff;
    padding: 12px 0;
    text-align: center;
    width: 100%;
    margin-top: 20px;
}
.center {
    margin-top:50px;   
}

.modal-header {
	padding-bottom: 5px;
}


.img-thumbnail {
    width: 100px;
    height: 100px;
    margin: 5px auto;
    display: block;
    -moz-border-radius: 50%;
    -webkit-border-radius: 50%;
    border-radius: 53%;

}
label {
    font-size: 14px;
    float: none;
}	
.form-control {
    display: block;
    width: 90%;
    margin: 0px auto;}
</style>
<script type="text/javascript" src="<%=cp%>/resource/js/jquery.form.js"></script>

<script type="text/javascript">
$(document).ready(function(){
		
	
	$.ajax({
			url:"<%=cp%>/study/myStudy/${s_num}/board",
			dataType:"html",
			success : function(data) {
			$('.cont').html(data);
			}
		});
		
		
	
		$('.menu').on('click', 'a', function(){
			var fileName;
			fileName = $(this).parent().attr('class');
			
			$('li').each(function(index){
				$(this).removeClass("active").css("background-color","");
			})
			
			$(this).parent().addClass("active").css("background-color","#1abc9c");
			
			var query ="leader=${dto.userId}";
			//alert(query);
			
			$.ajax({
				type: 'POST',  	
				data:query
				,url:"<%=cp%>/study/myStudy/${s_num}/" + fileName
				,success : function(data) {
					$('.cont').html(data);
				}
			});

		});

		
		$("#joinStudy").on('hidden.bs.modal', function () {
		      $("#uploadBtn").val("");
		      $("#content").val("");
		    
		   });
		
		
		
	});
	
	
function joinstudy() {
	
	var f= document.joinStudy;
	var query = new FormData(f); 
	
	$.ajax({
		type:"POST"
		,url:"<%=cp%>/study/${s_num}/joinStudy"
		,processData: false  // file 전송시 필수
		,contentType: false  // file 전송시 필수
		,data : query
		,dataType:"json"
		,success:function(data){
			alert("신청이 완료되었습니다. 리더의 승인을 기다려주세요!");
			 $('.modal.in').modal('hide'); 
			 $('#joinstudy').html("가입신청 중").attr('disabled', true);
			 
		},
		 error: function(e){
              console.log(e.responseText);
          } 
	});
	
	
}

//이미지 미리보기
$(function() {
    $("#uploadBtn").on('change', function(){
    	  
	var src = getFileExtension($(this).val());
					if (!((src.toLowerCase() == "gif")
							|| (src.toLowerCase() == "jpg") || (src
							.toLowerCase() == "jpeg"))) {
						alert('gif 와 jpg 파일만 지원합니다.');
						return;
					}

					$("#uploadBtn").empty();
					readURL(this);
				});
	});
	
//파일의 확장자를 가져옴
function getFileExtension(filePath){  
    var lastIndex = -1;
    lastIndex  = filePath.lastIndexOf('.');
    var extension = "";

   if(lastIndex != -1){
    extension = filePath.substring( lastIndex+1, filePath.len );
   }else{
    extension = "";
   }
    return extension;
}


function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();

			reader.onload = function(e) {
				
				$('#blah').attr('src', e.target.result);
				$('#content1').attr('src', e.target.result);
				
				
			}

			reader.readAsDataURL(input.files[0]);
		}
	}
</script>





<div style="width: 1140px;  margin: 60px auto;">
	<div style="height: 50px; font-size: 20px; text-align: center;">
		<span style="font-size: 20px; color: #BDBDBD; font-weight: bold;">
			<span style="font-size: 19px; color: #1abc9c;"
			class="glyphicon glyphicon-pencil"> </span>&nbsp;&nbsp;&nbsp;${dto.studyName }&nbsp;&nbsp;&nbsp;
		</span>S T U D Y
	</div>
	<div style="float: left; text-align: center; ">
		<div
			style="width: 170px; height: 230px; box-shadow: 0px 3px 5px 1px #eee; font-size: 20px; font-size: 16px; line-height: 50px;">
			<div
				style="width: 170px; height: 170px; background-image: url('<%=cp%>/uploads/member/userImg/${dto.imageFileName}'); background-size: cover;">
			</div>
			<div style="width: 170px; height: 3px; background-color: #1abc9c;"></div>
			<Strong>LEADER</Strong><span style="font-size: 14px;">&nbsp;&nbsp;${dto.userId }</span>
		</div>
	
			
			
		<div class="inbox-body">
		
		<!-- 멤버회원이 아닌경우만 출력... -->
				<c:if test="${state == false}">
						<a href="#joinStudy" data-toggle="modal" id="joinstudy" title="Compose"  class="btn btn-compose" style="border-radius: 0px;">스터디 가입하기</a>
				</c:if>


	<!-- 	<a href="#joinStudy" data-toggle="modal" id="joinstudy" title="Compose"  class="btn btn-compose" style="border-radius: 0px;">스터디 가입하기</a>
	 -->		
			 
			 
			<div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="joinStudy" class="modal fade" style="display: none;">
			<!-- Modal -->
				
	
			 
			 	<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span><span class="sr-only">Close</span>
							</button>
							<h3 class="modal-title" id="lineModalLabel">스터디 가입 양식</h3>
						</div>
						<div class="modal-body">

							<!-- content goes here -->
							<form name="joinStudy" enctype="multipart/form-data" method="post" >

								
									<div class="form-group">
									<label for="exampleInputFile">스터디에서 사용 할 프로필 사진을 등록해주세요</label><br>

									  
									  
									  <label for="uploadBtn"  class="btn btn-large uploadLabel">
									 
									  <c:if test="${empty sessionScope.member.userImg}"> 
										<img  id="blah" src="<%=cp%>/resource/img/noprofileimg.png" 
											class="img-thumbnail" width="100%" height="100%">
										
									  </c:if>
									
									  <c:if test="${not empty sessionScope.member.userImg}">
										<img id="blah"
											src="<%=cp%>/uploads/member/userImg/${sessionScope.member.userImg}"
											class="img-thumbnail" width="100%" height="100%">
									  </c:if>
										
										</label>
										
									<input type="file" name="upload" id="uploadBtn" class="uploadBtn tts" >
    
										
									<p class="help-block">이미지를 변경하지 않으면 기본프로필 이미지를 사용합니다.</p>
									</div>


								<div class="form-group">
									<label for="exampleInputPassword1">스터디원에게 간단한 자기소개를 해주세요</label> 
									<textarea rows="8" cols="10" class="form-control" id="content" name="content" required="required"></textarea>
								</div>
								
								
								
								<button type="button" class="btn btn-default" onclick="joinstudy();">제출하기</button>
							</form>

						</div>

					</div>
				</div>
			<!-- /.modal -->
			</div>
			
			
		</div>	
			
		
		<div
			style="margin: 20px 0; border-top: 1px solid #eee; padding: 20px 0; width: 170px;">${dto.study_Info }</div>
	</div>

	<div id="wrap">
		<div id="box">
			<div
				style="width: 900px; box-shadow: 2px 3px 5px 1px #eee; float: left; margin: 0px 25px 35px;">
				<ul class="menu">
					<li class="board"><a href="#">H O M E</a></li>
					<li class="calender"><a href="#">C A L E N D E R</a></li>
					<li class="team"><a href="#">M E M B E R</a></li>
					<li class="chating"><a href="#">C H A T H I N G</a></li>
				</ul>

			</div>
			
			<div class="cont"></div>
			
			
		</div>
	</div>
</div>

