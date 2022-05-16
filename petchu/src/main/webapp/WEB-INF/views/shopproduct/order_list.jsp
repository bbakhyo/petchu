<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<style>
#page {
	margin: 0px auto;
}
	.order_read{
		cursor:pointer;
	}
	#tbl{
		overflow:hidden;
		border: none;
		padding: 10px;
		margin: 10px;
		text-align: center;
		margin:0px auto;
	}
	tr, td{
		border:none;
	}
	.tbody{
		margin: 20px;
	}
	.border{
		border-top:50px solid white;
		border-left: 2px solid #ededed;
		border-right: 2px solid #ededed;
		background: #ededed;
	}
	.image{
		cursor:pointer;
	}
	.gray_line {
		border-top: 2px solid white;
 		border-left: 2px solid #ededed; 
 		border-right: 2px solid #ededed; 
		background: #ededed;
	}
	.date_td {
		height:5px;
	}
	.order_read{
		color:blue;
		
	}
</style>
<div id="page">
	<h1>구매목록</h1>
	<div id="sidemenu">
		<jsp:include page="/WEB-INF/views/user/mypageSidemenu.jsp"/>
	</div>
	<table id="tbl"></table>
	<script id="temp" type="text/x-handlebars-template">
		{{#each .}}	
		<tbody class="tbody" orno="{{orno}}" pno="{{pno}}">
		<tr class="date_tr" style="text-align:right;">
			<td colspan="3"><span class="date_td" style="margin-right:78%;">{{odate}}</span>
				<span class="order_read date_td" orno="{{orno}}" >주문 상세보기</span>
			</td>
			
		</tr>
		<tr>
			<td rowspan="2"><img class="image" src="{{pimage}}" width=100></td>
			<td>{{pname}} · {{amount}}개</td>
			<td class="price" pprice="{{pprice}}" amount="{{amount}}">가격*수량 값</td>
		</tr>
		</tbody>
		{{/each}}
	</script>
</div>

    
<script>	
var uid = "${id}";

// $(".date_box_righgt").on("click", "span", function(){
// 	alert("리드이동");
// });


//상세보기 클릭시 이동
$("#tbl").on("click", ".order_read", function(){
	var orno = $(this).attr("orno");
	location.href="/shopproduct/order_read?orno="+orno;
});

//order list 불러오기
getList();
function getList() {
	$.ajax({
		type : "get",
		dataType : "json",
		data : {
			uid : uid
		},
		url : "/shopproduct/order_list.json",
		success : function(data) {
// 			console.log(data);
			var template = Handlebars.compile($("#temp").html());
			$("#tbl").html(template(data));
			
			
			//가격 계산
			$(".price").each(function(){
				var pprice = $(this).attr("pprice");
				var amount = $(this).attr("amount");
				var final_price = Number(pprice) * Number(amount);
				$(this).html(final_price);
			});
			
			//orno별 구분선 등록
			var tno = "";
			var orno = "";
			var i = 0
			$(".tbody").each(function(){
				orno = $(this).attr("orno");
				var test = document.getElementsByClassName('tbody')[i];
				i++;
				if(tno==""||tno!=orno){
					//alert("tno=" + tno + "\norno=" + orno);
					test.classList.add('border');
					$(this).find(".date_tr").find(".date_td").attr("date_only", "date_only");
				}
				tno=orno;
			});	
			$(".date_td").each(function(){
				if(!$(this).attr("date_only")){
					$(this).html("");
				}else{
					$(this).parent().attr("style", "background:#A7CA37;");
				}
			});
			
			//가격포맷
			$(".price").each(function(){
				var fprice = $(this).html();
				fprice=fprice.replace(/\B(?=(\d{3})+(?!\d))/g, ',');
				$(this).html(fprice + "원");
			});
			getGrayLine();//구분선 긋기
			
			//날짜포맷
			$(".date_td").each(function(){
				if($(this).attr("date_only")!="date_only") return;
				var str = $(this).html();
				var strDate = str.substring(0, 10);
				strDate = strDate.replace("-", ".");
				strDate = strDate.replace("-", ".");
				$(this).html(strDate);
			});
			
			
// 			//같이 구매한 상품 가격포맷
// 			getFormatPrice();

			
		}
	});
}

//상품 이미지 클릭시 해당 페이지로 이동
$("#tbl").on("click", "img", function(){
	var pno = $(this).parent().parent().parent().attr("pno");
	location.href="/shopproduct/read?pno="+pno;
});


//만약 class명이 "tbody"라면

function getGrayLine(){
	$(".tbody").each(function(){
		if($(this).attr("class")=="tbody"){
			$(this).attr("class", "tbody gray_line");
		}
	});
}

//메뉴바 css 정렬
$(".sideMenu").css("margin-left", "0px");

</script>