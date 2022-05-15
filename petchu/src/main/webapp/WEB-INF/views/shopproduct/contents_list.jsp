<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<title>Content list</title>
<link href="/resources/temp_page.css" rel="stylesheet">
<style>
	
#page{
/*   display:flex; */
  flex-direction:column;
  font-family:NanumGothic;
}
.page_border{
  border:1px solid black;
}
.menu_item_title{
  font-size:13px;
  font-family:NanumGothic;
  font-weight: 700;
  letter-spacing:-0.5px;
  line-height:15px;
  text-align:center;
  margin-top:10px;
}

.content_item_container_row{
  display:flex;
  flex-direction:row;
  width:960px;
  flex-wrap:wrap;
  gap:10px;
}
.content_item_box_container{
  display:flex;
  flex-direction:column;
  width:180px;
  height:346px;
  box-shadow:5px 5px 15px 5px rgba(0,0,0,0);
  border:1px solid #d1d0cf;
  margin-bottom:20px;
}

.img_container>img {
	cursor:pointer;
}
.content_item_box_container:hover{
	border:solid 1px blue;
}
 .content_item_title{
    font-size:13px;
    height: 60px;
    padding:10px;
  }  
.content_item_price{
  display:flex;
  justify-content:space-between;
  align-items:center;
  width:100%;
  height: 45px;
/*   background-color:#f07f7f; */
}
.price_item1{
  font-size:13px;
  font-weight:700;
 /*  padding: 10px; */
}
/* .price_item2{
  font-size:15px;
  color:blue;
  padding: 10px;
} */
.content_item_title_row{
  align-items:flex-end;
  width:100%;
  height: 45px;
  background-color:#f5f5f5;
}
.content_item_title{
  padding:10px;
}

.content_banner_area{
  display:flex;
  flex-direction:row;
  gap:0;
}
.content_img{
	width:180px;
	height:180px;
}
.contents_box{
	background: #A7CA37;
	height: 60px;
}
.content_item_container_row{
	margin: 10px auto;
}
.content_item_box_container{
	margin: 1px;
}
#search_text{
    width: 300px;
    height: 40px;
    margin-top: 11px;
    padding: 0 3px 0;
    font-weight: bold;
    font-size: 13px;
    line-height: 15px;
    color: #333;
    letter-spacing: 0;
   /*  border: none; */
    background: transparent;
    border: solid 2px white;
    border-radius: 5px;
}
.goAll{
	 float: left; 
	 margin-left: 10px; 
	 margin-top: 15; 
	 cursor: pointer;"
	 background:white;
	 border: 1px solid white;
	 border-radius:10px;
     width: 70;
     height: 30;
}
.soldout{
	position:absolute;
	top:25%;
	left:3%;
}
.cart_add1, .cart_add1>img{
width: 35px;
padding-right: 5px;
cursor:pointer;
}

</style>
</head>
<body>
	<div id="page">
		<div class="contents_box">
			<span><button class="goAll">전체</button></span>
			<select name="animal_type" class="animal_type">
				<option>전체</option>
				<option>강아지</option>
				<option>고양이</option>
			</select>
			<select name="item_type" class="item_type">
				<option>전체</option>
				<option>사료</option>
				<option>간식</option>
				<option>용품</option>
			</select>
			<input type="text" name="keyword" id="search_text">
			<input type="button" value="검색" class="btn_search">
		</div>
		 <div class="content_container">
	    	<div class="content_item_container_row"></div> 
	    	
	      <script id="temp" type="text/x-handlebars-template">

	{{#each list}}
      <div class="content_item_box_container" pno="{{pno}}" data-pno="{{pno}}">
		<div class="img_container" style="position:relative;" onclick='getLocation(this)' pno="{{pno}}">
        	<img src="{{pimage}}" class="content_img" alt="https://via.placeholder.com/200x200/d3d3d3">
			<img class="soldout" src="/resources/soldout.png" width=170>
		</div>
        	<div class="content_item_title" pno="{{pno}}">{{pname}}</div>
        	<div class="content_item_price">
          		<div class="price_item1">{{comma pprice}}원</div> <div class="cart_add1"><img src="/resources/icon_menu/cart_add.png" id="cart_add1"></div>
       		</div>
        	<div class="content_item_title_row">
				<div class="content_item_title">{{replace pbrand}}</div>   
       		</div>
		</div>
	{{/each}}
        </script>		  
	 	 </div> 
	 </div>
	<div class="pagination"></div>
</body>
<script>
 $("#pagination a").click(function(e){
 e.preventDefault();
 var page=$(this).attr("href");
 frm.page.value=page;
 });
</script>
<script>
/*Brand명이 없으면 'House Brand를 러턴 */
	Handlebars.registerHelper("replace",function(pbrand){
		var replace ='House Brand';
		if(pbrand==''){
			return replace;
		}else{
			return pbrand;
		}	
	});
	Handlebars.registerHelper("comma", function(pprice) {
		return pprice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
	})
	
</script>

<script>
	var page=1;
	var keyword="";
	var selectCate="${cate}";
	var selectCate2="${cate2}";
	var selectCate3="${cate3}";
	getContentsList();
	
	//상품 클릭시 리드페이지로 이동
	function getLocation(e){	
		var pno = $(e).attr("pno"); 
		location.href="read?pno="+pno+"&selectCate="+selectCate+"&selectCate2="+selectCate2+"&selectCate3="+selectCate3; 
	}
	
	/* 장바구니 버턴 */
	$(".content_item_container_row").on("click",".cart_add1" ,function(){
		var pno = $(".content_item_title").find("pno");
		alert("add to cart"+"pno:"+pno);
	})

	
		
	
	function getContentsList(){
		$.ajax({
			type: "get",
			dataType: "json",
			data: {page:page, keyword:keyword},
			url: "/shopproduct/contents_list.json?selectCate="+selectCate+"&selectCate2="+selectCate2+"&selectCate3="+selectCate3,
			success:function(data){
				var template = Handlebars.compile($("#temp").html());
				$(".content_item_container_row").html(template(data));
				$(".pagination").html(getPagination(data));
				window.scroll({ top: 0, left: 0, behavior: "smooth" })
			}
		});
	}
	
	$(".pagination").on("click", "a", function(e){
		e.preventDefault();
		page=$(this).attr("href");
		getContentsList();
	});
	
	//검색버튼을 클릭했을 경우
	$(".btn_search").on("click", function(){
		keyword = $("#search_text").val();
		selectCate="";
		selectCate2=$(".item_type").val();
		selectCate3=$(".animal_type").val();
		if(selectCate2=="전체") {
			selectCate2 = "";
		}if(selectCate3=="전체"){
			selectCate3 = "";
		}
		getContentsList();
	});
	
	
    //엔터 프레스 => click()
    $("#search_text").on("keypress", function(e){
    	if(e.key === "Enter"){
    		$(".btn_search").click();
    	}
    });
    
    $(".goAll").on("click", function(){
		location.href = "/shopproduct/contents_list";
	});
</script>