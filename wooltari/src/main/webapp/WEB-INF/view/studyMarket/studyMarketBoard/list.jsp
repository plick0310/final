<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<style type="text/css">
* {
	box-sizing: border-box;
}

body {
	margin: 0;
}



.nav a, .nav a:link, .nav a:visited, .nav a:hover, .nav a:focus, span {
	color: #3e3a39;
}

.headerbody {
	width: 1140px;
	margin: 0px auto;
}
input[id=allCheck] {  
    display: none;  
}

input[id=allCheck] + label{
    display: inline-block;  
    cursor: pointer;  
    position: relative;  
    padding-left: 25px;  
    margin-right: 15px;  
    font-size: 13px;
}

input[id=allCheck]+ label:before {     

    content: "";  
    display: inline-block;  
  
    width: 13px;  
    height: 13px;  
  
    margin-right: 10px;  
    position: absolute;  
    left: 0; 
    top: 3px; 
    bottom: 1px;  
    background-color: #ccc;  
    border-radius: 16px; 
    box-shadow: inset 0px 1px 1px 0px rgba(0, 0, 0, .3), 0px 1px 0px 0px rgba(255, 255, 255, .8);  
}
input[id=allCheck]:checked + label:before { 
    
    text-shadow: 1px 1px 1px rgba(0, 0, 0, .2);  
    font-size: 7px; 
    font-weight:800; 
    color: #fff;  
    background:#1abc9c;
    text-align: center;  
    line-height: 15px;  

} 
.clickbtn{
background-color: white;
border-style: solid;
padding: 5px 20px;

margin-right: 10px;
border: 1px solid #EAEAEA;  

}
.panel-heading{
border-radius: 0px;
background-color: #eee;
}
.conttd td{
margin: 0px 10px;
} 
.bestbar{
width: 900px;
height: 200px;
background: #eee;
box-shadow: 0px 3px 12px 3px #eee;
}

.bestbarsome{
width: 150px;
height: 150px;
background-color: white;
margin: 0 auto;
padding: 40px;

}
.bestbar td{

}
           
</style>
<script type="text/javascript">
function teacherInfo(url){
	 var loadurl ="<%=cp%>" + url;
	   $("#modal-body").load(loadurl);
	   $("#modalflage").val("true");
	   $("#modalLogin").modal("show");
	}



</script>
<!-- 게시판 이름 -->
<div style="width:900px; margin: 60px auto; ">
<div  style="height:50px; font-size: 20px;text-align: center; margin: 60px 0px 20px;"> 
			<span style="font-size: 20px;color:#BDBDBD; font-weight: bold;">
			<span style="font-size: 19px; color: #1abc9c; " class="glyphicon glyphicon-pencil">
			</span>&nbsp;&nbsp;&nbsp;WOOLTARI&nbsp;&nbsp;&nbsp;</span>S T U D Y M A R K E T</div> 
<strong style="font-size: 20px;"><span style="color:rgba(183, 183, 183, 0.65); font-size: 20px;">
<i class="glyphicon glyphicon-align-left" style="color: #1abc9c; margin-bottom: 20px;"></i>&nbsp;&nbsp;B E S T</span> 스 터 디</strong>

<!-- 베스트 강좌 -->
<div class="row"
		style="margin-bottom: 20px; width: 900px; margin-left: 0;">
		<div class="col-sm-6 col-md-4">
			<div class="thumbnail">
				<div
					style="width:100%; height:200px; background-image:url('<%=cp%>/resource/images/back1.jpg');background-size: contain;">
					<img alt="" src=""
						style="width: 50px; height: 50px; margin: -1px;">
				</div>

				<div class="caption">
					<h3 style="font-size: 18px;">
						Green Cloud <small style="margin-left: 33px;">recommend&nbsp;&nbsp;</small><span
							style="font-size: 35px; color: #1abc9c; font-weight: lighter;">4.9</span>
					</h3>
					<p>넓고 분위기좋은 런던풍 카페</p>
					<p style="text-align: right;">
						<a href="#" style="color: #1abc9c;">+MORE</a>
					</p>
				</div>
			</div>
		</div>

		<div class="col-sm-6 col-md-4">
			<div class="thumbnail">
				<div
					style="width:100%; height:200px; background-image:url('<%=cp%>/resource/images/back1.jpg');background-size: contain;">
					<img alt="" 
						style="width: 50px; height: 50px; margin: -1px;">
				</div>

				<div class="caption">
					<h3 style="font-size: 18px;">
						Green Cloud <small style="margin-left: 33px;">recommend&nbsp;&nbsp;</small><span
							style="font-size: 35px; color: #1abc9c; font-weight: lighter;">4.9</span>
					</h3>
					<p>넓고 분위기좋은 런던풍 카페</p>
					<p style="text-align: right;">
						<a href="#" style="color: #1abc9c;">+MORE</a>
					</p>
				</div>
			</div>
		</div>

		<div class="col-sm-6 col-md-4">
			<div class="thumbnail">
				<div
					style="width:100%; height:200px; background-image:url('<%=cp%>/resource/images/back1.jpg');background-size: contain;">
					<img alt="" src=""
						style="width: 50px; height: 50px; margin: -1px;">
				</div>

				<div class="caption">
					<h3 style="font-size: 18px;">
						Green Cloud <small style="margin-left: 33px;">recommend&nbsp;&nbsp;</small><span
							style="font-size: 35px; color: #1abc9c; font-weight: lighter;">4.9</span>
					</h3>
					<p>넓고 분위기좋은 런던풍 카페</p>
					<p style="text-align: right;">
						<a href="#" style="color: #1abc9c;">+MORE</a>
					</p>
				</div>
			</div>
		</div>
	</div>
</div>
<hr style="width: 100%; height: 1px; background-color: #eee; margin-bottom: 50px;">

<div style="text-align: center; width: 900px; margin: 10px auto;">



<!-- 게시판 중간 제목  -->
<strong style="font-size: 20px;"><span style="color:rgba(183, 183, 183, 0.65); font-size: 20px;">
<i class="glyphicon glyphicon-align-left" style="color: #1abc9c;margin-top:50px; margin-bottom: 20px;"></i>&nbsp;&nbsp;M A R K E T</span> L I S T</strong>
<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true" style="width: 900px; margin: 0px auto">
  
  
<!-- 게시판  -->  
  <div class="panel panel">
    <div class="panel-heading" role="tab" id="heading1">
      <h4 class="panel-title">
        <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapse1" aria-expanded="false" aria-controls="collapse1">
        <span><small>No.1</small></span> &nbsp;&nbsp;&nbsp;<span>오세훈과 함께떠나는 자바여행</span>&nbsp;&nbsp;&nbsp;<small>작성일 : 2017-06-28</small>
        <input type="button" class="clickbtn" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo"
		 onclick="javascript:location.href='<%=cp%>/studyMarket/studyMarketBoard/article';" value="동영상 보기">
        </a>
      </h4>
    </div>
    <div id="collapse1" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading1">
      <div class="panel-body">
        <div style="width: 150px;height: 150px;background-color: #eee;padding: 30px;float: left;"></div>
        <div style="float: left; margin-left: 15px;">C O N T E N T : </div>
      </div>
    </div>
  </div>
  
  <div class="panel panel">
    <div class="panel-heading" role="tab" id="heading2">
      <h4 class="panel-title">
        <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapse2" aria-expanded="false" aria-controls="collapse1">
        <span><small>No.1</small></span> &nbsp;&nbsp;&nbsp;<span>오세훈과 함께떠나는 자바여행</span>&nbsp;&nbsp;&nbsp;<small>작성일 : 2017-06-28</small>
        <input type="button" class="clickbtn" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo"
		 onclick="javascript:location.href='<%=cp%>/studyMarket/studyMarketBoard/article';" value="동영상 보기">
        </a>
      </h4>
    </div>
    <div id="collapse2" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading1">
      <div class="panel-body">
        <div style="width: 150px;height: 150px;background-color: #eee;padding: 30px;float: left;"></div>
        <div style="float: left; margin-left: 15px;">C O N T E N T : </div>
      </div>
    </div>
  </div>
  
  
  <!-- 페이지, 글쓰기 삭제 버튼  -->
  <form action="" id="array_form">
  <div style="width: 900px; margin: 20px auto;text-align: center;">1 2 3</div>
	<div class="btnArea" style="float: right;">
		<input type="button" class="clickbtn" 
		 onclick="javascript:location.href='<%=cp%>/help/report/delete';" value="삭제">
		<input type="button" class="clickbtn" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo"
		 onclick="javascript:location.href='<%=cp%>/studyMarket/studyMarketBoard/created';" value="글쓰기">
	</div>
	
	<!-- 찾기  -->	
	<div class="scArea" style="margin: 30px 10px 30px 180px;"> 
		<select name="where" class="where">
			<option value="subject">제목</option>
			<option value="ment">내용</option>
			<option value="writer">작성자</option>
		</select>
		<input type="text" name="keyword" class="keyword" placeholder="검색"  style="width:120px; "> <input type="button" class="submit">
	</div>
	</form>
</div>	
</div>


