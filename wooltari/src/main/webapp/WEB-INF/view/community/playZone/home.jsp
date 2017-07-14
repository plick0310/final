<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<style>
input[type="button"]{
    margin: 25px 86px;
    width: 50px;
    height: 50px;
    background: white;
    border-radius: 50%;
}
#img2{
cursor: pointer;
}
</style>
<script>
coin = 50  
bet = 1
game = false
box1 = true
box2 = true
box3 = true
num = Math.floor(Math.random() * 10)

IMG = new Array();

IMG[0] = new Image(); IMG[0].src = "<%=cp%>/resource/images/play/0.png";
IMG[1] = new Image(); IMG[1].src = "<%=cp%>/resource/images/play/1.png";
IMG[2] = new Image(); IMG[2].src = "<%=cp%>/resource/images/play/2.png";
IMG[3] = new Image(); IMG[3].src = "<%=cp%>/resource/images/play/3.png";
IMG[4] = new Image(); IMG[4].src = "<%=cp%>/resource/images/play/4.png";
IMG[5] = new Image(); IMG[5].src = "<%=cp%>/resource/images/play/5.png";
IMG[6] = new Image(); IMG[6].src = "<%=cp%>/resource/images/play/6.png";
IMG[7] = new Image(); IMG[7].src = "<%=cp%>/resource/images/play/7.png";
IMG[8] = new Image(); IMG[8].src = "<%=cp%>/resource/images/play/8.png";
IMG[9] = new Image(); IMG[9].src = "<%=cp%>/resource/images/play/9.png";


function keisan(){
	var f=document.slotform;
	if((document.images["first"].src == document.images["second"].src) && (document.images["second"].src == document.images["third"].src) && (document.images["third"].src == IMG[7].src)){
		coin += bet * 10; 
		f.pay_back.value="축하 "+(bet*10)+"점 먹었구요　　점수는："+coin+"점"
		document.getElementById('img1').style.backgroundImage="url(<%=cp%>/resource/images/up.png)"
	}
	else if((document.images["first"].src == document.images["second"].src) && (document.images["second"].src == document.images["third"].src)){
		coin += bet * 5; 
		f.pay_back.value="와따리~ "+(bet*5)+"점 먹었구요　　점수는："+coin+"점";
		document.getElementById('img1').style.backgroundImage="url(<%=cp%>/resource/images/up.png)"
	} else {
		coin -= bet
		f.pay_back.value="안걸려 씀다！　　　남은 점수："+coin+"점";
		document.getElementById('img1').style.backgroundImage="url(<%=cp%>/resource/images/up.png)"
	}
	game = false
	box1 = true
	box2 = true
	box3 = true
}

function end(variable){
	if(game == true){
			if(variable == 1)box1 = false
			if(variable == 2)box2 = false
			if(variable == 3)box3 = false
	  }
	if((box1 == false) && (box2 == false) && (box3 == false)){
			clearTimeout(tid)
			keisan()
	  }
}

function hyouji(){
       
   if(num == 10) num = 0
   if(box1)document.images["first"].src = IMG[num % 10].src
   if(box2)document.images["second"].src = IMG[(num + 3) % 10].src
   if(box3)document.images["third"].src = IMG[(num + 6) % 10].src
num += 1
tid = setTimeout("hyouji()",60)  
}


function inCoin(){
	var f=document.slotform;
	var s=f.select.value;
	
  if (s ==0) bet = 1; 
  else if (s==1) bet = 1;
  else if (s==2) bet = 2;
  else if (s==3) bet = 3;
  else if (s==4) bet = 4;
  else if (s==5) bet = 5;

  if((coin-bet) < 0){
	 f.pay_back.value="즐거운 시간 되셨슴까? 도박은 정신은 병들게 함다!";
	  game = false
	}
  else if (bet > 0){
	  f.pay_back.value="배팅후 점수는"+(coin-bet)+"점 이구요, "+bet+"배팅하셨네요";
	  hyouji();
	}
}
function startGame(){
	var f=document.getElementById('img1');
	f.style.backgroundImage="url(<%=cp%>/resource/images/down.png)"
	
	
   if(game == false){
            game = true
        if (coin <= 0){
          f.pay_back.value="끝났슴다! 고마하구 딴거 해요^^" 
           }else{
          inCoin()
         }
     }
}

</script>
<div style="width:1140px; margin: 50px auto;">
<div style="width: 145px;
    margin: 0px auto 50px; text-align: center;">
	<strong style="font-size: 20px;">
		<span style="color: rgba(183, 183, 183, 0.65); font-size: 20px;"> 
		<i class="glyphicon glyphicon-align-left"style="color: #1abc9c; padding-top: 26px;"></i>&nbsp;&nbsp;너 의
		</span> 일 생 은</strong>
		<br>
		<span style="color: rgba(183, 183, 183, 0.65); font-size: 13px;">
			돌려돌려 돌림판
		</span>
		</div>
</div>

<hr style="width: 100% ;background-color: #eee; height: 1px;"> 
<c:forEach var="dto" items="${list }">
<div>
<div class="row" style="width: 724px; margin: 0 auto; border-right: ">
<div class="col-sm-4" style="margin: 0 auto 15px;padding: 0;">
<Strong style="font-size: 17px;">${dto.userName }</Strong><br>P O I N T : ${dto.point }</div> 
<div class="col-sm-4" style="margin: 0 auto 15px;padding: 0;">오늘 남은 기회는 3회 입니다.</div>
<div class="col-sm-4" style="margin: 0 auto 15px;padding: 0;">오늘 남은 기회는 3회 입니다.</div>
</div>
</c:forEach>

<form name="slotform" style="margin: 0px auto;     width: 724px;">

<div style="width: 1140px; height: 346px;">
	<div style="border: 35px solid #eee;box-shadow: 1px 1px 5px grey;width: 724px;height: 346px;float: left;">
	<div style=" 
    margin: 0 auto;
    width: 654px;
    background-color: #eee;">
		<IMG id="img2" src="<%=cp%>/resource/images/play/7.png" name="first" onClick="end(1)"> 
		<IMG id="img2" src="<%=cp%>/resource/images/play/7.png" name="second" onClick="end(2)"> 
		<IMG id="img2" src="<%=cp%>/resource/images/play/7.png"name="third" onClick="end(3)"><br> 
	</div>
	</div>
	
		<div id="img1" style="background-image: url('<%=cp%>/resource/images/up.png');        width: 140px;
    height: 346px;    margin-left: -1px; cursor:pointer;
    background-repeat: no-repeat;float: left;" onClick="startGame()"></div> 

	
</div>

	<br> 
	<div style="width:126px; margin: 30px auto;">
		<SELECT NAME="select" SIZE="1"> 
			<OPTION value="0"><strong>INSERT COIN(S)</strong></OPTION>
			<OPTION value="1">1 COIN</OPTION>
			<OPTION value="2">2 COINS</OPTION>
			<OPTION value="3">3 COINS</OPTION>
			<OPTION value="4">4 COINS</OPTION>
			<OPTION value="5">5 COINS</OPTION>
		</SELECT>
	</div> 
		<%-- <input type="button" onClick="startGame()" style="background-image: url('<%=cp%>/resource/images/up.png'); background-size:cover;"> --%>
		<br>
	<br>
	<br> 
		<input type="text" size=55 name="pay_back">
</form>
</div>
