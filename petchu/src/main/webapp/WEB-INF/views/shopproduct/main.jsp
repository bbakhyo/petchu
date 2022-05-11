<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<link href="http://kenwheeler.github.io/slick/slick/slick.css"
	rel="stylesheet" />
<link rel="stylesheet" type="text/css"
	href="http://kenwheeler.github.io/slick/slick/slick-theme.css" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick-theme.min.css">


</head>
<style>
/* 슬라이더 페이징 버턴 */
.slick-prev:before, .slick-next:before {
	color: gray;
}
.category_item {
	width: 213px;
	float:left;
	list-style: none;
	text-align: left;
	line-height: 50px;
	
}
.category_box, .category_list {
	cursor: pointer;
}
.category_snack, .category_foods, .category_supplies {
	 display: none;
}
/* 페이지 메뉴(게/고양이 선택시) 하위 메뉴 보여주시/숨기기 */
.cat{
display: none;
}
.active{
display: block;
}
.dog{
display: none;
}
.active{
display: block;
} 
.category_select {
	display: flex;
	justify-content: center;
	align-items: center;
	text-align: center;
	margin: 0px auto;
	margin-top: 40px;
	width: 100%;
	height: 150px;
	/* border: 1px black solid; */
}
/* .none_show {
	display: none;
} */
.menu_item[type="radio"]+label {
	display: inline;
	margin-top: 30px;
	margin: 30px;
	cursor: pointer;
	padding: 10px 10px 10px 10px;
	min-width: 100px;
	/* border: 1px solid #A7CA37; */
	line-height: 24px;
	text-align: center;
	font-weight: bold;
	font-size: 15px;
	border-radius: 10px;
}
/* 일방적으로 적용되서 주석 처일함.원인 불명 */
/* 하위 매뉴 아이탬 선택시  */
.checked[type="radio"]:checked+label{
	background-color: #A7CA37;
	color: white;
	width: 100px;
	padding: 10px 10px 10px 10px;
/* 	 border: 1px solid red; */
} 

.checked{
	background:#000000;
}

/* 매뉴 페이저 : 강아지/고양이  */
[type="radio"]:checked+label {
	border-bottom:3px solid #A7CA37;
/* 	background-color: #A7CA37;  */
	color: white;
	
	
}
/*메뉴 : 강아지/공양이 선택 포인터 */
.select {
	cursor: pointer;
}
/*메뉴 : 강아지/공양이 선택 포인터  */
label{
cursor:inherit;
}
[type="radio"] {
	display: none;
}
/* 슬라이저 각 카드 모양 */
.slider_item_card {
	text-align: center;
	display: flex;
	flex-direction: column;
	width: 180px;
	height: 250px;
	/* background-color: #febdbd; */
	font-style: "nanum gothic";
}
/* 슬라이더 이미지 규격 */
.item_img {
	width: 180px;
	height: 180px;
	cursor: pointer;
}
/* 슬라이더 컨탠츠 규격(횬재 없음) */
.pcontent {
	width: 178px;
	height: 30px;
	font-size: 12px;
	overflow: hidden;
	text-overflow: ellipsis;
	display: -webkit-box;
	-webkit-line-clamp: 2;
	-webkit-box-orient: vertical;
	white-space: normal;
	/* border: 1px solid black; */
}
/* 슬라이더 제품 규격 */
.ptitle {
	font-size: 12px;
	padding: 5px 0px 2px 0px;
}
/* 슬라이더 가격 규격 */
.row_price {
	
}
.pprice {
	font-size: 14px;
	font-family: "tahoma";
	color: red;
}
.pcontent {
	font-size: 12px;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}
.name {
	width: 200px;
	font-size: 13px;
	color: black;
	font-weight: bold;
}
/* 슬라이더 출력 공간(AJAX) Today1 */
.slider-div-today {
	display: flex;
}
.slider-div-best {
	display: flex;
}
.page {
	display: flex;
	flex-direction: column;
}
ul.sub_menu_cat>li {
	display: inline-block;
	float: left;
}
/* .category2, .categoryBody {
	position: sticky;
	top: 0;
} */
/* BEST 상품 디자인 */
.best_container{
  display: flex;
  flex-direction: column;
  font-family: "Apple SD Gothic Neo", "Malgun Gothic", "Nanum Gothic", "Noto Sans", "sans-serif";
}
.best_container>h2{
  font-size:30px;
  text-align: center;
}
.best_container_top, .best_container_bottom{
  width: 960px;
  height: 380px;
  display: flex;
  justify-content: space-around;
  gap: 5px;
  flex-wrap: wrap;
  margin-bottom: 30px;
}
.best_item_box{
  display: flex;
  flex-direction: column;
  
  font-family: "nanum gothic"; 
  width: 300px;
  height: 370px;
/*   background-color: #d8d5d5; */
}
/* 허버시 우두움  */
.best_item_box:hover{
  filter: brightness(50%);
}
/* 상품 사진 위에 고정된 Best 1.. 설정 */
.best_item_img{
  position: relative;
  top: 0;
  left: 0;
  width: 300px;
  height: 300px;
  cursor:pointer;
  
/*   border: 1px solid black; */
}
/* 상품 사진 위에 고정된 Best 1.. 설정 */
.img_best{
  position: relative;
  top: 0;
  left: 0;
  width:300px;
  height:300px;
}
/* 상품 사진 위에 고정된 Best 1.. 이미지 고정 설정 */
img.best_icon{
  position: absolute;
  top: 0;
  left: 0;
}
/* 제목 + 가격 공단 컨테이너  */
.best_item_content{
  height: 65px;
  width: 300px;
  display: flex;
  flex-direction: column;
  justify-content: space-around;
}
.best_item_title{
  font-size: 16px;
  overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}
.best_item_price{
  font-size: 14px;
  display: flex;
  
}
/* 배너 규격 */
.banner_box{
height: 200px;
width: 960px;
display: flex;
}

//맨위 강아지 두 마리 사진 - 추후 다른 거로 대체하면 배너 style과 배너 img 스타일 변경
.banner{
	width:700px;
	height:300px;
	overflow: hidden;
	margin-left: 20px;
}
.banner img{
	max-width: initial;
	max-height: initial;
}

</style>

<body>
	<div class="page">
		<div class="banner" style="display: flex; justify-content:center; width:700px; height:300px; overflow: hidden; margin-left: 143px;">
			<img src="/resources/petchu_dog_banner.png">
		</div>

			<!-- 주 카타고리 -->
		<div class="categoryBody">
			<div class="category_select">
				
				<!-- 1. 공양이 -->
				<div class="category_cat select">
					<input type="radio" name="animal" value="고양이" id="cat"><label
						for="cat"><img
						src="/resources/icon_menu/content_select_cat.png"
						style="margin-right: 20px;"></label>
				</div>

				<!--메뉴 간격(space)-->
				<div>
					<span><img
						src="/resources/icon_menu/content_select_middle_icon.png"
						style="width: 37px; height: 97px; position: relative; top: 15px"></span>
				</div>

				<!-- 2. 강아지 -->
				<div class="category_dog select">
					<input type="radio" name="animal" value="강아지" id="dog"><label
						for="dog"><img
						src="/resources/icon_menu/content_select_dog.png"
						style="margin-left: 20px;"></label>
				</div>
			</div>
			<hr style="width: 960px; margin-top: 20px; margin-bottom: 20px;" />

			<div id="menu"></div>
		<!--주 매뉴 : 고양이/강아지 이미지 선택   -->
			<div id="category1" class="category1">
				<!-- 사료 / 간식 / 용품 -->
				<!-- 		<div class="category_list none_show" id="pet_foods">사료</div> -->
				<!-- 		<div class="category_list none_show" id="pet_snack">간식</div> -->
				<!-- 		<div class="category_list none_show" id="pet_supplies">용품</div> -->
				
				<!-- 고양이 선택할 경우 매뉴 나타나기(JS) -->
				<div class="cat">
				<input type="radio" name="item_type" value="사료" id="petFoods"
					class="menu_item"> <label for="petFoods"> 고양이 사료</label> <input
					type="radio" name="item_type" value="간식" id="petSnack"
					class="menu_item"> <label for="petSnack">간식</label> <input
					type="radio" name="item_type" value="용품" id="petSupplies"
					class="menu_item"> <label for="petSupplies">용품</label>
				 </div>		                                                         
				
				<!-- 강아지 선택할 경우 매뉴 나타나기(JS) -->
				<div class="dog">
				<input type="radio" name="item_type" value="사료" id="petFoods2"
					class="menu_item menu_item2"> <label class = "label" for="petFoods2">강아지 사료</label> <input
					type="radio" name="item_type" value="간식" id="petSnack2"
					class="menu_item menu_item2"> <label class = "label" for="petSnack2">간식</label> <input
					type="radio" name="item_type" value="용품" id="petSupplies2"
					class="menu_item menu_item2"> <label class = "label" for="petSupplies2">용품</label>
				</div>
			</div>
			
			
			<div id="category2" class="category2">
				<!-- 하위 카테고리 목록 -->
				<section>
					<ul class="category_list2 category_foods" selectCate2="사료">
						<li class="category_item">
							<div class="category_box">건식</div>
						</li>
						<li class="category_item">
							<div class="category_box">습식</div>
						</li>
						<li class="category_item">
							<div class="category_box">테스트 카테고리3</div>
						</li>
						<li class="category_item">
							<div class="category_box">테스트 카테고리4</div>
						</li>
						<li class="category_item">
							<div class="category_box">테스트 카테고리5</div>
						</li>
						<!-- <li class="category_item">
							<div class="category_box">테스트 카테고리6</div>
						</li>
						<li class="category_item">
							<div class="category_box">테스트 카테고리7</div>
						</li>
						<li class="category_item">
							<div class="category_box">테스트 카테고리8</div>
						</li>
						<li class="category_item">
							<div class="category_box">테스트 카테고리9</div>
						</li>
						<li class="category_item">
							<div class="category_box">테스트 카테고리10</div>
						</li>
						<li class="category_item">
							<div class="category_box">테스트 카테고리11</div>
						</li>
						<li class="category_item">
							<div class="category_box">테스트 카테고리12</div>
						</li>
						<li class="category_item">
							<div class="category_box">테스트 카테고리13</div>
						</li>
						<li class="category_item">
							<div class="category_box">테스트 카테고리14</div>
						</li>
						<li class="category_item">
							<div class="category_box">테스트 카테고리15</div>
						</li>
						<li class="category_item">
							<div class="category_box">테스트 카테고리16</div>
						</li> -->
					</ul>
					<!-- -------------------------- -->
					<ul class="category_list2 category_snack" selectCate2="간식">
						<li class="category_item">				
						<div class="category_box">동결건조</div>
						</li>
						<li class="category_item">
							<div class="category_box">수제간식</div>
						</li>
						<li class="category_item">
							<div class="category_box">테스트 간식 카테고리3</div>
						</li>
						<li class="category_item">
							<div class="category_box">테스트 간식 카테고리4</div>
						</li>
						<li class="category_item">
							<div class="category_box">테스트 간식 카테고리5</div>
						</li>
						<%-- <!-- 	<li class="category_item">
							<div class="category_box">테스트 간식 카테고리6</div>
						</li>
						<li class="category_item">
							<div class="category_box">테스트 간식 카테고리7</d<!-- iv>
						</li>
						<li  -->class="category_item">
							<div class="category_box">테스트 간식 카테고리8</div>
						</li>
						<li class="category_item">
							<div class="category_box">테스트 간식 카테고리9</div>
						</li>
						<li class="category_item">
							<div class="category_box">테스트 간식 카테고리10</div>
						</li>
						<li class="category_item">
							<div class="category_box">테스트 간식 카테고리11</div>
						</li>
						<li class="category_item">
							<div class="category_box">테스트 간식 카테고리12</div>
						</li>
						<li class="category_item">
							<div class="cate<!-- gory_box">테스트 간식 카테고리13</d -->iv>
						</li>
						<li class="category_item">
							<div class="category_box">테스트 간식 카테고리14</div>
						</li>
						<li class="category_item">
							<div class="category_box">테스트 간식 카테고리15</div>
						</li>
						<li class="category_item">
							<div class="category_box">테스트 간식 카테고리16</div>
						</li> --> --%>
					</ul>
					<!-- -------------------------- -->
					<ul class="category_list2 category_supplies" selectCate2="용품">
						<li class="category_item">
							<div class="category_box">모래</div>
						</li>
						<li class="category_item">				<div class="category_box">배변패드</div>
						</li>
						<li class="category_item">
							<div class="category_box">테스트 용품 카테고리3</div>
						</li>
						<li class="category_item">
							<div class="category_box">테스트 용품 카테고리4</div>
						</li>
						<li class="category_item">
							<div class="category_box">테스트 용품 카테고리5</div>
						</li>
						<!-- <li class="category_item">
							<div class="category_box">테스트 용품 카테고리6</div>
						</li>
						<li class="category_item">
							<div class="category_box">테스트 용품 카테고리7</div>
						</li>
						<li class="category_item">
							<div class="category_box">테스트 용품 카테고리8</div>
						</li>
						<li class="category_item">
							<div class="category_box">테스트 용품 카테고리9</div>
						</li>
						<li class="category_item">
							<div class="category_box">테스트 용품 카테고리10</div>
						</li>
						<li class="category_item">
							<div class="category_box">테스트 용품 카테고리11</div>
						</li>
						<li class="category_item">
							<div class="category_box">테스트 용품 카테고리12</div>
						</li>
						<li class="category_item">
							<div class="category_box">테스트 용품 카테고리13</div>
						</li>
						<li class="category_item">
							<div class="category_box">테스트 용품 카테고리14</div>
						</li>
						<li class="category_item">
							<div class="category_box">테스트 용품 카테고리15</div>
						</li>
						<li class="category_item">
							<div class="category_box">테스트 용품 카테고리16</div>
						</li> -->
					</ul>
				</section>
			</div>
		</div>
		<div class="best_container">
			  <h2>BEST 상품</h2>
			    <div class="best_container_top">
			     <c:forEach items="${blist}" var="bvo">
			      <div class="best_item_box">      
			        <div class="best_item_img" pno = "${bvo.pno}" onclick='locationPno(this)'><img src="${bvo.pimage}" alt='best' class="img_best"><img src="/resources/icon_menu/best_1.png" class="best_icon"></div>
			        <div class="best_item_content">
			          <div class="best_item_title">
			          	${bvo.pname}
			          </div>
			           <div class="best_item_price"><span class="price">${bvo.pprice}</span><span>원</span></div>
			        </div>
			      </div>
			       </c:forEach>
			</div>
			    <div class="best_container_bottom">
				 <c:forEach items="${blist2}" var="b2vo">
   			      <div class="best_item_box">      
			        <div class="best_item_img" pno = "${b2vo.pno}" onclick='locationPno(this)'><img src="${b2vo.pimage}" alt='best' class="img_best"><img src="/resources/icon_menu/best_4.png" class="best_icon"></div>
			        <div class="best_item_content">
			          <div class="best_item_title">
			         	${b2vo.pname}
			          </div>
			          <div class="best_item_price"><span class="price">${b2vo.pprice}</span><span>원</span></div>
			        </div>
			      </div>
				</c:forEach>
			</div><!-- best container bottom  -->
		</div><!-- best container(top and bottom)  -->

		
		<!--출력 내용 필요함. 현제 중복 내용 출력  -->
		<!--특가 상품  -->
		<div class="slider_component">
			<div style="text-align:center;">
				<h1>주간 상품</h1>
			</div>
			<div
				style="padding: 50px 0px; width: 1000x; height: 270px; background-color: white;">
				
				<!-- AJAX -->
				<div class="slick-slider-best"></div>
				<script id="temp" type="text/x-handlebars-template">
				{{#each best1}}
					<div class="slider_item_card" pno={{pno}} onclick='locationPno(this)'>
						<div class="item_img">
							<img src="{{pimage}}" alt="img" width=180>
						</div>
						<div class="ellipsis ptitle">
						<a href="">{{pname}}</a>
						</div>
						<div class="row_price">
						<span class="price">{{pprice}}</span><span>원</span>
						</div>
					</div>
				{{/each}}
			</script>
			</div>
		</div>
		
		
		
		<!-- 오늘의 상품 -->
		<div class="slider_component">
			<div style="text-align:center;">
				<h1>오늘의 상품</h1></div>
			<div
				style="padding: 50px 0px; width: 1000x; height: 270px; background-color: white;">
				
				<!-- AJAX -->
				<div class="slick-slider-today"></div>
				<script id="temp2" type="text/x-handlebars-template">
				{{#each today1}}
					<div class="slider_item_card" pno={{pno}} onclick='locationPno(this)'>
						<div class="item_img">
					<img src="{{pimage}}" alt="img" width=180>
					</div>
					<div class="ellipsis ptitle">
					<a href="">{{pname}}</a>
					</div>
					<div class="row_price">
					<span class="price">{{pprice}}</span><span>원</span>
					</div>
					</div>
				{{/each}}
			</script>
		</div>
	</div>
	
		<div class="banner_box" style="display: flex; justify-center;">
			<img src="/resources/icon_menu/banner_left.png" alt='banner' style="height: 50%;width: 50%"><img src="/resources/icon_menu/banner_right.png" alt='banner' style="height: 50%;width: 50%">
		</div>
	
	</div><!-- page tag -->
</body>

<script>
/* 오늘의 상품 출력 */
	
	getToday();
	function getToday() {
		$.ajax({
			type : "get",
			url : "/shopproduct/main.json",
			dataType : "json",
			success : function(data) {
				destroyToday();
				var template = Handlebars.compile($("#temp2").html());
				$(".slick-slider-today").html(template(data));
				applyToday();
				getNumberFormat();
			}
		})
	}
/* Best 상품 출력 */
	getBest();
	function getBest() {
		$.ajax({
			type : "get",
			url : "/shopproduct/main.json",
			dataType : "json",
			success : function(data) {
				destroyBest();
				var template = Handlebars.compile($("#temp").html());
				$(".slick-slider-best").html(template(data));
				applyBest()
				getNumberFormat()
			}
		})
	}
	function destroyToday() {
		if ($('.slick-slider-today').hasClass('slick-initialized')) {
			$('.slick-slider-today').slick('unslick');
		}
	}
	function applyToday() {
		$('.slick-slider-today')
				.slick(
						{
							slide : 'div', //슬라이드 되어야 할 태그 ex) div, li 
							infinite : true, //무한 반복 옵션
							slidesToShow : 5, // 한 화면에 보여질 컨텐츠 개수
							slidesToScroll : 5, //스크롤 한번에 움직일 컨텐츠 개수
							speed : 1000, // 다음 버튼 누르고 다음 화면 뜨는데까지 걸리는 시간(ms)
							arrows : true, // 옆으로 이동하는 화살표 표시 여부
							dots : false, // 스크롤바 아래 점으로 페이지네이션 여부
							autoplay : true, // 자동 스크롤 사용 여부
							autoplaySpeed : 10000, // 자동 스크롤 시 다음으로 넘어가는데 걸리는 시간 (ms)
							pauseOnHover : true, // 슬라이드 이동    시 마우스 호버하면 슬라이더 멈추게 설정
							vertical : false, // 세로 방향 슬라이드 옵션
							prevArrow : "<button type='button' class='slick-prev'>Previous</button>", // 이전 화살표 모양 설정
							nextArrow : "<button type='button' class='slick-next'>Next</button>", // 다음 화살표 모양 설정
							dotsClass : "slick-dots", //아래 나오는 페이지네이션(점) css class 지정
							draggable : true, //드래그 가능 여부 
							// 반응형 웹구현 옵션
							responsive : [ {
								breakpoint : 960, //화면 사이즈 960px
								settings : {
									slidesToShow : 3
								}
							//위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
							}, {
								breakpoint : 768, //화면 사이즈 768px
								settings : {
									slidesToShow : 2
								}
							//위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
							} ]
						});
	}
	
	function destroyBest() {
		if ($('.slick-slider-best').hasClass('slick-initialized')) {
			$('.slick-slider-best').slick('unslick');
		}
	}
	function applyBest() {
		$('.slick-slider-best')
				.slick(
						{
							slide : 'div', //슬라이드 되어야 할 태그 ex) div, li 
							infinite : true, //무한 반복 옵션
							slidesToShow : 5, // 한 화면에 보여질 컨텐츠 개수
							slidesToScroll : 5, //스크롤 한번에 움직일 컨텐츠 개수
							speed : 1000, // 다음 버튼 누르고 다음 화면 뜨는데까지 걸리는 시간(ms)
							arrows : true, // 옆으로 이동하는 화살표 표시 여부
							dots : false, // 스크롤바 아래 점으로 페이지네이션 여부
							autoplay : true, // 자동 스크롤 사용 여부
							autoplaySpeed : 10000, // 자동 스크롤 시 다음으로 넘어가는데 걸리는 시간 (ms)
							pauseOnHover : true, // 슬라이드 이동    시 마우스 호버하면 슬라이더 멈추게 설정
							vertical : false, // 세로 방향 슬라이드 옵션
							prevArrow : "<button type='button' class='slick-prev'>Previous</button>", // 이전 화살표 모양 설정
							nextArrow : "<button type='button' class='slick-next'>Next</button>", // 다음 화살표 모양 설정
							dotsClass : "slick-dots", //아래 나오는 페이지네이션(점) css class 지정
							draggable : true, //드래그 가능 여부 
							// 반응형 웹구현 옵션
							responsive : [ {
								breakpoint : 960, //화면 사이즈 960px
								settings : {
									slidesToShow : 3
								}
							//위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
							}, {
								breakpoint : 768, //화면 사이즈 768px
								settings : {
									slidesToShow : 2
								}
							//위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
							} ]
						});
	}
</script>
<script>
	var cate3val = "";
	var cate2val = "";
	//카테고리 선택시 해당 카테고리의 정보를 담아서 페이지 이동
	$(".category_box").on(
			"click",
			function() {
				var cateval = $(this).text(); //필터링할 카테고리 분류 
				location.href = "/shopproduct/contents_list?selectCate="
						+ cateval + "&selectCate2=" + cate2val
						+ "&selectCate3=" + cate3val;
			});
	//하위 카테고리 display:none;
	function removeCate_2() {
		$(".category_foods").hide();
		$(".category_supplies").hide();
		$(".category_snack").hide();
	}
	   $("input[name='animal']:radio").change(function () {
          //라디오 버튼 값을 가져온다.
          cate3val = this.value;
          $(".category1").attr("class", "category1");
	      $(".category_list2").attr("style", "display:none");       
	      $("input[name='item_type']:radio").prop("checked",false);;
	   });
	   

	$("input[name='item_type']:radio").change(function() {
		//2번 선택지
		//체크드가 라벨이 아닌 라디오에서 되기 때문에 라벨에 클래스 style을 주기 어려움. 생각해 볼 것
		$(".menu_item").attr("class", "menu_item");
		$(this).attr("class", "menu_item checked");
		console.log($(this).attr("class"));
		
		
		cate2val = this.value;
		//value값이 무엇이냐에 따라 다르게 출력  '
		if (cate2val == '사료') {
			removeCate_2();
			$(".category_foods").show();
		} else if (cate2val == '간식') {
			removeCate_2(); //보이게 하기 전에 열려있는 하위 카테고리 값 display:none으로 설정.
			$(".category_snack").show();
		} else {
			removeCate_2();
			$(".category_supplies").show();
		}
	});// 펑션 끝
	/* 강아지 하위 매뉴 보여주기/숨기기 */
	$(document).ready(function() {
		$('.category_select > .category_cat').click(function(e) {
			$('.category1 > .cat').addClass('active');
			 $('.category1 > .dog').removeClass('active'); 			
		});
	});
	/* 고양이 하위 매뉴 보여주기/숨기기 */
	$(document).ready(function() {
		$('.category_select > .category_dog').click(function(e) {
			$('.category1 > .dog').addClass('active');
			 $('.category1 > .cat').removeClass('active'); 
		});
	});
	
	//상품 클릭시 해당 페이지로 이동
	function locationPno(e){
		var pno = $(e).attr("pno");
		location.href="/shopproduct/read?pno="+pno;
	}
	
	//가격포맷
	function getNumberFormat(){
		$(".price").each(function(){
			var price = $(this).html();
			price=price.replace(/\B(?=(\d{3})+(?!\d))/g, ',');
			$(this).html(price);
		});
	}
		
	//아이콘 숫자 지정
	var i = 0;
	$(".best_icon").each(function(){
		i++;
		$(this).attr("src", "/resources/icon_menu/best_"+i+".png")
	});
</script>