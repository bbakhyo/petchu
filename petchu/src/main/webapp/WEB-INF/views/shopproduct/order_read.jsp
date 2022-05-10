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
		width:200px;
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
					<th colspan="3" style="text-align:center;" class="title">받는 사람 정보</th>
				</tr>
				<tr class="receiver">
					<th class="title">받는 사람</th>
					<td>${uvo.receiver}</td>
				</tr>
				<tr class="tel">
					<th class="title">연락처</th>
					<td class="tel_number">${uvo.tel}</td>
				</tr>
				<tr class="address">
					<th class="title">주소</th>
					<td>(${uvo.zipcode}) ${uvo.address1} (${uvo.address2})</td>
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
}

</script>