<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
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

input[id=allCheck]+label {
	display: inline-block;
	cursor: pointer;
	position: relative;
	padding-left: 25px;
	font-size: 13px;
}

input[id=allCheck]+label:before {
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
	box-shadow: inset 0px 1px 1px 0px rgba(0, 0, 0, .3), 0px 1px 0px 0px
		rgba(255, 255, 255, .8);
}

input[id=allCheck]:checked+label:before {
	text-shadow: 1px 1px 1px rgba(0, 0, 0, .2);
	font-size: 7px;
	font-weight: 800;
	color: #fff;
	background: #1abc9c;
	text-align: center;
	line-height: 15px;
}

.clickbtn {
	background-color: white;
	border-style: solid;
	padding: 5px 20px;
	margin-right: 10px;
	border: 1px solid #EAEAEA;
}

ul.tabs {
	margin: 0;
	padding: 0;
	float: left;
	list-style: none;
	height: 32px;
	width: 900px;
	font-family: "dotum";
	font-size: 12px;
	font-family: "dotum";
}

ul.tabs li {
	    float: left;
    text-align: center;
    cursor: pointer;
    width: 170px;
    height: 170px;
    line-height: 25px;
    border: 1px solid #eee;
padding: 0 10px;
    font-weight: bold;
    background: #fafafa;
    overflow: hidden;
    position: relative;
    margin: 0 27px;
}

ul.tabs li.active {
	background: #FFFFFF;
	
} 

.tab_container {
	border-top: none;
	clear: both;
	float: left;
	width: 900px;
	background: #FFFFFF;
}

.info {
	padding-top: 7px;
}
.col-sm-3{ 
width: 180px;
height: 180px;
background: white;
    margin: 0 10px;
        box-shadow: 1px 1px 3px grey;
        cursor: pointer;
} 

.col-sm-3:HOVER {
	
	background: #eeeeee;
	color: white; 
	
	
}
</style> 
<script>
	//최상단 체크박스 클릭
	$(document).ready(function() {
		$("#allCheck").click(function() {
			//클릭되었으면
			if ($("#allCheck").prop("checked")) {
				//input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
				$("input[name=chk]").prop("checked", true);
				//클릭이 안되있으면
			} else {
				//input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
				$("input[name=chk]").prop("checked", false);
			}
		});

	});
	
	//탭 지정시 색상 
	 $(function() {
		$(".tab_content").hide();
		$(".tab_content:first").show();//tab_content 전부 숨긴 것 중에 가장 첫번째껏만 보여준다.

		$("ul.tabs li").click(function() {
			//<ul class="tabs">에 <li>를 클릭하면,
			tab = $(this).attr("data-tab");
			//attr:("data-tab")속성값을 가져와라.<li id="tab-all" class="active" data-tab="all">전체
			$("ul.tabs li").each(function(){
				$(this).removeClass("active").css("color", "#333");
			});
			
			$("#tab-"+tab).addClass("active").css("color", "#1abc9c");
				
			listPage(1);
			
		});
	}); 
	//1페이지로 가기
	$(function(){
		listPage(1);
	});
	
	function listPage(page) {
		var $tab = $("ul.tabs .active");//<ul class="tabs">에 <li>
		var category = $tab.attr("data-tab");
		//attr:("data-tab")속성값을 가져와라.<li id="tab-all" class="active" data-tab="all">전체
		
		var url="<%=cp%>/customer/faq/list";
		var query="pageNo="+page+"&category="+category;
		var search=$("form[name=searchForm]").serialize();//직렬화(포장)
		query+="&"+search;
		
		ajaxHTML(url, "get", query);
	}
	
	function ajaxHTML(url, type, query) {
		$.ajax({
			type:type
			,url:url
			,data:query
			,success:function(data){
				if($.trim(data)=="error"){
					listPage(1);
					return;
				}
				
				$("#tab_content").html(data);
				//게시판이 들어갈 곳.<div id="tab_content" class="tab_content"></div>
				//html 태그를 불러옴.
			}
		,beforeSend:function(jqXHR){
			//beforeSend:는 요청을 시작하기전에 호출할 함수를 지정.
			// jquery ajax의 error는 jqXHR, textStatus, errorThrown 의 세 가지 파라미터를 제공 합니다.
			// jqXHR.status는 http 오류 번호를 반환하며 케이스별 오류 메시지 판정에 사용하면 유용할 것 같습니다.
			jqXHR.setRequestHeader("AJAX",true)
			//인스턴스.setRequestHeader(헤더이름, 헤더값)
			//ajax에서는 요청을 보내기전 메소드를 사용하여 헤더이름과 값을 요청헤더에 포함할수 있음.
		}
		,error : function(jqXHR){
			if(jqXHR.status==4011){
				console.log(jqXHR);
			}else if(jqXHR.status==403){
				location.href="<%=cp%>/member/login;"
				
			}else{
				console.log(jqXHR.responseText);
				//console.log()는 입력한 값을 보여줌.
			}
		}
		});
	}
	
</script>

<div class="container">
	<div style="height: 50px; font-size: 20px; text-align: center; margin-top: 50px;"> 
		<span style="font-size: 20px; color: #BDBDBD; font-weight: bold;">
			<span style="font-size: 19px; color: #1abc9c;"
			class="glyphicon glyphicon-pencil"> </span>&nbsp;&nbsp;&nbsp;WOOLTARI&nbsp;&nbsp;&nbsp;
		</span>FAQ
	</div> 
	
	<!-- <div style="width: 900px; height: 450px;     margin: 0 auto 30px;">
	<hr>    
		<div style=" width: 800px; margin: 0 auto; padding: 135px 0;" class="row">   
			<div class="col-sm-3">asd</div> 
			<div class="col-sm-3">asd</div> 
			<div class="col-sm-3">asd</div>
			<div class="col-sm-3">
				<div style="margin: 0 auto; width: 42px;font-size: 42px;
   					 color: #8bcdc0;"><i style="margin-top: 25px;" class="glyphicon glyphicon-credit-card"></i>
    			</div>
    			<div style="width: 100%;text-align: center;">
    			<strong>결제관련문의</strong>
    			  
    			<p style="    font-size: 11px;    line-height: 20px;     margin-top: 10px;"> 
    			결제에 관련한 자주묻는 질문들을 확인할 수 있습니다.
    			</p>
    			</div>
			</div>
		</div>
	</div> -->
	
	<!-- ajax 처리할 탭 -->
	<div id="tabwrap" style="width: 900px; margin: 0px auto;">
		<ul class="tabs">
			<li id="tab-all" class="active" data-tab="all">
				<div style="margin: 0 auto; width: 42px;font-size: 42px;
	   					 color: #8bcdc0;"><i style="margin-top: 25px;" class="glyphicon glyphicon-menu-hamburger"></i>
    			</div>
    			<div style="width: 100%;text-align: center;">
	    			<strong>전체</strong>
	    			<p style="    font-size: 11px; font-weight:100;   line-height: 20px;     margin-top: 10px;"> 
	    			울타리 사용과 관련된 모든 질문을 확인 할 수 있습니다.
	    			</p>
    			</div>
			</li>
			
			<li id="tab-frequentask" data-tab="frequentask">
				<div style="margin: 0 auto; width: 42px;font-size: 42px;
		   					 color: #8bcdc0;"><i style="margin-top: 25px;" class="glyphicon glyphicon-question-sign"></i>
	    			</div>
		    			<div style="width: 100%;text-align: center;">
		    			<strong>자주묻는 질문</strong>
			    			<p style="    font-size: 11px; font-weight:100;   line-height: 20px;     margin-top: 10px;"> 
			    			사용자 분들이 자주하는 질문을 확인 할 수 있습니다.
			    			</p>
	    			</div>
			</li>
			
			<li id="tab-using" data-tab="using">
				<div style="margin: 0 auto; width: 42px;font-size: 42px;
   					 color: #8bcdc0;"><i style="margin-top: 25px;" class="glyphicon glyphicon-info-sign"></i>
    			</div>
    			<div style="width: 100%;text-align: center;">
    			<strong>이용관련</strong>
    			  
    			<p style="    font-size: 11px; font-weight:100;   line-height: 20px;     margin-top: 10px;"> 
    			이용방법을 확인할 수 있습니다.
    			</p>
    			
    			</div>
			</li>
			<li id="tab-payment" data-tab="payment">
			<div style="margin: 0 auto; width: 42px;font-size: 42px;
   					 color: #8bcdc0;"><i style="margin-top: 25px;" class="glyphicon glyphicon-credit-card"></i>
    			</div>
    			<div style="width: 100%;text-align: center;">
    			<strong>결제관련문의</strong>
    			  
    			<p style="    font-size: 11px; font-weight:100;   line-height: 20px;     margin-top: 10px;"> 
    			결제에 관련한 자주묻는 질문들을 확인할 수 있습니다.
    			</p>
    			</div>
			</li>
		</ul>
	</div>	
	
	<div style="float: right; margin: 8px 0; position: absolute; top: 453px; left: 1060px;">
		<c:if test="${sessionScope.member.userId=='admin'}">
			<!-- <input type="checkbox" id="allCheck" name="allCheck" class="checkbox-style" /><label for="allCheck"></label> -->
		</c:if>
	</div>
	
	<!-- ajax처리되는 실제 게시판  -->
	<div class="tab_container">
			<div id="tab_content" class="tab_content"></div>
	</div>
	


</div>