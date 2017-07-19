<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<style>
select:focus {
	outline:  none;
}
.wrapper {
  display: block;
  margin: 10px auto;
  border: 1px solid #555;
  width: 700px;
  height: 350px;
  position: relative;
}
p{text-align:center;}
.label {
  height: 1em;
  padding: .3em;
  background: rgba(255, 255, 255, .8);
  position: absolute;
  display: none;
  color:#333;
}
</style>
<script type="text/javascript">
var label = document.querySelector(".label");
var c = document.getElementById("c");
var ctx = c.getContext("2d");
var cw = c.width = 700;
var ch = c.height = 350;
var cx = cw / 2,
  cy = ch / 2;
var rad = Math.PI / 180;
var frames = 0;

ctx.lineWidth = 1;
ctx.strokeStyle = "#3e3a39";
ctx.fillStyle = "#3e3a39";
ctx.font = "14px monospace";

var grd = ctx.createLinearGradient(0, 0, 0, cy);
grd.addColorStop(0, "hsla(167,72%,60%,1)");
grd.addColorStop(1, "hsla(167,72%,60%,0)");

var oData = {
  "07/06": 0,
  "07/07": 0,
  "07/08": 0,
  "07/09": 75,
  "07/10": 42.5, 
  "07/11": 87,
  "07/12": 68,
  "07/13": 42
};

var valuesRy = [];
var propsRy = [];
for (var prop in oData) {

  valuesRy.push(oData[prop]);
  propsRy.push(prop);
}


var vData = 4;
var hData = valuesRy.length;
var offset = 50.5; //offset chart axis
var chartHeight = ch - 2 * offset;
var chartWidth = cw - 2 * offset;
var t = 1 / 7; // curvature : 0 = no curvature 
var speed = 2; // for the animation

var A = {
  x: offset,
  y: offset
}
var B = {
  x: offset,
  y: offset + chartHeight
}
var C = {
  x: offset + chartWidth,
  y: offset + chartHeight
}

/*
      A  ^
	    |  |  
	    + 25
	    |
	    |
	    |
	    + 25  
      |__|_________________________________  C
      B
*/

// CHART AXIS -------------------------
ctx.beginPath();
ctx.moveTo(A.x, A.y);
ctx.lineTo(B.x, B.y);
ctx.lineTo(C.x, C.y);
ctx.stroke();

// vertical ( A - B )
var aStep = (chartHeight - 50) / (vData);

var Max = Math.ceil(arrayMax(valuesRy) / 10) * 10;
var Min = Math.floor(arrayMin(valuesRy) / 10) * 10;
var aStepValue = (Max - Min) / (vData);
console.log("aStepValue: " + aStepValue); //8 units
var verticalUnit = aStep / aStepValue;

var a = [];
ctx.textAlign = "right";
ctx.textBaseline = "middle";
for (var i = 0; i <= vData; i++) {

  if (i == 0) {
    a[i] = {
      x: A.x,
      y: A.y + 25,
      val: Max
    }
  } else {
    a[i] = {}
    a[i].x = a[i - 1].x;
    a[i].y = a[i - 1].y + aStep;
    a[i].val = a[i - 1].val - aStepValue;
  }
  drawCoords(a[i], 3, 0);
}

//horizontal ( B - C )
var b = [];
ctx.textAlign = "center";
ctx.textBaseline = "hanging";
var bStep = chartWidth / (hData + 1);

for (var i = 0; i < hData; i++) {
  if (i == 0) {
    b[i] = {
      x: B.x + bStep,
      y: B.y,
      val: propsRy[0]
    };
  } else {
    b[i] = {}
    b[i].x = b[i - 1].x + bStep;
    b[i].y = b[i - 1].y;
    b[i].val = propsRy[i]
  }
  drawCoords(b[i], 0, 3)
}

function drawCoords(o, offX, offY) {
  ctx.beginPath();
  ctx.moveTo(o.x - offX, o.y - offY);
  ctx.lineTo(o.x + offX, o.y + offY);
  ctx.stroke();

  ctx.fillText(o.val, o.x - 2 * offX, o.y + 2 * offY);
}
//----------------------------------------------------------

// DATA
var oDots = [];
var oFlat = [];
var i = 0;

for (var prop in oData) {
  oDots[i] = {}
  oFlat[i] = {}

  oDots[i].x = b[i].x;
  oFlat[i].x = b[i].x;

  oDots[i].y = b[i].y - oData[prop] * verticalUnit - 25;
  oFlat[i].y = b[i].y - 25;

  oDots[i].val = oData[b[i].val];
  
  i++
}



///// Animation Chart ///////////////////////////
//var speed = 3;
function animateChart() {
  requestId = window.requestAnimationFrame(animateChart);
  frames += speed; //console.log(frames)
  ctx.clearRect(60, 0, cw, ch - 60);
  
  for (var i = 0; i < oFlat.length; i++) {
    if (oFlat[i].y > oDots[i].y) {
      oFlat[i].y -= speed;
    }
  }
  drawCurve(oFlat);
  for (var i = 0; i < oFlat.length; i++) {
      ctx.fillText(oDots[i].val, oFlat[i].x, oFlat[i].y - 25);
      ctx.beginPath();
      ctx.arc(oFlat[i].x, oFlat[i].y, 3, 0, 2 * Math.PI);
      ctx.fill();
    }

  if (frames >= Max * verticalUnit) {
    window.cancelAnimationFrame(requestId);
    
  }
}
requestId = window.requestAnimationFrame(animateChart);

/////// EVENTS //////////////////////
c.addEventListener("mousemove", function(e) {
  label.innerHTML = "";
  label.style.display = "none";
  this.style.cursor = "default";

  var m = oMousePos(this, e);
  for (var i = 0; i < oDots.length; i++) {

    output(m, i);
  }

}, false);

function output(m, i) {
  ctx.beginPath();
  ctx.arc(oDots[i].x, oDots[i].y, 20, 0, 2 * Math.PI);
  if (ctx.isPointInPath(m.x, m.y)) {
    //console.log(i);
    label.style.display = "block";
    label.style.top = (m.y + 10) + "px";
    label.style.left = (m.x + 10) + "px";
    label.innerHTML = "<strong>" + propsRy[i] + "</strong>: " + valuesRy[i] + "%";
    c.style.cursor = "pointer";
  }
}

// CURVATURE
function controlPoints(p) {
  // given the points array p calculate the control points
  var pc = [];
  for (var i = 1; i < p.length - 1; i++) {
    var dx = p[i - 1].x - p[i + 1].x; // difference x
    var dy = p[i - 1].y - p[i + 1].y; // difference y
    // the first control point
    var x1 = p[i].x - dx * t;
    var y1 = p[i].y - dy * t;
    var o1 = {
      x: x1,
      y: y1
    };

    // the second control point
    var x2 = p[i].x + dx * t;
    var y2 = p[i].y + dy * t;
    var o2 = {
      x: x2,
      y: y2
    };

    // building the control points array
    pc[i] = [];
    pc[i].push(o1);
    pc[i].push(o2);
  }
  return pc;
}

function drawCurve(p) {

  var pc = controlPoints(p); // the control points array

  ctx.beginPath();
  //ctx.moveTo(p[0].x, B.y- 25);
  ctx.lineTo(p[0].x, p[0].y);
  // the first & the last curve are quadratic Bezier
  // because I'm using push(), pc[i][1] comes before pc[i][0]
  ctx.quadraticCurveTo(pc[1][1].x, pc[1][1].y, p[1].x, p[1].y);

  if (p.length > 2) {
    // central curves are cubic Bezier
    for (var i = 1; i < p.length - 2; i++) {
      ctx.bezierCurveTo(pc[i][0].x, pc[i][0].y, pc[i + 1][1].x, pc[i + 1][1].y, p[i + 1].x, p[i + 1].y);
    }
    // the first & the last curve are quadratic Bezier
    var n = p.length - 1;
    ctx.quadraticCurveTo(pc[n - 1][0].x, pc[n - 1][0].y, p[n].x, p[n].y);
  }

  //ctx.lineTo(p[p.length-1].x, B.y- 25);
  ctx.stroke();
  ctx.save();
  ctx.fillStyle = grd;
  ctx.fill();
  ctx.restore();
}

function arrayMax(array) {
  return Math.max.apply(Math, array);
};

function arrayMin(array) {
  return Math.min.apply(Math, array);
};

function oMousePos(canvas, evt) {
  var ClientRect = canvas.getBoundingClientRect();
  return { //objeto
    x: Math.round(evt.clientX - ClientRect.left),
    y: Math.round(evt.clientY - ClientRect.top)
  }
}
</script>


<div style="margin-bottom: 5px; font-size: 15px; width: 100%; text-align: left; margin-top: 55px;
		">
	<span style="font-size: 15px; width: 700px;	text-align: left; margin: 50px auto 0;">
		『 2017년 06월 29일 』</span> 을 기준으로 금일 총 합격률은 80%입니다.  
		<span style="font-size: 10px; color: red; margin-left: 10px;">(※최초 응시할 때의 응시 정보만 반영됩니다)</span>
		<br/><span>방금 시험을 본 당신의 점수는!!?!!  ---> <strong>${result }</strong> 점입니돠</span>
</div>

<!-- 차트 -->
<div class="wrapper">
<%-- <c:forEach var="dto" items="${examinfoList }">
		<option value="${dto.examInfoName}">${dto.examInfoName }</option>
	 </c:forEach> --%>
	<select id="searchKey" name="searchKey" class="selectField"
	style="color: black;border: 1px solid black;height: 25px;padding: 1px;float: right;margin-top: -1px;margin-right: -1px;">
        <option value="userName">정보처리기사</option>
        <option value="content">정보처리산업기사</option>
        <option value="created">JLPT N3</option>
    </select>
  <canvas id='c'></canvas>
  <div class="label">text</div>
</div>


<table cellpadding="0" cellspacing="0" style="width: 100%;"
	class="board_table array">
	<tr>
		<td class="___number"
			style="font-size: 11px; color: #666; text-align: center; font-weight: bold;">11</td>
		<td style="padding: 9px 5px; border-bottom: 1px solid #EEEEEE;">
			<div style="position: relative;">
				<a href="<%=cp%>/help/report/article" class="subject"
					style="font-size: 15px; font-weight: bold; color: #373737;">정보처리기사</a>
				<span class="comment"
					style="display: inline-block; padding: 1px 7px 7px 7px; margin-left: 15px; color: #1abc9c; font-weight: bold; font-size: 15px; line-height: 8px; vertical-align: middle;">
					[17년 3회차] </span>

				<div class="info">
					<strong>응시일: &nbsp;&nbsp;</strong> <span class="dateWrap"
						title="[datetime]">2017-06-29</span> <span class="__dotted"></span>
					<strong>주최기관:&nbsp;&nbsp;</strong><span>큐넷</span> <span
						class="__dotted"></span> <strong>성적: &nbsp;&nbsp;</strong>
					<spanstyle="font-size: 20px;">82점</span>&nbsp; 
				</div>

				<div class="likes"
					style="line-height: 23px; position: absolute; top: -8px; right: 10px; background: #fff; padding: 9px 5px 5px 5px; display: block; width: 45px; height: 41px; text-align: center; font-size: 16px; letter-spacing: -1px; color: #666666; font-weight: bold;">
					<br> <span class="num"
						style="color: #1abc9c; font-size: 18px; font-weight: bold; font-family: tahoma;">합격</span>
					<!--[unlikes]-->
				</div>
			</div>
		</td>
	</tr>
	</tbody>
</table>
<br>