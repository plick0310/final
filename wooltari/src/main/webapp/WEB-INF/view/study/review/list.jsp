<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<link rel="stylesheet" href="<%=cp%>/resource/css/star.css">

<style>



.row {
   margin-top: 50px;
}

.imagebox {
   width: 250px;
   height: 200px;
   border: 1px solid #ccc;
   display: inline-block;
   margin: 10px;
}

.img-thumbnail, .thumbnail {
   -webkit-box-shadow: 0 1px 2px rgba(0, 0, 0, .075);
   box-shadow: 4px 6px 0px 1px #e8e8e8;
}
</style>

<script type="text/javascript">
//star rating
var starRating = function(){
  var $star = $(".star-input"),
      $result = $star.find("output>b");
  $(document)
    .on("focusin", ".star-input>.input", function(){
    $(this).addClass("focus");
  })
    .on("focusout", ".star-input>.input", function(){
    var $this = $(this);
    setTimeout(function(){
      if($this.find(":focus").length === 0){
        $this.removeClass("focus");
      }
    }, 100);
  })
    .on("change", ".star-input :radio", function(){
    $result.text($(this).next().text());
  })
    .on("mouseover", ".star-input label", function(){
    $result.text($(this).text());
  })
    .on("mouseleave", ".star-input>.input", function(){
    var $checked = $star.find(":checked");
    if($checked.length === 0){
      $result.text("0");
    } else {
      $result.text($checked.next().text());
    }
  });
};
starRating();
</script>


<div style="width: 900px; margin: 60px auto;">
   <div style="height: 50px; font-size: 20px; text-align: center;">
      <span style="font-size: 20px; color: #BDBDBD; font-weight: bold;">
         <span style="font-size: 19px; color: #1abc9c;"
         class="glyphicon glyphicon-pencil"> </span>&nbsp;&nbsp;&nbsp;WOOLTARI&nbsp;&nbsp;&nbsp;
      </span>R E V I E W
   </div>
   <div class="row">
   
   	<div class="col-sm-6 col-md-4"
         onclick="javascript:location.href='<%=cp%>/review/created';"
         style="cursor: pointer;">
         <div class="thumbnail" style="margin:57px; 0">
            <img src="<%=cp%>/resource/img/plus.png" alt="..." width="50%"
               height="50%" style="margin-top: 25px;">
            <div class="caption">
               <h4 style="text-align: center;">글쓰기</h4>

            </div>
         </div>
      </div>

      <div class="col-sm-6 col-md-4" onclick="javascript:location.href='';"
         style="cursor: pointer;">
         <div class="thumbnail">
            <div class="imagebox">

               <img src="..." alt="...">

            </div>
            <div class="caption">
               <h4 style="text-align: center;">스터디명</h4>
               <p>제목</p>
               <p>작성자</p>
            </div>
         </div>

      </div>
      
      <span class="star-input">
  <span class="input">
    <input type="radio" name="star-input" id="p1" value="1"><label for="p1">1</label>
    <input type="radio" name="star-input" id="p2" value="2"><label for="p2">2</label>
    <input type="radio" name="star-input" id="p3" value="3"><label for="p3">3</label>
    <input type="radio" name="star-input" id="p4" value="4"><label for="p4">4</label>
    <input type="radio" name="star-input" id="p5" value="5"><label for="p5">5</label>
    <input type="radio" name="star-input" id="p6" value="6"><label for="p6">6</label>
    <input type="radio" name="star-input" id="p7" value="7"><label for="p7">7</label>
    <input type="radio" name="star-input" id="p8" value="8"><label for="p8">8</label>
    <input type="radio" name="star-input" id="p9" value="9"><label for="p9">9</label>
    <input type="radio" name="star-input" id="p10" value="10"><label for="p10">10</label>
  </span>
  <output for="star-input"><b>0</b>점</output>
</span>
      
     
      

      
   </div>
</div>