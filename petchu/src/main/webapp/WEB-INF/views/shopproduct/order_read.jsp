<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
.image {
	width: 90px;
	height: 90px;
}

.order_info {
	width:830px;
	margin: 0px auto;
	text-align: center;
	padding-top: 40px;
	margin-bottom: 60px;
}

.receiver_info th, .receiver_info td {
	border: none;
}

.receiver_info th {
	width: 60px;
}

.receiver_info td {
	width: 400px;
}

.td_center {
	text-align: center;
}

.image {
	cursor: pointer;
}

.none {
	display: none;
}

#tbl {
	border-radius: 10px;
/* 	border: 1px solid; */
	background: #white;
}

td {
	padding: 10px;
	border: none;
	border-bottom: solid 5px white;
	margin-bottom: 50px;
}

.receiver_info {
	margin-top: 50px;
}

.left {
	text-align: left;
}

.small_title {
	color: rgb(85, 85, 85);
	font-weight: normal;
}

.receiver_info tbody {
	border-bottom: 1px solid gray;
	padding-bottom: 10px;
}

.buy_info {
	margin-top: 70px;
}

.buy_info tbody {
	border-bottom: 1px solid gray;
	/* 		padding-bottom: 10px; */
}

.right {
	text-align: right;
}

.back_white {
	background: white;
}

.btn_review{
	margin-bottom:6px;
}
.btn_review, .btn_item_read{
	border: 1px solid rgb(52, 106, 255);
	height: 40px;
	border-radius: 4px;
	background-color: white;
	color: rgb(52, 106, 255);
	width: 150px;
	cursor: pointer;
}

.tbody{
	border: solid 3px #eeeeee;
}
#tbl td, th {
	border-bottom: solid 1px #eeeeee;
}
.orno{
 	float:right; 
 	font-size: 12px; 
 	margin:bottom:5px;
 	padding-top:13px;
}
.date{
	float:left;
	font-size: 20px;
}
.ellipsis{
	width: 370px;
  	white-space: nowrap;
    overflow: hidden;
	text-overflow: ellipsis;
}
.pdl{
	padding-left: 10px;
}
.payBack{
	color:blue;
}
.btn_dot{
	 border:none; 
	 background:none;
	 cursor:pointer;
}
.btn_dot img{
	  width:20px;
}
.gray_screen{
	position:fixed;
	overflow:hidden;
	opacity:80%;
	width:100%;
	height:100%;
	top:0px;
	left:0px;
	background-color: rgb(0, 0, 0);
	text-align:center;
	display:none;
}
.full_screen{
	position:fixed;
	overflow:hidden;
	width:100%;
	height:100%;
	top:0px;
	left:0px;
	background-color: none;
	text-align:center;
	display:none;
}
.delete_screen{
	display: flex;
	justify-content: center;
 	align-items: center;
 	min-height: 100vh;
}
.btn_screen{
	display:block;
	opacity:100%;
	background-color:rgb(255, 255, 255);
	border-radius:5px;
}

.btn_cart_delete{
	cursor:pointer;
	width: 300px;
	height: 80px;
	background-color:rgb(255, 255, 255);
	font-size:20px;
	color:red;
}

.btn_screen_cancel{
	cursor:pointer;
	width:100%;
	height: 80px;
	opacity:100%;
	background-color:rgb(255, 255, 255);
	font-size:20px;
}
.hovGround:active{
	background:#eeeeee;
}
.btn_dot:active {
	margin-bottom: 10px;
}
</style>
<div id="page">
	<div style="text-align: center; overflow: hidden;">
		<div class="order_info">
			<div>
				<h2>주문상세</h2>
			</div>
			<div>
				<b><span class="date">${uvo.odate}</span></b><span class="orno">주문번호:
					${orno} </span>
			</div>
		</div>
		<!-- 		 d -->
	</div>
	<table id="tbl"></table>
	<table class="receiver_info">
		<tr class="td_title">
			<th colspan="3"
				style="border-bottom: 2px solid; padding-bottom: 20px; width: 750px;"
				class="title left">받는 사람 정보</th>
		</tr>
		<tr class="receiver">
			<th class="small_title left">받는 사람</th>
			<td>${uvo.receiver}</td>
		</tr>
		<tr class="tel">
			<th class="small_title left">연락처</th>
			<td class="tel_number">${uvo.tel}</td>
		</tr>
		<tr class="address" style="margin-bottom: 20px;">
			<th class="small_title left">주소</th>
			<td>(${uvo.zipcode}) ${uvo.address1} (${uvo.address2})</td>
		</tr>
		<tr class="message" style="margin-bottom: 20px;">
			<th class="small_title left">배송요청사항</th>
			<td>${ovo.omessage}</td>
		</tr>
	</table>
	<!-- -----------------결제정보------------------------ -->
	<table class="buy_info" style="background: #e6e6e6;">
		<tr class="td_title">
			<th colspan="3"
				style="border-bottom: 2px solid; padding-bottom: 20px; width: 750px;"
				class="title left back_white">결제<span class="del nprice"></span></th>
		</tr>
		<tr>
			<td rowspan="2"
				style="width: 300px; background: white; border-bottom: 1px solid gray;">
				결제수단: 카카오 페이</td>
			<th class="small_title left pdl"
				style="width: 150px; background: #e6e6e6;">기존 가격 합계</th>
			<td class="right" style="border: none;"><span
				class="oldPrice nprice">10000</span>원</td>
		</tr>
		<tr>
			<th class="small_title left pdl"
				style="background: #e6e6e6; border-bottom: 1px solid;">배송비</th>
			<td class="right"
				style="background: #e6e6e6; border-bottom: 1px solid;"><span>+ 3,000</span>원</td>

		</tr>
		<tr style="margin-bottom: 20px;">
			<td rowspan="2"
				style="background: white; border-bottom: 1px solid gray;">적립
				포인트: <span class="payBack">11</span>원
			</td>
			<th class="small_title left pdl">사용 포인트</th>
			<td class="right" style="border-bottom: 1px gray;"><span
				class="pointPay nprice">- ${ovo.point}</span>원</td>
		</tr>
		<tr>
			<th class="small_title left pdl" style="border-bottom: 1px solid;"><b>최종 결제금액</b></th>
			<td class="right" style="border-bottom: 1px solid gray;"><b><span
					class="sum nprice">${ovo.sum}</span>원</b></td>

		</tr>
	</table>
	<div>
		<button class="btn_review" style="margin-top:100px;" onclick='goBack()'>목록으로 돌아가기</button>
		<button class="btn_review" style="margin-left:20px;">상품 문의하기</button>
	</div>

	<script id="temp" type="text/x-handlebars-template">
		{{#each .}}
		<tbody class="tbody" orno="{{orno}}">
			<tr>
				<td rowspan="3"><img class="image" pno="{{pno}}" src="{{pimage}}" width=100></td>
				<td><div class="ellipsis">{{pname}}</div></td>
				<td class="td_center"><span class="price" pprice="{{pprice}}" amount="{{amount}}"></span>원</td>
				<td class="td_center" width=60>{{amount}}개</td>
				<td width=10><button class="btn_dot" bno="{{bno}}" onclick='getScreen(this)'><img src="/resources/icon_menu/icon_dot.png"></button></td>
				<td class="td_center" width=150><button class="btn_review" bno="{{bno}}" pno="{{pno}}" onclick='goReview(this)'>리뷰 작성하기</button><button class="btn_item_read" onclick='read_click(this)'>상품 페이지 이동</button></td>
			</tr>
		</tbody>
		{{/each}}
	</script>
	<div class="gray_screen screen">
	</div>
	<div class="full_screen screen">
		<div class="delete_screen" style="text-align:center;">
			<div>
				<div class="btn_screen">
					<button class = "btn_cart_delete hovGround" style="border:none; border-bottom:2px solid #eeeeee; border-radius: 5px 5px 0px 0px;" onclick='del_ohistory()'>주문내역 삭제</button>
				</div>
				<div class="btn_screen">
					<button class = "btn_screen_cancel hovGround" style="border:none; border-radius: 0px 0px 5px 5px;" onclick='throwScreen()'>닫기</button>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
	var pno = "";
	var bno = "";
	getList();
	function getList() {
		var orno = "${orno}";
		$.ajax({
			type : "get",
			dataType : "json",
			data : {
				orno : orno
			},
			url : "/shopproduct/order_read.json",
			success : function(data) {
				var template = Handlebars.compile($("#temp").html());
				$("#tbl").html(template(data));

				var withoutDel = 0;
				$(".price").each(function() {
					var price = $(this).attr("pprice");
					var amount = $(this).attr("amount");
					var final_price = Number(price) * Number(amount);
					$(this).html(final_price);
					var i = final_price;
					//삭제된 값을 제외한 가격
					withoutDel = withoutDel + Number(i)
				});
				var sum = "${ovo.sum}" - withoutDel;
				//.date 날짜포맷
				getDate();
				//삭제된 항목 수 표시
				if("${del}">0){
					$(".del").html(' 주문내역에서 삭제된 상품: 총 ${del}개 ( ' + sum + '원 )');
					$(".del").attr("style", "font-size: 13; font-weight: 300; float: right;");
				}
				//가격포맷
				getFormatPrice();
			}
		});
	}

	//상품 이미지 클릭시 해당 페이지로 이동1
	$(".image").on("click", function() {
		pno = $(this).attr("pno");
		location.href = "/shopproduct/read?pno=" + pno;
	});
	
	//  ↑↓  왜인지 모르겠으나 둘 중 하나만 사라져도 작동이 안 됨. 감수성의 영역.
	
	//상품 이미지 클릭시 해당 페이지로 이동2
	$("#tbl").on("click", ".image", function() {
		pno = $(this).attr("pno");
		location.href = "/shopproduct/read?pno=" + pno;
	});
	
	//상품페이지 이동btn
	function read_click(e){
		pno = $(e).closest(".tbody").find(".image").attr("pno");
		location.href = "/shopproduct/read?pno=" + pno;
	}

	//전화번호 포멧
	var num = $(".tel").find(".tel_number").html();
	var formatNum = '';
	if (num.length == 11) {
		formatNum = num.replace(/(\d{3})(\d{4})(\d{4})/, '$1-$2-$3');
	} else if (num.length == 8) {
		formatNum = num.replace(/(\d{4})(\d{4})/, '$1-$2');
	} else if (num.indexOf('02') == 0) {
		formatNum = num.replace(/(\d{2})(\d{4})(\d{4})/, '$1-$2-$3');
	} else {
		formatNum = num.replace(/(\d{3})(\d{3})(\d{4})/, '$1-$2-$3');
	}
	$(".tel_number").html(formatNum);

	//가격 포맷
	function getFormatPrice() {
		$("#tbl .price").each(function() {
			var fprice = $(this).html();
			fprice = fprice.replace(/\B(?=(\d{3})+(?!\d))/g, ',');
			$(this).html(fprice);
		});
		$(".nprice").each(function() {
			var fprice = $(this).html();
			fprice = fprice.replace(/\B(?=(\d{3})+(?!\d))/g, ',');
			$(this).html(fprice);
		});
	}

	//결제 - 기존가격 합계 계산
	var sum = "${ovo.sum}";
	var pointPay = "${ovo.point}";
	var oldPrice = Number(sum) + Number(pointPay) - 3000;
	$(".oldPrice").html(oldPrice);
	
	//적립 포인트 계산
	sum = Math.floor(sum/10);
	$(".payBack").html(sum);
	var fprice = $(".payBack").html();
	fprice = fprice.replace(/\B(?=(\d{3})+(?!\d))/g, ',');
	$(".payBack").html(fprice);
	
	
	//날짜포맷
	function getDate(){
		var date = $(".date").html();
		var strDate = date.substring(0, 10);
		strDate = strDate.replace("-", ".");
		strDate = strDate.replace("-", ".");
		$(".date").html(strDate+" 주문");
	}
	
	//목록으로 돌아가기
	function goBack(){
		location.href="/shopproduct/order_list";
	}
	
	//리뷰 페이지 입장
	function goReview(e){
		pno = $(e).attr("pno");
		bno = $(e).attr("bno");
		location.href="/review/insert?pno="+pno+"&bno="+bno;
	}
	
	//기록삭제 버튼 노출
	function getScreen(e){
		bno = $(e).attr("bno");
		$(".screen").attr("style", "display:block");
	}
	//기록삭제 버튼 아웃
	function throwScreen(){
		$(".screen").attr("style", "display:none");
	}
	//구매목록에서 삭제
	function del_ohistory(){
		var orno = "${orno}";
// 		user_order_delete
		$.ajax({
			type: "post",
			url: "/shopproduct/user_order_delete",	
			data: {bno:bno},
			success: function(){
					location.href="/shopproduct/order_read?orno=" + orno;
			}
		});
	}
</script>