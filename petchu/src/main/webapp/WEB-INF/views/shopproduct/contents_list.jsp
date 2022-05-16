<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<title>Content list</title>
<link href="/resources/temp_page.css" rel="stylesheet">
<link href="/resources/css/content_list.css" rel="stylesheet">
<style>

</style>
</head>
<body>
	<div id="content_page">
		<!-- <div class="contents_box">
			<span><button class="goAll">전체</button></span> <select
				name="animal_type" class="animal_type">
				<option>전체</option>
				<option>강아지</option>
				<option>고양이</option>
			</select> <select name="item_type" class="item_type">
				<option>전체</option>
				<option>사료</option>
				<option>간식</option>
				<option>용품</option>
			</select> <input type="text" name="keyword" id="search_text"> <input
				type="button" value="검색" class="btn_search">
		</div> -->
		
		<div class="top_nav_bar">
  <div class="btn_all_container">
    <a href="#" class="btn_show_all">전체보기</a>
    </div>
  
  <div class="menu_container_main">
  <div class="menu_container1">
       
           <div>펫타입: </div>
            <div class="menu-options">
            <div>
              <input type="radio" name="main_category" id="menu_dog" checked>
                <label for="menu_dog">
                  강아지 
                </label>
            </div>
            <div>
              <input type="radio" name="main_category" id="menu_cat">
                <label for="menu_cat">
                  고양이
                </label>
            </div>
           </div>
  </div>
  <div class="menu_container2">
  <div class="menu_title">선택: </div>
    <div class="select_wrapper">
	    <div class="select_container">
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
	     </div>
    </div>
    </div>
  
  <div class="menu_container3">
    <div class="menu_item1"></div>
  <div class="menu_item2">
      <div class="searchfield">
        <input type="text" name="keyword" id="search_text">
        <div class="btn_search"><img src="/resources/icon_menu/icon_navbar_loupe.png" alt='search icon' width=30></div>     
    	</div>
 	 </div>
  
  </div>
    </div>
  <!-- <div class="menu_option_icon"><img src="/resources/icon_menu/navbar_list.png" width=40></div> -->
</div>

		<div class="content_container">
			<div class="content_item_container_row"></div>

			<script id="temp" type="text/x-handlebars-template">

	{{#each list}}
      <div class="content_item_box_container">
		<div class="img_container" style="position:relative;" onclick='getLocation(this)' pno="{{pno}}">
        	<img src="{{pimage}}" class="content_img" alt="https://via.placeholder.com/200x200/d3d3d3">
			<img class="soldout" src="/resources/soldout.png" width=170>
		</div>
        	<div class="content_item_title" pno="{{pno}}" data-price="{{pprice}}" data-pno="{{pno}}">{{pname}}</div>
        	<div class="content_rating_container">
				<div class="rating rating2"><!--
		--><a href="#5" title="Give 5 stars">★</a><!--
		--><a href="#4" title="Give 4 stars">★</a><!--
		--><a href="#3" title="Give 3 stars">★</a><!--
		--><a href="#2" title="Give 2 stars">★</a><!--
		--><a href="#1" title="Give 1 star">★</a>
				</div>
			</div>
			<div class="content_item_price">
          		<div class="price_item1">{{comma pprice}}원</div> <div class="cart_add1"><img src="/resources/icon_menu/cart_add.png" id="cart_add1"></div>
       		</div>
        	<div class="content_item_title_row" pno="{{pno}}">
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
	$("#pagination a").click(function(e) {
		e.preventDefault();
		var page = $(this).attr("href");
		frm.page.value = page;
	});
</script>
<script>
	/*Brand명이 없으면 'House Brand를 러턴 */
	Handlebars.registerHelper("replace", function(pbrand) {
		var replace = 'House Brand';
		if (pbrand == '') {
			return replace;
		} else {
			return pbrand;
		}
	});
	Handlebars.registerHelper("comma", function(pprice) {
		return pprice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
	})
</script>

<script>
	var page = 1;
	var keyword = "";
	var selectCate = "${cate}";
	var selectCate2 = "${cate2}";
	var selectCate3 = "${cate3}";
	getContentsList();

	//상품 클릭시 리드페이지로 이동
	function getLocation(e) {
		var pno = $(e).attr("pno");
		location.href = "read?pno=" + pno + "&selectCate=" + selectCate
				+ "&selectCate2=" + selectCate2 + "&selectCate3=" + selectCate3;
	}

	/* 장바구니 버턴 - 바구니에 추가 (update/insert) */
	$(".content_item_container_row").on("click", ".cart_add1", function() {
		var item = $(this).parent().parent();
		var pno = item.data("pno");
		var price = item.data("price");
		alert("Hello" + " pno: " + pno + "!" + price);

		$.ajax({
			type : "post",
			url : "/shopproduct/update",
			data : {
				uid : uid,
				pno : pno,
				qnt : qnt
			},
			success : function() {
				alert('success');
			}
		})
	})

	function getContentsList() {
		$.ajax({
			type : "get",
			dataType : "json",
			data : {
				page : page,
				keyword : keyword
			},
			url : "/shopproduct/contents_list.json?selectCate=" + selectCate
					+ "&selectCate2=" + selectCate2 + "&selectCate3="
					+ selectCate3,
			success : function(data) {
				var template = Handlebars.compile($("#temp").html());
				$(".content_item_container_row").html(template(data));
				$(".pagination").html(getPagination(data));
				window.scroll({
					top : 0,
					left : 0,
					behavior : "smooth"
				})
			}
		});
	}

	$(".pagination").on("click", "a", function(e) {
		e.preventDefault();
		page = $(this).attr("href");
		getContentsList();
	});

	//검색버튼을 클릭했을 경우
	$(".btn_search").on("click", function() {
		keyword = $("#search_text").val();
		selectCate = "";
		selectCate2 = $(".item_type").val();
		selectCate3 = $(".animal_type").val();
		if (selectCate2 == "전체") {
			selectCate2 = "";
		}
		if (selectCate3 == "전체") {
			selectCate3 = "";
		}
		getContentsList();
	});

	//엔터 프레스 => click()
	$("#search_text").on("keypress", function(e) {
		if (e.key === "Enter") {
			$(".btn_search").click();
		}
	});

	$(".goAll").on("click", function() {
		location.href = "/shopproduct/contents_list";
	});
</script>