<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   request.setCharacterEncoding("utf-8");
   String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport"
   content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">

<!-- Swiper JS -->
<script src="<%=cp%>/resource/js/swiper.min.js"></script>

<!-- Map -->
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=tkYb1p5roIP90h3KhPZ_&submodules=geocoder"></script>

<!-- Link Swiper's CSS -->
<link rel="stylesheet" href="<%=cp%>/resource/css/style.css">
<link rel="stylesheet" href="<%=cp%>/resource/css/swiper.min.css">
<link rel="stylesheet" href="<%=cp%>/resource/css/bootstrap.css">

<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
<script type="text/javascript" src="<%=cp%>/resource/js/bootstrap.min.js"></script>

<!-- Demo styles -->
<style>
html, body {
   position: relative;
   height: 100%;
   
}

body {
   background: #eee;
   font-family: 'BareunDotum';  
   font-size: 14px;
   color: #000;
   margin: 0;
   padding: 0;
  
}

.swiper-container {
   width: 100%;
   height: 100%;
}

.swiper-slide {
   
   text-align: center;
   background: #fff;
   /* Center slide text vertically */
   display: -webkit-box;
   display: -ms-flexbox;
   display: -webkit-flex;
   display: flex;
   -webkit-box-pack: center;
   -ms-flex-pack: center;
   -webkit-justify-content: center;
   justify-content: center;
   -webkit-box-align: center;
   -ms-flex-align: center;
   -webkit-align-items: center;
   align-items: center;
}


.swiper-slide {
   display: table-cell;
   vertical-align: middle;
}

.fileBox {
   position: relative
}

div {
   display: block;
}


section {
   width: 100%;
   height: auto;
   min-height: 100vh;
   text-align: center;
   opacity: 0.4;
   display: none;
}

.section-area {
   padding-top: 5%;
}

.section-verticalLine {
      width: 45px;
    height: 1px;
    border-top: 2px solid #eee;
    margin: 0 auto;
}

.section-title {
   font-size: 24px;
    font-weight: 400;
    margin-top: 10px;
    margin-bottom: 15px;
    text-align: center;
    color: #363636;
}

.section-question {
   padding: 15px 0; 
   max-width: 550px;
   margin: 0 auto;
}


input#studyName {
   margin: 0;
   border-radius: 0px; 
}

.icon {
    border: 0;
    width: 80px;
    height: 85px;
    padding-top: 10px;
    cursor: pointer;
}
.question-title {
     font-size: 16px;
    font-weight: 300;
    margin-bottom: 5px;
    color: #363636;
}

.question-answer select, .question-answer input {
   height: 45px;
   width: 100%;
   margin: 10px 0;
   font-size: 1.6rem;
   font-weight: 300;
   border: 1px solid #ccc;
}

.upload-label {
    width: 250px;
    height: 250px;

    background-position: center;
    background-repeat: no-repeat;
    background-size: 20px 20px;
    border-radius: 5px;
    margin: 0 auto;
}

.uploadLabel {
     background-color: rgba(0,0,0,0.7);
    font-size: 16px;
    color: #ffffff;
    width: 250px;
    padding: 18px;
    border-radius: 0px;
    text-align: center;
    border: none;
}

input #LTA {
   opacity: 0; /*input type="file" tag 투명하게 처리*/
   position: relative;
}

input.uploadBtn {
   opacity: 0; /*input type="file" tag 투명하게 처리*/
   position: relative;
}

input[type="checkbox"], input[type="radio"] {
   display: none;
}

.styleWrap label.styleProperty, .targetWrap label.targetProperty,
   .specialWrap label.specialProperty, .recruitPolicyWrap label.recruitPolicyBox,
   .isTestLessonWrap label,
   #what {
   font-size: 1.7rem;
   font-weight: 300;
   border: 1px solid #ccc;
   padding: 10px;
   width: 100%;
   height: 100%;
   margin: 0;
}

input[name=style]:checked+label, input[name=isTestLesson]:checked+label,
   input[name=speciality]:checked+label, input[name=target]:checked+label, input[name=gender]:checked+label,
   #what {
   background-color: #75ccbb;
   color: #fff;
   border-color: rgba(0, 180, 240, .2) !important;
}

section .moccozyType, section .teacher-type, .topCategory-box,
   .styleProperty, .targetProperty, .specialProperty, .isTestLessonBox,
   .recruitPolicyBox {
   background: #fff;
   border: 1px solid #e5e5e5;
   box-shadow: 0 0 0 0 rgba(0, 0, 0, 0.16), 0 0 0 0 rgba(0, 0, 0, 0.08);
   transition: box-shadow 200ms cubic-bezier(0.4, 0.0, 0.2, 1);
   text-align: center;
}

.tts {
   position: absolute;
   width: 0;
   height: 0;
   font-size: 0;
   line-height: 0;
   overflow: hidden;
   visibility: hidden
}
#blah{
border: 0px;
}
.col-sm-6 col-md-4:HOVER{
background: black;
}
.help-block{
    color: #1abc9c;
    font-weight: lighter; 

}

.swiper-pagination-progress .swiper-pagination-progressbar{
background-color: #1abc9c; 

}
.swiper-container-horizontal>.swiper-pagination-progress{
height: 9px;
}

.swiper-button-next{
background: #eee;
    width: 40px;
    height: 40px;
    border-radius: 50%;
        box-shadow: 1px 1px 3px grey;
}
.swiper-button-prev{
background: #eee;
    width: 40px;
    height: 40px;
    border-radius: 50%;
        box-shadow: 1px 1px 3px grey;
}

.uploadLabel:HOVER {
	color: gray;
}
.row{
margin: 0; 
}
.thumbnail .caption{
clear: both;
}
.thumbnail{
border-radius: 0px;
    box-shadow: 1px 1px 3px #b0b0b0;
    border: none;
}
.thumbnail:HOVER{
background: rgba(26,188,156,0.1);

}


</style>
 
<script>
$(function() {
    $("input").not($(":button")).keypress(
          function(evt) {
             if (evt.keyCode == 13) {
                var fields = $(this).parents('form:eq(0),body').find(
                      'button,input,textarea,select');
                var index = fields.index(this);
                if (index > -1 && (index + 1) < fields.length) {
                   fields.eq(index + 1).focus();
                }
                return false;
             }
          });
 });
 
 
function insertStudy(){
    var f=document.studyForm;
    
    var str;
    str=f.studyName.value;
    str=$.trim(str);
    if(!str){
  	  f.studyName.focus();
  	  alert("스터디명을 입력해주세요");
  	  return false;
    }
 
    f.action="<%=cp%>/study/created";
    f.submit();
 }
 
</script>

</head>
<body>
   <!-- Swiper -->
   <form class="swiper-container" method="post" enctype="multipart/form-data" name="studyForm">

      <div class="swiper-wrapper">
         <div class="swiper-slide">

            <div class="section-area">
               <div class="section-title"><i class="glyphicon glyphicon-th-list" style="font-size: 19px;"></i>&nbsp;스터디 <span style="color: #b8b8b8;">기본 정보</span></div>
               <div class="section-verticalLine"></div>
               <div class="section-question">
                  <div class="question-title">스터디 명을 입력해 주세요</div>
                  <p class="help-block">40자 이내로 입력해 주세요.</p>
                  <div class="question-answer">
                     <input id="studyName" name="studyName" type="text" class="form-control">


                  </div>
               </div>



               <div class="section-question">
                  <div class="question-title">스터디 한줄 소개를 입력해 주세요</div>
                  <p class="help-block">100자 이내로 입력해 주세요.</p>
                  <div class="question-answer">
                     <textarea class="form-control"rows="6%" cols="80%" name="study_Info" id="study_Info" style="border-radius: 0; border: 1px solid #ccc; resize: none;" onchange=""></textarea>
                  </div>
               </div>
            </div>

              <div class="section-question">
                  <div class="question-title">스터디 대문이미지를 등록해 주세요</div>
                  <div class="question-answer">
                     <div class="upload-label">
                        <div class="fileBox" >
                        <img id="blah" src="#" alt="" style="width: 250px; height: 250px;"/>
                           <label id="blahbtn" for="uploadBtn"  class="btn btn-large uploadLabel " style="position: absolute; top: 94px; left: 0px;">사진올리기
                           <i class="glyphicon glyphicon-cloud-upload"></i></label>
                           <input type="file" name="upload" id="uploadBtn" class="uploadBtn tts" >
                        </div>



                     </div>

                  </div>
               </div> 

         </div>
         <!-- ------------------------------------1페이지 ------------------------------------------- -->

         <div class="swiper-slide">
            <div class="section-area">
               <div class="section-title"><i class="glyphicon glyphicon-th-list" style="font-size: 19px;"></i>&nbsp;스터디  <span style="color: #b8b8b8;">상세 정보&nbsp;I</span></div>
               <div class="section-verticalLine"></div>


               <div class="section-question">
                  <div class="question-title">스터디 인원을 입력해 주세요</div>
                  
                  <div class="question-answer">
                     <select name="recruit" style="    border-radius: 0;">
                        <option value="2">2명</option>
                        <option value="3">3명</option>
                        <option value="4">4명</option>
                        <option value="5">5명</option>
                        <option value="6">6명 이상</option>
                     </select>

                  </div>
               </div>

               <div class="section-question">
                  <div class="question-title">스터디 대상을 선택해 주세요</div>
                  <p class="help-block" id="help-target">최대 두가지 선택가능합니다.</p>
                  <div class="question-answer">
                     <div class="row targetWrap" style="margin: 0;">


                        <div class="col-lg-3 col-md-3 col-sm-4 col-xs-6 targetBox"
                           style="padding: 2px;">
                           <input type="checkbox" name="target" id="LTA00" value="초등학생" />
                           <label class="targetProperty" for="LTA00">초등학생</label>
                        </div>

                        <div class="col-lg-3 col-md-3 col-sm-4 col-xs-6 targetBox"
                           style="padding: 2px;">
                           <input type="checkbox" name="target" id="LTA01" value="중학생" />
                           <label class="targetProperty" for="LTA01">중학생</label>
                        </div>

                        <div class="col-lg-3 col-md-3 col-sm-4 col-xs-6 targetBox"
                           style="padding: 2px;">
                           <input type="checkbox" name="target" id="LTA02" value="고등학생" />
                           <label class="targetProperty" for="LTA02">고등학생</label>
                        </div>

                        <div class="col-lg-3 col-md-3 col-sm-4 col-xs-6 targetBox"
                           style="padding: 2px;">
                           <input type="checkbox" name="target" id="LTA03" value="대학생" />
                           <label class="targetProperty" for="LTA03">대학생</label>
                        </div>


                        <div class="col-lg-3 col-md-3 col-sm-4 col-xs-6 targetBox"
                           style="padding: 2px;">
                           <input type="checkbox" name="target" id="LTA04" value="직장인" />
                           <label class="targetProperty" for="LTA04">직장인</label>
                        </div>
                        
                        
                        <div class="col-lg-3 col-md-3 col-sm-4 col-xs-6 targetBox"
                           style="padding: 2px;">
                           <input type="checkbox" name="target" id="LTA05" value="주부" />
                           <label class="targetProperty" for="LTA05">주부</label>
                        </div>
                        
                        
                        <div class="col-lg-3 col-md-3 col-sm-4 col-xs-6 targetBox"
                           style="padding: 2px;">
                           <input type="checkbox" name="target" id="LTA06" value="입시생" />
                           <label class="targetProperty" for="LTA06">입시생</label>
                        </div>
                        

                     </div>

                  </div>
               </div>



               <div class="section-question">
                  <div class="question-title">스터디 성별를 선택해 주세요</div>
                  <div class="question-answer">
                     <div class="row targetWrap">
                        <div class="col-lg-3 col-md-3 col-sm-4 col-xs-6 targetBox"
                           style="padding: 2px;">
                           <input type="radio" name="gender" id="LTB00" value="무관" />
                           <label class="targetProperty" for="LTB00">무관</label>
                        </div>

                        <div class="col-lg-3 col-md-3 col-sm-4 col-xs-6 targetBox"
                           style="padding: 2px;">
                           <input type="radio" name="gender" id="LTB01" value="여자" />
                           <label class="targetProperty" for="LTB01">여자</label>
                        </div>

                        <div class="col-lg-3 col-md-3 col-sm-4 col-xs-6 targetBox"
                           style="padding: 2px;">
                           <input type="radio" name="gender" id="LTB02" value="남자" />
                           <label class="targetProperty" for="LTB02">남자</label>
                        	
                        	
                        </div>


                     </div>
                  </div>
               </div>
               
               
               <div class="section-question">
                  <div class="question-title">스터디 카테고리를 선택해 주세요</div>
                  <p class="help-block" id="help-cate">최대 3개의 카테고리를 선택 가능합니다.</p>
                  <div class="question-answer">
                     <div class="row targetWrap">

                        <select id="bigCategory" class="selectField" onchange="themeList();" style=" margin: 10px 0 0;width: 265px;">
                           <option value="">:: 대분류 ::</option>
                           <c:forEach var="vo" items="${listBigCategory}">
                              <option value="${vo.categoryNum}">${vo.subject}</option>
                           </c:forEach>
                        </select>
                        
                        <select  id="smallCategory" class="selectField" style=" margin: 10px 0 0;width: 265px;" >
                           <option value="">:: 중분류 ::</option>
                        </select>
                        
                        <div id="select_category">
                       </div>
                        </div>

                     </div>
                  </div>


            </div>

         </div>

         <!-- ------------------------------------2페이지 ------------------------------------------- -->

         <div class="swiper-slide">
            <div class="section-area">
            
            
               <div class="section-title"><i class="glyphicon glyphicon-th-list" style="font-size: 19px;"></i>&nbsp;스터디 <span style="color: #b8b8b8;">상세 정보&nbsp;II</span></div>
               <div class="section-verticalLine"></div>

               </div>

            <div class="section-question">
                  <div class="question-title">스터디 활동 지역을 선택해 주세요</div>
                  <p class="help-block" id="help-city">최대 3개의 지역을 선택가능합니다.</p>
                  <div class="question-answer">
                      <div class="row targetWrap">
						<div id="select_city">
                        </div>
						<!-- 맵 시작 -->
						<div class="question-answer">
								<input id="address" name="address" type="text"> 
								<input type="button" id="addLocal" value="검색">
							<div id=map style="width: 550px; height: 300px;"></div>
						</div>
						<div id="map" style="width:100%;height:400px;"></div>
						
						<script type="text/javascript">
						var searchLocal = null;
						var pointx = null;
						var pointy = null;
						var map = new naver.maps.Map("map", {
						    center: new naver.maps.LatLng(37.3595316, 127.1052133),
						    zoom: 10,
						    mapTypeControl: true
						});

						var infoWindow = new naver.maps.InfoWindow({
						    anchorSkew: true
						});

						map.setCursor('pointer');

						// search by tm128 coordinate
						function searchCoordinateToAddress(latlng) {
						    var tm128 = naver.maps.TransCoord.fromLatLngToTM128(latlng);

						    infoWindow.close();

						    naver.maps.Service.reverseGeocode({
						        location: tm128,
						        coordType: naver.maps.Service.CoordType.TM128
						    }, function(status, response) {
						        if (status === naver.maps.Service.Status.ERROR) {
						            return alert('Something Wrong!');
						        }
								//onclick='deleteCategory(\""+idx+"\");'
						        var item = response.result.items[0],
					            point = new naver.maps.Point(item.point.x, item.point.y);
					            searchLocal = item.address;
					            pointx = point.x;
						        pointy = point.y;
						        
					            var btn = '<input type="button" onclick="addStudyLocal();" value="스터디 활동 지역 추가">';
					            var atag = '<a href="javascript:addStudyLocal();">스터디 활동 지역 추가</a>';
					            infoWindow.setContent([
					                '<div style="padding:10px;min-width:200px;line-height:150%;">',
					                item.address +'</br>',
					                '('+ point.x +','+ point.y + ')</br>',
					                btn,
					                '</div>'
					            ].join('\n'));

 						        infoWindow.open(map, latlng);
						    }); 
						}

						// result by latlng coordinate
						function searchAddressToCoordinate(address) {
						    naver.maps.Service.geocode({
						        address: address
						    }, function(status, response) {
						        if (status === naver.maps.Service.Status.ERROR) {
						            return alert('Something Wrong!');
						        }

						        var item = response.result.items[0],
						        point = new naver.maps.Point(item.point.x, item.point.y);
						        searchLocal = item.address;
						        pointx = point.x;
						        pointy = point.y;
						        
						        var btn = '<input type="button" onclick="addStudyLocal();" value="스터디 활동 지역 추가">';
					            var atag = '<a href="javascript:addStudyLocal();">스터디 활동 지역 추가</a>';
					            infoWindow.setContent([
					                '<div style="padding:10px;min-width:200px;line-height:150%;">',
					                item.address +'</br>',
					                '('+ point.x +','+ point.y + ')</br>',
					                btn,
					                '</div>'
					            ].join('\n'));


						        map.setCenter(point);
						        infoWindow.open(map, point);
						    });
						}

						function initGeocoder() {
						    map.addListener('click', function(e) {
						        searchCoordinateToAddress(e.coord);
						    });

						    $('#address').on('keydown', function(e) {
						        var keyCode = e.which;

						        if (keyCode === 13) { // Enter Key
						            searchAddressToCoordinate($('#address').val());
						        }
						    });

						    $('#addLocal').on('click', function(e) {
						        e.preventDefault();

						        searchAddressToCoordinate($('#address').val());
						    });

						    searchAddressToCoordinate('정자동 178-1');
						}

						naver.maps.onJSContentLoaded = initGeocoder;
						</script>

						<!-- 맵 끝 -->

                     </div> 
                  </div>
               </div>


         
                
            </div>
         
         
         <!-- ------------------------------------3페이지 ------------------------------------------- -->

         <div class="swiper-slide">
            
            <div class="section-area">
               <div class="section-title"><i class="glyphicon glyphicon-th-list" style="font-size: 19px;"></i>&nbsp;스터디 공개범위 설정</div>
               <div class="section-verticalLine"></div>


               <div class="section-question" >
                  <div class="question-title" style="margin-bottom: 38px;">스터디 공개범위를 선택해 주세요</div>
                  <div class="question-answer">

                     <div class="row">
                        <div class="col-sm-6 col-md-4">
                           <div class="thumbnail" id="thum1">
                              <label style="margin-left: 31px;">
                              <input type="radio" name="range" value="0" id="range0"/>
                                 <img class="icon"src="<%=cp%>/resource/img/group.png" alt="..."> 
                              </label>
                              <div class="caption">
                                 <h4>전체공개</h4>
                                 <p style="font-size: 13px;color: #858585;font-weight: lighter;">누구나 스터디를 검색해 찾을 수 있고,홈페이지 회원 모두 게시물을 볼 수 있습니다.</p>
                              </div>
                           </div>

                        </div>

                        <div class="col-sm-6 col-md-4">
                           <div class="thumbnail" id="thum2">
                              <label style="margin-left: 31px;">
                              <input type="radio" name="range" value="1" id="range1"/>
                                 <img class="icon" src="<%=cp%>/resource/img/user.png" alt="..." >
                              </label>
                              
                              <div class="caption">
                                 <h4>스터디명 공개</h4>
                                 <p style="font-size: 13px;color: #858585;font-weight: lighter;">누구나 스터디를 검색해 찾을 수 있지만, 게시물은 멤버만 볼 수 있습니다.</p>
                              </div>
                           </div>
                        </div>

                        <div class="col-sm-6 col-md-4">
                           <div class="thumbnail" id="thum3">
                              <label style="margin-left: 31px;"> <input type="radio" name="range" value="2" id="range2"/>
							    <img class="icon" src="<%=cp%>/resource/img/padlock.png" alt="...">
                              </label>
                              <div class="caption">
                                 <h4>비공개</h4>
                                 <p style="font-size: 13px;color: #858585;font-weight: lighter;">스터디와 게시글이 공개되지 않습니다. 초대를 통해서만 가입할 수 있습니다.</p>
                              </div>
                           </div>
                        </div>
                        
                     </div>
                  </div>
               </div>
            
            
               <div class="section-question" >
                  <input type="button" id="uploadBtn2" class="uploadBtn tts" onclick="insertStudy();" >
                  <label for="uploadBtn2" class="btn btn-large uploadLabel">스터디 만들기</label>
                  <input type="button" id="uploadBtn2" class="uploadBtn tts">
                  <label for="uploadBtn2" class="btn btn-large uploadLabel" style="float: right;">취소</label>
               </div>
            
            </div>
         </div>
</div>
     
      <!-- Add Pagination -->
      <div class="swiper-pagination"></div>
      <!-- Add Arrows -->
      <div class="swiper-button-next"><i class="glyphicon glyphicon-chevron-right" style="color: #1abc9c;
    font-size: 18px;padding: 9px 0px 0px 11px;"></i></div>
      <div class="swiper-button-prev"><i class="glyphicon glyphicon-chevron-left" style="color: #1abc9c;
    font-size: 18px;padding: 9px 0px 0px 11px;"></i></div>

   </form>

   

   <!-- Initialize Swiper -->
   <script>
      var swiper = new Swiper('.swiper-container', {
         pagination : '.swiper-pagination',
         paginationClickable : false,
         paginationType: 'progress',
         speed:	1000, 

         simulateTouch:false,
         nextButton : '.swiper-button-next',
         prevButton : '.swiper-button-prev',
         spaceBetween : 0
      });
   </script>

   <script>

	function deleteCategory(item) {//x버튼 클릭시 제거
		var $item =$("#"+item);
		$item.next().next().next().remove();
		$item.next().next().remove();
		$item.next().remove();
		$item.remove();
		cnt--;
	}
	   
    
    /////////////////////////////////////////////////////////////////////////////////////////////////////

	$(function() {
		
		 $("input:radio[name=range]").change(function () {
			var $me =  $(this).parent().siblings();
			var radioValue = $(this).val();
			if (radioValue == "0") {
				$("#thum1").css("background","rgba(26,188,156,0.1)");
				$("#thum2").css("background","none");
				$("#thum3").css("background","none");
		
			} else if (radioValue == "1") {
				$("#thum1").css("background","none");
				$("#thum2").css("background","rgba(26,188,156,0.1)");
				$("#thum3").css("background","none");
			} else if (radioValue == "2") {
				$("#thum1").css("background","none");
				$("#thum2").css("background","none"); 
				$("#thum3").css("background","rgba(26,188,156,0.1)");
			}
		
		});
		
		
		
         var cnt=0, vnt=0;
         $("#smallCategory").change(function() { //카테고리 선택하면 박스추가   
            if($("input[name='choiceCategory']").length>=3){
               $("#help-cate").html("3개이하만 선택 가능합니다.").css("color","#f27979");
               return;
            } else{
            	
            }
         
            cnt++;
            var index1 = $("#bigCategory option:selected");
            var index2 = $("#smallCategory option:selected");
            var s = index1.text() + "-" + index2.text();
			var idx="my_category"+cnt;
			
			
		     var state1=false;
             $("input[name='choiceCategory']").each(function() {
            	 if(index2.val() === this.value){
            		 state1=true;
            		 $("#help-cate").html("중복된 카테고리를 선택하였습니다.").css("color","#f27979");
            	 }
            });

			if(state1){
				return;
			}	

			
			
            $("#select_category").append(" <div id='"+idx+"' style='width: 536px; height: 40px; margin: 5px auto; background-color: #75ccbb;'>"
                    +"<div style='display: inline-block; font-size: 17px; line-height: 40px; color: white;'>"
                      +s+"</div> <div style=' float: right;'> <img alt='' src='<%=cp%>/resource/img/delete.png'"
                        +" width='20px' height='20px' onclick='deleteCategory(\""+idx+"\");' style='margin: 10px 7px; cursor: pointer;'> </div> </div>"
                        	+"<input type='hidden' value='"+index2.val()+"' name='choiceCategory' id='choiceCategory'>");
        
           
         });
      	
         
         $('input[type=checkbox]').click(function() { //스터디대상3이하로 막기
            var count = $('input:checkbox[name="target"]:checked').length;
            if (count > 2) {
            	 $("#help-target").html("2개 이하로 선택해 주세요").css("color","#f27979");
               $(this).attr("checked", false);
            }

         });
      });
    
    
    
    
		var vdx = null;
		var vnt = 0;
		var cnt = 0;
    	function addStudyLocal() {
    		// 3개 초과인지 검사
            if(cnt>=3){
                $("#help-city").html("3개이하만 선택 가능합니다.").css("color","#f27979");
                return;
            } 
            var flag = true;
			$("input[id='choiceCity']").each(function() {
				//$("#"+vdx).next().val()
				if(searchLocal == this.value){
					$("#help-city").html("중복된 카테고리를 선택하였습니다.").css("color","#f27979");
					flag = false;
					return;
				}
			});
			if(!flag){
				return;
			}
			cnt++;
			vnt++;
			var vdx ="my_city"+vnt;
			$("#select_city").append(" <div id='"+vdx+"' style='width: 536px; height: 40px; margin: 5px auto; background-color: #75ccbb; '>"
			+"<div style='display: inline-block; font-size: 17px; line-height: 40px; color: white;'>"
			+searchLocal+"</div> <div style=' float: right;'> <img alt='' src='<%=cp%>/resource/img/delete.png'"
			+" width='20px' height='20px' onclick='deleteCategory(\""+vdx+"\");' style='margin: 10px 7px; cursor: pointer;'> </div> </div>"
			+"<input type='hidden' value='"+searchLocal+"' name='choiceCity' id='choiceCity'>"
			+"<input type='hidden' value='"+pointx+"' name='pointx' id='pointx'>"
			+"<input type='hidden' value='"+pointy+"' name='pointy' id='pointy'>");
		} 
    	
    	
    	
      /////////////////////////////////////////////////////////////////////////////////////////////////////
  
      function themeList() {
       var bigCategory=$("#bigCategory").val();
       if(bigCategory=="") {
          $("#smallCategory option").each(function() {
             $("#smallCategory option:eq(0)").remove();
          });

          $("#smallCategory").append("<option value=''>:: 중분류 ::</option>");
          return false;
       }
       
       var url="<%=cp%>/study/getCategory";
         var query = "parent=" + bigCategory;
         //alert(query);
         $
               .ajax({
                  type : "post",
                  url : url,
                  data : query,
                  dataType : "json",
                  success : function(data) {
                     $("#smallCategory option").each(function() {
                        $("#smallCategory option:eq(0)").remove();
                     });

                     $("#smallCategory").append(
                           "<option value=''>:: 중분류 ::</option>");

                     var cn = "${dto.categoryNum}";
                     var s;
                     for (var idx = 0; idx < data.listSmallCategory.length; idx++) {
                        s = "";
                        if (cn == data.listSmallCategory[idx].categoryNum)
                           s = " selected='selected'";
                        $("#smallCategory")
                              .append(
                                    "<option value='"+data.listSmallCategory[idx].categoryNum+"' " + s +">"
                                          + data.listSmallCategory[idx].subject
                                          + "</option>");
                     }
                  },
                  error : function(e) {
                     alert(e.responseText);
                  }
               });
      }
      
   </script>


   <script type="text/javascript">
        $(function() {
            $('#blah').attr('src', '<%=cp%>/resource/images/white.png'); 
            $("#uploadBtn").on('change', function(){
                $("#uploadBtn").empty();

                readURL(this);
            });
        });

        function readURL(input) {
            if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
            	$('#blahbtn').html("사진 바꾸기");
				$('#blah').attr('src', e.target.result); 
               		/* alert(e.target.result);
                    $('#blah').style.backgroundImage = "url('"e.target.result"')"; */
                }

              reader.readAsDataURL(input.files[0]);
            }
        }
    </script>
</body>
</html>