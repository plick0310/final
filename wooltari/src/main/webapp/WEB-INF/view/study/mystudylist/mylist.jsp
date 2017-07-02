<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

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
<div style="width: 900px; margin: 60px auto;">
   <div style="height: 50px; font-size: 20px; text-align: center;">
      <span style="font-size: 20px; color: #BDBDBD; font-weight: bold;">
         <span style="font-size: 19px; color: #1abc9c;"
         class="glyphicon glyphicon-pencil"> </span>&nbsp;&nbsp;&nbsp;WOOLTARI&nbsp;&nbsp;&nbsp;
      </span>M Y S T U D Y
   </div>
   <div class="row">

      <div class="col-sm-6 col-md-4" onclick="javascript:location.href='';"
         style="cursor: pointer;">
         <div class="thumbnail">
            <div class="imagebox">

               <img src="..." alt="...">

            </div>
            <div class="caption">
               <h4 style="text-align: center;">스터디명</h4>
               <p>카테고리1</p>
               <p>카테고리2</p>
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
               <p>카테고리1</p>
               <p>카테고리2</p>
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
               <p>카테고리1</p>
               <p>카테고리2</p>
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
               <p>카테고리1</p>
               <p>카테고리2</p>
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
               <p>카테고리1</p>
               <p>카테고리2</p>
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
               <p>카테고리1</p>
               <p>카테고리2</p>
            </div>
         </div>

      </div> 

      <div class="col-sm-6 col-md-4"
         onclick="javascript:location.href='<%=cp%>/study/created';"
         style="cursor: pointer;">
         <div class="thumbnail" style="margin:57px; 0">
            <img src="<%=cp%>/resource/img/plus.png" alt="..." width="50%"
               height="50%" style="margin-top: 25px;">
            <div class="caption">
               <h4 style="text-align: center;">스터디만들기</h4>

            </div>
         </div>
      </div>
   </div>
</div>