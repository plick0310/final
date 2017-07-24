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

<div style="margin: 0 5px 36px; display: block; letter-spacing: -0.3px; font-size: 10px; ">
	<a style="border-bottom-color: #1abc9c; border-left-color: #1abc9c; border-top-color: #1abc9c; border-left: 1px solid #dbdbdb; border-top: 1px solid #dbdbdb; background-color: #1abc9c; color: #fff; border: 1px solid #dbdbdb; display: inline-block; font-size: 15px; font-weight: 500; height: 44px; letter-spacing: normal; line-height: 42px; text-align: center; vertical-align: top; width: 178px; ">
		전체<span style="color: #fff; font-size: 15px; font-weight: 500; letter-spacing: normal; line-height: 42px; text-align: center;">(${dataCount })</span>
	</a>
	<a style="border-top: 1px solid #dbdbdb; border: 1px solid #dbdbdb; border-left: 0; color: #616161; display: inline-block; font-size: 15px; font-weight: 500; height: 44px; letter-spacing: normal;line-height: 42px; text-align: center; vertical-align: top; width: 178px;">
	좋아요순
	</a>
	<a style="border-top: 1px solid #dbdbdb; border: 1px solid #dbdbdb; border-left: 0; color: #616161; display: inline-block; font-size: 15px; font-weight: 500; height: 44px; letter-spacing: normal;line-height: 42px; text-align: center; vertical-align: top; width: 178px;">
	평점순
	</a>
	<a style="border-top: 1px solid #dbdbdb; border: 1px solid #dbdbdb; border-left: 0; color: #616161; display: inline-block; font-size: 15px; font-weight: 500; height: 44px; letter-spacing: normal;line-height: 42px; text-align: center; vertical-align: top; width: 178px;">
	인기순
	</a>
	<a style="border-top: 1px solid #dbdbdb; border: 1px solid #dbdbdb; border-left: 0; color: #616161; display: inline-block; font-size: 15px; font-weight: 500; height: 44px; letter-spacing: normal;line-height: 42px; text-align: center; vertical-align: top; width: 178px;">
	카테고리순
	</a>
</div>
   

<form action="starForm">
 <ul>
<c:forEach var="dto"  items="${list }">      

<li style="height: 300px; margin: 5px; width: 290px; display: inline-block; position: relative; cursor: pointer; padding: 0;" onclick="readBoard(${dto.num});">
<a style="margin: 10px; text-decoration: none; color: inherit; position: absolute; right: 0; top: 0; z-index: 30;"><div class='icon' style="font-size: 17px; color: #fff;"><span class="glyphicon glyphicon-heart-empty"></span></div>
</a>
<div class='card-cover' style="left: 0; position: absolute; right: 0; top: 0; z-index: 20; height: 100%;">

<div class='img-container' style="height: 210px; position: relative; overflow: hidden;">
<div class='content-top' style="cursor: default; position: absolute; top: 0;">
<div class='label' style="font-size: 12px; margin: 10px; padding: 0 8px; background: #fff; border-radius: 4px; color: #757575; float: left; height: 30px; line-height: 30px;">${dto.studyName }</div>
</div>
<div class='expiry-date' style="background: #1abc9c; bottom: 0; color: #fff; display: inline-block; font-size: 10px; font-weight: 500; height: 22px; left: 0; line-height: 22px; padding: 0 10px; position: absolute;">작성일: ${dto.created }</div>
<img src="<%=cp%>/uploads/review/${dto.imageFileName}" onerror="this.src='<%=cp%>/resource/images/reviewPhoto/pp.jpg'" style="width: 100%; height: 100%;">
</div>
<div class='content-box' style="height: 90px; padding: 10px; border: 1px solid #e0e0e0; border-top: 0; position: relative; overflow: hidden;">
<div class='name' style="font-size: 14px; color: #424242; font-weight: 600; line-height: 20px; text-overflow: ellipsis; overflow: hidden; word-wrap:break-word; display: -webkit-box; -webkit-line-clamp:2; height: 40px; -webkit-box-orient:vertical;">${dto.subject } </div>
<c:if test="${dto.range=='0' }"><div style="margin-top: 10px;">[전체공개][${dto.category }]</div></c:if>
<c:if test="${dto.range=='1' }"><div style="margin-top: 10px;">[멤버공개][${dto.category }]</div></c:if>
<div class='price' style="bottom: 10px; right: 10px; color: #3e92d6; font-size: 18px; line-height: 19px; position: absolute;">
<span style="color: #3e92d6; font-size: 12px; ">
	<c:if test="${dto.star =='5'}">
								<i class="glyphicon glyphicon-star" style="color: #1abc9c;"></i>
								<i class="glyphicon glyphicon-star" style="color: #1abc9c;"></i>
								<i class="glyphicon glyphicon-star" style="color: #1abc9c;"></i>
								<i class="glyphicon glyphicon-star" style="color: #1abc9c;"></i>
								<i class="glyphicon glyphicon-star" style="color: #1abc9c;"></i>
							</c:if>
							<c:if test="${dto.star =='4'}">
								<i class="glyphicon glyphicon-star" style="color: #1abc9c;"></i>
								<i class="glyphicon glyphicon-star" style="color: #1abc9c;"></i>
								<i class="glyphicon glyphicon-star" style="color: #1abc9c;"></i>
								<i class="glyphicon glyphicon-star" style="color: #1abc9c;"></i>
								<i class="glyphicon glyphicon-star-empty" style="color: #1abc9c;"></i>
							</c:if>
							<c:if test="${dto.star =='3'}">
								<i class="glyphicon glyphicon-star" style="color: #1abc9c;"></i>
								<i class="glyphicon glyphicon-star" style="color: #1abc9c;"></i>
								<i class="glyphicon glyphicon-star" style="color: #1abc9c;"></i>
								<i class="glyphicon glyphicon-star-empty" style="color: #1abc9c;"></i>
								<i class="glyphicon glyphicon-star-empty" style="color: #1abc9c;"></i>
							</c:if>
							<c:if test="${star =='2'}">
								<i class="glyphicon glyphicon-star" style="color: #1abc9c;"></i>
								<i class="glyphicon glyphicon-star" style="color: #1abc9c;"></i>
								<i class="glyphicon glyphicon-star-empty" style="color: #1abc9c;"></i>
								<i class="glyphicon glyphicon-star-empty" style="color: #1abc9c;"></i>
								<i class="glyphicon glyphicon-star-empty" style="color: #1abc9c;"></i>
							</c:if>
							<c:if test="${dto.star =='1'}">
								<i class="glyphicon glyphicon-star" style="color: #1abc9c;"></i>
								<i class="glyphicon glyphicon-star-empty" style="color: #1abc9c;"></i>
								<i class="glyphicon glyphicon-star-empty" style="color: #1abc9c;"></i>
								<i class="glyphicon glyphicon-star-empty" style="color: #1abc9c;"></i>
								<i class="glyphicon glyphicon-star-empty" style="color: #1abc9c;"></i>
							</c:if>
							<c:if test="${dto.star =='0'}">
								<i class="glyphicon glyphicon-star-empty" style="color: #1abc9c;"></i>
								<i class="glyphicon glyphicon-star-empty" style="color: #1abc9c;"></i>
								<i class="glyphicon glyphicon-star-empty" style="color: #1abc9c;"></i>
								<i class="glyphicon glyphicon-star-empty" style="color: #1abc9c;"></i>
								<i class="glyphicon glyphicon-star-empty" style="color: #1abc9c;"></i>
							</c:if>
</span>
</div>
</div>

</div>
</li>

</c:forEach>
      </ul>
</form>
<div style="text-align: right; margin-right: 50px;"><a href="<%=cp%>/review/created"
				style="color: #1abc9c; font-weight: bold;"><i
					class="glyphicon glyphicon-pencil"
					style="font-size: 19px; vertical-align: middle;"></i> 후기 등록하기</a></div>

     <div style="text-align: center">${paging }</div>
			<%-- <input type="hidden" name="page" value="${page }"> --%>
   </div>
</div>


<!-- Modal --> 
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
  <div class="modal-dialog">
    <div class="modal-content" style="padding: 15px;">
      <div id="myModalBody" class="modal-body" style="height: 500px; "></div>
      <div class="modal-footer" style="margin-top: -5px;">
      		
         <button type="button" class="btn btn-default" style="width: 65px; height: 30px; background: #1abc9c; padding-top: 3px; padding-left: 13px;" onclick="deleteBoard();">삭제</button>
       
         <button type="button" class="btn btn-default" data-dismiss="modal" style="width: 65px; height: 30px; background: #1abc9c; padding-top: 3px; padding-left: 7px;">리스트</button>
         <button type="button" class="btn btn-default" style="width: 65px; height: 30px; background: #1abc9c; padding-top: 3px; padding-left: 13px;" onclick="insertStar();">평가</button>
      </div>
    </div>
  </div>
</div>
