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
	border-left: 1px solid #eee;
	width: 900px;
	font-family: "dotum";
	font-size: 12px;
	font-family: "dotum";
}

ul.tabs li {
	float: left;
	text-align: center;
	cursor: pointer;
	width: 82px;
	height: 31px;
	line-height: 31px;
	border: 1px solid #eee;
	border-left: none;
	font-weight: bold;
	background: #fafafa;
	overflow: hidden;
	position: relative;
}

ul.tabs li.active {
	background: #FFFFFF;
	border-bottom: 1px solid #FFFFFF;
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
</style>
<script>
	$(document).ready(function() {
		//최상단 체크박스 클릭
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
	
	$(function() {
		$(".tab_content").hide();
		$(".tab_content:first").show();

		$("ul.tabs li").click(function() {
			tab = $(this).attr("data-tab");
			$("ul.tabs li").each(function(){
				$(this).removeClass("active").css("color", "#333");
			});
			
			$("#tab-"+tab).addClass("active").css("color", "#1abc9c");
				
			listPage(1);
			
		});
	});
	
	$(function(){
		listPage(1);
	});
	
	function listPage(page) {
		var $tab = $("ul.tabs .active");
		var category = $tab.attr("data-tab");
		
		var url="<%=cp%>/customer/faq/list";
		var query="pageNo="+page+"&category="+category;
		var search=$("form[name=searchForm]").serialize();
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
			}
		,beforeSend:function(jqXHR){
			jqXHR.setRequestHeader("AJAX",true)
		}
		,error : function(jqXHR){
			if(jqXHR.status==4011){
				console.log(jqXHR);
			}else if(jqXHR.status==403){
				location.href="<%=cp%>/member/login;"
				
			}else{
				console.log(jqXHR.responseText);
			}
		}
		});
	}
	
</script>
<script type="text/javascript">



</script>
<div style="width: 900px; height: 600px; margin: 60px auto;">
	<div style="height: 50px; font-size: 20px; text-align: center;">
		<span style="font-size: 20px; color: #BDBDBD; font-weight: bold;">
			<span style="font-size: 19px; color: #1abc9c;"
			class="glyphicon glyphicon-pencil"> </span>&nbsp;&nbsp;&nbsp;WOOLTARI&nbsp;&nbsp;&nbsp;
		</span>R E P O R T
	</div>
	<div id="tabwrap" style="width: 900px; margin: 0px auto;">
		<ul class="tabs">
			<li id="tab-all" class="active" data-tab="all">전체</li>
			<li id="tab-frequentask" data-tab="frequentask">자주묻는 질문</li>
			<li id="tab-using" data-tab="using">이용관련</li>
			<li id="tab-payment" data-tab="payment">결제 관련</li>
			<div style="float: right; margin: 8px 0;">
				<input type="checkbox" id="allCheck" name="allCheck"
					class="checkbox-style" /><label for="allCheck">전체선택</label>
			</div>
		</ul>
	</div>	
	
	<div class="tab_container">
			<div id="tab_content" class="tab_content"></div>
	</div>

	<div class="paging" style="width: 900px; margin: 20px auto;text-align: center;">
		<c:if test="${dataCount==0 }">
                            등록된 게시물이 없습니다.
        </c:if>
        <c:if test="${dataCount!=0 }">
        	${paging}
        </c:if></div>
	<div class="btnArea" style="float: right;">
	<c:if test="${sessionScope.member.userId=='admin'}">
		<input type="button" class="clickbtn" 
		 onclick="javascript:deleteList();" value="삭제">
	</c:if>	
		<input type="button" class="clickbtn"
		 onclick="javascript:location.href='<%=cp%>/customer/faq/created';" value="글쓰기">
	</div>

<form action="" id="array_form" name="searchForm" method="post">
	<div class="scArea" style="margin: 30px 10px 30px 200px;">
		<select name="searchKey" class="where">
			<option value="subject">제목</option>
			<option value="content">내용</option>
		</select>
		<input type="text" name="searchValue" class="keyword" placeholder="검색"  style="width:120px; "> <input type="button" class="submit" onclick="listPage(1);">
	</div>
</form>


</div>