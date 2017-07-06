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
	margin-left: 10px;
	font-size:15px;
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

#results td {
	width: 300px;
	padding: 9px;
}

.btn btn-primary:HOVER {
	background-color: white;
	color: black;
}

.thumbnail img {
	width: 100%;
	height: 200px;
}

.thumbnail:HOVER {
	cursor: pointer;
	opacity: 0.5;
}

.thumbnail {
	padding: 0px;
	border-radius: 0px;
	box-shadow: 2px 5px 80px 0px #eee;
	border: none;
	margin-bottom: 50px;
	z-index: 999;
}



.likes {
	line-height: 19px;
	position: absolute;
	top: -8px;
	right: 10px;
	background: #fff;
	padding: 12px 5px 0px 5px;
	display: block;
	width: 85px;
	height: 41px;
	text-align: center;
	font-size: 33px;
	letter-spacing: -1px;
	color: #1abc9c;
	font-weight: bold;
}
.pagination > .active > a, .pagination > .active > span, .pagination > .active > a:hover, .pagination > .active > span:hover, .pagination > .active > a:focus, .pagination > .active > span:focus {
    z-index: 2;
    color: #fff;
    cursor: default;
    background-color: #1abc9c;
    /* border-color: #337ab7; */
    /* text-align: center; */
}

.pagination-sm > li > a, .pagination-sm > li > span {
    padding: 8px 9px;
    
    font-size: 11px;
}
.pagination > li > a, .pagination > li > span {
    position: relative;
    float: left;
    padding: 6px 12px;
    margin-left: -1px;
    line-height: 1.42857143;
    color: #337ab7;
    text-decoration: none;
    background-color: #fff;
  border: none;
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
	$(function(){
		$('#collapseTwo').on('shown.bs.collapse', function () {
			initialize();
	   });		
	});
	var map, places, iw;
	var markers = [];
	var autocomplete;
	 

	function initialize() {
		var myLatlng = new google.maps.LatLng(37.534992, 126.902750);
		var myOptions = {
			zoom : 15,
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
		console.log(autocomplete.getPlace());
	
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
						icon : image
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
		/* var iconTd = document.createElement('td'); */
		var nameTd = document.createElement('td');
		var icon = document.createElement('img');
		/* icon.src = result.icon.replace('http:', '');
		icon.setAttribute('class', 'placeIcon'); */
		var name = document.createTextNode(result.name);
		/* iconTd.appendChild(icon); */
		nameTd.appendChild(name);
		/* tr.appendChild(iconTd); */
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
		var content = '<table style="border:0"><tr>';
		content += '<td style="border:0;width:265px; padding: 9px;"><b><a href="' + place.url + '">'
				+ place.name + '</a></b>';
		content += '</td></tr></table>';
		return content;
	}
	/* google.maps.event.addDomListener(window, 'load', initialize); */
</script>
<div style="width: 900px; margin: 60px auto 0px; height: 100%;">
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
	</span> P L A C E</strong>

	<div class="row"
		style="margin-bottom: 20px; width: 900px; margin-left: 0;">
		<div class="col-sm-6 col-md-4">
			<div class="thumbnail">
				<div
					style="width:100%; height:200px; background-image:url('<%=cp%>/resource/images/back1.jpg');background-size: contain;">
					<img alt="" src="<%=cp%>/resource/images/no2.png"
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
					<img alt="" src="<%=cp%>/resource/images/no2.png"
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
					<img alt="" src="<%=cp%>/resource/images/no2.png"
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




	<div class="panel-group" id="accordion" role="tablist"
		aria-multiselectable="true" style="text-align: center;">
		<div class="panel panel-default"
			style="border: none; box-shadow: none;">
			<div class="panel-heading" role="tab" id="headingTwo"
				style="width: 80px; height: 80px; margin: 18px auto; border-radius: 50%; background: #1abc9c; box-shadow: 0px 9px 30px #9f9fa0;">
				<h4 class="panel-title">
					<a class="collapsed" data-toggle="collapse"
						data-parent="#accordion" href="#collapseTwo" aria-expanded="false"
						aria-controls="collapseTwo"> <span
						style="font-size: 40px; color: white; padding: 9px 4px 4px 4px;"
						class="glyphicon glyphicon-map-marker"> </span>
					</a>
				</h4>
			</div>
			<div id="collapseTwo" class="panel-collapse collapse" role="tabpanel"
				aria-labelledby="headingTwo">
				<div class="panel-body"
					style="height: 501px; border: none; padding: 0;">
					<div
						style="margin-bottom: 100px; width: 900px; background-color: #eee; height: 500px;">

						<div id="map_canvas"
							style="width: 600px; background-color: white; height: 500px; float: left;">
						</div>

						<div id="locationField" style="float: left;">
							<input id="autocomplete" type="text"
								style="width: 300px; height: 40px; padding: 10px; border: 1px solid #eee">
						</div>
						<div id="controls">
							<form name="controls">
								<div>


									<label class="btn btn-primary" id="btncate"
										style="width: 150px; background: #1abc9c; border-radius: 0px; color: white; border: none; font-weight: bold;">
										<img class="img-circle" alt="" src=""> <input
										type="radio" name="type" value="cafe" onclick="search()"
										checked="checked" style="display: none;" />카페
									</label> <label class="btn btn-primary" id="btncate"
										style="width: 150px; background: #1abc9c; border-radius: 0px; color: white; border: none; font-weight: bold;">
										<input type="radio" name="type" value="library"
										onclick="search()" style="display: none;" />도서관
									</label>
								</div>
							</form>

						</div>

						<div id="listing"
							style="float: left; width: 300px; height: 427px; overflow: auto; cursor: pointer;">
							<table id="results"></table>
						</div>

					</div>
				</div>
			</div>
		</div>
		<strong style="font-size: 20px;"><span
			style="color: rgba(183, 183, 183, 0.65); font-size: 20px;"> <i
				class="glyphicon glyphicon-align-left"
				style="color: #1abc9c; padding-top: 26px;"></i>&nbsp;&nbsp;지 도 로
		</span> 찾 아 보 기</strong><br> <span
			style="color: rgba(119, 119, 119, 0.72); line-height: 45px; font-size: 13px; letter-spacing: 4px;">카페 &
			도서관의 <span
			style="text-decoration: underline; color: rgba(119, 119, 119, 0.72); font-size: 13px;">위치와
				정보</span>를 검색
		</span>
	</div>
</div>

<hr style="width: 100%; height: 1px; background-color: #eee;margin-top: 50px;">  
<div style="width: 900px; margin: 40px auto 100px;">
	<table style="width: 100%; margin: 20px auto 0px; border-spacing: 0px;">
		<tr height="35">
			<td align="left" width="50%" style="    padding-bottom: 15px;"><strong style="font-size: 20px;"><span
					style="color: rgba(183, 183, 183, 0.65); font-size: 20px;">
						<i class="glyphicon glyphicon-align-left" style="color: #1abc9c;"></i>&nbsp;&nbsp;P
						L A C E
				</span>B O A R D</strong></td>
			<td align="right">${dataCount }개(${page}/${total_page } 페이지)</td>
		</tr>
	</table>


	<table cellpadding="0" cellspacing="0" style="width: 100%;"
		class="board_table array">
		<c:forEach var="dto" items="${list }">
			<tr>

				

				<td class="___number"
					style="font-size: 11px; color: #666; text-align: center; font-weight: bold;padding: 10px;">${dto.listNum }</td>
				<td class="___number"
					style="font-size: 11px; color: #666; text-align: center; font-weight: bold; width: 105px; padding: 0px 5px;">
					<div
						style="    width: 70px; height: 70px; background-image: url('${dto.content }'); background-size: cover;">
						<div
							style="overflow: hidden; width: 100%; height: 20px;    opacity: 0.9; background-color: white;  padding: 2px; color: #1abc9c;">${dto.region}</div>
					</div>
				</td>
				<td style="padding: 9px 5px; border-bottom: 1px solid #EEEEEE;">
					<div style="position: relative;">
						<!--[category_name]-->

						<a href="${articleUrl }&num=${dto.num}" class="subject"
							style="font-size: 15px; font-weight: bold; color: #373737;">[${dto.region}]
							${dto.subject } - ${dto.placename }</a><span class="comment"
							style="display: inline-block; padding: 1px 7px 7px 7px; margin-left: 15px; color: #1abc9c; font-weight: bold; font-size: 15px; line-height: 8px; vertical-align: middle;">[${dto.replyCount }]</span>

						<div class="info" style="font-size: 13px;">
							<strong>작성일 </strong> <span class="dateWrap" title="[datetime]">${dto.created }</span>
							<span class="__dotted"></span> <strong>작성자 </strong><span>${dto.userId }</span>
							<span class="__dotted"></span> <strong>조회수 </strong><span>${dto.hitCount }</span>
						</div>


						<div class="likes">
							${dto.likesCount }<br> <span class="num"
								style="color: #777; font-size: 15px;">LIKE</span>
							<!--[unlikes]-->
						</div>

					</div>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">

		<tr height="35">
			<td align="center">
				<div>${paging }</div>
			</td>  
		</tr>
	</table>
	
	<form action="" id="array_form">
		<div class="scArea" style="">
			<select name="where" class="where">
				<option value="subject">제목</option>
				<option value="ment">내용</option>
				<option value="writer">작성자</option>
			</select> <input type="text" name="keyword" class="keyword" placeholder="검색"
				style="width: 120px;"> <input type="button" class="submit">
		</div>
	</form>
	<div style="    float: right;
    margin-top: -125px;">
		<button
			onclick="javascript:location.href='<%=cp%>/studyboard/studywhere/created';"
			class="clickbtn">등록하기</button>
	</div>
</div>



<!-- .tab_container -->
