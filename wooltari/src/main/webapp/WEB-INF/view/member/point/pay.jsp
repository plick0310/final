<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<style>

</style>
<script type="text/javascript">
//window.IMP 변수 초기화
var IMP = window.IMP; //생략가능
IMP.init('imp73997630'); //아임포트 회원가입 후 발급된 가맹점 고유 코드를 사용해주세요. 예시는 KCP공식 아임포트 데모 계정입니다.

/* 
//금액 문자 입력 제한
function onlyNumber(event){
	event = event || window.event;
	var keyID = (event.which) ? event.which : event.keyCode;
	if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
		return;
	else
		return false;
}
//금액 한글 입력 제한,충전 포인트 계산
function removeChar(event) {
	//포인트 계산
	var pointAmount = $('#payAmount').val().trim();
	$('#amount-point').text(pointAmoun/10 + " Point");
	//한글 입력 제한
	event = event || window.event;
	var keyID = (event.which) ? event.which : event.keyCode;
	if ( keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
		return;
	else
		event.target.value = event.target.value.replace(/[^0-9]/g, "");
}
*/
//결제 요청
function payRequest() {
	alert($('#chk-price').val());
	var payAmount = $('#chk-price:checked').val();
	if(payAmount.length == 0){
		alert("결제 금액을 입력해 주세요.")
		return;
	}
	IMP.request_pay({
	    pg : 'html5_inicis', //웹표준 결제창 지원
	    pay_method : 'card', //card(신용카드), trans(실시간계좌이체), vbank(가상계좌), phone(휴대폰소액결제)
	    merchant_uid : 'Wooltari_' + new Date().getTime(), //상점에서 관리하시는 고유 주문번호를 전달
	    name : 'WooltariPoint',
	    amount : payAmount,
	    buyer_email : '${dto.userId}',
	    buyer_name : '${dto.userName}',
	    buyer_tel : '${dto.tel}',
	    buyer_addr : '${dto.addr1} ${dto.addr2}',
	    buyer_postcode : '${dto.zipcode}'
	}, function(rsp) {
	    if ( rsp.success ) {
	    	//[1] 고객 입장에서 결제가 완료되었고, 아임포트 서버에도 결제완료로 상태가 변경된 상황
	    	//가맹점 서버단에서 아임포트 REST API로 결제정보 조회를 위해 imp_uid를 운영하는 서버로 전달하기
	    	jQuery.ajax({
	    		url: "<%=cp%>/point/pay_complete", //cross-domain error가 발생하지 않도록 주의해주세요
	    		type: 'POST',
	    		dataType: 'json',
	    		data: {
	    			imp_uid : rsp.imp_uid, //상점 고유 ID
	    			merchant_uid : rsp.merchant_uid, //상점 거래 ID
		    		paid_amount : rsp.paid_amount, //결제 금액
		    		apply_num : rsp.apply_num //카드 승인 번호
		    		//기타 필요한 데이터가 있으면 추가 전달
	    		}
	    	}).done(function(data) {
	    		//[2] 서버에서 REST API로 결제정보확인 후 가맹점 DB에 결제완료로 상태 변경 등 서비스루틴이 정상적인 경우
	    		var state = data.state;
	    		if (state = 'true') {
	    			alert('결제가 완료되었습니다.');
	    		} else {
	    			alert('결제를 실패하였습니다.');
	    			//[3] 아직 제대로 결제가 되지 않았습니다.
	    			//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
	    		}
	    	});
	    } else {
	    	//결제 실패 : error_msg속성에 실패 사유가 전달됨
	        var msg = '결제를 실패하였습니다.';
	        msg += '\n실패내용 : ' + rsp.error_msg;
	        alert(msg);
	    }
	});
}
</script>
<!-- 충전금액 선택 -->
<div id="innerSection">
	<div id="innerTitle">포인트 충전</div>
	<div id="innerContent">
		<p>결제상품 이용안내</p>
		<ul style="list-style: circle; margin-left: 30px;">
			<li>충전 후, 사용하신 상품은 해지 및 취소/변경을 하실 수 없습니다.</li>
			<li>포인트로만 제휴컨텐츠 이용이 가능합니다.</li>
			<li>결제 환불 및 취소, 변경 하시는 경우 고객센터로 문의해주시기 바랍니다.</li>
			<li>모든 상품은 결제시 부가세 10%가 포함됩니다.</li>
			<li>결제 후 사용내역이 없을 경우 결제 월(月) 중 환불이 가능합니다.</li>
		</ul>
		
		<table id="pointTable" class="table" style="margin-top: 20px;">
			<colgroup>
				<col width="50">
				<col width="100">
				<col width="150"> 
				<col width="150">
				<col width="200">
				<col width="150">
			</colgroup>
				<tr>
					<th scope="col"></th>
					<th scope="col">판매금액</th>
					<th scope="col">할인률</th>
					<th scope="col">할인적용금액</th>
					<th scope="col">적립포인트</th>
					<th scope="col">마일리지</th>
				</tr>
			<tbody>
				<c:forEach var="dto" items="${pointList}">
					<tr class="point">
					
						<!-- 라디오버튼 -->
						<td class="check"><input type="radio" name="point" id="chk-price" class="input-radio" value="${dto.price}"></td>
						
						<!-- 결제가격 -->
						<td class="price">${dto.price}</td>

						<!-- 할인율 -->
						<td class="sale">${dto.sale}%</td>
						
						<!-- 할인 적용 금액 -->
						<td class="saleprice">${dto.saleprice}</td>
						
						<!-- 실제 적립 포인트 -->
						<td class="point"><strong>${dto.point} P</strong></td>
						
						<!-- 마일리지 추가적립 -->
						<c:if test="${dto.mileage != 0}">
						<td class="mileage">${dto.mileage}% 추가적립</td>
						</c:if>
						<c:if test="${dto.mileage == 0}">
						<td class="mileage">-</td>
						</c:if>
						
					</tr>
				</c:forEach>
			</tbody> 
		</table>
	</div>
	<div id="innerFooter" style="float: right;">
		<input type="button" onclick="payRequest();" value="결제요청">
	</div>
</div>

