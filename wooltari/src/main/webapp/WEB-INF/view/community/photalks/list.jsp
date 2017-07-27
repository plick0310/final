<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>

<link rel="image_src" href="/images/immersive_slider_image.png" />

	<meta content="http://www.thepetedesign.com/demos/immersive_slider_demo.html" property="og:url" />
	<meta content="http://www.thepetedesign.com/images/immersive_slider_image.png" property="og:image" />
	<link rel="shortcut icon" id="favicon" href="favicon.png"> 
	<meta name="author" content="Pete R.">
	<link rel="canonical" href="http://www.thepetedesign.com/demos/immersive_slider_demo.html" />
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:300,400,700' rel='stylesheet' type='text/css'>
  	<script type="text/javascript" src="<%=cp%>/resource/js/jquery.immersive-slider.js"></script>
  	<link href="<%=cp%>/resource/css/immersive-slider.css" rel='stylesheet' type='text/css'>
  
 <style> 
    html {
      height: 100%;
    }
    body {

      padding: 0;
      text-align: center;
      font-family: 'open sans';
      position: relative;
      margin: 0;
      height: 100%;
    }
    
    .wrapper {
    	height: auto !important;
    	height: 100%;
    	margin: 0 auto; 
    	overflow: hidden;
    }
    
    a {
      text-decoration: none;
    }
    
    
    h1, h2 {
      width: 100%;
      float: left;
    }
    h1 {
      margin-top: 25px;
      color: #000;
      margin-bottom: 5px;
      font-size: 50px;
      letter-spacing: -4px;
    }
    h2 {
      color: #444;
      font-weight: 100;
      margin-top: 0;
      margin-bottom: 10px;
    }
    
    .pointer {
      color: #9b59b6;
      font-family: 'Pacifico', cursive;
      font-size: 30px;
      margin-top: 15px;
    }
    pre {
      margin: 80px auto;
    }
    pre code {
      padding: 35px;
      border-radius: 5px;
      font-size: 15px;
      background: rgba(0,0,0,0.1);
      border: rgba(0,0,0,0.05) 5px solid;
      max-width: 500px;
    }


    .main {
      float: left;
      width: 100%;
      margin: 0 auto;
      background: #161923;
    }
    
    .main h1 {
      padding:20px 50px;
      float: left;
      width: 100%;
      font-size: 90px;
      box-sizing: border-box;
      -webkit-box-sizing: border-box;
      -moz-box-sizing: border-box;
      font-weight: 100;
      color: black;
      margin: 0;
      margin-top: 70px;
      font-family: 'Playfair Display';
      letter-spacing: -1px;
    }
   
    .main h1.demo1 {
      background: #1ABC9C;
    }
    
    .reload.bell {
      font-size: 12px;
      padding: 20px;
      width: 45px;
      text-align: center;
      height: 47px;
      border-radius: 50px;
      -webkit-border-radius: 50px;
      -moz-border-radius: 50px;
    }
    
    .reload.bell #notification {
      font-size: 25px;
      line-height: 140%;
    }
    
    .reload, .btn{
      display: inline-block;
      border: 4px solid #A2261E;
      border-radius: 5px;
      -moz-border-radius: 5px;
      -webkit-border-radius: 5px;
      background: #CC3126;
      display: inline-block;
      line-height: 100%;
      padding: 0.7em;
      text-decoration: none;
      color: #fff;
      width: 100px;
      line-height: 140%;
      font-size: 17px;
      font-family: open sans;
      font-weight: bold;
    }
    .reload:hover{
      background: #A2261E;
    }
    .btn {
      width: 200px;
      color: #fff;
      border: none;
      margin-left: 10px;
      background: black;
    }
    .clear {
      width: auto;
    }
    .btn:hover, .btn:hover {
      background: rgba(0,0,0,0.8);
    }
    .btns {
      width: 410px;
      margin: 50px auto;
    }
    .credit {
      text-align: center;
      color: #444;
      padding: 10px;
      margin: 0 0 0 0;
      background: #161923;
      color: #FFF;
      float: left;
      width: 100%;
    }
    .credit a {
      color: #fff;
      text-decoration: none;
      font-weight: bold;
    }
    
    .back {
      position: absolute;
      top: 0;
      left: 0;
      text-align: center;
      display: block;
      padding: 7px;
      width: 100%;
      box-sizing: border-box;
      -moz-box-sizing: border-box;
      -webkit-box-sizing: border-box;
      background: rgba(255, 255, 255, 0.25);
      font-weight: bold;
      font-size: 13px;
      color: #000;
      -webkit-transition: all 200ms ease-out;
      -moz-transition: all 200ms ease-out;
      -o-transition: all 200ms ease-out;
      transition: all 200ms ease-out;
    }
    .back:hover {
      color: black;
      background: rgba(255, 255, 255, 0.5);
    }
    
    
    .page_container {
      max-width: 960px;
      margin: 50px auto;
    }

    .header {
      background: white;
      padding-top: 10px;
      margin-bottom: 0;
    }
    .header h1{
      margin-bottom: 0;
      font-size: 45px;
    }

    .header .menu {
      padding-bottom: 10px;
    }

    .benefits {
      color: black;
      height: 100px;
      background: #FFF;
      position: relative;
      width: 100%;
      padding: 25px;
      font-size: 40px;
      font-weight: 100;
      float: left;
      box-sizing: border-box;
      -moz-box-sizing: border-box;
      -webkit-box-sizing: border-box;
    }

    .benefits .page_container{
      margin-bottom: 50px;
      margin-top: 0;
    }
  
    .immersive_slider .is-slide .content h2{
      line-height: 140%;
      font-weight: 100;
      color: #383635;
      font-weight: 100;
    }
    .immersive_slider .is-slide .content a {
      color: #383635; 
    }
  
  .immersive_slider .is-slide .content p{
    float: left;
    font-weight: 100;
    width: 100%;
    font-size: 17px;
    margin-top: 5px;
    color: #383635;
  }
  .pho{ 
  height: 380px;
    background: black;

        padding: 0;
        border: 1px solid white;
  }
  .hvr-grow-shadow {
  display: inline-block;
  vertical-align: middle;
  -webkit-transform: perspective(1px) translateZ(0);
  transform: perspective(1px) translateZ(0);
  box-shadow: 0 0 1px transparent;
  -webkit-transition-duration: 0.3s;
  transition-duration: 0.3s;
  -webkit-transition-property: box-shadow, transform;
  transition-property: box-shadow, transform;
}
.hvr-grow-shadow:hover, .hvr-grow-shadow:focus, .hvr-grow-shadow:active {
  box-shadow: 0 10px 10px -10px rgba(0, 0, 0, 0.5);
  -webkit-transform: scale(1.1);
  transform: scale(1.05);
}
p,
[class^="hvr-"] {
    font-family: 'Roboto', sans-serif;
}

[class^="hvr-"] {
margin: 5px 3px;		
  width:350px;
  height:350px;
  padding: 1em;
  cursor: pointer;
  background: #e1e1e1;
  text-decoration: none;
  color: #666;
  
  /* Prevent highlight colour when element is tapped */
  -webkit-tap-highlight-color: rgba(0,0,0,0);

  /* Smooth fonts */
  -webkit-font-smoothing: antialiased;
	-moz-osx-font-smoothing: grayscale;
}
.cbp-rfgrid {
    margin: auto;
    padding: 0;
    list-style: none;
    position: relative;
    width: 100%;
}
.cbp-rfgrid li {
    position: relative;
    float: left;
    overflow: hidden;
    width: 25%;
    width: -webkit-calc(100% / 4);
    width: calc(100% / 4);
    -webkit-transition: 0.4s all linear;
    transition: 0.4s all linear;
}
    .fadeInLeft {
    -webkit-animation-name: fadeInLeft;
    animation-name: fadeInLeft;
}
.cbp-rfgrid li a .project-info {
    position: absolute;
    left: 10px;
    top: 10px;
    right: 10px;
    bottom: 10px;
    background: rgba(0,0,0,0.5);
    padding-top: 25%;
    text-align: center;
    filter: alpha(opacity=0);
    opacity: 0;
    -webkit-transition: all ease .25s;
    transition: all ease .2s;
    }
    .clickbtn{
background-color: white;
border-style: solid;
padding: 5px 20px;

margin-right: 10px;
border: 1px solid #EAEAEA;  

}
    
</style>

	
	<div class="wrapper" style="background: white; margin-top: 60px;"> 
	<span style="font-size: 30px; color:#383635; font-weight: bold;margin-top: 60px; ">P H O <span style="font-weight: lighter;">T A l K S</span></span> 
    <hr>
    <div class="main"style="margin-top:40px;">
      <div class="page_container">
        <div id="immersive_slider"> 
          <div class="slide" data-blurred="<%=cp %>/resource/images/slide1_blurred.jpg">
            <div class="content">
              <h2><a href="http://www.bucketlistly.com" target="_blank">당산에서 스터디모임 했어요</a></h2>
              <p> 맑음에서 공부했어요. 너무좋았어요 또오고싶어요 계속오고싶어요 
              </div>
            <div class="image">
              <a href="http://www.bucketlistly.com" target="_blank">
                <img src="<%=cp %>/resource/images/slide1.jpg" alt="Slider 1">
              </a>
            </div>
          </div>
          <div class="slide" data-blurred="img/slide2_blurred.jpg">
            <div class="content">
              <h2><a href="http://www.bucketlistly.com/apps" target="_blank">BucketListly Apps</a></h2>
              <p>It’s never been easier to watch YouTube on the big screen
              Send your favorite YouTube videos from your Android phone or tablet to TV with the touch of a button. It’s easy. No wires, no setup, no nothing. Find out more here.</p>
            </div>
            <div class="image">
             <a href="http://www.bucketlistly.com/apps" target="_blank"> <img src="img/slide2.jpg" alt="Slider 1"></a>
            </div>
          </div>
          <div class="slide" data-blurred="img/slide3_blurred.jpg">
            <div class="content">
              <h2><a href="http://www.thepetedesign.com" target="_blank">The Pete Design</a></h2>
              <p>It’s never been easier to watch YouTube on the big screen
              Send your favorite YouTube videos from your Android phone or tablet to TV with the touch of a button. It’s easy. No wires, no setup, no nothing. Find out more here.</p>
            </div>
            <div class="image">
              <a href="http://www.thepetedesign.com" target="_blank"><img src="img/slide3.jpg" alt="Slider 1"></a>
            </div>
          </div>
          
          <a href="#" class="is-prev">&laquo;</a>
          <a href="#" class="is-next">&raquo;</a>
        </div>
      </div>
  	</div>
  	<div class="benefits">
      <div class="page_container">

  	  </div>
  	</div>
  	<div style="font-size: 25px">P H O T O L I S T</div>
	<div class="row" style="width: 1140px;
    margin: 0 auto 0px;
    clear: both;
    height: 100%;"> 
    <a href="" class="hvr-grow-shadow"style="background-image: url('<%=cp %>/resource/images/photolist/photolist9.jpg');background-size: cover; visibility: visible;">
    	<img alt="" src="">
 
  	</a>
  		<div class="hvr-grow-shadow" style="background-image: url('<%=cp %>/resource/images/photolist/photolist7.jpg');background-size: cover;">
  			
  		</div>
  		<div class="hvr-grow-shadow" style="background-image: url('<%=cp %>/resource/images/photolist/photolist8.jpg');background-size: cover;">
  	asd
  		</div>
  	
  	</div> 
  	<div class="row" style="width: 1140px;margin: 0 auto 0"> 
  		<div class="hvr-grow-shadow" style="background-image: url('<%=cp %>/resource/images/photolist/photolist1.png');background-size: cover;">
  	asd
  		</div>
  		
  		<div class="hvr-grow-shadow" style="background-image: url('<%=cp %>/resource/images/photolist/photolist2.jpg');background-size: cover;">
  	sad
  		</div>
  		<div class="hvr-grow-shadow" style="background-image: url('<%=cp %>/resource/images/photolist/photolist3.jpg');background-size: cover;">
  	asd 
  		</div>
  	
  	</div> 
   
  	<div class="row" style="width: 1140px;margin: 0 auto 100px; "> 
  		<div class="hvr-grow-shadow" style="background-image: url('<%=cp %>/resource/images/photolist/photolist4.png');background-size: cover;">
  	asd
  		</div>
  		
  		<div class="hvr-grow-shadow" style="background-image: url('<%=cp %>/resource/images/photolist/photolist5.jpg');background-size: cover;">
  	sad
  		</div>
  		<div class="hvr-grow-shadow" style="background-image: url('<%=cp %>/resource/images/photolist/photolist6.jpg');background-size: cover;">
  	asd
  		</div>
  	
  	</div> 
  	
  	<div>${paging }</div>
<input type="button" class="clickbtn" value="글쓰기" 	onclick="javascript:location.href='<%=cp%>/community/photalks/created';"

style="margin-bottom: 50px;">
  	
  	<script type="text/javascript">
  	  $(document).ready( function() {
  	    $("#immersive_slider").immersive_slider({
  	    	animation: "slide",
  	      container: ".main",
 
  	 
  	    });
  	  });

    </script>
  </div>
  
  
  