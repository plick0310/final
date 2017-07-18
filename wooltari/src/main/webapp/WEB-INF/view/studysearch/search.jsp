<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<link rel="stylesheet" href="<%=cp%>/resource/css/search.css">
<style>
.footer{
	visibility: hidden;
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
</style>
<!-- Map -->
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=tkYb1p5roIP90h3KhPZ_&submodules=geocoder"></script>

<div class="container-study">
	<div class="leftContent" id="left-wrap">
		<div class="section-question">
		   <div class="question-title">스터디 인원을 입력해 주세요</div>
		   <div class="question-answer">
		      <select name="recruit">
		         <option value="2">2명</option>
		         <option value="3">3명</option>
		         <option value="4">4명</option>
		         <option value="5">5명</option>
		         <option value="6">6명 이상</option>
		      </select>
		   </div>
		</div>
	
		<div class="section-question">
			<div class="question-title">스터디 대상을 선택해 주세요</div>
			<div class="question-answer">
				<div class="row targetWrap">
					<div class="col-lg-3 col-md-3 col-sm-4 col-xs-6 targetBox" style="padding: 2px;">
						<input type="checkbox" name="target" id="LTA00" value="초등학생" />
						<label class="targetProperty" for="LTA00">초등학생</label>
					</div>
					<div class="col-lg-3 col-md-3 col-sm-4 col-xs-6 targetBox" style="padding: 2px;">
						<input type="checkbox" name="target" id="LTA01" value="중학생" />
						<label class="targetProperty" for="LTA01">중학생</label>
					</div>
		
					<div class="col-lg-3 col-md-3 col-sm-4 col-xs-6 targetBox" style="padding: 2px;">
						<input type="checkbox" name="target" id="LTA02" value="고등학생" />
			            <label class="targetProperty" for="LTA02">고등학생</label>
					</div>
		
					<div class="col-lg-3 col-md-3 col-sm-4 col-xs-6 targetBox" style="padding: 2px;">
						<input type="checkbox" name="target" id="LTA03" value="대학생" />
						<label class="targetProperty" for="LTA03">대학생</label>
					</div>
		
					<div class="col-lg-3 col-md-3 col-sm-4 col-xs-6 targetBox" style="padding: 2px;">
						<input type="checkbox" name="target" id="LTA04" value="직장인" />
						<label class="targetProperty" for="LTA04">직장인</label>
					</div>
		         
		         	<div class="col-lg-3 col-md-3 col-sm-4 col-xs-6 targetBox" style="padding: 2px;">
						<input type="checkbox" name="target" id="LTA05" value="주부" />
						<label class="targetProperty" for="LTA05">주부</label>
					</div>
		         
					<div class="col-lg-3 col-md-3 col-sm-4 col-xs-6 targetBox" style="padding: 2px;">
						<input type="checkbox" name="target" id="LTA06" value="입시생" />
						<label class="targetProperty" for="LTA06">입시생</label>
					</div>
				</div>
			</div>
		</div>
	
		<div class="section-question">
			<div class="question-title">스터디 성별를 선택해 주세요</div>
			<div class="question-answer">
				<div class="row targetWrap">
					<div class="col-lg-3 col-md-3 col-sm-4 col-xs-6 targetBox" style="padding: 2px;">
						<input type="radio" name="gender" id="LTB00" value="무관" />
						<label class="targetProperty" for="LTB00">무관</label>
					</div>
	
					<div class="col-lg-3 col-md-3 col-sm-4 col-xs-6 targetBox" style="padding: 2px;">
						<input type="radio" name="gender" id="LTB01" value="여자" />
						<label class="targetProperty" for="LTB01">여자</label>
					</div>
	
					<div class="col-lg-3 col-md-3 col-sm-4 col-xs-6 targetBox" style="padding: 2px;">
						<input type="radio" name="gender" id="LTB02" value="남자" />
						<label class="targetProperty" for="LTB02">남자</label>
					</div>
				</div>
			</div>
		</div>
	
	
		<div class="section-question">
			<div class="question-title">스터디 카테고리를 선택해 주세요</div>
			<div class="question-answer">
				<div class="row targetWrap">
					<select id="bigCategory" class="selectField" onchange="themeList();" style="width: 45%;">
						<option value="">:: 대분류 ::</option>
						<%-- 
						<c:foreach var="vo" items="${listBigCategory}">
							<option value="${vo.categoryNum}">${vo.subject}</option>
						</c:foreach>
						 --%>
					</select>
					<select id="smallCategory" class="selectField" style="width: 45%;">
						<option value="">:: 중분류 ::</option>
					</select>
					<div id="select_category">
					</div>
				</div>
			</div>
		</div>
		<div class="section-question">
			<div class="question-title">스터디 활동 지역을 선택해 주세요</div>
			<div class="question-answer">
				<div class="row targetWrap">
					<select id="bigCity" class="selectField" onchange="cityList();" style="width: 45%;">
						<option value="">:: 대분류 ::</option>
						<%-- 
						<c:foreach var="vo" items="${listBigCity}">
							<option value="${vo.cityNum}">${vo.cityName}</option>
						</c:foreach>
						 --%>
					</select>
					<select id="smallCity" class="selectField" style="width: 45%;">
						<option value="">:: 중분류 ::</option>
					</select>
					<div id="select_city">
					</div>
				</div>
			</div>
		</div>
	               
		<c:forEach begin="1" end="10" step="1">
			<div class="col-lg-4 col-md-6 col-sm-12 col-xs-12 default-list-box study-item-wrap">
				<a href="/teacher/12">
					<div class="study-item list-item align-left" data-lat="" data-lng="" data-index="">
						<div class="study-item-overlay">
						</div>
						<div class="header-bg" style="background-image:url('')">
						</div>
						<div class="header-text-container">
							<div class="isPayment">
							카테고리
							</div>
							<div class="header-text align-left">
								<div class="title-wrap">
									<div class="title">
									스터디 제목
									</div>
								</div>
								<div class="tag">
									<span class="last">#해시태그</span>
								</div>
							</div>
						</div>
						<div class="item-contents align-left">
							<div class="profile-image" style="background-image:url('<%=cp%>/resource/img/noprofileimg.png')">
							</div>
							<div class="user-name">
							오세훈씨씨
							</div>
							<div class="location">
							서울 동작구 사당동
							</div>
							<div class="strong-info">
								<span class="payment"></span> 200,000원 <span class="count"></span>
							</div>
							<div class="icon-container">
								<span class="commentIcon"><img class="icon-img" src="http://moccozy.blob.core.windows.net/icon/comment-icon.png"/></span><span class="info-comment">30</span>
								<span class="commentIcon"><img class="icon-img" src="http://moccozy.blob.core.windows.net/icon/comment-icon.png"/></span><span class="info-comment">30</span>
							</div>
						</div>
					</div>
				</a>
			</div>
		</c:forEach>
	</div>
	<div class="rightContent" id="map-wrap">
		<div id=map style="width: 100%; height: 100%;"></div>
		
		<script type="text/javascript">
		
		var HOME_PATH = window.HOME_PATH || '.';
		var MARKER_SPRITE_X_OFFSET = 29,
		    MARKER_SPRITE_Y_OFFSET = 50,
		    MARKER_SPRITE_POSITION = {
		        "A0": [0, 0],
		        "B0": [MARKER_SPRITE_X_OFFSET, 0],
		        "C0": [MARKER_SPRITE_X_OFFSET*2, 0],
		        "D0": [MARKER_SPRITE_X_OFFSET*3, 0],
		        "E0": [MARKER_SPRITE_X_OFFSET*4, 0],
		        "F0": [MARKER_SPRITE_X_OFFSET*5, 0],
		        "G0": [MARKER_SPRITE_X_OFFSET*6, 0],
		        "H0": [MARKER_SPRITE_X_OFFSET*7, 0],
		        "I0": [MARKER_SPRITE_X_OFFSET*8, 0],

		        "A1": [0, MARKER_SPRITE_Y_OFFSET],
		        "B1": [MARKER_SPRITE_X_OFFSET, MARKER_SPRITE_Y_OFFSET],
		        "C1": [MARKER_SPRITE_X_OFFSET*2, MARKER_SPRITE_Y_OFFSET],
		        "D1": [MARKER_SPRITE_X_OFFSET*3, MARKER_SPRITE_Y_OFFSET],
		        "E1": [MARKER_SPRITE_X_OFFSET*4, MARKER_SPRITE_Y_OFFSET],
		        "F1": [MARKER_SPRITE_X_OFFSET*5, MARKER_SPRITE_Y_OFFSET],
		        "G1": [MARKER_SPRITE_X_OFFSET*6, MARKER_SPRITE_Y_OFFSET],
		        "H1": [MARKER_SPRITE_X_OFFSET*7, MARKER_SPRITE_Y_OFFSET],
		        "I1": [MARKER_SPRITE_X_OFFSET*8, MARKER_SPRITE_Y_OFFSET],

		        "A2": [0, MARKER_SPRITE_Y_OFFSET*2],
		        "B2": [MARKER_SPRITE_X_OFFSET, MARKER_SPRITE_Y_OFFSET*2],
		        "C2": [MARKER_SPRITE_X_OFFSET*2, MARKER_SPRITE_Y_OFFSET*2],
		        "D2": [MARKER_SPRITE_X_OFFSET*3, MARKER_SPRITE_Y_OFFSET*2],
		        "E2": [MARKER_SPRITE_X_OFFSET*4, MARKER_SPRITE_Y_OFFSET*2],
		        "F2": [MARKER_SPRITE_X_OFFSET*5, MARKER_SPRITE_Y_OFFSET*2],
		        "G2": [MARKER_SPRITE_X_OFFSET*6, MARKER_SPRITE_Y_OFFSET*2],
		        "H2": [MARKER_SPRITE_X_OFFSET*7, MARKER_SPRITE_Y_OFFSET*2],
		        "I2": [MARKER_SPRITE_X_OFFSET*8, MARKER_SPRITE_Y_OFFSET*2]
		    };

		var map = new naver.maps.Map('map', {
		    center: new naver.maps.LatLng(37.3595316, 127.1052133),
		    zoom: 10,
		    mapTypeControl: true
		});

		var infoWindow = new naver.maps.InfoWindow({
		    anchorSkew: true
		});
		map.setCursor('pointer');
		
		
		var bounds = map.getBounds(),
		    southWest = bounds.getSW(),
		    northEast = bounds.getNE(),
		    lngSpan = northEast.lng() - southWest.lng(),
		    latSpan = northEast.lat() - southWest.lat();

		var markers = [];
 
		
		for (var key in MARKER_SPRITE_POSITION) {
		
		    var position = new naver.maps.LatLng(
		        southWest.lat() + latSpan * Math.random(),
		        southWest.lng() + lngSpan * Math.random());
		
		    var marker = new naver.maps.Marker({
		        map: map,
		        position: position,
		        title: key,
		        icon: {
		            url: "<%=cp%>/resource/img/marker.png",
		            size: new naver.maps.Size(24, 37),
		            anchor: new naver.maps.Point(12, 37),
		            origin: new naver.maps.Point(MARKER_SPRITE_POSITION[key][0], MARKER_SPRITE_POSITION[key][1])
		        },
		        zIndex: 100
		    });
		
		    markers.push(marker);
		};
		
		map.setCursor('pointer');
		
		naver.maps.Event.addListener(map, 'idle', function() {
		    updateMarkers(map, markers);
		});
		
		function updateMarkers(map, markers) {
		
		    var mapBounds = map.getBounds();
		    var marker, position;
		
		    for (var i = 0; i < markers.length; i++) {
		
		        marker = markers[i]
		        position = marker.getPosition();
		
		        if (mapBounds.hasLatLng(position)) {
		            showMarker(map, marker);
		        } else {
		            hideMarker(map, marker);
		        }
		    }
		}
		
		function showMarker(map, marker) {
		
		    if (marker.setMap()) return;
		    marker.setMap(map);
		}
		
		function hideMarker(map, marker) {
		
		    if (!marker.setMap()) return;
		    marker.setMap(null);
		}
		</script>
	</div>
</div>

