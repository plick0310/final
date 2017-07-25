<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<script type="text/javascript">
//맵 및 배열 초기화
var map = new naver.maps.Map("map", {
    zoom: 3,
    center: new naver.maps.LatLng(36.2253017, 127.6460516),
    zoomControl: true,
    zoomControlOptions: {
        position: naver.maps.Position.TOP_LEFT,
        style: naver.maps.ZoomControlStyle.SMALL
    }
}),
markers = [],
infoWindows = [], 
contentString = [];
//맵에 다중 마커 추가
$(function addMarker(){
	<c:forEach items="${list}" var="dto" >
		<c:forEach items="${dto.listLocal}" var="local" >
			marker = new naver.maps.Marker({
	        map: map,
	        position: new naver.maps.LatLng('${local.pointy}', '${local.pointx}'),
	        title: '${dto.studyName}',
	        icon: {
	            url: '<%=cp%>/resource/img/marker4.png',
	            size: new naver.maps.Size(30, 30),
	            origin: new naver.maps.Point(0, 0),
	            anchor: new naver.maps.Point(25, 25)
	        },
	        zIndex: 100
		    });
			studyimg = '<%=cp%>/uploads/member/userImg/${dto.imageFileName}';
			userimg = '<%=cp%>/uploads/member/userImg/${dto.userImg}';
			nouserimg = '<%=cp%>/resource/img/noprofileimg.png'; 
			studyurl = '<%=cp%>/study/myStudy/home/${dto.s_num}';
			contentString = [
				'<a href="'+ studyurl+'">',
				'<div class="iw_inner">',
					'<div class="study-item list-item align-left">',
						'<div class="study-item-overlay"></div>',
						'<div class="header-bg" style="background-image:url('+studyimg+')"></div>',
						'<div class="header-text-container">',
							<c:forEach var="category" items="${dto.listCategory}">
								'<div class="isPayment">',
								'${category.subject}',
								'</div>',
							</c:forEach>
							'<div class="header-text align-left">',
								'<div class="title-wrap">',
									'<div class="title">',
									'${dto.studyName}',
									'</div>',
								'</div>',
								'<div class="tag">',
									'<span class="last">',
									'${dto.study_Info}',
									'</span>',
								'</div>',
							'</div>',
						'</div>',
						'<div class="item-contents align-left">',
							<c:if test="${not empty dto.userImg}">
							'<div class="profile-image" style="background-image:url('+userimg+')"></div>',      
							</c:if>
							<c:if test="${empty dto.userImg}">
							'<div class="profile-image" style="background-image:url('+nouserimg+')"></div>',
							</c:if>
							'<div class="user-name">',
							'${dto.userName}',
							'</div>',
							'<div class="location" style="width:250px;">',
								<c:forEach var="local" items="${dto.listLocal}" end="0">
								'<h3>${local.city}</h3>',
								</c:forEach>
							'</div>',
							'<div class="strong-info">',
								'<span class="payment"></span> ${dto.gender} <span class="count"></span>',
							'</div>',
							'<div class="icon-container">',
							'<i class="fa fa-user-o" aria-hidden="true"></i><span class="info-comment"> ${dto.memcnt}</span>',
							'</div>',
						'</div>',
					'</div>',
					'</div>', 
				'</a>'
			].join('');
						 
		    infoWindow = new naver.maps.InfoWindow({
		    	content: contentString,
		        maxWidth: 250,
		        backgroundColor: "#fff",
		        borderColor: "#1abc9c",
		        borderWidth: 3,
		        anchorSize: new naver.maps.Size(30, 20),
		        anchorSkew: false,
		        anchorColor: "#fff",
		        pixelOffset: new naver.maps.Point(20, 0)
		    });
		
		    markers.push(marker);
		    infoWindows.push(infoWindow);
		</c:forEach> 
	</c:forEach>
});
//맵 범위안에 있는 마커만 보이게
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
//마커 보이기
function showMarker(map, marker) {
    if (marker.setMap()) return;
    marker.setMap(map);
}
//마커 숨기기
function hideMarker(map, marker) {
    if (!marker.setMap()) return;
    marker.setMap(null);
}
//해당 마커의 인덱스를 seq라는 클로저 변수로 저장하는 이벤트 핸들러를 반환
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
//마커 클릭이벤트 설정
for (var i=0, ii=markers.length; i<ii; i++) {
    naver.maps.Event.addListener(markers[i], 'click', getClickHandler(i));
}
//마우스 오버된 스터디의 마커가 있는 지역으로 맵 이동
function moveXY(s_num) {
	var query = {"s_num" : s_num};
	$.ajax({
        url:"<%=cp%>/study/getmarker",
        type:'POST',
        data: query,
        success:function(data){
        	var city = data.city;
			var pointx = data.pointx;
			var pointy = data.pointy;
			var myaddr = new naver.maps.Point(pointx, pointy);
	        map.setCenter(myaddr);
	        map.setZoom(11);
        },
        error:function(jqXHR, textStatus, errorThrown){
            alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
            self.close();
        }
    });
}
</script>
<style>
#list-header {
 	margin-top: 50px;
}
</style>
<div id="list-header">
	검색결과 ${dataCount}개
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
							<%-- 
							<c:forEach var="category" items="${dto.listCategory}"> 
							<div class="isPayment">
								${category.subject}
							</div>
							</c:forEach>
							 --%>
							<div class="header-text align-left">
								<div class="title-wrap">
									<div class="title">
									${dto.studyName}
									</div>
								</div>
								<div class="tag">
									<c:forEach var="category" items="${dto.listCategory}">
										<p><span class="last">#${category.subject}</span></p>
									</c:forEach>
								</div>
								<%-- 
								<div class="tag">
									<span class="last">${dto.study_Info}</span>
								</div>
								 --%>
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
								<c:forEach var="local" items="${dto.listLocal}" end="0">
									<h3>${local.city}</h3> 
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