<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<html>
	<head> 
		<title>[WOOLTARI 모의테스트] 2017년 1회 정보처리기사 CBT</title>
		<link rel="stylesheet" href="<%=cp%>/resource/css/style_qpass.css"/>
		
		<script type="text/javascript"> // 자바스크립트에서 사용하는 전역변수 선언
		var g4_path = "../tn";
		var g4_bbs = "";
		var g4_bbs_img = "";
		var g4_url = "";
		var g4_is_member = "";
		var g4_is_admin = "";
		var g4_bo_table = "";
		var g4_sca = "";
		var g4_charset = "utf-8";
		var g4_cookie_domain = "";
		var g4_is_gecko = navigator.userAgent.toLowerCase().indexOf("gecko") != -1;
		var g4_is_ie = navigator.userAgent.toLowerCase().indexOf("msie") != -1;
		var isMobile = -1;
		</script>
	</head>
	
	
<body id="body_style">
	<a name="g4_head"></a>
	
	<div align="center"><!--Mobile, PC 페이지 컨테이너 가운데 정렬 시작.-->
		<div style="margin:auto; width:1008px; background:#fff; border-radius:8px;"><!--PC 컨테이너 시작.-->
			<div style="padding:15px;"><!--PC 컨테이너 여백 시작.-->
				<span style="font-size: 20px; color: #BDBDBD; font-weight: bold;">
					<span style="font-size: 19px; color: #1abc9c;" class="glyphicon glyphicon-pencil"></span>
					WOOLTARI&nbsp;
				</span>
				<span style="color: #404040;font-weight: bolder;">TRIAL EXAMINATION</span> <br><br>
				
				<div style="padding:5px; border:solid 1px #ccc;"><!--시험 시작.-->
					<table style="margin:0px 0px 5px 0px; width:100%; border:1px solid #ccc; background:#f8f8f8" align="center"><!-- 상단 타이틀 시작. -->
						<tbody>
							<tr style="height:45px;">
								<td style="font-family: 'BareunDotum'; font-weight:bolder; color:#383635; font-size:11pt;" align="center" valign="middle">
									<strong>정보처리기사 [ 2017년 1회 기출문제 ] 응시 </strong>
									<span style="font-size:10pt; font-weight:500; color:#878787;">
										<span style="padding-left:8px; font-weight:500">
											<strong>Timer</strong>
										</span>
										<span id="min" style="width:15px; font-weight:500; text-align:right">3</span>분
										<span id="sec_info" style="width:15px; font-weight:500; text-align:right">49</span>초
	               
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
								<td style="padding-right:5px; text-align:right;" valign="middle">
									<input type="button" value="시험 취소" class="btn01_qpass" style="width:65px;padding:1px;border:1px solid #008000;padding-bottom: 4px;" onclick="move2main()">
								</td>
							</tr>
						</tbody>
					</table><!-- 상단 타이틀 끝. -->

					<input type="hidden" id="current_i" value="0" size="3"/>
					<input type="hidden" id="current_j" value="0" size="3"/>
					<input type="hidden" id="current_startNum" value="1" size="3"/>
					<input type="hidden" id="current_questionTotal" value="10" size="3"/>
					<input type="hidden" id="current_mode" value="first" size="3"/>

					<form name="test_form" method="post" action="#" style="margin:0">
						<input type="hidden" name="mode" value="first"/>
						<input type="hidden" name="targetDiv" value=""/>
						<input type="hidden" name="ansTryList" value=""/>
					</form>

					<script type="text/javascript">
						var subjectNum = 1;
						var mode = 'first';
						var initStartNum = 1;
						var initEachTotal = 10;
					</script>

					<div id="index_div" style="padding-top: 50px; text-align: center; display: none; visibility: hidden;">1문제씩 풀기 로딩 중입니다...</div>
					<script>var max_five = Array(100);</script>

					<table width="100%" align="center" cellspacing="0" cellpadding="0" style="margin:0px" border="0">
						<tbody>
							<tr>
								<td align="left" valign="top"><!-- 문제지 출력 -->
								<!-- try: 선택한 답 || trysame: 같은지 여부(?) || real: 정답 -->
									<input type="hidden" id="ans_try1" size="3" value=""/>
									<input type="hidden" id="ans_trySame1" size="3" value=""/>
									<input type="hidden" id="ans_real1" size="2" value="1"/>
									<input type="hidden" id="ans_try2" size="3" value=""/>
									<input type="hidden" id="ans_trySame2" size="3" value=""/>
									<input type="hidden" id="ans_real2" size="2" value="1,2,3,4"/>
									<input type="hidden" id="ans_try3" size="3" value="">
									<input type="hidden" id="ans_trySame3" size="3" value="">
									<input type="hidden" id="ans_real3" size="2" value="1,2,3,4">
									<input type="hidden" id="ans_try4" size="3" value="">
									<input type="hidden" id="ans_trySame4" size="3" value="">
									<input type="hidden" id="ans_real4" size="2" value="2">
									<input type="hidden" id="ans_try5" size="3" value="">
									<input type="hidden" id="ans_trySame5" size="3" value="">
									<input type="hidden" id="ans_real5" size="2" value="2">
									<input type="hidden" id="ans_try6" size="3" value="">
									<input type="hidden" id="ans_trySame6" size="3" value="">
									<input type="hidden" id="ans_real6" size="2" value="1">
									<input type="hidden" id="ans_try7" size="3" value="">
									<input type="hidden" id="ans_trySame7" size="3" value="">
									<input type="hidden" id="ans_real7" size="2" value="3">
									<input type="hidden" id="ans_try8" size="3" value="">
									<input type="hidden" id="ans_trySame8" size="3" value="">
									<input type="hidden" id="ans_real8" size="2" value="3">
									<input type="hidden" id="ans_try9" size="3" value="">
									<input type="hidden" id="ans_trySame9" size="3" value="">
									<input type="hidden" id="ans_real9" size="2" value="2">
									<input type="hidden" id="ans_try10" size="3" value="">
									<input type="hidden" id="ans_trySame10" size="3" value="">
									<input type="hidden" id="ans_real10" size="2" value="3">
									<script>max_five[0] = '19';</script>
									<script>max_five[1] = '19';</script>
									<script>max_five[2] = '19';</script>
									<script>max_five[3] = '19';</script>
									<script>max_five[4] = '19';</script>
									
<%-- 							<!-- 문제 foreach로 돌리기 - 출력은 되나,  -->				
								<c:forEach items="${examList }" var="dto" varStatus="status">
									<div id="div00" style="display: block; width: 100%; height: 100%;">
										<table width="100%" cellspacing="0" cellpadding="0" style="margin-top:0px;" border="0">
											<tbody>
												<tr>
													<td width="100%" valign="top" class="ed" style="padding-top:5px;">
														<div id="ques_ox1" style="margin:0px; position:absolute; width:55px; height:45px;">
															<img src="<%=cp%>/resource/images/blank.gif" style="width:55px; height:45px;"/>
														</div>
														<table style="margin-bottom:10px; width:100%; height:150px; border:0" cellspacing="0" cellpadding="5">
															<tbody>
																<tr>
																	<td style="padding-left:8px; width:25px; text-align:right" valign="top" class="count_qpass">${dto.examNum}.</td>
																	<td style="width:98%" valign="top" class="question01_qpass">${dto.exam}<br>
																		<span id="rate1" class="rightRate" style="display:none">[정답률: 57%]</span>
																	</td>
																</tr>
																
																<!-- [보기 1-1] -->
																<tr>
																	<td></td>
																	<td id="quesitem11" class="question02_qpass">
																		<a href="javascript:answer_check(1, 1)">① ${dto.ex_One}</a>
																	</td>
																</tr>
																
																<!-- [보기 1-2] -->
																<tr>
																	<td></td>
																	<td id="quesitem12" class="question02_qpass" style="background-repeat: no-repeat;">
																		<a href="javascript:answer_check(1, 2)">② ${dto.ex_Two}</a>
																	</td>
																</tr>
																
																<!-- [보기 1-3] -->
																<tr>
																	<td></td>
																	<td id="quesitem13" class="question02_qpass" style="background-repeat: no-repeat;">
																		<a href="javascript:answer_check(1, 3)">③ ${dto.ex_Three}</a>
																	</td>
																</tr>
																
																<tr>
																	<td></td>
																	<td id="quesitem14" class="question02_qpass" style="background-repeat: no-repeat;">
																		<a href="javascript:answer_check(1, 4)">④ ${dto.ex_Four}</a>
																	</td>
																</tr>
															</tbody>
														</table>
														
														<p style="margin:15px 0px 10px 16px;">
															<input type="button" value="이전" onclick="previous_div('1과목', 0, 0)" class="btn01_qpass"/>
															<input type="button" value="다음" onclick="next_div('1과목', 0, 0)" class="btn01_qpass"/>
														</p>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
								</c:forEach> --%>
	

									<div id="div00" style="display: block; width: 100%; height: 100%;">
										<table width="100%" cellspacing="0" cellpadding="0" style="margin-top:0px;" border="0">
											<tbody>
												<tr>
													<td width="100%" valign="top" class="ed" style="padding-top:5px;height: 282px;padding: 35px 27px;">
														<div id="ques_ox1" style="margin:0px; position:absolute; width:55px; height:45px;">
															<img src="<%=cp%>/resource/images/blank.gif" style="width:55px; height:45px;"/>
														</div>
														<table style="margin-bottom:10px; width:100%; height:150px; border:0" cellspacing="0" cellpadding="5">
															<tbody>
																<tr>
																	<td style="padding-left:8px; width:25px; text-align:right" valign="top" class="count_qpass">1.</td>
																	<td style="width:98%" valign="top" class="question01_qpass">다음 관계대수 중 순수 관계연산자가 아닌 것은?<br>
																		<span id="rate1" class="rightRate" style="display:none">[정답률: 57%]</span>
																	</td>
																</tr>
																
																<!-- [보기 1-1] -->
																<tr>
																	<td></td>
																	<td id="quesitem11" class="question02_qpass">
																		<a href="javascript:answer_check(1, 1)">① 차집합(difference)</a>
																	</td>
																</tr>
																
																<!-- [보기 1-2] -->
																<tr>
																	<td></td>
																	<td id="quesitem12" class="question02_qpass" style="background-repeat: no-repeat;">
																		<a href="javascript:answer_check(1, 2)">② 프로젝트(project)</a>
																	</td>
																</tr>
																
																<!-- [보기 1-3] -->
																<tr>
																	<td></td>
																	<td id="quesitem13" class="question02_qpass" style="background-repeat: no-repeat;">
																		<a href="javascript:answer_check(1, 3)">③ 조인(join)</a>
																	</td>
																</tr>
																
																<tr>
																	<td></td>
																	<td id="quesitem14" class="question02_qpass" style="background-repeat: no-repeat;">
																		<a href="javascript:answer_check(1, 4)">④ 디비전(division)</a>
																	</td>
																</tr>
															</tbody>
														</table>
														
														<p style="margin:15px 0px 10px 16px;">
															<input type="button" value="이전" onclick="previous_div('1과목', 0, 0)" class="btn01_qpass"/>
															<input type="button" value="다음" onclick="next_div('1과목', 0, 0)" class="btn01_qpass"/>
														</p>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
									
									<!-- [문제 2] -->
									<div id="div01" style="display: none; width: 100%; height: 100%;">
										<table width="100%" cellspacing="0" cellpadding="0" style="margin-top:0px;" border="0">
											<tbody>
												<tr>
													<td width="100%" valign="top" class="ed" style="padding-top:5px;">
														<div id="ques_ox2" style="margin:0px; position:absolute; width:55px; height:45px;">
															<img src="<%=cp%>/resource/images/blank.gif" style="width:55px; height:45px;">
														</div>
														<table style="margin-bottom:10px; width:100%; height:150px; border:0" cellspacing="0" cellpadding="5">
															<tbody>
																<tr>
																	<td style="padding-left:8px; width:25px; text-align:right" valign="top" class="count_qpass">2.</td>
																	<td style="width:98%" valign="top" class="question01_qpass">관계형 대수의 연산자가 아닌 것은? <br>
																		<span id="rate2" class="rightRate" style="display:none">[정답률: 64%]</span>
																	</td>
																</tr>
																
																<!-- [보기 2-1] -->
																<tr>
																	<td></td>
																	<td id="quesitem21" class="question02_qpass">
																		<a href="javascript:answer_check(2, 1)">① JOIN</a>
																	</td>
																</tr>
																
																<!-- [보기 2-2] -->
																<tr>
																	<td></td>
																	<td id="quesitem22" class="question02_qpass">
																		<a href="javascript:answer_check(2, 2)">② PROJECT</a>
																	</td>
																</tr>
																
																<!-- [보기 2-3] -->
																<tr>
																	<td></td>
																	<td id="quesitem23" class="question02_qpass">
																		<a href="javascript:answer_check(2, 3)">③ PRODUCT</a>
																	</td>
																</tr>
																
																<!-- [보기 2-4] -->
																<tr>
																	<td></td>
																	<td id="quesitem24" class="question02_qpass">
																		<a href="javascript:answer_check(2, 4)">④ PART</a>
																	</td>
																</tr>
															</tbody>
														</table>
														
														<div id="comment2" style="display:none; color:blue; line-height:1.5; padding:15px; padding-top:0px;">
															<span style="font-weight:bold; ">해설 : </span>
															자격검정 시행기관에서 가답안으로 2번은 답항 4를 발표하였지만 문제 의견 수렴 후 결정한 확정답안에서 전항 정답으로 결정한 문제입니다.<br/><br/>
															전항 정답으로 결정한 이유는 [성적테이블]에 학점 컬럼을 학번으로 오류 표기함으로써 WHERE 조건절 [A.학번 = B.학번 AND B.과목이름 = “DB”]을 만족하는 결과 값 추출이 불가능하기 때문입니다.
														</div>
														
														<p style="margin:15px 0px 10px 16px;">
															<input type="button" value="이전" onclick="previous_div('1과목', 0, 1)" class="btn01_qpass"/>
															<input type="button" value="다음" onclick="next_div('1과목', 0, 1)" class="btn01_qpass"/>
														</p>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
									
									<!-- [문제 3] -->
									<div id="div02" style="display: none; width: 100%; height: 100%;">
										<table width="100%" cellspacing="0" cellpadding="0" style="margin-top:0px;" border="0">
											<tbody>
												<tr>
													<td width="100%" valign="top" class="ed" style="padding-top:5px;">
														<div id="ques_ox3" style="margin:0px; position:absolute; width:55px; height:45px;">
															<img src="<%=cp%>/resource/images/blank.gif" style="width:55px; height:45px;">
														</div>
														<table style="margin-bottom:10px; width:100%; height:150px; border:0" cellspacing="0" cellpadding="5">
															<tbody>
																<tr>
																	<td style="padding-left:8px; width:25px; text-align:right" valign="top" class="count_qpass">3.</td>
																	<td style="width:98%" valign="top" class="question01_qpass">데이터베이스의 상태를 변환시키기 위하여 논리적 기능을 수행하는 하나의 작업 단위를 무엇이라고 하는가? <br>
																		<span id="rate3" class="rightRate" style="display:none">[정답률: 77%]</span>
																	</td>
																</tr>
																
																<!-- [보기 3-1] -->
																<tr>
																	<td></td>
																	<td id="quesitem31" class="question02_qpass">
																		<a href="javascript:answer_check(3, 1)">① 프로시저</a>
																	</td>
																</tr>
																
																<!-- [보기 3-2] -->
																<tr>
																	<td></td>
																	<td id="quesitem32" class="question02_qpass">
																		<a href="javascript:answer_check(3, 2)">② 트랜잭션</a>
																	</td>
																</tr>
																
																<!-- [보기 3-3] -->
																<tr>
																	<td></td>
																	<td id="quesitem33" class="question02_qpass">
																		<a href="javascript:answer_check(3, 3)">③ 12</a>
																	</td>
																</tr>
																
																<!-- [보기 3-4] -->
																<tr>
																	<td></td>
																	<td id="quesitem34" class="question02_qpass">
																		<a href="javascript:answer_check(3, 4)">④ 도메인</a>
																	</td>
																</tr>
															</tbody>
														</table>
														
														<p style="margin:15px 0px 10px 16px;">
															<input type="button" value="이전" onclick="previous_div('1과목', 0, 2)" class="btn01_qpass"/>
															<input type="button" value="다음" onclick="next_div('1과목', 0, 2)" class="btn01_qpass"/>
														</p>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
									
									<!-- [문제 4] -->
									<div id="div03" style="display: none; width: 100%; height: 100%;">
										<table width="100%" cellspacing="0" cellpadding="0" style="margin-top:0px;" border="0">
											<tbody>
												<tr>
													<td width="100%" valign="top" class="ed" style="padding-top:5px;">
														<div id="ques_ox4" style="margin:0px; position:absolute; width:55px; height:45px;">
															<img src="<%=cp%>/resource/images/blank.gif" style="width:55px; height:45px;">
														</div>
														<table style="margin-bottom:10px; width:100%; height:150px; border:0" cellspacing="0" cellpadding="5">
															<tbody>
																<tr>	
																	<td style="padding-left:8px; width:25px; text-align:right" valign="top" class="count_qpass">4.</td>
																	<td style="width:98%" valign="top" class="question01_qpass">뷰에 대한 설명으로 틀린 것은? <br>
																		<span id="rate4" class="rightRate" style="display:none">[정답률: 63%]</span>
																	</td>
																</tr>
																
																<tr>
																	<td></td>
																	<td id="quesitem41" class="question02_qpass">
																		<a href="javascript:answer_check(4, 1)">① 뷰에 대한 사용자의 권한을 제한할 수 있다.</a>
																	</td>
																</tr>
																
																<tr>
																	<td></td>
																	<td id="quesitem42" class="question02_qpass">
																		<a href="javascript:answer_check(4, 2)">② 뷰 테이블에 행이나 열을 추가할 때에는 ALTER 문을 사용하여야 한다.</a>
																	</td>
																</tr>
																
																<tr>
																	<td></td>
																	<td id="quesitem43" class="question02_qpass" style="background-repeat: no-repeat;">
																		<a href="javascript:answer_check(4, 3)">③ 뷰는 다른 뷰를 대상으로 설정될 수 있다.</a>
																	</td>
																</tr>
																
																<tr>
																	<td></td>
																	<td id="quesitem44" class="question02_qpass">
																		<a href="javascript:answer_check(4, 4)">④ 뷰 테이블은 물리적으로 구현된 것은 아니다.</a>
																	</td>
																</tr>
															</tbody>
														</table>
													<p style="margin:15px 0px 10px 16px;">
														<input type="button" value="이전" onclick="previous_div('1과목', 0, 3)" class="btn01_qpass">
														<input type="button" value="다음" onclick="next_div('1과목', 0, 3)" class="btn01_qpass">
													</p>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
								
								<!-- [문제 5] -->
								<div id="div04" style="display: none; width: 100%; height: 100%;">
									<table width="100%" cellspacing="0" cellpadding="0" style="margin-top:0px;" border="0">
										<tbody>
											<tr>
												<td width="100%" valign="top" class="ed" style="padding-top:5px;">
													<div id="ques_ox5" style="margin:0px; position:absolute; width:55px; height:45px;">
														<img src="<%=cp%>/resource/images/blank.gif" style="width:55px; height:45px;">
													</div>
													<table style="margin-bottom:10px; width:100%; height:150px; border:0" cellspacing="0" cellpadding="5">
														<tbody>
															<tr>
																<td style="padding-left:8px; width:25px; text-align:right" valign="top" class="count_qpass">5.</td>
																<td style="width:98%" valign="top" class="question01_qpass">깊이가 5인 이진트리에서 가질 수 있는 최대 노드 수는? <br>
																	<span id="rate5" class="rightRate" style="display:none">[정답률: 66%]</span>
																</td>
															</tr>
															<tr>
																<td></td>
																<td id="quesitem51" class="question02_qpass">
																	<a href="javascript:answer_check(5, 1)">① 25</a>
																</td>
															</tr>
															<tr>
																<td></td>
																<td id="quesitem52" class="question02_qpass">
																	<a href="javascript:answer_check(5, 2)">② 31</a>
																</td>
															</tr>
															<tr>
																<td></td>
																<td id="quesitem53" class="question02_qpass" style="background-repeat: no-repeat;">
																	<a href="javascript:answer_check(5, 3)">③ 35</a>
																</td>
															</tr>
															<tr>
																<td></td>
																<td id="quesitem54" class="question02_qpass">
																	<a href="javascript:answer_check(5, 4)">④ 42</a>
																</td>
															</tr>
														</tbody>
													</table>
													<p style="margin:15px 0px 10px 16px;">
														<input type="button" value="이전" onclick="previous_div('1과목', 0, 4)" class="btn01_qpass">
														<input type="button" value="다음" onclick="next_div('1과목', 0, 4)" class="btn01_qpass">
													</p>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
								
								<!-- [문제 6] -->
								<div id="div05" style="display: none; width: 100%; height: 100%;">
									<table width="100%" cellspacing="0" cellpadding="0" style="margin-top:0px;" border="0">
										<tbody>
											<tr>
												<td width="100%" valign="top" class="ed" style="padding-top:5px;">
													<div id="ques_ox6" style="margin:0px; position:absolute; width:55px; height:45px;">
														<img src="<%=cp%>/resource/images/blank.gif" style="width:55px; height:45px;">
													</div>
													<table style="margin-bottom:10px; width:100%; height:150px; border:0" cellspacing="0" cellpadding="5">
														<tbody>
															<tr>
																<td style="padding-left:8px; width:25px; text-align:right" valign="top" class="count_qpass">6.</td>
																<td style="width:98%" valign="top" class="question01_qpass">로킹기법에서 2단계 로킹 규약에 대한 설명으로 옳은 것은? <br>
																	<span id="rate6" class="rightRate" style="display:none">[정답률: 34%]</span>
																</td>
															</tr>
															<tr>
																<td></td>
																<td id="quesitem61" class="question02_qpass">
																	<a href="javascript:answer_check(6, 1)">① 트랜잭션은 lock만 수행할 수 있고, unlock은 수행할 수 없는 확장단계가 있다.</a>
																</td>
															</tr>
															<tr>
																<td></td>
																<td id="quesitem62" class="question02_qpass">
																	<a href="javascript:answer_check(6, 2)">② 트랜잭션이 unlock과 lock을 동시에 수행할 수 있는 단계를 병렬전환 단계라 한다.</a>
																</td>
															</tr>
															<tr>
																<td></td>
																<td id="quesitem63" class="question02_qpass" style="background-repeat: no-repeat;">
																	<a href="javascript:answer_check(6, 3)">③ 한 트랜잭션이 unlock 후 다른 데이터 아이템을 lock 할 수 있다.</a>
																</td>
															</tr>
															<tr>
																<td></td>
																<td id="quesitem64" class="question02_qpass">
																	<a href="javascript:answer_check(6, 4)">④ 교착상태를 일으키지 않는다.</a>
																</td>
															</tr>
														</tbody>
													</table>
													<p style="margin:15px 0px 10px 16px;">
														<input type="button" value="이전" onclick="previous_div('1과목', 0, 5)" class="btn01_qpass">
														<input type="button" value="다음" onclick="next_div('1과목', 0, 5)" class="btn01_qpass">
													</p>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							
								<!-- [문제 7] -->
								<div id="div06" style="display: none; width: 100%; height: 100%;">
									<table width="100%" cellspacing="0" cellpadding="0" style="margin-top:0px;" border="0">
											<tbody>
												<tr>
													<td width="100%" valign="top" class="ed" style="padding-top:5px;">
														<div id="ques_ox7" style="margin:0px; position:absolute; width:55px; height:45px;">
															<img src="<%=cp%>/resource/images/blank.gif" style="width:55px; height:45px;">
														</div>
														<table style="margin-bottom:10px; width:100%; height:150px; border:0" cellspacing="0" cellpadding="5">
															<tbody>
																<tr>
																	<td style="padding-left:8px; width:25px; text-align:right" valign="top" class="count_qpass">7.</td>
																	<td style="width:98%" valign="top" class="question01_qpass">자료구조에 대한 설명으로 옳지 않은 것은? <br>
																		<span id="rate7" class="rightRate" style="display:none">[정답률: 49%]</span>
																	</td>
																</tr>
																<tr>
																	<td></td>
																	<td id="quesitem71" class="question02_qpass">
																		<a href="javascript:answer_check(7, 1)">① 스택은 Last In - First Out 처리를 수행한다.</a>
																	</td>
																</tr>
																<tr>
																	<td></td>
																	<td id="quesitem72" class="question02_qpass">
																		<a href="javascript:answer_check(7, 2)">② 큐는 First In - First Out 처리를 수행한다.</a>
																	</td>
																</tr>
																<tr>
																	<td></td>
																	<td id="quesitem73" class="question02_qpass">
																		<a href="javascript:answer_check(7, 3)">③ 스택은 서브루틴 호출, 인터럽트 처리, 수식 계산 및 수식 표기법에 응용된다.</a>
																	</td>
																</tr>
																<tr>
																	<td></td>
																	<td id="quesitem74" class="question02_qpass">
																		<a href="javascript:answer_check(7, 4)">④ 큐는 비선형구조에 해당한다.</a>
																	</td>
																</tr>
															</tbody>
														</table>
														<p style="margin:15px 0px 10px 16px;">
															<input type="button" value="이전" onclick="previous_div('1과목', 0, 6)" class="btn01_qpass">
															<input type="button" value="다음" onclick="next_div('1과목', 0, 6)" class="btn01_qpass">
														</p>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
									
									<!-- [문제 8] -->
									<div id="div07" style="display: none; width: 100%; height: 100%;">
										<table width="100%" cellspacing="0" cellpadding="0" style="margin-top:0px;" border="0">
											<tbody>
												<tr>
													<td width="100%" valign="top" class="ed" style="padding-top:5px;">
														<div id="ques_ox8" style="margin:0px; position:absolute; width:55px; height:45px;">
															<img src="<%=cp%>/resource/images/blank.gif" style="width:55px; height:45px;">
														</div>
														<table style="margin-bottom:10px; width:100%; height:150px; border:0" cellspacing="0" cellpadding="5">
															<tbody>
																<tr>
																	<td style="padding-left:8px; width:25px; text-align:right" valign="top" class="count_qpass">8.</td>
																	<td style="width:98%" valign="top" class="question01_qpass">데이터베이스에서 개념적 설계 단계에 대한 설명으로 틀린 것은? <br>
																		<span id="rate8" class="rightRate" style="display:none">[정답률: 47%]</span>
																	</td>
																</tr>
																<tr>
																	<td></td>
																	<td id="quesitem81" class="question02_qpass">
																		<a href="javascript:answer_check(8, 1)">① 산출물로 ER-D가 만들어진다.</a>
																	</td>
																</tr>
																<tr>
																	<td></td>
																	<td id="quesitem82" class="question02_qpass">
																		<a href="javascript:answer_check(8, 2)">② DBMS에 독립적인 개념 스키마를 설계한다.</a>
																	</td>
																</tr>
																<tr>
																	<td></td>
																	<td id="quesitem83" class="question02_qpass" style="background-repeat: no-repeat;">
																		<a href="javascript:answer_check(8, 3)">③ 트랜잭션 인터페이스를 설계한다.</a>
																	</td>
																</tr>
																<tr>
																	<td></td>
																	<td id="quesitem84" class="question02_qpass">
																		<a href="javascript:answer_check(8, 4)">④ 논리적 설계 단계의 앞 단계에서 수행된다.</a>
																	</td>
																</tr>
															</tbody>
														</table>
														<p style="margin:15px 0px 10px 16px;">
															<input type="button" value="이전" onclick="previous_div('1과목', 0, 7)" class="btn01_qpass">
															<input type="button" value="다음" onclick="next_div('1과목', 0, 7)" class="btn01_qpass">
														</p>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
									
									<!-- [문제 9] -->
									<div id="div08" style="display: none; width: 100%; height: 100%;">
										<table width="100%" cellspacing="0" cellpadding="0" style="margin-top:0px;" border="0">
											<tbody>
												<tr>
													<td width="100%" valign="top" class="ed" style="padding-top:5px;">
														<div id="ques_ox9" style="margin:0px; position:absolute; width:55px; height:45px;">
															<img src="<%=cp%>/resource/images/blank.gif" style="width:55px; height:45px;">
														</div>
														<table style="margin-bottom:10px; width:100%; height:150px; border:0" cellspacing="0" cellpadding="5">
															<tbody>
																<tr>
																	<td style="padding-left:8px; width:25px; text-align:right" valign="top" class="count_qpass">9.</td>
																	<td style="width:98%" valign="top" class="question01_qpass">정규화 과정 중 1NF에서 2NF가 되기 위한 조건은? <br>
																		<span id="rate9" class="rightRate" style="display:none">[정답률: 61%]</span>
																	</td>
																</tr>
																<tr>
																	<td></td>
																	<td id="quesitem91" class="question02_qpass">
																		<a href="javascript:answer_check(9, 1)">① 1NF를 만족하고 모든 도메인이 원자 값이어야 한다.</a>
																	</td>
																</tr>
																<tr>
																	<td></td>
																	<td id="quesitem92" class="question02_qpass">
																		<a href="javascript:answer_check(9, 2)">② 1NF를 만족하고 키가 아닌 모든 애트리뷰트들이 기본 키에 이행적으로 함수 종속되지 않아야 한다.</a>
																	</td>
																</tr>
																<tr>
																	<td></td>
																	<td id="quesitem93" class="question02_qpass">
																		<a href="javascript:answer_check(9, 3)">③ 1NF를 만족하고 다치 종속이 제거되어야 한다.</a>
																	</td>
																</tr>
																<tr>
																	<td></td>
																	<td id="quesitem94" class="question02_qpass">
																		<a href="javascript:answer_check(9, 4)">④ 1NF를 만족하고 키가 아닌 모든 속성이 기본 키에 완전 함수적 종속되어야 한다.</a>
																	</td>
																</tr>
															</tbody>
														</table>
														<p style="margin:15px 0px 10px 16px;">
															<input type="button" value="이전" onclick="previous_div('1과목', 0, 8)" class="btn01_qpass">
															<input type="button" value="다음" onclick="next_div('1과목', 0, 8)" class="btn01_qpass">
														</p>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
									
									<!-- [문제 10] -->
									<div id="div09" style="display: none; width: 100%; height: 100%;">
										<table width="100%" cellspacing="0" cellpadding="0" style="margin-top:0px;" border="0">
											<tbody>
												<tr>
													<td width="100%" valign="top" class="ed" style="padding-top:5px;">
														<div id="ques_ox10" style="margin:0px; position:absolute; width:55px; height:45px;">
															<img src="<%=cp%>/resource/images/blank.gif" style="width:55px; height:45px;">
														</div>
														<table style="margin-bottom:10px; width:100%; height:150px; border:0" cellspacing="0" cellpadding="5">
															<tbody>
																<tr>
																	<td style="padding-left:8px; width:25px; text-align:right" valign="top" class="count_qpass">10.</td>
																	<td style="width:98%" valign="top" class="question01_qpass">Which of the following does not belong to the DML statement of SQL? <br>
																		<span id="rate10" class="rightRate" style="display:none">[정답률: 65%]</span>
																	</td>
																</tr>
																<tr>
																	<td></td>
																	<td id="quesitem101" class="question02_qpass">
																		<a href="javascript:answer_check(10, 1)">① SELECT</a>
																	</td>
																</tr>
																<tr>
																	<td></td>
																	<td id="quesitem102" class="question02_qpass">
																		<a href="javascript:answer_check(10, 2)">② DELETE</a>
																	</td>
																</tr>
																<tr>
																	<td></td>
																	<td id="quesitem103" class="question02_qpass" style="background-repeat: no-repeat;">
																		<a href="javascript:answer_check(10, 3)">③ CREATE</a>
																	</td>
																</tr>
																<tr>
																	<td></td>
																	<td id="quesitem104" class="question02_qpass">
																		<a href="javascript:answer_check(10, 4)">④ INSERT</a>
																	</td>
																</tr>
															</tbody>
														</table>
														<p style="margin:15px 0px 10px 16px;">
															<input type="button" value="이전" onclick="previous_div('1과목', 0, 9)" class="btn01_qpass">
															<input type="button" value="다음" onclick="next_div('1과목', 0, 9)" class="btn01_qpass">
														</p>
													</td>
												</tr>
											</tbody>
										</table>
									</div> 
								
								<td style="padding-left:4px; border:none; width:130px;" valign="top"><!-- 답안지 출력 -->
									<div id="ans0" style="display: block;width: 100%;height: 100%;padding-left: 0px;border-bottom: saddlebrown;">
										<table width="100%" height="30" align="center" cellspacing="0" cellpadding="2">
											<tbody>
												<tr>
													<td align="center" style="color:green; font-weight:bold; border:solid 1px #ccc; border-bottom:none">답안지</td>
												</tr>
											</tbody>
										</table>
													
										<table style="width:100%;text-align:center;border-bottom: 1px solid #bdbdbd;" cellspacing="0" cellpadding="0" border="0px">
											<tbody>
												<tr style="height:25px;">
													<td id="ans_num1" style="font-weight:bold; color:#008000; text-align:center;" class="td_border_common_qpass">
														<a href="javascript:move2question(0)" style="color:#008000;">1</a>
													</td>
													<td id="ans_td11" width="24px" align="center" valign="middle" class="td_border_common_qpass">
														<a href="javascript:answer_check(1, 1)"><img id="answer11" src="/wooltari/resource/images/num1.gif"></a>
													</td>
													<td id="ans_td12" width="24px" align="center" valign="middle" class="td_border_common_qpass">
														<a href="javascript:answer_check(1, 2)"><img id="answer12" src="/wooltari/resource/images/num2.gif"></a>
													</td>
													<td id="ans_td13" width="24px" align="center" valign="middle" class="td_border_common_qpass">
														<a href="javascript:answer_check(1, 3)"><img id="answer13" src="/wooltari/resource/images/num3.gif"></a>
													</td>
													<td id="ans_td14" width="24px" align="center" valign="middle" class="td_border_right_qpass">
														<a href="javascript:answer_check(1, 4)"><img id="answer14" src="/wooltari/resource/images/num4.gif"></a>
													</td>
												</tr>

												<tr style="height:25px;">
													<td id="ans_num2" style="font-weight:bold; color:#008000; text-align:center;" class="td_border_common_qpass">
														<a href="javascript:move2question(1)" style="color:#008000;">2</a>
													</td>
													<td id="ans_td21" width="24px" align="center" valign="middle" class="td_border_common_qpass">
														<a href="javascript:answer_check(2, 1)"><img id="answer21" src="/wooltari/resource/images/num1.gif"></a>
													</td>
													<td id="ans_td22" width="24px" align="center" valign="middle" class="td_border_common_qpass">
														<a href="javascript:answer_check(2, 2)"><img id="answer22" src="/wooltari/resource/images/num2.gif"></a>
													</td>
													<td id="ans_td23" width="24px" align="center" valign="middle" class="td_border_common_qpass">
														<a href="javascript:answer_check(2, 3)"><img id="answer23" src="/wooltari/resource/images/num3.gif"></a>
													</td>
													<td id="ans_td24" width="24px" align="center" valign="middle" class="td_border_right_qpass">
														<a href="javascript:answer_check(2, 4)"><img id="answer24" src="/wooltari/resource/images/num4.gif"></a>
													</td>
												</tr>
												
												<tr style="height:25px;">
													<td id="ans_num3" style="font-weight:bold; color:#008000; text-align:center;" class="td_border_common_qpass">
														<a href="javascript:move2question(2)" style="color:#008000;">3</a>
													</td>
													<td id="ans_td31" width="24px" align="center" valign="middle" class="td_border_common_qpass">
														<a href="javascript:answer_check(3, 1)"><img id="answer31" src="/wooltari/resource/images/num1.gif"></a>
													</td>
													<td id="ans_td32" width="24px" align="center" valign="middle" class="td_border_common_qpass">
														<a href="javascript:answer_check(3, 2)"><img id="answer32" src="/wooltari/resource/images/num2.gif"></a>
													</td>
													<td id="ans_td33" width="24px" align="center" valign="middle" class="td_border_common_qpass">
														<a href="javascript:answer_check(3, 3)"><img id="answer33" src="/wooltari/resource/images/num3.gif"></a>
													</td>
													<td id="ans_td34" width="24px" align="center" valign="middle" class="td_border_right_qpass">
														<a href="javascript:answer_check(3, 4)"><img id="answer34" src="/wooltari/resource/images/num4.gif"></a>
													</td>
												</tr>
												
												<tr style="height:25px;">
													<td id="ans_num4" style="font-weight:bold; color:#008000; text-align:center;" class="td_border_common_qpass">
														<a href="javascript:move2question(3)" style="color:#008000;">4</a>
													</td>
													
													<td id="ans_td41" width="24px" align="center" valign="middle" class="td_border_common_qpass">
														<a href="javascript:answer_check(4, 1)"><img id="answer41" src="/wooltari/resource/images/num1.gif"></a>
													</td>
													<td id="ans_td42" width="24px" align="center" valign="middle" class="td_border_common_qpass">
														<a href="javascript:answer_check(4, 2)"><img id="answer42" src="/wooltari/resource/images/num2.gif"></a>
													</td>
													<td id="ans_td43" width="24px" align="center" valign="middle" class="td_border_common_qpass">
														<a href="javascript:answer_check(4, 3)"><img id="answer43" src="/wooltari/resource/images/num3.gif"></a>
													</td>
													<td id="ans_td44" width="24px" align="center" valign="middle" class="td_border_right_qpass">
														<a href="javascript:answer_check(4, 4)"><img id="answer44" src="/wooltari/resource/images/num4.gif"></a>
													</td>
												</tr>
												
												<tr style="height:25px;">
													<td id="ans_num5" style="font-weight:bold; color:#008000; text-align:center;" class="td_border_common_qpass">
														<a href="javascript:move2question(4)" style="color:#008000;">5</a>
													</td>
													
													<td id="ans_td51" width="24px" align="center" valign="middle" class="td_border_common_qpass">
														<a href="javascript:answer_check(5, 1)"><img id="answer51" src="/wooltari/resource/images/num1.gif"></a>
													</td>
													<td id="ans_td52" width="24px" align="center" valign="middle" class="td_border_common_qpass">
														<a href="javascript:answer_check(5, 2)"><img id="answer52" src="/wooltari/resource/images/num2.gif"></a>
													</td>
													<td id="ans_td53" width="24px" align="center" valign="middle" class="td_border_common_qpass">
														<a href="javascript:answer_check(5, 3)"><img id="answer53" src="/wooltari/resource/images/num3.gif"></a>
													</td>
													<td id="ans_td54" width="24px" align="center" valign="middle" class="td_border_right_qpass">
														<a href="javascript:answer_check(5, 4)"><img id="answer54" src="/wooltari/resource/images/num4.gif"></a>
													</td>
												</tr>
												
												<tr style="height:25px;">
													<td id="ans_num6" style="font-weight:bold; color:#008000; text-align:center;" class="td_border_common_qpass">
														<a href="javascript:move2question(5)" style="color:#008000;">6</a>
													</td>
													
													<td id="ans_td61" width="24px" align="center" valign="middle" class="td_border_common_qpass">
														<a href="javascript:answer_check(6, 1)"><img id="answer61" src="/wooltari/resource/images/num1.gif"></a>
													</td>
													<td id="ans_td62" width="24px" align="center" valign="middle" class="td_border_common_qpass">
														<a href="javascript:answer_check(6, 2)"><img id="answer62" src="/wooltari/resource/images/num2.gif"></a>
													</td>
													<td id="ans_td63" width="24px" align="center" valign="middle" class="td_border_common_qpass">
														<a href="javascript:answer_check(6, 3)"><img id="answer63" src="/wooltari/resource/images/num3.gif"></a>
													</td>
													<td id="ans_td64" width="24px" align="center" valign="middle" class="td_border_right_qpass">
														<a href="javascript:answer_check(6, 4)"><img id="answer64" src="/wooltari/resource/images/num4.gif"></a>
													</td>
												</tr>
												
												<tr style="height:25px;">
													<td id="ans_num7" style="font-weight:bold; color:#008000; text-align:center;" class="td_border_common_qpass">
														<a href="javascript:move2question(6)" style="color:#008000;">7</a>
													</td>
													
													<td id="ans_td71" width="24px" align="center" valign="middle" class="td_border_common_qpass">
														<a href="javascript:answer_check(7, 1)"><img id="answer71" src="/wooltari/resource/images/num1.gif"></a>
													</td>
													<td id="ans_td72" width="24px" align="center" valign="middle" class="td_border_common_qpass">
														<a href="javascript:answer_check(7, 2)"><img id="answer72" src="/wooltari/resource/images/num2.gif"></a>
													</td>
													<td id="ans_td73" width="24px" align="center" valign="middle" class="td_border_common_qpass">
														<a href="javascript:answer_check(7, 3)"><img id="answer73" src="/wooltari/resource/images/num3.gif"></a>
													</td>
													<td id="ans_td74" width="24px" align="center" valign="middle" class="td_border_right_qpass">
														<a href="javascript:answer_check(7, 4)"><img id="answer74" src="/wooltari/resource/images/num4.gif"></a>
													</td>
												</tr>
												
												<tr style="height:25px;">
													<td id="ans_num8" style="font-weight:bold; color:#008000; text-align:center;" class="td_border_common_qpass">
														<a href="javascript:move2question(7)" style="color:#008000;">8</a>
													</td>
													
													<td id="ans_td81" width="24px" align="center" valign="middle" class="td_border_common_qpass">
														<a href="javascript:answer_check(8, 1)"><img id="answer81" src="/wooltari/resource/images/num1.gif"></a>
													</td>
													<td id="ans_td82" width="24px" align="center" valign="middle" class="td_border_common_qpass">
														<a href="javascript:answer_check(8, 2)"><img id="answer82" src="/wooltari/resource/images/num2.gif"></a>
													</td>
													<td id="ans_td83" width="24px" align="center" valign="middle" class="td_border_common_qpass">
														<a href="javascript:answer_check(8, 3)"><img id="answer83" src="/wooltari/resource/images/num3.gif"></a>
													</td>
													<td id="ans_td84" width="24px" align="center" valign="middle" class="td_border_right_qpass">
														<a href="javascript:answer_check(8, 4)"><img id="answer84" src="/wooltari/resource/images/num4.gif"></a>
													</td>
												</tr>
												
												<tr style="height:25px;">
													<td id="ans_num9" style="font-weight:bold; color:#008000; text-align:center;" class="td_border_common_qpass">
														<a href="javascript:move2question(8)" style="color:#008000;">9</a>
													</td>
													
													<td id="ans_td91" width="24px" align="center" valign="middle" class="td_border_common_qpass">
														<a href="javascript:answer_check(9, 1)"><img id="answer91" src="/wooltari/resource/images/num1.gif"></a>
													</td>
													<td id="ans_td92" width="24px" align="center" valign="middle" class="td_border_common_qpass">
														<a href="javascript:answer_check(9, 2)"><img id="answer92" src="/wooltari/resource/images/num2.gif"></a>
													</td>
													<td id="ans_td93" width="24px" align="center" valign="middle" class="td_border_common_qpass">
														<a href="javascript:answer_check(9, 3)"><img id="answer93" src="/wooltari/resource/images/num3.gif"></a>
													</td>
													<td id="ans_td94" width="24px" align="center" valign="middle" class="td_border_right_qpass">
														<a href="javascript:answer_check(9, 4)"><img id="answer94" src="/wooltari/resource/images/num4.gif"></a>
													</td>
												</tr>
												
												<tr style="height:25px;">
													<td id="ans_num10" style="font-weight:bold; color:#008000; text-align:center;" class="td_border_common_qpass">
														<a href="javascript:move2question(9)" style="color:#008000;">10</a>
													</td>
													
													<td id="ans_td101" width="24px" align="center" valign="middle" class="td_border_common_qpass">
														<a href="javascript:answer_check(10, 1)"><img id="answer101" src="/wooltari/resource/images/num1.gif"></a>
													</td>
													<td id="ans_td102" width="24px" align="center" valign="middle" class="td_border_common_qpass">
														<a href="javascript:answer_check(10, 2)"><img id="answer102" src="/wooltari/resource/images/num2.gif"></a>
													</td>
													<td id="ans_td103" width="24px" align="center" valign="middle" class="td_border_common_qpass">
														<a href="javascript:answer_check(10, 3)"><img id="answer103" src="/wooltari/resource/images/num3.gif"></a>
													</td>
													<td id="ans_td104" width="24px" align="center" valign="middle" class="td_border_right_qpass">
														<a href="javascript:answer_check(10, 4)"><img id="answer104" src="/wooltari/resource/images/num4.gif"></a>
													</td>
												</tr>
											</tbody>
										</table>
										
										<p id="btnFinish0" align="center" style="display:block; margin: 10px 0px 0px 0px;">
											<input type="button" value="답안제출" onclick="finish_exam(0);" class="btn01_qpass" style="width:70px;"/>
										</p>
										<p id="resultDisplay0" align="center" style="margin: 10px 0px 0px 0px;"></p>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
									
					<script src="../q/js/jquery.js" type="text/javascript"></script>
					<script src="../q/js/quest_insert.js" type="text/javascript"></script>
					
					<script>
						/* 첫화면으로 이동*/
						function move2main() {
						  if(confirm("포기하실거에요?")) {
						    self.close();
						  }
						}
						
						/* 인덱스에서의 선택 처리*/
						function start_test(i, mode, startNum, eachTotal, n) {
							var f = document.test_form;
							targetDiv = i-1;
						
							index_div.style.display='none';
						
							f.mode.value = mode;
							document.getElementById('current_mode').value = mode;
							document.getElementById('current_startNum').value = startNum;
							document.getElementById('current_questionTotal').value = eachTotal;
						
							var finishBtn = document.getElementById('btnFinish'+ targetDiv);
							var resultDisplay = document.getElementById('resultDisplay'+targetDiv);
							resultDisplay.innerHTML = "";
						
							if(mode == "first") { /* 응시하기*/
							}
							else if(mode == "restudy") { /* 다시풀기*/
								unscoring_targetDiv(targetDiv, startNum, eachTotal);
								finishBtn.style.display = "block";
							}	
							else if(mode == "restudyCheck") { /* 다시풀기 결과확인하기*/
								scoring_targetDiv(targetDiv, startNum, eachTotal, "");
								finishBtn.style.display = "none";
						}
							else if(mode == "check") { /* 응시결과 확인하기*/
								unscoring_targetDiv(targetDiv, startNum, eachTotal); /* 체크후 답안제출없이 첫화면으로 이동시 리셋이 필요*/
								resave_ansTry(startNum, eachTotal);
								scoring_targetDiv(targetDiv, startNum, eachTotal, "");
								finishBtn.style.display = "none";
							}	
							else if(mode == "incorrect") { /* 틀린문제 다시풀기*/
								unscoring_targetDiv(targetDiv, startNum, eachTotal); /* 체크후 답안제출없이 첫화면으로 이동시 리셋이 필요*/
								resave_ansTry(startNum, eachTotal);
								scoring_targetDiv(targetDiv, startNum, eachTotal, "");
								finishBtn.style.display = "block";
							}	
							else if(mode == "incorrectCheck") { /* 틀린문제 다시풀기 결과확인하기*/
								scoring_targetDiv(targetDiv, startNum, eachTotal, "");
								finishBtn.style.display = "none";
							}	
						
							if(typeof(n) == "undefined" || !n) n = 0;
								replace_div(targetDiv, n);
								document.getElementById('index_div').style.visibility = 'hidden';
						}
						
						function resave_ansTry(startNum, eachTotal) {
							var tryNum;
							var endNum = startNum + eachTotal - 1;
						
							for(var i=startNum; i <= endNum; i++) {
								tryNum = document.getElementById('ans_trySame'+i).value;
								document.getElementById('ans_try'+i).value = tryNum;
							}
						}
						
						
						function restore_exam(targetDiv, course) {
							if(!confirm(course + " 시험을 정말 응시이전의 상태로 되돌립니까?\t")) return;
							var f = document.test_form;
							f.mode.value = "return";
							f.targetDiv.value = targetDiv;
							f.submit();
						}
						
						/* 해당 구역으로 이동*/
						function replace_div(divNum, fiveNum) {
							/* 현재 블럭 감추기*/
							var currentI = document.getElementById('current_i').value;
							var currentJ = document.getElementById('current_j').value;
							var currentDiv = document.getElementById('div'+ currentI + currentJ);
							currentDiv.style.display = "none";
							
							/* 대상 블럭 보이기*/
							var targetDiv = document.getElementById("div"+ divNum + fiveNum);
							targetDiv.style.display = "block";
							/*alert(fiveNum); return;*/
						
							/* 해당 답안지 변경*/
							var targetAns = document.getElementById("ans"+divNum);
							targetAns.style.display = "block";
						
							document.getElementById('current_i').value = divNum;
							document.getElementById('current_j').value = fiveNum;
						}
						
						/* 채점 표시 전부 없애기*/
						function unscoring_targetDiv(targetDiv, startNum, eachTotal) {
							var f = document.test_form;
							var ans_try, ans_real;
							var endNum = startNum + eachTotal - 1;
							var itemType;
						
							for(var i=startNum; i <= endNum; i++) {
								/* 문제지 번호*/
								document.getElementById('ques_ox'+i).style.backgroundImage = "";
									
								/* 문제지 문항*/
								for(var j=1; j<=4; j++) {
									itemType = document.getElementById('quesitem'+i+j);
									if(itemType != null) document.getElementById('quesitem'+i+j).style.backgroundImage = "";
								}
						
								// 정답률
								if(
									document.getElementById('rate'+i) ) {
									document.getElementById('rate'+i).style.display = "none";
								}
						
								/* 해설 안보이게 처리 */
								if(
									document.getElementById('comment'+i) ) {
									document.getElementById('comment'+i).style.display = "none";
								}
								
								/* 답안지 번호*/
								document.getElementById('ans_num'+i).style.backgroundImage = "";
						
								/* 답안지 문항*/
								for(var j=1; j<=4; j++) {
								itemType = document.getElementById('answer'+i+j);
						
								/*if(i>= 4) alert("type01 : "+ i+ j + itemType);*/
								if(itemType != null) document.getElementById('answer'+i+j).src = "<%=cp%>/resource/images/num"+ j + ".gif";
								else if( document.getElementById('ansInsert_text'+i) ) { /* 주관식*/
									var insSpan = document.getElementById('ansInsert_span'+i);
									var insText = document.getElementById('ansInsert_text'+i);
						
									insSpan.style.display = "none";
									insText.value = "";
									insText.style.display = "";
								}
								}
								
								/* 답안지 정답 체크*/
								for(var j=1; j<=4; j++) {
									itemType = document.getElementById('ans_td'+i+j);
									if(itemType != null) document.getElementById('ans_td'+i+j).style.backgroundImage = "";
								}
								
								/* 응시기록 리셋*/
								document.getElementById('ans_try'+i).value = "";
							}
						}
						
						function scoring_targetDiv(targetDiv, startNum, eachTotal, answerMode) {
							var f = document.test_form;
							var ans_try, ans_real, selectType, oxState;
							var correctCount=0;
							var mode = document.getElementById('current_mode').value;
							var endNum = eval(startNum) + eval(eachTotal) - 1;
						
							for(var i=startNum; i <= endNum; i++) {
								ans_try = document.getElementById('ans_try'+i).value;
								ans_real = document.getElementById('ans_real'+i).value;
						
								/* 주관/객관 설정변수*/
								if( document.getElementById('ansInsert_span'+i) ) selectType = 1;
								else { selectType = 0; }
						
								oxState = get_OX_state(ans_try, ans_real, selectType);
						
								// 정답률
								if( mode != "incorrect" && document.getElementById('rate'+i) ) { document.getElementById('rate'+i).style.display = "inline"; }
						
								/* 해설 뷰*/
								if( document.getElementById('comment'+i) ) {
									if(mode != "incorrect" || answerMode == "one") { document.getElementById('comment'+i).style.display = "block"; }
								}
						
								/* 1단계 : 문제지 문항, 답안지 문항에 정답,오답 표시*/
								if(oxState.substr(0,1) == "1") { /* 정답*/
									correctCount++;
						
									/* 문제지 문제번호에 o 표시*/
									document.getElementById('ques_ox'+i).style.backgroundImage = "url('<%=cp%>/resource/images/re_o.gif')";
						
									/* 답안지 문제번호에 o 표시*/
									document.getElementById('ans_num'+i).style.backgroundImage = "url('<%=cp%>/resource/images/ans_O.gif')";
									document.getElementById('ans_num'+i).style.backgroundRepeat = "no-repeat";
								
								}
								else { /* 오답*/
									if(mode != "incorrect" || answerMode == "one") { /* 틀린문제풀기에서 오답은 그냥둠*/
										/* 문제지 문제번호에 x 표시*/
										document.getElementById('ques_ox'+i).style.backgroundImage = "url('<%=cp%>/resource/images/re_x.gif')";
											
										/* 답안지 문제번호에 x 표시*/
										document.getElementById('ans_num'+i).style.backgroundImage = "url('<%=cp%>/resource/images/x24.gif')";
										document.getElementById('ans_num'+i).style.backgroundRepeat = "no-repeat";
									}
								}
						
								/* 2단계 : 답안지에서 정답 표시(복수정답 고려)*/
								if( selectType == 0 ) { /* 객관식*/
									if(mode == "incorrect" && oxState.substr(0,1) == "0" && answerMode == "") { /* 틀린문제풀기에서 오답이면 패스*/	}
									else {			
										if(oxState.length == 1) { /* 단수정답*/
										document.getElementById('ans_td'+i+ans_real).style.backgroundImage = "url('<%=cp%>/resource/images/circle_blue22.gif')";
										document.getElementById('ans_td'+i+ans_real).style.backgroundRepeat = "no-repeat";
										}
										else { /* 복수정답*/
											for(var j=1; j <= oxState.length-1; j++) { /* 1, 0 자리 고려*/
												ans_index = oxState.substr(j,1);
												document.getElementById('ans_td'+i+ans_index).style.backgroundImage = "url('<%=cp%>/resource/images/circle_blue22.gif')";
												document.getElementById('ans_td'+i+ans_index).style.backgroundRepeat = "no-repeat";
											}
										}
									}
								}
								else if( document.getElementById('ansInsert_span'+i) ) { /* 주관식*/
								var insSpan = document.getElementById('ansInsert_span'+i);
									var insText = document.getElementById('ansInsert_text'+i);
						
									insSpan.innerHTML = "<span style='color:blue; font-weight:bold'>"+ ans_real + "</span>/" + ans_try;
						
									if(mode == "incorrect" && oxState.substr(0,1) == "0") {
										insSpan.style.display = "none";
									insText.style.display = "";
									}
									else { /* 정답이면 ans_try에 값 세팅*/
										insSpan.style.display = "";
										insText.value = ans_try;
										insText.style.display = "none";
									}
								}
						
								/* 3단계 : 문제지 답항표시(복수정답 고려), 답안지에서 시도답항 표시*/
								if(selectType == 0) {
									if(mode == "incorrect" && oxState.substr(0,1) == "0" && answerMode == "") { /* 틀린문제풀기에서 오답은 그냥둠*/	}
									else {
										/* 문제지 표시*/
										if(oxState.length == 1) { /* 단수정답*/
											if(oxState == "1") { /* 정답 */
												document.getElementById('quesitem'+i+ans_real).style.backgroundImage = "url('<%=cp%>/resource/images/ov38.gif')";
												document.getElementById('quesitem'+i+ans_real).style.backgroundRepeat = "no-repeat";
											}
											else { /* 오답*/
												/* 정답 단독표시*/
												document.getElementById('quesitem'+i+ans_real).style.backgroundImage = "url('<%=cp%>/resource/images/o3524.gif')";
												document.getElementById('quesitem'+i+ans_real).style.backgroundRepeat = "no-repeat";
												if(ans_try > 0) { /* 시도는 했는데 오답*/
												document.getElementById('quesitem'+i+ans_try).style.backgroundImage = "url('<%=cp%>/resource/images/red_v38.gif')";
													document.getElementById('quesitem'+i+ans_try).style.backgroundRepeat = "no-repeat";
												}
											}
										}
										else { /* 복수정답*/
											var circleType;
									
											for(var j=1; j <= oxState.length-1; j++) { /* 1, 0 자리 고려*/
												ans_index = oxState.substr(j,1);
						
												if(ans_try > 0 && ans_try == ans_index) circleType = "ov38"; /* 둥근원+체크표시*/
												else { circleType = "o3524"; }
						
												document.getElementById('quesitem'+i+ans_index).style.backgroundImage = "url('<%=cp%>/resource/images/"+ circleType +".gif')";
												document.getElementById('quesitem'+i+ans_index).style.backgroundRepeat = "no-repeat";
											}
										}
										/* 답안지 시도문항 표시*/
										if(ans_try > 0) document.getElementById('answer'+i+ans_try).src = "<%=cp%>/resource/images/num"+ ans_try + "_gray.gif";
									}
								}
							}
							/* 결과 표시*/
							var resultDisplay = document.getElementById('resultDisplay'+targetDiv);
							if(answerMode != "one") { resultDisplay.innerHTML = correctCount + " / " + eachTotal; }
						}
						
						function get_OX_state(ans_try, ans_real, selectType) { /* selectType 주관식 여부.*/
							ans_try = spaceOut_qpass(ans_try);
							ans_real = spaceOut_qpass(ans_real);
						
							if(ans_try == ans_real) return "1"; /* 주관/객관 공용*/
								if(selectType == 0) { /* 객관식*/
									if(ans_real.length == 1) { return "0"; } /* 답안과 정답이 다른데, 단수정답이면 오답*/
										else { /* 다수정답인 경우*/
											if( ans_try !='' && ans_real.indexOf(ans_try) != -1) /* 시도를 하고, 정답이 들어있으면 정답열을 리턴*/
												return '1' + all_answer_num(ans_real);
											else
												return '0' + all_answer_num(ans_real);
										}
									}
									else { /* 주관식*/
										return compare_strings(ans_real, ans_try);
								}
						}
						
						function compare_strings(ans_real, ans_try) {
							if(ans_try == "") return "0";
							ans_try = spaceOut_qpass(ans_try);
						
							var realList = ans_real.split(",");
							for(var i=0; i < realList.length; i++) {
								if(spaceOut_qpass(realList[i]) == ans_try) return "1";
							}
							return "0";
						}
						
						function all_answer_num(str) {
							var new_str = "";
							var ch = '';
							for(var i=0; i < str.length; i++) {
								ch = str.substr(i,1);
								if(ch != ',' && ch !='/' && ch != '') new_str = new_str + '' + ch;
							}
							return new_str;
						}
						
						function spaceOut_qpass(str) {
							var newStr="", ch="";
							for(var i=0; i < str.length; i++) {
								ch = str.substr(i,1);
								if(ch != " ") newStr = newStr + "" + ch;
							}
							return newStr;
						}
						
						function get_ansReal(question_num) {
							var targetDiv = document.getElementById('current_i').value;
						}
						
						function answer_check(question_num, ans_num) {
							var currentMode = document.getElementById('current_mode').value;
							var incorrectRight="";
							if(currentMode == "incorrect") {
								var ans_try = document.getElementById('ans_trySame'+question_num).value;
								var ans_real = document.getElementById('ans_real'+question_num).value;
								incorrectRight = get_OX_state(ans_try, ans_real);
							}
							if(currentMode == "check" || currentMode == "restudyCheck" || currentMode == "incorrectCheck") {
								alert("지금은 문제별 응시결과 확인 중 입니다.\n\n다시풀기는 첫화면으로 가셔서 '다시풀어보기' \n\n또는 '틀린문제 다시풀기'를 선택하세요.");
								return;
							}
							else if(incorrectRight.substr(0,1)=="1") {
								alert("지금은 틀린 문제만 다시 풀고 계십니다. \n\n이미 맞힌 문제는 넘어가세요.");
								return;
							}
							var ans = document.getElementById('answer'+question_num+ans_num);
							var ques = document.getElementById('quesitem'+question_num+ans_num);
						
							/* 먼저 기존 칠한게 있으면 지우기*/
							for(i=1; i <= 4 ; i++) {
								document.getElementById('answer'+question_num+i).src = "<%=cp%>/resource/images/num"+ i + ".gif";
								document.getElementById('quesitem'+question_num+i).style.backgroundImage = "";
							}
						
							var ansIndex = question_num - document.getElementById('current_startNum').value;
							move2question(ansIndex);
							ques.style.backgroundImage = "url('<%=cp%>/resource/images/red_v38.gif')";
							ques.style.backgroundRepeat = "no-repeat";
							ans.src = "<%=cp%>/resource/images/num"+ ans_num + "_gray.gif";
						
							/* 폼에 값 저장하기*/
							document.getElementById('ans_try'+question_num).value = ans_num;
						}
						
						
						function previous_div(courseName, divIndex, fiveIndex) {
							if(fiveIndex == 0) {
								alert("해당 문제가 첫번째 문제입니다.");
								return;
							}
							nextFive = eval(fiveIndex) - eval(1);
							replace_div(divIndex, nextFive); 
						}
						
						function next_div(courseName, divIndex, fiveIndex) {
							if(fiveIndex == max_five[divIndex]-10) {
								alert("마지막 문제입니다.");
								return;
							}
							nextFive = eval(fiveIndex) + eval(1);
							replace_div(divIndex, nextFive);
						}
						
						
						function move2question(ansIndex) {
							var divNum = document.getElementById('current_i').value;
							var fiveNum = Math.floor(ansIndex / 1);
							replace_div(divNum, fiveNum);
						}
						
						
						function get_notTriedNum(startNum, endNum) {
							var ans_try;
							for(var i=startNum; i <= endNum; i++) {
								ans_try = document.getElementById('ans_try'+i).value;
								if(ans_try == "") return i;
							}
							return -1;
						}
						
						function finish_exam(divIndex) {
							/* 안푼 문제가 있는지 체크*/
							var startNum = document.getElementById('current_startNum').value;
							var eachTotal = (document.getElementById('current_questionTotal').value) - 10;
							var endNum = eval(startNum) + eval( eachTotal ) - 1;
							
						
							/* 주관식 문제 이전*/ 
							for(var i=startNum; i <= endNum; i++) {
								if( document.getElementById('ansInsert_text'+i) ) {
									document.getElementById('ans_try'+i).value = document.getElementById('ansInsert_text'+i).value;
								}
							}
						
							var notTriedNum = get_notTriedNum(startNum, endNum);
							if(notTriedNum != -1) {
								var ansIndex = notTriedNum - document.getElementById('current_startNum').value;
						
								if( !confirm("아직 풀지 않은 문제가 있습니다.\n\n취소를 누르시면 풀지 않은 문제로,\n\n이대로 포기하시려면 [확인]을 눌러주세요") ) {
									move2question(ansIndex); // 취소했을 때 풀지않은 인덱스로 돌아감
									return;
								}
							}
						
							var f = document.test_form;
							
							nextSameIndex = divIndex + 1;
							if(f.mode.value == 'first') {
								var tryList="";
						
								for(var i=startNum; i <= endNum; i++) {
									ans_try = document.getElementById('ans_try'+i).value;
									if(ans_try != "") {
										tryList = tryList + ans_try + ",";
									}
								}
								
								if(tryList == "") {
									alert("시험을 포기합니다.\n다음에는 끝까지 풀어주세요");
									window.close();
								} else {
									f.ansTryList.value = tryList;
									f.targetDiv.value = document.getElementById('current_i').value;
									
									alert("수고하셨습니다!!!");
									opener.goSubmit(tryList);
									
									window.close();
								}
							}
							else if(f.mode.value == 'restudy') start_test(nextSameIndex, "restudyCheck", startNum, eachTotal);
							else if(f.mode.value == 'incorrect') start_test(nextSameIndex, "incorrectCheck", startNum, eachTotal);
						}
						
				   <%-- function goSubmit() {
							
							window.opener.name="parentPage";
							document.test_form.target = "parentPage";
							document.test_form.action = "<%=cp%>/mockTest/mockExam";
							document.test_form.submit();
							self.close();
						} --%>
						
						
						function resultCheck(i, j) {
							var baseNum = "1" - 1;
							//alert(i + " and "+ j + " and " + baseNum);
						
							var targetDiv = i;
							var startNum = eval(baseNum) + eval(j) + eval(1);
							
							scoring_targetDiv(targetDiv, startNum, 1, "one");
							document.getElementById('btnResult'+i+j).style.display = "none";
							document.getElementById('btnReverse'+i+j).style.display = "inline";
						}
						
						function checkReverse(i, j) {
							var targetDiv = i;
							var baseNum = "1" - 1;
							var startNum = eval(baseNum) + eval(j) + eval(1);
							
							
							unscoring_targetDiv(targetDiv, startNum, 1);
							document.getElementById('btnReverse'+i+j).style.display = "none";
							document.getElementById('btnResult'+i+j).style.display = "inline";
						}
						
						start_test(1, "first", 1, 20, 0);
					</script>
				</div><!--PC 시험 끝.-->
			</div><!--PC 컨테이너 여백 끝.-->
		</div><!--PC 컨테이너 끝.-->
	</div><!--Mobile, PC 페이지 컨테이너 가운데 정렬 끝.-->
</body></html>