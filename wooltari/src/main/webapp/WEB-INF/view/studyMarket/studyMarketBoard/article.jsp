<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<style>
   /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
        height: 100%;
      }
      /* Optional: Makes the sample page fill the window. */
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
      #floating-panel {
        position: absolute;
        top: 10px;
        left: 25%;
        z-index: 5;
        background-color: #fff;
        padding: 5px;
        border: 1px solid #999;
        text-align: center;
        font-family: 'Roboto','sans-serif';
        line-height: 30px;
        padding-left: 10px;
      }

embed-container {
    position: relative;
    padding-bottom: 56.25%;
    height: 0;
    overflow: hidden;
    max-width: 100%; 
}

.embed-container iframe, .embed-container object, .embed-container embed {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
}

.dnu{
border: none;
background: none;
}
</style>

<script type="text/javascript">
function deleteBoard(){
<c:if test="${sessionScope.member.userId=='admin'||sessionScope.member.userId==dto.userId}">
var num="${dto.num}";
var page="${page}";
var query="num="+num+"&page="+page;
var url="<%=cp%>/studyMarket/studyMarketBoard/delete?"+query;

if(confirm("위 자료를 삭제 하시 겠습니까 ? "))
  	location.href=url;
</c:if>    
<c:if test="${sessionScope.member.userId!='admin' && sessionScope.member.userId!=dto.userId}">
alert("게시물을 삭제할 수  없습니다.");
</c:if>
}


function updateBoard(){
<c:if test="${sessionScope.member.userId==dto.userId}">
	var num="${dto.num}";
	var page = "${page}";
	var query="num="+num+"&page="+page;
	var url = "<%=cp%>/studyMarket/studyMarketBoard/update?"+query;
	
	location.href=url;	
</c:if>
<c:if test="${sessionScope.member.userId!=dto.userId}">
	alert("게시물을 수정할 수 없습니다.");
</c:if>
}
</script>


<script type="text/javascript">
//게시물 공감 개수
function countLikeBoard(num){
	var url="<%=cp%>/studyMarket/studyMarketBoard/countLikeBoard";
	$.post(url,{num:num},function(data){
		var count=data.countLikeBoard;
		
		$("#countLikeBoard").html(count);
	},"json");
}

//게시물 공감 추가
function sendLikeBoard(num){
	var uid="${sessionScope.member.userId}";
	if(!uid){
		login();
		return;
	}
	msg="게시물에 공감하십니까?";
	if(!confirm(msg))
		return;
	
	var query = "num="+num;
	
	$.ajax({
		type:"post"
		,url:"<%=cp%>/studyMarket/studyMarketBoard/insertLikeBoard"
		,data:query
		,dataType:"json"
		,success:function(data){
			var state=data.state;
			if(state=="true"){
				countLikeBoard(num);
			}else if(state=="false"){
				alert("좋아요는 한번만 가능합니다.!!!");
			}else if(state=="loginFail"){
				login();
			}
		}
		,error:function(e){
			console.log(e.responseText);
		}
	});
}
//...............................................
//댓글
function login(){
	location.href="<%=cp%>/member/login";
}
//댓글 리스트
$(function(){
	listPage(1);
});
function listPage(page){
	var url="<%=cp%>/studyMarket/studyMarketBoard/listReply";
	var num="${dto.num}";
	$.post(url, {num:num, pageNo:page}, function(data){
		$("#listReply").html(data);
	});
}
//댓글 추가
function sendReply(){
	var uid="${sessionScope.member.userId}";
	if(!uid){
		login();
		return false;
	}
	var num="${dto.num}";//해당 게시물 번호
	var content = $.trim($("#replyContent").val());
	if(!content){
		alert("내용을 입력하세요!!!");
		$("replyContent").focus();
		return false;
	}
	var query="num="+num;
	query+="&content="+encodeURIComponent(content);
	
	$.ajax({
		type:"post"
		,url:"<%=cp%>/studyMarket/studyMarketBoard/createdReply"
		,data:query
		,dataType:"json"
		,success:function(data){
			$("#content").val("");
			
			var state = data.state;
			if(state=="true"){
				listPage(1);
			}else if(state=="false"){
				alert("댓글을 등록하지 못했습니다.!!!");
			}else if(state=="loginFail"){
				login();
			}
		}
		,error:function(e){
			console.log(e.responseText)
		}
	});
}
//댓글 삭제
function deleteReply(replyNum, page){
	var uid="${sessionScope.member.userId}";
	if(!uid){
		login();
		return false;
	}
	if(confirm("게시물을 삭제하시겠습니까?")){
		var url="<%=cp%>/studyMarket/studyMarketBoard/deleteReply"
		$.post(url, {replyNum:replyNum, mode:"reply"}, function(data){
			var state=data.state;
			
			if(state=="loginFail"){
				login();
			}else{
				listPage(page);
			}
		},"json");
	}
}

</script>

<script type="text/javascript">

$(function(){
	$('#collapseTwo').on('shown.bs.collapse', function () {
		initialize();
   });		
});
      function initMap() {
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 8,
          center: {lat: -34.397, lng: 150.644}
        });
        var geocoder = new google.maps.Geocoder();

        document.getElementById('submit').addEventListener('click', function() {
          geocodeAddress(geocoder, map);
        });
      }

      function geocodeAddress(geocoder, resultsMap) {
        var address = document.getElementById('address').value;
        geocoder.geocode({'address': address}, function(results, status) {
          if (status === 'OK') {
            resultsMap.setCenter(results[0].geometry.location);
            var marker = new google.maps.Marker({
              map: resultsMap,
              position: results[0].geometry.location
            });
          } else {
            alert('Geocode was not successful for the following reason: ' + status);
          }
        });
      }
    </script>
   <!-- 
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAcO1EZpm4c5VVFmWf1h0dwX1QVbsx3Gb4&callback=initMap">
    </script>
 	-->
	<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=MXeCbH9k35apBk0LHUUl"></script>

<div  style=" margin: 60px auto; height:50px; font-size: 20px;text-align: center;">
			<span style="font-size: 20px;color:#BDBDBD; font-weight: bold;">
			<span style="font-size: 19px; color: #1abc9c; " class="glyphicon glyphicon-pencil">
			</span>&nbsp;&nbsp;&nbsp;WOOLTARI&nbsp;&nbsp;&nbsp;</span>W R I T E . . .</div>
<table cellpadding="0" cellspacing="0" id="read_table" class="board_table" style="width: 900px; margin: -45px auto 0;">
	<thead>
		<tr>
			<th class="informations">
				${dto.subject}
				<span class="inforArea">
					<strong>작성일</strong> ${dto.created}
					<span class="__dotted"></span>
					<strong>작성자</strong> ${dto.userId}
					<span class="__dotted"></span>
					<strong>조회수</strong> ${dto.hitCount}
				</span>
			</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td class="read_contArea">
				<span id="" >강의 시작일  : ${dto.startdate}</span>&nbsp;&nbsp;&nbsp;<span id="" >강의 종료일 : ${dto.enddate}</span>
				
	<%-- 			
	<!-- 지도  -->
	<div class="panel panel-default" style="border: none; box-shadow: none;">
			
			<!-- 판넬 헤드 -->
			<div class="panel-heading" role="tab" id="headingTwo" style="width: 80px; height: 80px; margin: 18px auto; border-radius: 50%; background: #1abc9c; box-shadow: 0px 9px 30px #9f9fa0;">
				<h4 class="panel-title">
					<a class="collapsed" data-toggle="collapse"	data-parent="#accordion" href="#collapseTwo" aria-expanded="false"	aria-controls="collapseTwo"> 
					<span style="font-size: 40px; color: white; padding: 9px 4px 4px 4px;" class="glyphicon glyphicon-map-marker"> </span>
					</a>
				</h4>
			</div>
			
			<!-- 판넬 바디 -->		
			<div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
				<div class="panel-body"	style="height: 501px; border: none; padding: 0;">
					<div style="margin-bottom: 100px; width: 900px; background-color: #eee; height: 500px;">
						
						<!--지도 -->
				<div id="floating-panel">
     				 <input id="address" type="textbox" value="${dto.address}">
     				 <input id="submit" type="button" value="Geocode">
    			</div>
    			<div id="map"></div>

					</div>
				</div>
			</div>
	</div>
	 --%>
	<div id="map" style="width:100%;height:400px;"></div>
		
				<!-- 유튜브 동영상 -->
				<div class="">
					<iframe width="560" height="315" src="https://www.youtube.com/embed/${dto.urlContent}" frameborder="0" allowfullscreen></iframe>
				</div>
				
				
				<div id="board_memo_area">
					${dto.content}
				</div>
			<!-- 좋아요  -->
					<ul class="_read_likesArea" style="border-bottom: 1px solid #eee;">
						<li class="_likes_btn">
							<a href="javascript:sendLikeBoard('${dto.num}');" title="">
								<span id="countLikeBoard">${countLikeBoard}<br/></span>
								<span class="__count" style="color: #1abc9c;">추천</span>
							</a>
						</li>
					</ul>
<!-- 				<tr> -->
<!-- 				<td> 이전글</td> -->
<!-- 				</tr> -->
				
<!-- 				<tr> -->
<!-- 				<td>다음글</td> -->
<!-- 				</tr> -->
				<ul>
					<li>
						<strong>이전글 :</strong>
						<c:if test="${not empty preReadDto}">
							<a href="<%=cp%>/studyMarket/studyMarketBoard/article?${query}&num=${preReadDto.num}">
							${preReadDto.subject}</a>
						</c:if>
					</li>
				</ul>
				
				<ul>
					<li>
						<strong>다음글 :</strong>
						<c:if test="${not empty nextReadDto}">
							<a href="<%=cp%>/studyMarket/studyMarketBoard/article?${query}&num=${nextReadDto.num}">
							${nextReadDto.subject}</a>
						</c:if>
					</li>
				</ul>
				
				<ul>
					<li>
						<strong>첨부파일</strong>
						<c:forEach var="dto" items="${listFile}">
						<a href="<%=cp%>/studyMarket/studyMarketBoard/download?fileNum=${dto.fileNum}">
					  ${dto.originalFilename}<span class="glyphicon glyphicon-download-alt"></span><br></a>
						</c:forEach>
					</li>
				</ul>
				
				<div style="float: right;">
			<c:if test="${sessionScope.member.userId==dto.userId}">	
					<button type="button" class="dnu" onclick="updateBoard();">수정</button>
			</c:if>
			<c:if test="${sessionScope.member.userId==dto.userId}">		
					 <button type="button" class="dnu" onclick="deleteBoard();">삭제</button>
			</c:if>		
					</div>
		
		<!-- 답글 -->
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
                    <button type='button' class='clickbtn' style="padding:10px 20px;     border: none;" onclick='sendReply();'>댓글 등록</button>
                </td>
            </tr>
		</tbody>
	</table>
    <div id="listReply">    </div>
    
    <script type="text/javascript">
        var map = null;

        function initMap() {
            map = new naver.maps.Map('map', {
                center: new naver.maps.LatLng(37.3595704, 127.105399),
                zoom: 10
            });
        }
    </script>
    