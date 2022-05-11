<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
	.image{
		width:90px;
		height:90px;
	}
	.order_info{
		margin: 0px auto;
		text-align: center;
		padding-top: 40px;
	}
	.receiver_info th, .receiver_info td{
		border: none;
	}
	.receiver_info th{
		width:50px;
	}
	.receiver_info td{
		 width:400px;
	}
	.td_center {
		text-align: center;
	}
	.image{
		cursor:pointer;
	}
	.none{
		display:none;
	}
	#tbl{
		border-radius: 10px;
		background: #eeeeee;
	}
	
	td {
		padding: 10px;
		border: none;
		border-bottom: solid 5px white;
		margin-bottom: 50px;
	}
	
	.receiver_info{
		margin-top: 50px;
	}
	.left{
		text-align:left;
	}
	.small_title{
		color:rgb(85, 85, 85);
		font-weight:normal;
	}
	.receiver_info tbody{
		border-bottom: 1px solid gray;
		padding-bottom: 10px;
	}
	.buy_info{
		margin-top:70px;
	}
	.buy_info tbody{
		border-bottom: 1px solid gray;
/* 		padding-bottom: 10px; */
	}
	.right{
		text-align:right;
	}
	.back_white{
		 background:white;
	}
</style>
<div id="page">
	<div style="text-align: center; overflow:hidden;">
		<div class="order_info">
			<div><h5>주문상세</h5></div>
			<div><b class="odate"></b>&nbsp;&nbsp;&nbsp;&nbsp;<span class="orno">주문번호: ${orno} </span></div>
		</div>
<!-- 		 d -->
	</div>
	<table id="tbl"></table>
			<table class="receiver_info">
				<tr class="td_title">
					<th colspan="3" style="border-bottom:2px solid; padding-bottom:20px; width:750px;" class="title left">받는 사람 정보</th>
				</tr>
				<tr class="receiver">
					<th class="small_title left">받는 사람</th>
					<td>${uvo.receiver}</td>
				</tr>
				<tr class="tel">
					<th class="small_title left">연락처</th>
					<td class="tel_number">${uvo.tel}</td>
				</tr>
				<tr class="address" style="margin-bottom:20px;">
					<th class="small_title left">주소</th>
					<td>(${uvo.zipcode}) ${uvo.address1} (${uvo.address2})</td>
				</tr>
			</table>
			<!-- -----------------결제정보------------------------ -->
			<table class="buy_info" style="background: #e6e6e6;">
				<tr class="td_title">
					<th colspan="3" style="border-bottom:2px solid; padding-bottom:20px; width:750px;" class="title left back_white">결제</th>
				</tr>
				<tr>
					<td rowspan="2" style="width:300px; background: white; border-bottom:1px solid gray;">
						결제수단: 카카오 페이
					</td>
					<th class="small_title left" style="width:150px; background: #e6e6e6;">기존 가격 합계</th>
					<td class="right" style="border:none;"><span class="oldPrice nprice">10000</span>원</td>
				</tr>
				<tr>
					<th class="small_title left" style="background: #e6e6e6; border-bottom:1px solid;">배송비</th>
					<td class="right" style="background: #e6e6e6; border-bottom:1px solid;"><span>3,000</span>원</td>
				
				</tr>
				<tr style="margin-bottom:20px;">
					<td rowspan="2" style="background: white; border-bottom:1px solid gray;">
						적립된 포인트:<span class="payBack price"></span>원
					</td>
					<th class="small_title left">사용 포인트</th>
					<td class="right" style="border-bottom:1px gray;"><span class="pointPay nprice">${ovo.point}</span>원</td>
				</tr>
				<tr>
					<th class="small_title left"><b>최종 결제금액</b></th>
					<td class="right" style="border-bottom:1px solid gray;"><b><span class="sum nprice">${ovo.sum}</span>원</b></td>
				
				</tr>
			</table>
			
	<script id="temp" type="text/x-handlebars-template">
		{{#each .}}
		<tbody class="tbody" orno="{{orno}}">
			<tr>
				<td rowspan="3"><img class="image" pno="{{pno}}" src="{{pimage}}" width=100></td>
				<td>{{pname}}</td>
				<td class="td_center"><span class="price" pprice="{{pprice}}" amount="{{amount}}"></span>원</td>
				<td class="td_center" width=60>{{amount}}개</td>
			</tr>
		</tbody>
		{{/each}}
	</script>
</div>

<script>

getList();
function getList(){
	var orno = "${orno}";
	$.ajax({
		type : "get",
		dataType : "json",
		data : {orno:orno},
		url : "/shopproduct/order_read.json",
		success : function(data) {
			var template = Handlebars.compile($("#temp").html());
			$("#tbl").html(template(data));
			
			//vo.final_price 계산
// 			var vo_pprice = $(".pprice").attr("pprice");
// 			var vo_amount = $(".pprice").attr("amount");
// 			var vo_final_price = Number(vo_pprice) * Number(vo_amount);  
// 			//alert(vo_final_price);
// 			$(".final_price").html(vo_final_price);
			
			//each final_price 계산
			$(".price").each(function(){
				var price = $(this).attr("pprice");
				var amount = $(this).attr("amount");
				var final_price = Number(price) * Number(amount);
				$(this).html(final_price);
			});
			
			//주문날짜 substring
// 			var odate = $(".odate").html();
// 			odate = odate.substring(0, 9); 
// 			$(".odate").html(odate+" 주문");
			
			//구매상품 가격포맷
// 			var fprice = $(".final_price").html();
// 			fprice=fprice.replace(/\B(?=(\d{3})+(?!\d))/g, ',');
// 			alert(fprice);
// 			$(".final_price").html(fprice);
			//같이 구매한 상품 가격포맷
			
			getFormatPrice();
		}
	});
}

//상품 이미지 클릭시 해당 페이지로 이동
$(".image").on("click", function(){
	var pno = $(this).attr("pno");
	location.href="/shopproduct/read?pno="+pno;
});

//상품 이미지 클릭시 해당 페이지로 이동
$("#tbl").on("click", ".image", function(){
	var pno = $(this).attr("pno");
	location.href="/shopproduct/read?pno="+pno;
});


//전화번호 포멧
var num = $(".tel").find(".tel_number").html();
var formatNum = '';

 if(num.length==11){
     formatNum = num.replace(/(\d{3})(\d{4})(\d{4})/, '$1-$2-$3');
 }else if(num.length==8){
     formatNum = num.replace(/(\d{4})(\d{4})/, '$1-$2');
 }else if(num.indexOf('02')==0){
     formatNum = num.replace(/(\d{2})(\d{4})(\d{4})/, '$1-$2-$3');
 }else{
     formatNum = num.replace(/(\d{3})(\d{3})(\d{4})/, '$1-$2-$3');
 }
 $(".tel_number").html(formatNum);



//가격 포맷
function getFormatPrice(){
	$("#tbl .price").each(function(){
		var fprice = $(this).html();
		fprice=fprice.replace(/\B(?=(\d{3})+(?!\d))/g, ',');
		$(this).html(fprice);
	});
	$(".nprice").each(function(){
		var fprice = $(this).html();
		fprice=fprice.replace(/\B(?=(\d{3})+(?!\d))/g, ',');
		$(this).html(fprice);
	});
}

//결제 - 기존가격 합계 계산
	var sum = ${ovo.sum};
	var pointPay = ${ovo.point};
	var oldPrice = Number(sum) + Number(pointPay) - 3000;
	$(".oldPrice").html(oldPrice);
	//적립된 포인트 계산
	$(".payBack").html(sum+"....");
</script>