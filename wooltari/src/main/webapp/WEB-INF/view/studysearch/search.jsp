<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<!-- 통합 CSS -->
<link rel="stylesheet" href="<%=cp%>/resource/css/studylist.css">
<style>
.footer{
	visibility: hidden;
}

.leftContent {
   padding: 10px 10px 10px 10px; 
   font-family: 'BareunDotum';   
   
}  

.search-btn {
    width: 100%;
    min-width: 105px;
    background-color: #fff;
    color: #1abc9c;
    border: 1px #1abc9c solid;
    border-radius: 0;
    height: 38px;
}

#left-wrap{ 
    width: 60%;
    position: fixed;
    top: 180px; 
    left: 0;
    bottom: 0;
    overflow-y: scroll;
    overflow-x: hidden;
}
#map-wrap {
    width: 40%;
    position: fixed;
    top: 180px;
    right: 0;
    bottom: 0;
}
.mapHideButton, .mapShowButton {
	color: #1abc9c;
    position: absolute;
    background: #fff;
    border: 1px solid #1abc9c;
    border-radius: 500px;
    z-index: 500;
    cursor: pointer;
    padding: 7px 10px;
    right: 5px;
    top: 0;
}
</style>
<!-- Map --> 
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=tkYb1p5roIP90h3KhPZ_&submodules=geocoder"></script>

<script type="text/javascript">
var page = 1;
var recruit = 0;
var gender = "";
var searchValue = "";
$(document).ready(function(){
	studyLoad();
	mapLoad();
	$("#search-btn").click(function () {
		page=1;
		studyLoad();
	});
});
function paging(paging) {
	page = paging;
	studyLoad();
}

function studyLoad(){
	var params = jQuery("#searchForm").serialize();
	$.ajax({
		url:"<%=cp%>/study/list?page="+page,
		data : params,
		dataType:"html",
		success : function(data) {
		$('.listContent').html(data);
		}
	});
}

function mapLoad(){
	$.ajax({
		url:"<%=cp%>/study/map",
		dataType:"html",
		success : function(data) {
		$('.rightContent').html(data);
		}
	});
}

//맵 숨김/보이기 버튼
function mapShow() {
    $('#mapShowButton').hide();
    var moveRight = $('#map-wrap').css('right');
    moveRight = (parseInt(moveRight)) * -1;
    $('#map-wrap').animate({ "right": 0 }, "500");
    $('#left-wrap .filter').animate({ "right": '40%' }, "500");
    $('.filter-footer').animate({ "width": '60%' }, "500");
    $('#left-wrap').animate({ "width": "60%" }, "500", function () {
        $('#left-wrap').removeAttr('style');
    })
    $('.default-list-box,#search-list > div').removeClass('col-lg-3 col-md-6 col-sm-6 col-xs-12 moccozy-item-wrap').addClass('col-lg-4 col-md-6 col-sm-12 col-xs-12 moccozy-item-wrap')
    $('#mapHideButton').show();
}
function mapHide() {
	$('#mapHideButton').hide();
	var mapWitdh = ($('#map-wrap').parent().width()) * 3;
    $('#map-wrap').animate({ "right": '-' + mapWitdh + 'px' }, "500");
    $('#left-wrap .filter').animate({ "right": '0' }, "500");
    $('.filter-footer').animate({ "width": '100%' }, "500");
    $('#left-wrap').animate({ "width": "100%" }, "500", function () {
        $('.mapShowButton').show();
    });
    $('.default-list-box,#search-list > div').removeClass('col-lg-4 col-md-6 col-sm-12 col-xs-12 moccozy-item-wrap').addClass('col-lg-3 col-md-6 col-sm-6 col-xs-12 moccozy-item-wrap')
    $('#mapShowButton').show();
}

//대분류 카테고리 가져옴
function themeList() {
var bigCategory=$("#bigCategory").val();
if(bigCategory=="") {
   $("#smallCategory option").each(function() {
      $("#smallCategory option:eq(0)").remove();
   });

   $("#smallCategory").append("<option value=''>:: 중분류 ::</option>");
   return false;
}


//소분류 카테고리 가져옴
var url="<%=cp%>/study/getCategory";
var query = "parent=" + bigCategory;
	$.ajax({
	  type : "post",
	  url : url,
	  data : query,
	  dataType : "json",
	  success : function(data) {
	     $("#smallCategory option").each(function() {
	        $("#smallCategory option:eq(0)").remove();
	     });
	
	     $("#smallCategory").append(
	           "<option value=''>:: 중분류 ::</option>");
	
	     var cn = "${dto.categoryNum}";
	     var s;
	     for (var idx = 0; idx < data.listSmallCategory.length; idx++) {
	        s = "";
	        if (cn == data.listSmallCategory[idx].categoryNum)
	           s = " selected='selected'";
	        $("#smallCategory")
	              .append(
	                    "<option value='"+data.listSmallCategory[idx].categoryNum+"' " + s +">"
	                          + data.listSmallCategory[idx].subject
	                          + "</option>");
	     }
	  },
	  error : function(e) {
	     alert(e.responseText);
	  }
	});
}



</script>
<div class="container">
	<div class="leftContent" id="left-wrap">
	    <form class="searchForm" id="searchForm" method="GET" name="searchForm">
		    <div class="filter default-filter">
		    	
		    	<div class="filter-section default-section">
	                <div class="row">
	                    <div class="col-lg-1 col-md-12 pt-sm pb-sm">카테고리</div> 
	                    <div class="col-lg-11"> 
	                        <div class="row">
	                            <div class="col-sm-4">
	                                <div class="select select-box">
	                                    <select id="bigCategory" class="form-control" data-title="category" onchange="themeList();">
	                                        <option value="">:: 대분류 ::</option>
											<c:forEach var="vo" items="${listBigCategory}">
												<option value="${vo.categoryNum}">${vo.subject}</option>
											</c:forEach>
	                                    </select>
	                                </div>
	                            </div>
	                            <div class="col-sm-4">
	                                <div class="select select-box">
	                                    <select id="smallCategory" class="form-control" data-title="category">
	                                        <option value="">:: 중분류 ::</option>
	                                    </select>
	                                </div>
	                            </div>
	                            <span class="mapShowButton" id="mapShowButton" onclick="mapShow();" style="display: none;"><i class="fa fa-map" aria-hidden="true"></i></span>
	                            <span class="mapHideButton" id="mapHideButton" onclick="mapHide();"><i class="fa fa-indent" aria-hidden="true"></i></span>
	                        </div>
	                    </div>
	                </div>
				</div>
				<div class="filter-section default-section">
	                <div class="row">
	                	<div class="col-lg-1 col-md-12 pt-sm pb-sm">대상</div>
                		<div class="col-md-2">
							<select id="selectTarget" name="target" class="form-control">
							    <option value="">전체</option>
							    <option value="초등학생">초등학생</option>
							    <option value="중학생">중학생</option>
							    <option value="고등학생">고등학생</option>
							    <option value="대학생">대학생</option>
							    <option value="직장인">직장인</option>
							    <option value="주부">주부</option>
							    <option value="입시생">입시생</option>
							</select>  
						</div>
						<div class="col-lg-1 col-md-6 pt-sm pb-sm"> 인원</div>
                		<div class="col-md-2"> 
							<select id="selectRecruit" name="recruit" class="form-control">
								<option value="0">전체</option>
								<option value="2">2명</option>
								<option value="3">3명</option>
								<option value="4">4명</option>
								<option value="5">5명</option>
								<option value="6">6명 이상</option>
							</select>
						</div>
						<div class="col-lg-1 col-md-6 pt-sm pb-sm"> 성별</div>
                		<div class="col-md-2"> 
							<select id="selectGender" name="gender" class="form-control">
								<option value="">전체</option>
								<option value="남자">남자</option>
								<option value="여자">여자</option>
							</select>
						</div>
	                </div>
	            </div>
	            <div class="filter-section default-section">
	                <div class="row">
	                    <div class="col-lg-1 col-md-6 pt-sm pb-sm">지역</div>  
	                    <div class="col-lg-11"> 
	                        <div class="row">
	                            <div class="col-sm-4">
	                                <div class="inner-addon">
	                                    <input type="text" class="form-control" id="location-search" name="choiceCity" data-title="location" placeholder="ex) 강남구" value="" />
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	            <div class="filter-section default-section"> 
	                <div class="row">
	                    <div class="col-lg-1 col-md-12 pt-sm pb-sm">키워드</div>
	                    <div class="col-lg-11">
	                        <div class="row">
	                            <div class="col-sm-4">
	                                <div class="inner-addon">
	                                    <input type="text" class="form-control" id="title-search" name="searchValue" data-title="title" placeholder="ex) 토익" />
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	            <div class="col-sm-12"> 
					<button type="button" class="btn search-btn" id="search-btn">선택한 조건으로 스터디 찾기</button>
	            </div>
			</div>
		</form>
		<div class="listContent" id="listContent">
		<!-- 스터디 리스트 나오는 곳 -->
		</div>
	</div>
	<div class="rightContent" id="map-wrap">
			<!-- 맵 나오는 곳 -->
			
	</div>
</div>

