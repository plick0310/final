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

.tab_content {
	font-size: 12px;
	display: none;
}

.tab_container .tab_content ul {
	width: 100%;
	margin: 0px;
	padding: 0px;
}

.tab_container .tab_content ul li {
	list-style: none
}

.info {
	padding-top: 7px;
}

</style>
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAcO1EZpm4c5VVFmWf1h0dwX1QVbsx3Gb4&libraries=places"></script>
<!-- <script src="http://maps.googleapis.com/maps/api/js"></script>
<script src="https://maps.googleapis.com/maps/api/place/autocomplete/output?parameters"></script> -->
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
			$("ul.tabs li").removeClass("active").css("color", "#333");
			//$(this).addClass("active").css({"color": "darkred","font-weight": "bolder"});
			$(this).addClass("active").css("color", "#1abc9c");
			$(".tab_content").hide()
			var activeTab = $(this).attr("rel");
			$("#" + activeTab).fadeIn()
		});
	});
</script>
<script type="text/javascript">
	var map, places, iw;
	var markers = [];
	var autocomplete;
	 

	function initialize() {
		var myLatlng = new google.maps.LatLng(37.566535, 126.97796919999996);
		var myOptions = {
			zoom : 14,
			center : myLatlng,
			mapTypeId : google.maps.MapTypeId.ROADMAP
		};
		



		
		map = new google.maps.Map(document.getElementById('map_canvas'),
				myOptions);
		places = new google.maps.places.PlacesService(map);
		google.maps.event.addListener(map, 'tilesloaded', tilesLoaded);
		autocomplete = new google.maps.places.Autocomplete(document
				.getElementById('autocomplete'));
		google.maps.event.addListener(autocomplete, 'place_changed',
				function() {
					showSelectedPlace();
				});
		
	}

	function tilesLoaded() {
		google.maps.event.clearListeners(map, 'tilesloaded');
		google.maps.event.addListener(map, 'zoom_changed', search);
		google.maps.event.addListener(map, 'dragend', search);
		search();
	}

	function showSelectedPlace() {
		clearResults();
		clearMarkers();
		var place = autocomplete.getPlace();
	
		map.panTo(place.geometry.location);
		markers[0] = new google.maps.Marker({
			position : place.geometry.location,
			map : map,		
		});
		iw = new google.maps.InfoWindow({
			content : getIWContent(place)
		});
		iw.open(map, markers[0]);
	}

	function search() {
		var type;
		for (var i = 0; i < document.controls.type.length; i++) {
			if (document.controls.type[i].checked) {
				type = document.controls.type[i].value;
			}
		}
		autocomplete.setBounds(map.getBounds());
		var search = {
			bounds : map.getBounds()
		};
		if (type != 'establishment') {
			search.types = [ type ];
		}
		places.search(search, function(results, status) {
			if (status == google.maps.places.PlacesServiceStatus.OK) {
				clearResults();
				clearMarkers();
				for (var i = 0; i < results.length; i++) {
					 var image = '<%=cp%>/resource/images/picpic.png';
					markers[i] = new google.maps.Marker({
						position : results[i].geometry.location,
						animation : google.maps.Animation.DROP,
						icon: image
					});
					google.maps.event.addListener(markers[i], 'click',
							getDetails(results[i], i));
					setTimeout(dropMarker(i), i * 100);
					addResult(results[i], i);
				}
			}
		});
	}

	function clearMarkers() {
		for (var i = 0; i < markers.length; i++) {
			if (markers[i]) {
				markers[i].setMap(null);
				markers[i] == null;
			}
		}
	}

	function dropMarker(i) {
		return function() {
			markers[i].setMap(map);
		}
	}

	function addResult(result, i) {
		var results = document.getElementById('results');
		var tr = document.createElement('tr');
		tr.style.backgroundColor = (i % 2 == 0 ? '#F0F0F0' : '#FFFFFF');
		tr.onclick = function() {
			google.maps.event.trigger(markers[i], 'click');
		};
		var iconTd = document.createElement('td');
		var nameTd = document.createElement('td');
		var icon = document.createElement('img');
		icon.src = result.icon.replace('http:', '');
		icon.setAttribute('class', 'placeIcon');
		var name = document.createTextNode(result.name);
		iconTd.appendChild(icon);
		nameTd.appendChild(name);
		tr.appendChild(iconTd);
		tr.appendChild(nameTd);
		results.appendChild(tr);
	}

	function clearResults() {
		var results = document.getElementById('results');
		while (results.childNodes[0]) {
			results.removeChild(results.childNodes[0]);
		}
	}

	function getDetails(result, i) {
		return function() {
			places.getDetails({
				reference : result.reference
			}, showInfoWindow(i));
		}
	}

	function showInfoWindow(i) {
		return function(place, status) {
			if (iw) {
				iw.close();
				iw = null;
			}
			if (status == google.maps.places.PlacesServiceStatus.OK) {
				iw = new google.maps.InfoWindow({
					content : getIWContent(place)
				});
				iw.open(map, markers[i]);
			}
		}
	}

	function getIWContent(place) {
		var content = '<table style="border:0"><tr><td style="border:0;">';
		content += '<img class="placeIcon" src="' + place.icon + '"></td>';
		content += '<td style="border:0;"><b><a href="' + place.url + '">'
				+ place.name + '</a></b>';
		content += '</td></tr></table>';
		return content;
	}
	google.maps.event.addDomListener(window, 'load', initialize);
</script>
<div style="width: 900px; margin: 60px auto 150px;">
	<div style="height: 50px; font-size: 20px; text-align: center;">
		<span style="font-size: 20px; color: #BDBDBD; font-weight: bold;">
			<span style="font-size: 19px; color: #1abc9c;"
			class="glyphicon glyphicon-map-marker"> </span>&nbsp;&nbsp;&nbsp;WOOLTARI&nbsp;&nbsp;&nbsp;
		</span>S T U D Y P L A C E
	</div>

	<strong style="font-size: 20px;"><span
		style="color: rgba(183, 183, 183, 0.65); font-size: 20px;"> <i
			class="glyphicon glyphicon-align-left"
			style="color: #1abc9c; margin-bottom: 20px;"></i>&nbsp;&nbsp;B E S T
	</span> 스 터 디 장 소</strong>

	<div style="width: 900px; background-color: #eee; height: 150px;"></div>

	<strong style="font-size: 20px;"><span
		style="color: rgba(183, 183, 183, 0.65); font-size: 20px;"> <i
			class="glyphicon glyphicon-align-left"
			style="color: #1abc9c; margin-bottom: 20px; margin-top: 20px;"></i>&nbsp;&nbsp;내
			주 위
	</span> 스 터 디 장 소</strong>
			
	<div style="width: 900px; background-color: #eee; height: 500px;">
		
		<div id="map_canvas"
			style="width: 600px; background-color: white; height: 500px;     float: left;">
		</div>
		
		<div id="locationField" style="float: left;">  
				<input id="autocomplete" type="text" style="width: 300px; height: border: 2px solid #1abc9c;">
		</div>
		<div id="controls">
		<form name="controls" >
		<div >
		<label class="btn btn-primary" style="width: 150px;
    background: white;
    border: 1px solid #1abc9c;
    border-radius: 0px;
    color: #3b3938;">
			<input type="radio" name="type" value="cafe" onclick="search()" checked="checked" style="display:none;" />카페
		</label>
		<label class="btn btn-primary" style="width: 150px;
    background: white;
    border: 1px solid #1abc9c;
    border-radius: 0px;
    color: #3b3938;">
			<input type="radio" name="type" value="library" onclick="search()" style="display:none;"/>도서관
		</label>
		</div>
		</form>
			
	</div>
		
		<div id="listing" style="float: left;
    
    width: 300px;
    height: 443px;
    overflow: auto;
    cursor: pointer;">
		<table id="results"></table> 
		</div>

	</div>
	<div id="tabwrap" style="width: 900px; margin: 0px auto;">
		<ul class="tabs">
			<li class="active" rel="tab1">공지사항</li>
			<li rel="tab2">구매랭킹</li>
			<li rel="tab3">공지사항</li>
			<div style="float: right; margin: 8px 0;">
				<input type="checkbox" id="allCheck" name="allCheck"
					class="checkbox-style" /><label for="allCheck">전체선택</label>
			</div>
		</ul>
		<div class="tab_container">
			<div id="tab1" class="tab_content">

				<table cellpadding="0" cellspacing="0" style="width: 100%;"
					class="board_table array">
					<tr>

						<td style="text-align: right; width: 65px; padding: 5px 18px;"><input
							type="checkbox" name="chk"></td>

						<td class="___number"
							style="font-size: 11px; color: #666; text-align: center; font-weight: bold;">11</td>
						<td style="padding: 9px 5px; border-bottom: 1px solid #EEEEEE;">
							<div style="position: relative;">
								<!--[category_name]-->

								<a href="<%=cp%>/help/report/article" class="subject"
									style="font-size: 15px; font-weight: bold; color: #373737;">제목입니다</a><span
									class="comment"
									style="display: inline-block; padding: 1px 7px 7px 7px; margin-left: 15px; color: #1abc9c; font-weight: bold; font-size: 15px; line-height: 8px; vertical-align: middle;">[16]</span>

								<div class="info">
									<strong>작성일 </strong> <span class="dateWrap" title="[datetime]">2017-06-19</span>
									<span class="__dotted"></span> <strong>작성자 </strong><span>홍길동</span>
									<span class="__dotted"></span> <strong>조회수 </strong><span>30</span>
								</div>


								<div class="likes"
									style="line-height: 23px; position: absolute; top: -8px; right: 10px; background: #fff; padding: 9px 5px 5px 5px; display: block; width: 45px; height: 41px; text-align: center; font-size: 16px; letter-spacing: -1px; color: #666666; font-weight: bold;">
									25<br> <span class="num"
										style="color: #1abc9c; font-size: 18px; font-weight: bold; font-family: tahoma;">추천</span>
									<!--[unlikes]-->
								</div>

							</div>
						</td>
					</tr>
					</tbody>
				</table>

			</div>
			<!-- #tab1 -->
			<div id="tab2" class="tab_content">
				<table cellpadding="0" cellspacing="0" style="width: 100%;"
					class="board_table array">
					<tr>

						<td style="text-align: right; width: 65px; padding: 5px 18px;"><input
							type="checkbox" name="chk"></td>

						<td class="___number"
							style="font-size: 11px; color: #666; text-align: center; font-weight: bold;">11</td>
						<td style="padding: 9px 5px; border-bottom: 1px solid #EEEEEE;">
							<div style="position: relative;">
								<!--[category_name]-->

								<a href="<%=cp%>/help/report/article" class="subject"
									style="font-size: 15px; font-weight: bold; color: #373737;">죔혹힙니다</a><span
									class="comment"
									style="display: inline-block; padding: 1px 7px 7px 7px; margin-left: 15px; color: #1abc9c; font-weight: bold; font-size: 15px; line-height: 8px; vertical-align: middle;">[16]</span>

								<div class="info">
									<strong>작성일 </strong> <span class="dateWrap" title="[datetime]">2017-06-19</span>
									<span class="__dotted"></span> <strong>작성자 </strong><span>홍길동</span>
									<span class="__dotted"></span> <strong>조회수 </strong><span>30</span>
								</div>


								<div class="likes"
									style="line-height: 23px; position: absolute; top: -8px; right: 10px; background: #fff; padding: 9px 5px 5px 5px; display: block; width: 45px; height: 41px; text-align: center; font-size: 16px; letter-spacing: -1px; color: #666666; font-weight: bold;">
									25<br> <span class="num"
										style="color: #1abc9c; font-size: 18px; font-weight: bold; font-family: tahoma;">추천</span>
									<!--[unlikes]-->
								</div>

							</div>
						</td>
					</tr>
					</tbody>
				</table>
			</div>
			<!-- #tab2 -->
			<div id="tab3" class="tab_content"></div>
			<!-- #tab3 -->
		</div>
		<!-- .tab_container -->
	</div>
	<!-- #container -->
</div>