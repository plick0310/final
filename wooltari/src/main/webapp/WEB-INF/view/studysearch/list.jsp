<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<script type="text/javascript">


//맵에 다중 마커 추가
var HOME_PATH = window.HOME_PATH || '.';

var map = new naver.maps.Map('map', {
    center: new naver.maps.LatLng(37.3595704, 127.105399),
    zoom: 10
});

var markers = [],
    infoWindows = [];
    
$(function addMarker(){
	<c:forEach items="${list}" var="dto" >
		//alert(${dto.s_num});
		<c:forEach items="${dto.listLocal}" var="vo" >
			//"${dto.studyName}": ['${vo.pointx}', '${vo.pointy}'],
			marker = new naver.maps.Marker({
	        map: map,
	        position: new naver.maps.LatLng(${vo.pointy}, ${vo.pointx}),
	        title: '${dto.studyName}',
	        /* icon: {
	            url: HOME_PATH +'/img/example/sp_pins_spot_v3.png',
	            size: new naver.maps.Size(24, 37),
	            anchor: new naver.maps.Point(12, 37),
	            origin: new naver.maps.Point(MARKER_SPRITE_POSITION[key][0], MARKER_SPRITE_POSITION[key][1])
	        }, */
	        zIndex: 100
		    });
		
		    infoWindow = new naver.maps.InfoWindow({
		        content: '<div style="width:150px;text-align:center;padding:10px;">The Letter is <b>"'+ '${dto.studyName}' +'"</b>.</div>'
		    });
		
		    markers.push(marker);
		    infoWindows.push(infoWindow);
		</c:forEach> 
	</c:forEach>
});

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

// 해당 마커의 인덱스를 seq라는 클로저 변수로 저장하는 이벤트 핸들러를 반환합니다.
function getClickHandler(seq) {
    return function(e) {
        var marker = markers[seq],
            infoWindow = infoWindows[seq];

        if (infoWindow.getMap()) {
            infoWindow.close();
        } else {
            infoWindow.open(map, marker);
        }
    }
}

for (var i=0, ii=markers.length; i<ii; i++) {
    naver.maps.Event.addListener(markers[i], 'click', getClickHandler(i));
}
/* 
$(function(){
	  $('.study-item-overlay').mouseenter(function(){
		  alert(${dto.studyName});
	  });
});
*/
function moveXY(s_num) {
	alert(s_num);
}
</script>
<style>
#list-header > .select, .option-section .add-filter-btn {
    width: 118px;
    border-radius: 0;
    height: 38px;
    font-size: 13px;
}
.inline {
    display: inline-block !important;
}
</style>
<div id="list-header">
	<div class="result-box inline">
		검색결과 <span class="result-num">${dataCount}</span>개
	</div>
</div>

<div id="list-box">
	<div id="search-list" class="row">
		<c:forEach var="dto" items="${list}">
			<div class="col-lg-4 col-md-6 col-sm-12 col-xs-12 default-list-box study-item-wrap">
				<a href="javascript:location.href='<%=cp%>/study/myStudy/home/${dto.s_num}'">
					<div class="study-item list-item align-left">
						<div class="study-item-overlay" onmouseover="moveXY('${dto.s_num}');" >
						</div>
						<div class="header-bg" style="background-image:url(<%=cp%>/uploads/member/userImg/${dto.imageFileName})">
						</div>
						<div class="header-text-container">
							<div class="isPayment">
								<c:forEach var="vo" items="${dto.listCategory}">
									${vo.subject}&nbsp; 
								</c:forEach>
							</div>
							<div class="header-text align-left">
								<div class="title-wrap">
									<div class="title">
									${dto.studyName}
									</div>
								</div>
								<div class="tag">
									<span class="last">${dto.study_Info}</span>
								</div>
							</div>
						</div>
						<div class="item-contents align-left">
							<c:if test="${not empty dto.userImg}">
								<div class="profile-image" style="background-image:url(<%=cp%>/uploads/member/userImg/${dto.userImg})"></div>
							</c:if>
							<c:if test="${empty dto.userImg}">
								<div class="profile-image" style="background-image:url(<%=cp%>/resource/img/noprofileimg.png)"></div>
							</c:if>
							<div class="user-name">
								${dto.userName}
							</div>
							<div class="location">
								<c:forEach var="vo" items="${dto.listLocal}" end="0">
									<h3>${vo.city}</h3> 
								</c:forEach>
							</div>
							<div class="strong-info">
								<span class="payment"></span> ${dto.gender} <span class="count"></span>
							</div>
							<div class="icon-container">
								<i class="fa fa-user-o" aria-hidden="true"></i><span class="info-comment"> ${dto.memcnt}</span>
							</div>
						</div>
					</div>
				</a>
			</div>
		</c:forEach>
	</div>
	<div id="paging" style=" text-align: center; clear: both;">
	${paging}
	</div>
</div>