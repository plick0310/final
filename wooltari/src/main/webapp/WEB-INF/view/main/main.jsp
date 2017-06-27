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

<link rel="stylesheet" href="<%=cp%>/resource/css/bootstrap.css">
<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
<link rel="stylesheet" type="text/css" href="<%=cp%>/resource/css/header.css">
<link rel="stylesheet" type="text/css" href="<%=cp%>/resource/fonts/font-awesome/css/font-awesome.css">
<link rel="stylesheet" type="text/css" href="<%=cp%>/resource/css/style.css">
<link rel="stylesheet" type="text/css" href="<%=cp%>/resource/css/prettyPhoto.css">
<link href='http://fonts.googleapis.com/css?family=Lato:400,700,900,300' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800,600,300' rel='stylesheet' type='text/css'>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
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
            <h2>Our Services</h2>
            <hr>
            <div class="clearfix"></div>
            <p>Lorem ipsum dolor sit amet placerat facilisis felis mi in
               tempus. Eleifend pellentesque natoque faucibus magna ut etiam.</p>
         </div>
         <div class="space"></div>
         <div class="row">
            <div class="col-md-3 col-sm-6 service" onclick="javascript:location.href='<%=cp %>/study/mylist';"
               style="cursor: pointer;">
               <i class="fa fa-desktop"></i>
               <h4>나의 스터디</h4>
               <p>Lorem ipsum dolor sit amet placerat facilisis felis mi in
                  tempus eleifend pellentesque natoque etiam.</p>
            </div>
            <div class="col-md-3 col-sm-6 service" onclick="javascript:location.href='<%=cp %>/study/created';"
            style="cursor: pointer;" >
               <i class="fa fa-gears"></i>
               <h4>스터디 만들기</h4>
               <p>Lorem ipsum dolor sit amet placerat facilisis felis mi in
                  tempus eleifend pellentesque.</p>
            </div>
            <div class="col-md-3 col-sm-6 service">
               <i class="fa fa-rocket"></i>
               <h4>번개스터디</h4>
               <p>Lorem ipsum dolor sit amet placerat facilisis felis mi in
                  tempus eleifend pellentesque natoque etiam.</p>
            </div>
            <div class="col-md-3 col-sm-6 service">
               <i class="fa fa-line-chart"></i>
               <h4>스터디찾기</h4>
               <p>Lorem ipsum dolor sit amet placerat facilisis felis mi in
                  tempus eleifend pellentesque natoque.</p>
            </div>
         </div>
      </div>
   </div>
   <!-- Portfolio Section -->
   <div id="works-section">
      <div class="container">
         <!-- Container -->
         <div class="section-title text-center center">
            <h2>Category</h2>
            <hr>
            <div class="clearfix"></div>
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis
               sed dapibus leo nec ornare diamcommodo nibh ante facilisis.</p>
         </div>
         <div class="categories">
            <ul class="cat">
               <li>
                  <ol class="type">
                     <li><a href="#" data-filter="*" class="active">All</a></li>
                     <li><a href="#" data-filter=".web">Web Design</a></li>
                     <li><a href="#" data-filter=".app">App Development</a></li>
                     <li><a href="#" data-filter=".branding">Branding</a></li>
                  </ol>
               </li>
            </ul>
            <div class="clearfix"></div>
         </div>
         <div class="row">
            <div class="portfolio-items">
               <div class="col-sm-6 col-md-3 col-lg-3 web">
                  <div class="portfolio-item">
                     <div class="hover-bg">
                        <a href="img/portfolio/01.jpg" rel="prettyPhoto">
                           <div class="hover-text">
                              <h4>Project Title</h4>
                              <small>Web Design</small>
                              <div class="clearfix"></div>
                           </div> <img src="img/portfolio/01.jpg" class="img-responsive"
                           alt="Project Title">
                        </a>
                     </div>
                  </div>
               </div>
               <div class="col-sm-6 col-md-3 col-lg-3 app">
                  <div class="portfolio-item">
                     <div class="hover-bg">
                        <a href="img/portfolio/02.jpg" rel="prettyPhoto">
                           <div class="hover-text">
                              <h4>Project Title</h4>
                              <small>App Development</small>
                              <div class="clearfix"></div>
                           </div> <img src="img/portfolio/02.jpg" class="img-responsive"
                           alt="Project Title">
                        </a>
                     </div>
                  </div>
               </div>
               <div class="col-sm-6 col-md-3 col-lg-3 web">
                  <div class="portfolio-item">
                     <div class="hover-bg">
                        <a href="img/portfolio/03.jpg" rel="prettyPhoto">
                           <div class="hover-text">
                              <h4>Project Title</h4>
                              <small>Web Design</small>
                              <div class="clearfix"></div>
                           </div> <img src="img/portfolio/03.jpg" class="img-responsive"
                           alt="Project Title">
                        </a>
                     </div>
                  </div>
               </div>
               <div class="col-sm-6 col-md-3 col-lg-3 web">
                  <div class="portfolio-item">
                     <div class="hover-bg">
                        <a href="img/portfolio/04.jpg" rel="prettyPhoto">
                           <div class="hover-text">
                              <h4>Project Title</h4>
                              <small>Web Design</small>
                              <div class="clearfix"></div>
                           </div> <img src="img/portfolio/04.jpg" class="img-responsive"
                           alt="Project Title">
                        </a>
                     </div>
                  </div>
               </div>
               <div class="col-sm-6 col-md-3 col-lg-3 app">
                  <div class="portfolio-item">
                     <div class="hover-bg">
                        <a href="img/portfolio/05.jpg" rel="prettyPhoto">
                           <div class="hover-text">
                              <h4>Project Title</h4>
                              <small>App Development</small>
                              <div class="clearfix"></div>
                           </div> <img src="img/portfolio/05.jpg" class="img-responsive"
                           alt="Project Title">
                        </a>
                     </div>
                  </div>
               </div>
               <div class="col-sm-6 col-md-3 col-lg-3 branding">
                  <div class="portfolio-item">
                     <div class="hover-bg">
                        <a href="img/portfolio/06.jpg" rel="prettyPhoto">
                           <div class="hover-text">
                              <h4>Project Title</h4>
                              <small>Branding</small>
                              <div class="clearfix"></div>
                           </div> <img src="img/portfolio/06.jpg" class="img-responsive"
                           alt="Project Title">
                        </a>
                     </div>
                  </div>
               </div>
               <div class="col-sm-6 col-md-3 col-lg-3 branding app">
                  <div class="portfolio-item">
                     <div class="hover-bg">
                        <a href="img/portfolio/07.jpg" rel="prettyPhoto">
                           <div class="hover-text">
                              <h4>Project Title</h4>
                              <small>App Development, Branding</small>
                              <div class="clearfix"></div>
                           </div> <img src="img/portfolio/07.jpg" class="img-responsive"
                           alt="Project Title">
                        </a>
                     </div>
                  </div>
               </div>
               <div class="col-sm-6 col-md-3 col-lg-3 web">
                  <div class="portfolio-item">
                     <div class="hover-bg">
                        <a href="img/portfolio/08.jpg" rel="prettyPhoto">
                           <div class="hover-text">
                              <h4>Project Title</h4>
                              <small>Web Design</small>
                              <div class="clearfix"></div>
                           </div> <img src="img/portfolio/08.jpg" class="img-responsive"
                           alt="Project Title">
                        </a>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
   <!-- About Section -->
   <div id="about-section">
      <div class="container">
         <div class="section-title text-center center">
            <h2>About Us</h2>
            <hr>
            <div class="clearfix"></div>
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis
               sed dapibus leo nec ornare diamcommodo nibh ante facilisis.</p>
         </div>
         <div class="row">
            <div class="col-md-6">
               <img src="img/about.jpg" class="img-responsive">
            </div>
            <div class="col-md-6">
               <div class="about-text">
                  <h4>Who We Are</h4>
                  <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                     Duis sed dapibus leo nec ornare diam. Sed commodo nibh ante
                     facilisis bibendum dolor feugiat at. Duis sed dapibus leo nec
                     ornare diam commodo nibh ante facilisis bibendum.</p>
                  <h4>What We Do</h4>
                  <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                     Duis sed dapibus leo nec ornare diam. Sed commodo nibh ante
                     facilisis bibendum dolor feugiat at. Duis sed dapibus leo nec
                     ornare diam commodo nibh ante facilisis bibendum.</p>
                  <h4>Why Choose Us</h4>
                  <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                     Duis sed dapibus leo nec ornare diam. Sed commodo nibh ante
                     facilisis bibendum dolor feugiat at.</p>
               </div>
            </div>
         </div>
      </div>
   </div>
   <!-- Achievements Section -->
   <div id="achievements" class="section dark-bg">
      <div class="container">
         <div class="row">
            <div class="col-md-3 col-sm-3">
               <div class="achievement-box">
                  <span class="count">210</span>
                  <h4>모든스터디</h4>
               </div>
            </div>
            <div class="col-md-3 col-sm-3">
               <div class="achievement-box">
                  <span class="count">9,500</span>
                  <h4>모든회원</h4>
               </div>
            </div>
            <div class="col-md-3 col-sm-3">
               <div class="achievement-box">
                  <span class="count">590</span>
                  <h4>Projects completed</h4>
               </div>
            </div>
            <div class="col-md-3 col-sm-3">
               <div class="achievement-box">
                  <span class="count">14</span>
                  <h4>Awards won</h4>
               </div>
            </div>
         </div>
      </div>
   </div>
   <!-- Team Section -->
   <div id="team-section" class="text-center">
      <div class="container">
         <div class="section-title center">
            <h2>Meet the Team</h2>
            <hr>
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis
               sed dapibus leo nec ornare diamcommodo nibh ante facilisis.</p>
         </div>
         <div id="row">
            <div class="col-md-3 col-sm-6 team">
               <div class="thumbnail">
                  <img src="img/team/01.jpg" alt="..." class="img-circle team-img">
                  <div class="caption">
                     <h3>John Doe</h3>
                     <p>Founder / CEO</p>
                     <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                  </div>
               </div>
            </div>
            <div class="col-md-3 col-sm-6 team">
               <div class="thumbnail">
                  <img src="img/team/02.jpg" alt="..." class="img-circle team-img">
                  <div class="caption">
                     <h3>Mike Doe</h3>
                     <p>Web Designer</p>
                     <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                  </div>
               </div>
            </div>
            <div class="col-md-3 col-sm-6 team">
               <div class="thumbnail">
                  <img src="img/team/03.jpg" alt="..." class="img-circle team-img">
                  <div class="caption">
                     <h3>Jane Doe</h3>
                     <p>Creative Director</p>
                     <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                  </div>
               </div>
            </div>
            <div class="col-md-3 col-sm-6 team">
               <div class="thumbnail">
                  <img src="img/team/04.jpg" alt="..." class="img-circle team-img">
                  <div class="caption">
                     <h3>Larry Show</h3>
                     <p>Project Manager</p>
                     <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
   <!-- Contact Section -->
   <div id="contact-section" class="text-center">
      <div class="container">
         <div class="section-title center">
            <h2>Contact Us</h2>
            <hr>
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis
               sed dapibus leo nec ornare diamcommodo nibh ante facilisis.</p>
         </div>
         <div class="col-md-8 col-md-offset-2">
            <div class="col-md-4">
               <i class="fa fa-map-marker"></i>
               <p>
                  4321 California St,<br> San Francisco, CA 12345
               </p>
            </div>
            <div class="col-md-4">
               <i class="fa fa-envelope-o"></i>
               <p>info@company.com</p>
            </div>
            <div class="col-md-4">
               <i class="fa fa-phone"></i>
               <p>+1 123 456 1234</p>
            </div>
            <hr>
            <div class="clearfix"></div>
         </div>
         <div class="col-md-8 col-md-offset-2">
            <h3>Leave us a message</h3>
            <form name="sentMessage" id="contactForm" novalidate>
               <div class="row">
                  <div class="col-md-6">
                     <div class="form-group">
                        <input type="text" id="name" class="form-control"
                           placeholder="Name" required="required">
                        <p class="help-block text-danger"></p>
                     </div>
                  </div>
                  <div class="col-md-6">
                     <div class="form-group">
                        <input type="email" id="email" class="form-control"
                           placeholder="Email" required="required">
                        <p class="help-block text-danger"></p>
                     </div>
                  </div>
               </div>
               <div class="form-group">
                  <textarea name="message" id="message" class="form-control"
                     rows="4" placeholder="Message" required></textarea>
                  <p class="help-block text-danger"></p>
               </div>
               <div id="success"></div>
               <button type="submit" class="btn btn-default">Send Message</button>
            </form>
         </div>
      </div>
   </div>

   <div id="social-section">
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
               Copyright &copy; Helios. Designed by <a
                  href="http://www.templatewire.com" rel="nofollow">TemplateWire</a>
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