<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="/resources/temp_page.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick-theme.min.css">
<!-- <script src="https://cdn.jsdelivr.net/npm/handlebars@latest/dist/handlebars.js"></script> -->
<meta charset="UTF-8">
<title>news</title>

<!--슬라더에서
-슬라이더 내용에서 ▶▶ 기호 제거 해야할 것. 정규직 표현 적용이 잘 않되고 있음 \
-슬라이더 페이진내이션 부분에서 점 제거 해야 함. 현제 display: false로 설정 했음.
-슬라이더 데이터는 실시간 크롤링 해야 하기 때문에 불러 오는 속도가 느리다. 약 30초. 이문제 풀어야할것.
-스타일 최총 버전은 별개의  css 페이지로 이동 할것
-Source: https://www.hani.co.kr/arti/animalpeople/companion_animal/list1.html (반력동물 색션)
  -->
<!-- Slick 불러오기 -->
<style>
   .name {width:200px; font-size:13px; color:black; font-weight:bold;}
   .content, .date{width:200px; height:50px; font-size:12px; color:black;}
   .slider_box{width:200px; height:200px; border: 1px soild black;}
   .ellipsisM{
     display: -webkit-box;
   	-webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
    overflow: hidden;
    text-overflow: ellipsis;
    line-height:12px;
    max-height: 24px;
}
.date{
color:#94938e
font-weight:900;
}
.slick-prev:before, .slick-next:before{
    color:gray;
}
</style>
</head>


<p>https://www.hani.co.kr/arti/animalpeople/companion_animal/list1.html<p>
<!-- stlye 은 slick 영역 확인용 -->
<div style="padding:50px 50px; width:870px; height:225px; background-color:white;">
   <div class="slider-div"></div>
   <script id="temp" type="text/x-handlebars-template">
            {{#each array}}
				<div class="slider_box">
				<img src="{{image}}" width=200 height=150>              
				<div class="ellipsis name"><a href="{{link}}">{{title}}</a></div>
				<div class="ellipsisM content">{{tagless content}}</div>	
				<div class="date">{{date}}</div>
				</div>
				
            {{/each}}
   </script>
</div>


</body>

<script>
Handlebars.registerHelper("tagless", function(content) {
	return content.toString().replace(/(<([^>▶]+)>▶▶)/ig,"");
	})
</script>


<script>


getNews();
function getNews(){
	$.ajax({
	    type:"get",
	    url:"/crawl/hani.json",
	    dataType:"json",	    
	    success:function(data){
	       destroy();
	       var template = Handlebars.compile($("#temp").html());
	       $(".slider-div").html(template(data));   
	       apply();
	    }
	 });
}


 
 function destroy() {
    if ($('.slider-div').hasClass('slick-initialized')) {
        $('.slider-div').slick('unslick');
    }
}
 
 function apply() {
     $('.slider-div').slick({
         slide : 'div',  //슬라이드 되어야 할 태그 ex) div, li 
         infinite : true,  //무한 반복 옵션
         slidesToShow :4,  // 한 화면에 보여질 컨텐츠 개수
         slidesToScroll : 1,  //스크롤 한번에 움직일 컨텐츠 개수
         speed : 8000,  // 다음 버튼 누르고 다음 화면 뜨는데까지 걸리는 시간(ms)
         arrows : true,  // 옆으로 이동하는 화살표 표시 여부
         dots : false,  // 스크롤바 아래 점으로 페이지네이션 여부
         autoplay : true,  // 자동 스크롤 사용 여부
         autoplaySpeed : 0,  // 자동 스크롤 시 다음으로 넘어가는데 걸리는 시간 (ms)
         pauseOnHover : true,  // 슬라이드 이동    시 마우스 호버하면 슬라이더 멈추게 설정
         vertical : false,  // 세로 방향 슬라이드 옵션
         prevArrow : "<button type='button' class='slick-prev'>Previous</button>",  // 이전 화살표 모양 설정
         nextArrow : "<button type='button' class='slick-next'>Next</button>",  // 다음 화살표 모양 설정
         dotsClass : "slick-dots",  //아래 나오는 페이지네이션(점) css class 지정
         draggable : true,  //드래그 가능 여부 
         /* cssEase: 'linear', */
         // 반응형 웹구현 옵션
         responsive : [
             {
                 breakpoint : 960,  //화면 사이즈 960px
                 settings : { slidesToShow : 3 }  //위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
             },
             {
                 breakpoint : 768,  //화면 사이즈 768px
                 settings : { slidesToShow : 2 }  //위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
             }
         ]
     });
 }
</script>
</html>