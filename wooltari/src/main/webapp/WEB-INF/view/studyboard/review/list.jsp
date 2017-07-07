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

<script type="text/javascript">

function readBoard(num){
	var url="<%=cp%>/review/article?num="+num+"&page="+${page};
	$("#myModalBody").load(url);
	$("#myModal").modal("show");
	
};

function countStar(num){
	var url="<%=cp%>/review/countStar";
	$.post(url,{num:num},function(data){
		var count=data.countStar;
		var many=data.manyStar;
		
		$("#countStar").html("계산중...");
		$("#countMany").html(many);
	},"json");
}

function insertStar() {
	var f=document.reviewForm;
	var num=f.num.value;
	
	var userId="${sessionScope.member.userId}";
	if(! userId){
		alert("로그인하세요");
		$("#myModal").modal("hide");
		return;
	} 
	
	var star=$(':radio[name="star-input"]:checked').val();
	
	if(! star){
		alert("점수를 입력하세요");
		return;
	}
	
	var query="star="+star;
	query+="&num="+num;
	
	msg="몇점??"+star+"점??";
	if(!confirm(msg)){
		return;
	}
		
	var url="<%=cp%>/review/insertStar"
		
	$.ajax({
		type:"post"
		,url:url
		,data:query
		,dataType:"json"
		,success:function(data){
			var state=data.state;
			if(state=="true"){
				countStar(num);
			}else if(state=="false"){
				alert("후기평점은 한번만 가능합니다.");
			}else if(state=="loginFail"){
				alert("로그인하세요");
			}
		}
		,error:function(e){
			console.log(e.responseText);
		}
	});
	
	

	/* $("#myModal").modal("hide"); */
}

function deleteBoard(){
	var f=document.reviewForm;
	var num=f.num.value;
	var page=f.page.value;
	var query="num="+num+"&page="+page;
	
	var id="${sessionScope.member.userId}";
	if(!id){
		alert("로그인은 필수입니다.");
		return;
	}
	
	var readId=f.userId.value;
	
	if(readId!=id){
		alert("작성자만 삭제할 수 있습니다.");
		return;
	}
	
	var url="<%=cp%>/review/delete?"+query;
	
	if(confirm("글을 삭제하시겠습니까?"))
		location.href=url;
	
}


</script>


<div style="width: 920px; margin: 60px auto;">
   <div style="height: 50px; font-size: 20px; text-align: center; width: 920px;">
      <span style="font-size: 20px; color: #BDBDBD; font-weight: bold;">
         <span style="font-size: 19px; color: #1abc9c;"
         class="glyphicon glyphicon-pencil"> </span>&nbsp;&nbsp;&nbsp;WOOLTARI&nbsp;&nbsp;&nbsp;
      </span>R E V I E W
   </div>
   <div class="row">
   
   	<div class="col-sm-6 col-md-4"
         onclick="javascript:location.href='<%=cp%>/review/created';"
         style="cursor: pointer;">
         <div class="thumbnail" style="margin:10px; 0">
            <img src="<%=cp%>/resource/img/plus.png" alt="..." width="50%"
               height="50%" style="margin-top: 25px;">
            <div class="caption">
               <h4 style="text-align: center;" onclick="javascript:location.href='<%=cp%>/review/created';">글쓰기</h4>

            </div>
         </div>
      </div>
 
<%--  <h6>dataCount:${dataCount}</h6> --%>
 
 <form action="starForm">
<c:forEach var="dto"  items="${list }">      
      <!-- Button trigger modal -->
 
<button type="button" class="btn btn-primary btn-lg" style="border: none; background: none;" onclick="readBoard(${dto.num});">
         <div class="thumbnail">
            <div class="imagebox">
               <img src="<%=cp%>/uploads/review/${dto.imageFileName}" onerror="this.src='<%=cp%>/resource/images/reviewPhoto/pp.jpg'" style="width: 250px; height: 200px;">

            </div>
            <div class="caption">
               <h4 style="text-align: center; font-size: 15px;">제목 :${dto.subject } </h4>
               <h4 style="text-align: center; font-size: 15px;">작성자 : ${dto.userName}</h4>
               <h4 style="text-align: center; font-size: 15px;">스터디명 : ${dto.studyName}</h4>
            </div>
         </div>
</button>
	
</c:forEach>
</form>
     <div style="text-align: center">${paging }</div>
			<%-- <input type="hidden" name="page" value="${page }"> --%>
   </div>
</div>

<!-- Modal --> 
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
  <div class="modal-dialog">
    <div class="modal-content">
      <div id="myModalBody" class="modal-body" style="height: 500px; "></div>
      <div class="modal-footer" style="margin-top: -5px;">
      		
         <button type="button" class="btn btn-default" style="width: 65px; height: 30px; background: #1abc9c; padding-top: 3px; padding-left: 13px;" onclick="deleteBoard();">삭제</button>
       
         <button type="button" class="btn btn-default" data-dismiss="modal" style="width: 65px; height: 30px; background: #1abc9c; padding-top: 3px; padding-left: 7px;">리스트</button>
         <button type="button" class="btn btn-default" style="width: 65px; height: 30px; background: #1abc9c; padding-top: 3px; padding-left: 13px;" onclick="insertStar();">평가</button>
      </div>
    </div>
  </div>
</div>
