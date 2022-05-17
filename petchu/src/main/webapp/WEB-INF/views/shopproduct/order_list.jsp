<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<link href="/resources/css/order_list.css" rel="stylesheet">
<style>
/* #page {
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
		border-radius: 20px;
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
		
	} */
</style>


    <div id="page_orderlist">
  <div id="page_heading">주문목록</div>
  <div class="order_wrapper">
	  <div id="tbl"></div>
  			<script id="temp" type="text/x-handlebars-template">
  		{{#each olist}}	
      <div class="order_list_card" orno="{{orno}}" pno="{{pno}}">
	      <div class="order_header tbody" tno="{{orno}}" pno="{{pno}}">
		      <div class="order_date date_tr">{{odate}} 주문</div>
		      <div class="order_read" orno="{{orno}}"><a href="#">주문 상세보기</a></div>
		  </div>
	      <div class="order_content_wrapper">
	        	<div class="content_col1_imgbox"><img class="image order_img" src="{{pimage}}" width=100></div>
	        <div class="content_col2_title">
	          <div class="title ellipsis"><div class="pname_title">{{pname}}</div></div>
	          <div class="qnt">{{amount}}개</div>
	            <div class="price" pprice="{{pprice}}" amount="{{amount}}">{{pprice}}</div>
	        </div>
	        <div class="content_col3_options">  
				<a href="#" class="orderlist">배송조회</a>  
				<a href="#" class="orderlist">교환, 반품 신청</a>  
				<a href="#" class="orderlist">리뷰 작성하기</a></div>
			
	     </div>
		</div>
		{{/each}}
      </script>
    
 </div>
  
  <div class="footer">
    <div class = "pagination"></div>
  </div>
 </div>
    
<script>	
var uid = "${id}";
var page = 1;
getList();
$(".pagination").on("click", "a", function(e){
	e.preventDefault();
	page=$(this).attr("href");
	getList();
});



// $(".date_box_righgt").on("click", "span", function(){
// 	alert("리드이동");
// });


//상세보기 클릭시 이동
$("#tbl").on("click", ".order_read", function(){
	var orno = $(this).attr("orno");
	location.href="/shopproduct/order_read?orno="+orno;
});

//order list 불러오기
function getList() {
	$.ajax({
		type : "get",
		dataType : "json",
		data : {
			page : page,
			uid : uid
		},
		url : "/shopproduct/order_list.json",
		success : function(data) {
// 			console.log(data);
			var template = Handlebars.compile($("#temp").html());
			$("#tbl").html(template(data));
			$(".pagination").html(getPagination(data));
			
			//가격 계산
			$(".price").each(function(){
				var pprice = $(this).attr("pprice");
				var amount = $(this).attr("amount");
				var final_price = Number(pprice) * Number(amount);
				$(this).html(final_price);
			});
			
			//orno별 구분선 등록
/* 			var tno = "";
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
			});	 */
			
			
		 	
			 //item card		
			 var i = 0;
			$('.order_list_card').each(function(){
			 	var orno = $(this).attr("orno");
				
				if( i > 0 && orno == orno){
				var tabIndex = $('.order_header').index();
				console.log(tabIndex);
				}
				i++;
			})
			
			
			
			$(".date_td").each(function(){
				if(!$(this).attr("date_only")){
					$(this).html("");
				}else{
					$(this).parent().attr("style", "background:none;");
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

</script>