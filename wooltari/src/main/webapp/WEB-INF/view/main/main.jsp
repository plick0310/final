<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>Wooltari</title>
<link rel="shortcut icon" href="<%=cp%>/resource/favicon.ico">
<link rel="stylesheet" href="<%=cp%>/resource/css/bootstrap.css">
<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
<link rel="stylesheet" type="text/css" href="<%=cp%>/resource/css/header.css">
<link rel="stylesheet" type="text/css" href="<%=cp%>/resource/fonts/font-awesome/css/font-awesome.css">
<link rel="stylesheet" type="text/css" href="<%=cp%>/resource/css/style.css">
<link rel="stylesheet" type="text/css" href="<%=cp%>/resource/css/prettyPhoto.css">
<link href='http://fonts.googleapis.com/css?family=Lato:400,700,900,300' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800,600,300' rel='stylesheet' type='text/css'>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<style>
.img-responsive{
height: 100%;
width:  100%;
}
</style>
</head>
<body>
<div class="header">
<jsp:include page="../layout/header.jsp"/>
</div>

   <div class="header"></div>

   <!-- Header -->
   <header class="text-center" name="home">
      <div class="intro-text">
         <h1>
            Welcome to <strong>WOOLTARI</strong>
         </h1>
         <p>We are Successful Study System</p>
         <a href="#services-section" class="btn btn-info btn-lg page-scroll"
            style="background: none; border: 3px solid white;">LEARN MORE</a>
      </div>
   </header>

   <!-- Services Section -->
   <div id="services-section" class="text-center">
      <div class="container">
         <div class="section-title center">
            <h2>울타리 서비스</h2>
            <hr>
            <div class="clearfix"></div>
            <p>울타리는 당신이 원하는 모든 스터디를 만들고, 찾고, 참여할 수 있습니다. 지금 당장 나만의 울타리를 세워보세요.</p>
         </div>
         <div class="space"></div>
         <div class="row">
            <div class="col-md-3 col-sm-6 service" onclick="javascript:location.href='<%=cp %>/study/mylist';"
               style="cursor: pointer;">
               <i class="fa fa-desktop"></i>
               <h4>나의 스터디</h4>
               <p>나와 관련된 모든 스터디를 확인해 보세요. 당신에게 꼭 필요한 경험들을 제공해 <br>줄 것입니다.</p>
            </div>
            <div class="col-md-3 col-sm-6 service" onclick="javascript:location.href='<%=cp %>/study/created';"
            style="cursor: pointer;" >
               <i class="fa fa-gears"></i>
               <h4>스터디 만들기</h4>
               <p>당신이 원하는 분야의 스터디를 생성하고, 직접 리더가 되어보세요.그리고 <br>관리하세요.</p>
            </div>
            <div class="col-md-3 col-sm-6 service"  style="cursor: pointer;" onclick="javascript:location.href='<%=cp %>/studyMarket/studyMarketBoard/list';">
               <i class="fa fa-rocket"></i>
               <h4>스터디 마켓</h4>
               <p>필요한 강의를 찾고 구독해보세요. 포인트를 이용하시면 정기구독이 <br>가능합니다.</p>
            </div>
            <div class="col-md-3 col-sm-6 service" style="cursor: pointer;" onclick="javascript:location.href='<%=cp %>/study/search';" >
               <i class="fa fa-line-chart"></i>
               <h4>스터디찾기</h4>
               <p>당신에게 필요한 맞춤 스터디를 찾아보세요.스터디에 가입하시면 울타리 <br>서비스가 시작됩니다.</p>
            </div>
         </div>
      </div>
   </div>
   <!-- Portfolio Section -->
   <div id="works-section">
      <div class="container">
         <!-- Container -->
         <div class="section-title text-center center">
            <h2>카테고리</h2>
            <hr>
            <div class="clearfix"></div>
            <p>울타리의 스터디는 100여개의 카테고리로 분류됩니다. 원하는 카테고리를 찾아 시작해보세요.	</p>
         </div>
         <div class="categories">
            <ul class="cat">
               <li>
                  <ol class="type">
                
                     <li><a href="#" data-filter=".life" >라이프스타일</a></li>
                     <li><a href="#" data-filter=".music">음악/공연</a></li>
                     <li><a href="#" data-filter=".beauty">뷰티/미용</a></li>
                     <li><a href="#" data-filter=".app">컴퓨터</a></li>
                     <li><a href="#" data-filter=".branding">디자인/미술</a></li>
                     <li><a href="#" data-filter=".web">국가고시/공무원</a></li><br>
                 
                     
                  </ol>
               </li>
            </ul>
            <div class="clearfix"></div>
         </div>
         
         <div class="row">
            <div class="portfolio-items">
               <div class="col-sm-6 col-md-3 col-lg-3 life">
                  <div class="portfolio-item">
                     <div class="hover-bg">
                        <a href="<%=cp %>/study/search?bigCategory=1&smallCategory=12">
                           <div class="hover-text">
                              <h4>육아</h4>
                              <small>Parenting</small>
                              <div class="clearfix"></div>
                           </div> <img src="<%=cp%>/resource/category/parenting.jpg" class="img-responsive"
                           alt="Project Title">
                        </a>
                     </div>
                  </div>
               </div>
             <div class="col-sm-6 col-md-3 col-lg-3 life">
                  <div class="portfolio-item">
                     <div class="hover-bg">
                        <a href="<%=cp %>/study/search?bigCategory=1&smallCategory=13">
                           <div class="hover-text">
                              <h4>반려동물</h4>
                              <small>Pet</small>
                              <div class="clearfix"></div>
                           </div> <img src="<%=cp%>/resource/category/pet.jpg" class="img-responsive"
                           alt="Project Title">
                        </a>
                     </div>
                  </div>
               </div>
                  <div class="col-sm-6 col-md-3 col-lg-3 life">
                  <div class="portfolio-item">
                     <div class="hover-bg">
                      <a href="<%=cp %>/study/search?bigCategory=1&smallCategory=14">
                           <div class="hover-text">
                              <h4>금융/재태크</h4>
                              <small>Finance / Investment</small>
                              <div class="clearfix"></div>
                           </div> <img src="<%=cp%>/resource/category/Finance.jpg" class="img-responsive"
                           alt="Project Title">
                        </a>
                     </div>
                  </div>
               </div>
                 <div class="col-sm-6 col-md-3 col-lg-3 life">
                  <div class="portfolio-item">
                     <div class="hover-bg">
                        <a href="<%=cp %>/study/search?bigCategory=1&smallCategory=22">
                           <div class="hover-text">
                              <h4>요리/베이킹</h4>
                              <small>Cooking / Baking</small>
                              <div class="clearfix"></div>
                           </div> <img src="<%=cp%>/resource/category/cooking.jpg" class="img-responsive"
                           alt="Project Title">
                        </a>
                     </div>
                  </div>
               </div>  
                   <div class="col-sm-6 col-md-3 col-lg-3 life">
                  <div class="portfolio-item">
                     <div class="hover-bg">
                         <a href="<%=cp %>/study/search?bigCategory=1&smallCategory=19">
                           <div class="hover-text">
                              <h4>사진/영상</h4>
                              <small>Photo / Video</small>
                              <div class="clearfix"></div>
                           </div> <img src="<%=cp%>/resource/category/photo.jpg" class="img-responsive"
                           alt="Project Title">
                        </a>
                     </div>
                  </div>
               </div>  
                 <div class="col-sm-6 col-md-3 col-lg-3 life">
                  <div class="portfolio-item">
                     <div class="hover-bg">
                        <a href="<%=cp %>/study/search?bigCategory=1&smallCategory=24">
                           <div class="hover-text">
                              <h4>바리스타/바텐더</h4>
                              <small>Barista / barman</small>
                              <div class="clearfix"></div>
                           </div> <img src="<%=cp%>/resource/category/barista.jpg" class="img-responsive"
                           alt="Project Title">
                        </a>
                     </div>
                  </div>
               </div>  
                   <div class="col-sm-6 col-md-3 col-lg-3 life">
                  <div class="portfolio-item">
                     <div class="hover-bg">
                         <a href="<%=cp %>/study/search?bigCategory=1&smallCategory=25">
                           <div class="hover-text">
                              <h4>봉사활동</h4>
                              <small>Volunteer</small>
                              <div class="clearfix"></div>
                           </div> <img src="<%=cp%>/resource/category/volunteer.jpg"class="img-responsive"
                           alt="Project Title">
                        </a>
                     </div>
                  </div>
               </div>  
                      <div class="col-sm-6 col-md-3 col-lg-3 life">
                  <div class="portfolio-item">
                     <div class="hover-bg">
                         <a href="<%=cp %>/study/search?bigCategory=1&smallCategory=23">
                           <div class="hover-text">
                              <h4>인테리어</h4>
                              <small>Interior</small>
                              <div class="clearfix"></div>
                           </div> <img src="<%=cp%>/resource/category/interior.jpg" class="img-responsive"
                           alt="Project Title">
                        </a>
                     </div>
                  </div>
               </div>
               
               
               <div class="col-sm-6 col-md-3 col-lg-3 music">
                  <div class="portfolio-item">
                     <div class="hover-bg">
                       <a href="<%=cp %>/study/search?bigCategory=1&smallCategory=12">
                           <div class="hover-text">
                              <h4>기타/우크렐라</h4>
                              <small>Guitar / Ukulele</small>
                              <div class="clearfix"></div>
                           </div> <img src="<%=cp%>/resource/category/guitar.jpg"class="img-responsive"
                           alt="Project Title">
                        </a>
                     </div>
                  </div>
               </div>
               <div class="col-sm-6 col-md-3 col-lg-3 music">
                  <div class="portfolio-item">
                     <div class="hover-bg">
                        <a href="<%=cp %>/study/search?bigCategory=1&smallCategory=12">
                           <div class="hover-text">
                              <h4>피아노/키보드</h4>
                              <small>Piano / Keyboard</small>
                              <div class="clearfix"></div>
                           </div> <img src="<%=cp%>/resource/category/piano.jpg" class="img-responsive"
                           alt="Project Title">
                        </a>
                     </div>
                  </div>
               </div>
               <div class="col-sm-6 col-md-3 col-lg-3 music">
                  <div class="portfolio-item">
                     <div class="hover-bg">
                         <a href="<%=cp %>/study/search?bigCategory=1&smallCategory=12">
                           <div class="hover-text">
                              <h4>보컬/음악이론</h4>
                              <small>Vocal / Music Theory</small>
                              <div class="clearfix"></div>
                           </div> <img src="<%=cp%>/resource/category/vocal.jpg"class="img-responsive"
                           alt="Project Title">
                        </a>
                     </div>
                  </div>
               </div>
               <div class="col-sm-6 col-md-3 col-lg-3 music">
                  <div class="portfolio-item">
                     <div class="hover-bg">
                         <a href="<%=cp %>/study/search?bigCategory=1&smallCategory=12">
                           <div class="hover-text">
                              <h4>작사/작곡</h4>
                              <small>Lyrics / Composition</small>
                              <div class="clearfix"></div>
                           </div> <img src="<%=cp%>/resource/category/jakgok.jpg"class="img-responsive"
                           alt="Project Title">
                        </a>
                     </div>
                  </div>
               </div>
               <div class="col-sm-6 col-md-3 col-lg-3 music">
                  <div class="portfolio-item">
                     <div class="hover-bg">
                         <a href="<%=cp %>/study/search?bigCategory=1&smallCategory=12">
                           <div class="hover-text">
                              <h4>밴드</h4>
                              <small>Band</small>
                              <div class="clearfix"></div>
                           </div> <img src="<%=cp%>/resource/category/band.jpg"class="img-responsive"
                           alt="Project Title">
                        </a>
                     </div>
                  </div>
               </div>
               <div class="col-sm-6 col-md-3 col-lg-3 music">
                  <div class="portfolio-item">
                     <div class="hover-bg">
                         <a href="<%=cp %>/study/search?bigCategory=1&smallCategory=12">
                           <div class="hover-text">
                              <h4>뮤지컬</h4>
                              <small>Musical</small>
                              <div class="clearfix"></div>
                           </div> <img src="<%=cp%>/resource/category/musical.jpg" class="img-responsive"
                           alt="Project Title">
                        </a>
                     </div>
                  </div>
               </div>
               
                    <div class="col-sm-6 col-md-3 col-lg-3 music">
                  <div class="portfolio-item">
                     <div class="hover-bg">
                        <a href="<%=cp %>/study/search?bigCategory=1&smallCategory=12">
                           <div class="hover-text">
                              <h4>마술</h4>
                              <small>Magic</small>
                              <div class="clearfix"></div>
                           </div> <img src="<%=cp%>/resource/category/magic.jpg" class="img-responsive"
                           alt="Project Title">
                        </a>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
   
   <!-- Achievements Section -->
   <div id="achievements" class="section dark-bg" style="background: #eee;">
      <div class="container">
         <div class="row">
            <div class="col-md-3 col-sm-3">
               <div class="achievement-box">
                  <span class="count">${dto.count_study}</span>
                  <h4>모든스터디</h4>
               </div>
            </div>
            <div class="col-md-3 col-sm-3">
               <div class="achievement-box">
                  <span class="count">67</span>
                  <h4>오늘 접속자</h4>
               </div>
            </div>
            <div class="col-md-3 col-sm-3">
               <div class="achievement-box">
                  <span class="count">${dto.count_member}</span>
                  <h4>모든 회원</h4>
               </div>
            </div>
            <div class="col-md-3 col-sm-3">
               <div class="achievement-box">
                  <span class="count">${dto.count_category}</span>
                  <h4>모든 카테고리</h4>
               </div>
            </div>
         </div>
      </div>
   </div>
   
  
   <div id="social-section" style="    padding: 15px 0; 
    height: 60px;">
      <div class="container">
         <div class="social">
            <ul>
               <li><a href="#"><i class="fa fa-facebook"></i></a></li>
               <li><a href="#"><i class="fa fa-twitter"></i></a></li>
               <li><a href="#"><i class="fa fa-dribbble"></i></a></li>
               <li><a href="#"><i class="fa fa-github"></i></a></li>
               <li><a href="#"><i class="fa fa-instagram"></i></a></li>
               <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
            </ul>
         </div>
      </div>
   </div>
   <div id="footer">
      <div class="container">
         <div class="fnav">
            <p>
               Copyright &copy; Wooltari 
            </p>
         </div>
      </div>
   </div>
   
<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery.ui.datepicker-ko.js"></script>
<script type="text/javascript" src="<%=cp%>/resource/js/jquery.counterup.js"></script> 
<script type="text/javascript" src="<%=cp%>/resource/js/jquery.prettyPhoto.js"></script> 
<script type="text/javascript" src="<%=cp%>/resource/js/bootstrap.js"></script> 
<script type="text/javascript" src="<%=cp%>/resource/js/util.js"></script>
<script type="text/javascript" src="<%=cp%>/resource/js/SmoothScroll.js"></script> 
<script type="text/javascript" src="<%=cp%>/resource/js/waypoints.js"></script> 
<script type="text/javascript" src="<%=cp%>/resource/js/jquery.isotope.js"></script> 
<script type="text/javascript" src="<%=cp%>/resource/js/jqBootstrapValidation.js"></script> 
<script type="text/javascript" src="<%=cp%>/resource/js/contact_me.js"></script> 
<script type="text/javascript" src="<%=cp%>/resource/js/main.js"></script>
<script type="text/javascript" src="<%=cp%>/resource/js/modernizr.custom.js"></script>

</body>
</html>