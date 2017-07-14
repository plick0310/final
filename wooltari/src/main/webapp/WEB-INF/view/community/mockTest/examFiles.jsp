<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC"-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%
   String cp = request.getContextPath();
%>
<link rel="stylesheet" href="<%=cp%>/resource/css/mock.css" />
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"/>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"/>

<style>
	html {
		margin: 7% auto;
	}
	
	.menuBar span{
		float: right;
		color: #ffffff;
	}
	
	 .menuBar td {
		 width: 25%;
		 padding: 10px;
	 }
	
	#hi {
		width:100%;
		height:100%;
	}

	@font-face {
	  font-family: 'BareunDotum';
	  font-style: normal;
	  font-weight: 400;
	  src: url('//cdn.jsdelivr.net/korean-webfonts/1/orgs/othrs/kpa/BareunDotum/BareunDotumOTFPro2.woff2') format('woff2'), url('//cdn.jsdelivr.net/korean-webfonts/1/orgs/othrs/kpa/BareunDotum/BareunDotumOTFPro2.woff') format('woff');
	}
	
	@font-face {
	  font-family: 'BareunDotum';
	  font-style: normal;
	  font-weight: 700;
	  src: url('//cdn.jsdelivr.net/korean-webfonts/1/orgs/othrs/kpa/BareunDotum/BareunDotumOTFPro3.woff2') format('woff2'), url('//cdn.jsdelivr.net/korean-webfonts/1/orgs/othrs/kpa/BareunDotum/BareunDotumOTFPro3.woff') format('woff');
	}
	
	@font-face {
	  font-family: 'BareunDotum';
	  font-style: normal;
	  font-weight: 300;
	  src: url('//cdn.jsdelivr.net/korean-webfonts/1/orgs/othrs/kpa/BareunDotum/BareunDotumOTFPro1.woff2') format('woff2'), url('//cdn.jsdelivr.net/korean-webfonts/1/orgs/othrs/kpa/BareunDotum/BareunDotumOTFPro1.woff') format('woff');
	}
</style>
<div style="width: 100%;height:30px;margin: 60px auto 13px;">
	<div style="height: 50px; font-size: 20px; text-align: center; padding-bottom: 50px;">
		<span style="font-size: 20px; color: #BDBDBD; font-weight: bold;">
			<span style="font-size: 19px; color: #1abc9c;" class="glyphicon glyphicon-pencil"></span>
				WOOLTARI&nbsp;
      	</span>
		
		<span style="color: #404040;font-weight: bolder;">TRIAL EXAMINATION</span> <br/><br/>
      
		<table style="margin:0px 0px 5px 0px;width:100%;border: 1px solid #eee; BORDER-BOTTOM: NONE; background:#f8f8f8;/* border-top: 1px solid #eee; */" align="center"><!-- 상단 타이틀 시작. -->
			<c:forEach items="${examwishList }" var="dto" varStatus="status">
				<tbody>
					<tr style="height:45px;">
						<td style="font-family: 'BareunDotum'; font-weight:bolder; color:#383635; font-size:11pt;" align="center" valign="middle">
							<strong>정보처리기사 [ 2017년 1회 기출문제 ] 응시 </strong>
							<span style="font-size:10pt; font-weight:500; color:#878787;">
								<span style="padding-left:8px; font-weight:500">
									<strong>Timer</strong>
								</span>
								<span id="min" style="width:15px; font-weight:500; text-align:right">15</span>분
								<span id="sec_info" style="width:15px; font-weight:500; text-align:right">23</span>초
	               
								<script>
			                        var startDate = new Date();
			                        updateTime();
			                        
			                        function updateTime() {
										var nowTime = new Date();
										var t = nowTime.getTime() - startDate.getTime();
										var s = Math.round(t/1000);
										var ss = s%60;
										min.innerHTML = Math.floor(s/60);
										sec_info.innerHTML = ss;
										setTimeout("updateTime()",500);
									}
								</script>
							</span>
						</td>
					</tr>
				</tbody>
			</c:forEach>	
		</table>
     
		<div id="index_div" style="margin: 30px auto 45px; width:715px;" align="center"><!-- 첫화면 컨테이너 시작. -->
			<table style="width:100%">
            	<tbody>
					<tr>
						<td style="text-align:left; padding-bottom: 40px">
							<div style="margin: 5px auto;padding:0px;width: 400px;height: 170px;float:right;" id="FightingImg">
								<a href="#" target="_top" style="margin: 0 auto;">
									<img id="hi" src="/wooltari/resource/img/padlock.png" alt="goto.com" border="0" style=" width: 170px; height: 170px;"/>
								</a>
								<br/>
                     		</div>
                     		
                     		<div style="margin:0px; padding:10px 10px 10px 30px; font-size:10pt; font-weight:normal; line-height:1.4;">
	                        	<span id="subj_01" style="font-size:20px;letter-spacing: 2px;">
	                        		<strong style="line-height: 50px;">2017년 1회 정보처리기사</strong><br/>
	                        	</span>
								
								<span style="font-family: 'BareunDotum';margin-top: 15px;font-size: 12px;line-height: 25px;font-weight: lighter;">
		                            [CBT] 기출문제 모의고사 CBT<br/>
		                            [시험 범위] 1과목 ~ 5과목 종합 랜덤 시험 (10문제)<br/>
		                            [시험시간] 특별한 제약없이 15분 응시 가능<br/>
		                            [합격점수] 60점 이상 (100문제 중 60문제 이상 득점)<br/>
		                            [불합격] 7문제 이하 득점시, 불합격처리<br/>
	                        	</span>
	                     	</div>   
	                  	</td> 
	               	</tr>
              		
              		<tr>
						<td style="padding:0px; background:#f5f5f5; font-size:15px;" align="center">
							<table class="menuBar" style="padding-bottom:5px; width:100%; " cellspacing="0" cellpadding="0">
								<tbody>
									<tr style="padding:10px 2px 1px 2px;font-size:14px;height:33px;font-family: 'BareunDotum';background: #eee;/* padding: 38px; */">
										<td align="center">종합<span>|</span></td>
										<td align="center"><strong style="color: #1abc9c;">응시전</strong>&nbsp;&nbsp;&nbsp;20 문제<span>|</span><br/></td>
										<td style="text-align: center;">17.07.13<span>|</span></td>
										<td colspan="1" align="center">
											<button type="button" value="시작" class="clickbtn">시작</button>
                             			</td>
                             		</tr>
                        		</tbody>
                     		</table>
						</td>
					</tr>
				</tbody>
			</table>
		</div>     
	</div>
</div>