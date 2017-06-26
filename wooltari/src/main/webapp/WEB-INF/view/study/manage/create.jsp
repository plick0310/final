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

<!-- Link Swiper's CSS -->

<link rel="stylesheet" href="<%=cp%>/resource/css/swiper.min.css">
<link rel="stylesheet" href="<%=cp%>/resource/css/bootstrap.css">

<script type="text/javascript" src="<%=cp%>/resource/js/jquery.1.11.1.js"></script>

<script type="text/javascript" src="<%=cp%>/resource/js/bootstrap.min.js"></script>



<!-- Demo styles -->
<style>
html, body {
   position: relative;
   height: 100%;
}

body {
   background: #eee;
   font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
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


/*        */

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
   padding-top: 30px;
}

.section-verticalLine {
   width: 70px;
   height: 1px;
   border-top: 1px solid #1abc9c;
   margin: 0 auto;
}

.section-title {
   font-size: 2.8rem;
   font-weight: 400;
   margin-top: 10px;
   margin-bottom: 15px;
   text-align: center;
}

.section-question {
   padding: 25px 0;
   max-width: 550px;
   margin: 0 auto;
}

input#introTitle {
   margin: 0;
}

.question-title {
   font-size: 2.0rem;
   font-weight: 300;
   margin-bottom: 15px;
}

.question-answer select, .question-answer input {
   height: 45px;
   width: 100%;
   margin: 10px 5px;
   font-size: 1.6rem;
   font-weight: 300;
   border-radius: 5px;
   border: 1px solid #ccc;
}

.upload-label {
   width: 70%;
   height: 300px;
   border: 1px solid #ccc;
   
   background-image:
      url(http://moccozy.blob.core.windows.net/icon/upload.png);
   background-position: center;
   background-repeat: no-repeat;
   background-size: 20px 20px;
   border-radius: 5px;
   margin: 0 auto;
}

.uploadLabel {
   background-color: #1abc9c;
   font-size: 16px;
   color: #fff;
   width: 138px;
   padding: 18px;
   text-align: center;
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
   border: 1px solid #dfdfdf;
   padding: 10px;
   width: 100%;
   height: 100%;
   margin: 0;
}

input[name=style]:checked+label, input[name=isTestLesson]:checked+label,
   input[name=speciality]:checked+label, input[name=target]:checked+label, input[name=target2]:checked+label,
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





</style>

</head>
<body>
   <!-- Swiper -->
   <form class="swiper-container" method="post"
      enctype="multipart/form-data">

      <div class="swiper-wrapper">
         <div class="swiper-slide">

            <div class="section-area">
               <div class="section-title">스터디 기본 정보</div>
               <div class="section-verticalLine"></div>
               <div class="section-question">
                  <div class="question-title">스터디 명을 입력해 주세요</div>
                  <div class="question-answer">
                     <input id="introTitle" name="title" type="text"
                        class="form-control">


                  </div>
               </div>


               <div class="section-question">
                  <div class="question-title">스터디 대문이미지를 등록해 주세요</div>
                  <div class="question-answer">
                     <div class="upload-label">
                        <div class="fileBox">
                           <input type="file" id="uploadBtn" class="uploadBtn tts" >
                           <label for="uploadBtn" class="btn btn-large uploadLabel "style="left: 120px; top: 104px; position: absolute;">사진올리기</label>
                        </div>



                     </div>

                  </div>
               </div>


               <div class="section-question">
                  <div class="question-title">스터디 한줄 소개를 입력해 주세요</div>
                  <div class="question-answer">
                     <textarea class="form-control"rows="10%" cols="80%" name="study_Info" id="study_Info"
                        placeholder="40자 이내로 입력해주세요." onchange="study_InfoCheck();"></textarea>
                  </div>
               </div>
            </div>

         </div>
         <!-- ------------------------------------1페이지 ------------------------------------------- -->

         <div class="swiper-slide">
            <div class="section-area">
               <div class="section-title">스터디 상세 정보I</div>
               <div class="section-verticalLine"></div>


               <div class="section-question">
                  <div class="question-title">스터디 인원을 입력해 주세요</div>
                  <div class="question-answer">
                     <select>
                        <option value="">2명</option>
                        <option value="">3명</option>
                        <option value="">4명</option>
                        <option value="">5명</option>
                        <option value="">6명 이상</option>
                     </select>

                  </div>
               </div>

               <div class="section-question">
                  <div class="question-title">스터디 대상을 선택해 주세요</div>
                  <div class="question-answer">
                     <div class="row targetWrap">


                        <div class="col-lg-3 col-md-3 col-sm-4 col-xs-6 targetBox"
                           style="padding: 2px;">
                           <input type="checkbox" name="target" id="LTA00" value="LTA00" />
                           <label class="targetProperty" for="LTA00">초등학생</label>
                        </div>

                        <div class="col-lg-3 col-md-3 col-sm-4 col-xs-6 targetBox"
                           style="padding: 2px;">
                           <input type="checkbox" name="target" id="LTA01" value="LTA01" />
                           <label class="targetProperty" for="LTA01">중학생</label>
                        </div>

                        <div class="col-lg-3 col-md-3 col-sm-4 col-xs-6 targetBox"
                           style="padding: 2px;">
                           <input type="checkbox" name="target" id="LTA02" value="LTA02" />
                           <label class="targetProperty" for="LTA02">고등학생</label>
                        </div>

                        <div class="col-lg-3 col-md-3 col-sm-4 col-xs-6 targetBox"
                           style="padding: 2px;">
                           <input type="checkbox" name="target" id="LTA03" value="LTA03" />
                           <label class="targetProperty" for="LTA03">대학생</label>
                        </div>


                        <div class="col-lg-3 col-md-3 col-sm-4 col-xs-6 targetBox"
                           style="padding: 2px;">
                           <input type="checkbox" name="target" id="LTA04" value="LTA04" />
                           <label class="targetProperty" for="LTA04">직장인</label>
                        </div>
                        
                        
                        <div class="col-lg-3 col-md-3 col-sm-4 col-xs-6 targetBox"
                           style="padding: 2px;">
                           <input type="checkbox" name="target" id="LTA05" value="LTA05" />
                           <label class="targetProperty" for="LTA05">주부</label>
                        </div>
                        
                        
                        <div class="col-lg-3 col-md-3 col-sm-4 col-xs-6 targetBox"
                           style="padding: 2px;">
                           <input type="checkbox" name="target" id="LTA06" value="LTA06" />
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
                           <input type="radio" name="target2" id="LTB00" value="LTB00" />
                           <label class="targetProperty" for="LTB00">무관</label>
                        </div>

                        <div class="col-lg-3 col-md-3 col-sm-4 col-xs-6 targetBox"
                           style="padding: 2px;">
                           <input type="radio" name="target2" id="LTB01" value="LTB01" />
                           <label class="targetProperty" for="LTB01">여자</label>
                        </div>

                        <div class="col-lg-3 col-md-3 col-sm-4 col-xs-6 targetBox"
                           style="padding: 2px;">
                           <input type="radio" name="target2" id="LTB02" value="LTB02" />
                           <label class="targetProperty" for="LTB02">남자</label>
                        </div>


                     </div>
                  </div>
               </div>


            </div>

         </div>

         <!-- ------------------------------------2페이지 ------------------------------------------- -->

         <div class="swiper-slide">
            <div class="section-area">
            
            
               <div class="section-title">스터디 상세 정보II</div>
               <div class="section-verticalLine"></div>

      <div class="section-question">
                  <div class="question-title">스터디 카테고리를 선택해 주세요</div>
                  <div class="question-answer">
                     <div class="row targetWrap">

                        <select name="bigCategory" id="bigCategory" class="selectField"
                           onchange="themeList();" style="width: 45%;">
                           <option value="">:: 대분류 ::</option>
                           <c:forEach var="vo" items="${listBigCategory}">
                              <option value="${vo.categoryNum}"
                                 ${vo.categoryNum==dto.bigCategory ? "selected='selected'" : ""}>${vo.subject}</option>
                           </c:forEach>
                        </select>
                         <select name="smallCategory" id="smallCategory"
                           class="selectField" style="width: 45%;" >
                           <option value="">:: 중분류 ::</option>
                        </select>
                        <div id="select_category"></div>

                     </div>
                  </div>
               </div>

            <div class="section-question">
                  <div class="question-title">스터디 활동 지역을 선택해 주세요</div>
                  <div class="question-answer">
                      <div class="row targetWrap">

                        <select name="bigCity" id="bigCity" class="selectField"
                           onchange="cityList();" style="width: 45%;">
                           <option value="">:: 대분류 ::</option>
                           <c:forEach var="vo" items="${listBigCity}">
                              <option value="${vo.cityNum}"
                                 ${vo.cityNum==dto.bigCity ? "selected='selected'" : ""}>${vo.subject}</option>
                           </c:forEach>
                        </select> <select name="smallCity" id="smallCity"
                           class="selectField" style="width: 45%;">
                           <option value="">:: 중분류 ::</option>
                        </select>
                        <div id="select_city"></div>

                     </div> 
                  </div>
               </div>


         
               
            </div>
         </div>
         
         <!-- ------------------------------------3페이지 ------------------------------------------- -->

         <div class="swiper-slide">
            
            <div class="section-area">
               <div class="section-title">스터디 공개범위 설정</div>
               <div class="section-verticalLine"></div>


               <div class="section-question" >
                  <div class="question-title">스터디 공개범위를 선택해 주세요</div>
                  <div class="question-answer">

                     <div class="row">
                        <div class="col-sm-6 col-md-4">
                           <div class="thumbnail">
                              <label> <input type="radio" name="fb" value="small" />
                                 <img src="..." alt="..."> 
                              </label>
                              <div class="caption">
                                 <h4>전체공개</h4>
                                 <p>누구나 스터디를 검색해 찾을 수 있고,홈페이지 회원 모두 게시물을 볼 수 있습니다.</p>
                              </div>
                           </div>

                        </div>

                        <div class="col-sm-6 col-md-4">
                           <div class="thumbnail">
                              <label> <input type="radio" name="fb" value="small" />

                                 <img src="..." alt="...">
                              </label>
                              <div class="caption">
                                 <h4>스터디명 공개</h4>
                                 <p>누구나 스터디를 검색해 찾을 수 있지만, 게시물은 멤버만 볼 수 있습니다.</p>
                              </div>
                           </div>
                        </div>

                        <div class="col-sm-6 col-md-4">
                           <div class="thumbnail">
                              <label> <input type="radio" name="fb" value="small" />

                                 <img src="..." alt="...">
                              </label>
                              <div class="caption">
                                 <h4>비공개</h4>
                                 <p>스터디와 게시글이 공개되지 않습니다. 초대를 통해서만 가입할 수 있습니다.</p>
                              </div>
                           </div>
                        </div>
                        
                     </div>
                  </div>
               </div>
            
            
               <div class="section-question" >
                  <input type="button" id="uploadBtn2" class="uploadBtn tts">
                  <label for="uploadBtn2" class="btn btn-large uploadLabel">스터디
                     만들기</label>
                  <input type="button" id="uploadBtn2" class="uploadBtn tts">
                  <label for="uploadBtn2" class="btn btn-large uploadLabel">취소</label>
               </div>
            
            </div>
         </div>

      </div>
      <!-- Add Pagination -->
      <div class="swiper-pagination"></div>
      <!-- Add Arrows -->
      <div class="swiper-button-next"></div>
      <div class="swiper-button-prev"></div>

   </form>

   

   <!-- Initialize Swiper -->
   <script>
      var swiper = new Swiper('.swiper-container', {
         pagination : '.swiper-pagination',
         paginationClickable : true,
         nextButton : '.swiper-button-next',
         prevButton : '.swiper-button-prev',
         spaceBetween : 30
      });
   </script>

   <script>
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

      $(function() {

            var cnt=0;
         $("#smallCategory").change(function() { //카테고리 선택하면 박스추가   
            
            cnt++;
         
            if(cnt>3){
               $("#smallCategory").attr("disabled","disabled");
               alert("3개이하만 선택 가능합니다.");
               
            }
            
            
            var index1 = $("#bigCategory option:selected").text();
            var index2 = $("#smallCategory option:selected").text();
            var s = index1 + "-" + index2;
            $("#select_category").append("<div id='what' style='margin :8px;'>" + s + "</div>");

            
            
         });
         
         

         $('input[type=checkbox]').click(function() { //스터디대상3이하로 막기
            var count = $('input:checkbox[name="target"]:checked').length;
            if (count > 2) {
               alert("2개이하만 선택가능합니다.");
               $(this).attr("checked", false);
            }

         });

      });
   </script>






</body>
</html>