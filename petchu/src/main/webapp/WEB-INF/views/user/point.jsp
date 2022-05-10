<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<div id="page">
	<div id="cashadd">
		<div id="decocash">
			<p>캐쉬 잔액 </p>
		</div>
		<div id="realcash">
			<p>${cash}원</p>
			<div id="chargecash">
				<label><input type="radio" name="cash" value=1000 checked>1,000원</label>
				<label><input type="radio" name="cash" value=2000>2,000원</label>
				<label><input type="radio" name="cash" value=5000>5,000원</label>
				<label><input type="radio" name="cash" value=10000>10,000원</label>
				<label><input type="radio" name="cash" value=20000>20,000원</label>
			</div>
			<button id="chargebtn">충전하기</button>
		</div>
		<div id="cashhistory">
			<p>캐쉬 사용내역</p>
			<c:forEach items="${cashhistory}" var="vo">
				<p>${vo.amount} | ${vo.content}</p>
			</c:forEach>
		</div>
	</div>
	<div id="pointadd">
		<p>내 포인트 : ${point}</p>
		<p>포인트 사용내역</p>
		<c:forEach items="${pointhistory}" var="vo">
			<p>${vo.amount} | ${vo.content}</p>
		</c:forEach>
	</div>	
</div>
<script>
	var cash;
	
	$("#chargebtn").on("click", function(){
		cash = $('input[name="cash"]:checked').val();
		
			var IMP = window.IMP; // 생략가능
			IMP.init('imp71996590'); 
			// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
			// ''안에 띄어쓰기 없이 가맹점 식별코드를 붙여넣어주세요. 안그러면 결제창이 안뜹니다.
			IMP.request_pay({
				pg: 'kakao',
				pay_method: 'card',
				merchant_uid: 'merchant_' + new Date().getTime(),
				/* 
				 *  merchant_uid에 경우 
				 *  https://docs.iamport.kr/implementation/payment
				 *  위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
				 */
				name: cash + '원 충전',
				// 결제창에서 보여질 이름
				// name: '주문명 : ${auction.a_title}',
				// 위와같이 model에 담은 정보를 넣어 쓸수도 있습니다.
				amount: cash,
				// amount: ${bid.b_bid},
				// 가격 
				buyer_name: '이름',
				// 구매자 이름, 구매자 정보도 model값으로 바꿀 수 있습니다.
				// 구매자 정보에 여러가지도 있으므로, 자세한 내용은 맨 위 링크를 참고해주세요.
				buyer_postcode: '123-456',
				}, function (rsp) {
					console.log(rsp);
				if (rsp.success) {
					// success.submit();
					// 결제 성공 시 정보를 넘겨줘야한다면 body에 form을 만든 뒤 위의 코드를 사용하는 방법이 있습니다.
					// 자세한 설명은 구글링으로 보시는게 좋습니다.
					$.ajax({
						type:"post",
						url:"/user/updatecash",
						data: {amount:cash},
						success:function(){
							var msg = '결제가 완료되었습니다.';
							msg += '결제 금액 : ' + rsp.paid_amount;
							location.href="/user/pointRead";
						}
						
					})
				} else {
					var msg = '결제에 실패하였습니다.';
					msg += '에러내용 : ' + rsp.error_msg;
				}
				swal(msg);
			});
	})
	
</script>