<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<link rel='stylesheet' href="/resources/home.css">
	<link rel="short icon" href="#">
	<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
	<script src="/resources/pagination.js"></script>
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<script type="text/javascript" src="/resources/chart.js"></script>
	<title>Insert title here</title>
</head>
<style>
.modal_wrap {
	display: none;
	width: 400px;
	height: 500px;
	position: absolute;
	top: 45%;
	left: 50%;
	margin: -250px 0 0 -250px;
	background: #FFFFFF;
	z-index: 2;
	border-radius: 30px;
}

.black_bg {
	display: none;
	position: absolute;
	content: "";
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5);
	top: 0;
	left: 0;
	z-index: 1;
}

.modal_close {
	width: 26px;
	height: 26px;
	position: absolute;
	top: -30px;
	right: 0;
}

.modal_close>a {
	display: block;
	width: 100%;
	height: 100%;
	background: url(https://img.icons8.com/metro/26/000000/close-window.png);
	text-indent: -9999px;
}

.buttonc {
	position : relative;
	top:3%;
	left:65%;
	
}

.buttonb {
	position : relative;
	top: -2%;
	left: 77%;
	display : none;
}

#regi [type="radio"]{
   display:none;
}
#regi [type="radio"]+label{
   display: inline-block;
   cursor: pointer;
   padding: 10px 0px 10px 0px;
    width: 80px;
    border: 1px solid #A7CA37;
    line-height: 24px;
    text-align: center;
    font-weight:bold;
    font-size:13px;
    border-radius: 10px;
}
#regi [type="radio"]+label{
   background-color: white;
    color: #A7CA37;
}
#regi [type="radio"]:checked+label{
    background-color: #A7CA37;
    color: white;
}
.page1, .page2, .page3{
	display:none;
	height : 350px;
}
.show {
	display:;
}

.rad {
	margin-left : 45px;
}

h2{
	margin-left : 40px;
	margin-top : 80px;
}
input[type=radio] {
	vertical-align :3px;
}

.texta {
	margin: 0px auto;
	margin-top : 40px;
	text-align : center;
	resize : none;
}

.city {
	margin-top : 50px;
	margin-left : 45px;
}

.page3 input[type="checkbox"] {
    width: 0.8rem;
    height: 0.8rem;
    border-radius: 50%;
    border: 2px solid #999;
    appearance: none;
    transition: background 0.2s;
    margin-bottom : 15px;
 }

.page3 input[type="checkbox"]:checked {
    background: #2AA1C0;
    border: none;
 }
  
  
</style>
<body>
	<h2>원하는 서비스를 선택해주세요!</h2>
	<div id="regi">
		<input type="radio" class="radio1" name="service" id="modal_btn1"> <label for="modal_btn1">미용</label> &nbsp;
		<input type="radio" class="radio1"name="service" id="modal_btn2">	<label for="modal_btn2">홈클리닝</label> &nbsp;
		<input type="radio" class="radio1" name="service" id="modal_btn3">	<label for="modal_btn3">레슨</label> &nbsp;
	</div>
	
	<div class="black_bg" ></div> <!-- 창 띄웠을시 배경 -->
	<form name="frm1" action="binsert" method="post" enctype="multipart/form-data">
		<input type="text" name="uid" value="${id}" style="display:none;">
		<input type="text" name="nick" value="${nick}" style="display:none;">
		<div class="modal_wrap" id="modal_wrap1"> <!-- 창 본체 -->
			<div class="modal_close" id="modal_close1"><a href="javascript:void(0);">close</a></div>
	    		<div class="page1" id="page1" style="display : block">
	    			<h2 class="title">[1/9] 어떤 반려동물인가요?</h2>
	    		    <input type="radio" class="rad" name="pcate" value="강아지"> 강아지 <br/><br/>
	    		    <input type="radio" class="rad" name="pcate" value="고양이"> 고양이 <br/>
	   		 	</div>
	   		 	<div class="page1">
	   		 		<h2 class="title"> [2/9] 어떤 서비스를 원하시나요?</h2>
	    		    <input type="radio" class="rad" name="beauty_classification" value="목욕"> 목욕 <br/><br/>
	    		    <input type="radio" class="rad" name="beauty_classification" value="전체미용"> 전체미용 <br/><br/>
	    		    <input type="radio" class="rad" name="beauty_classification" value="부분미용"> 부분미용 <br/><br/>
	    		    <input type="radio" class="rad" name="beauty_classification" value="위생미용"> 위생미용 <br/><br/>
	   		 	</div>
	   		 	<div class="page1">
	   		 		<h2 class="title">[3/9] 반려동물 체중을 선택해주세요</h2>
	    		    <input type="radio" class="rad" name="weight" value="4kg미만"> 4kg미만 <br/><br/>
	    		    <input type="radio" class="rad" name="weight" value="4~7kg"> 4~7kg <br/><br/>
	    		    <input type="radio" class="rad" name="weight" value="7~10kg"> 7~10kg <br/><br/>
	    		    <input type="radio" class="rad" name="weight" value="10~14kg"> 10~14kg <br/><br/>
	   		 	</div>
	   		 	<div class="page1">
	   		 		<h2 class="title">[4/9] 반려동물 나이를 선택해주세요</h2>
	    		    <input type="radio" class="rad" name="age" value="1살미만"> 1살미만<br/><br/>
	    		    <input type="radio" class="rad" name="age" value="1~9살">  1~9살<br/><br/>	
	    		    <input type="radio" class="rad" name="age" value="10살이상"> 10살이상 <br/><br/>
	   		 	</div>
	   		 	<div class="page1">
	   		 		<h2 class="title"> [5/9] 마지막 미용시기는 선택해주세요</h2>
	    		    <input type="radio" class="rad" name="last_beautydate" value="첫미용"> 첫미용 <br/><br/>
	    		    <input type="radio" class="rad" name="last_beautydate" value="1달 내외"> 1달 내외 <br/><br/>
	    		    <input type="radio" class="rad" name="last_beautydate" value="2달 내외"> 2달 내외 <br/><br/>
	    		    <input type="radio" class="rad" name="last_beautydate" value="3달 내외"> 3달 내외 <br/><br/>
	    		    <input type="radio" class="rad" name="last_beautydate" value="unknown"> 잘 모르겠다 <br/><br/>
	   		 	</div>
	   		 	<div class="page1">
	   		 		<h2 class="title"> [6/9] 어떻게 진행하기를 원하시나요?</h2>
	    		    <input type="radio" class="rad" name="service_place" value="집(출장 서비스)"> 집(줄장 서비스) <br/><br/>
	    		    <input type="radio" class="rad" name="service_place" value="개인 미용실"> 개인 미용시설 <br/><br/>
	    		    <input type="radio" class="rad" name="service_place" value="무관"> 무관 <br/><br/>
	   		 	</div>
	   		 	<div class="page1">
	   		 		<h2 class="title"> [7/9] 희망서비스일을 선택해주세요</h2>
	    		    <input type="radio" class="rad" name="wish_date" value="협의"> 협의 가능 <br/><br/>
	    		    <input type="radio" class="rad" name="wish_date" value="가능한 빨리 진행">  가능한 빨리 진행<br/><br/>
	    		    <input type="radio" class="rad" name="wish_date" value="일주 이내">  일주일 이내 진행<br/><br/>
	    		    <input type="radio" class="rad" name="wish_date" value="상관 없음"> 상관 없음  <br/><br/>
	   		 	</div>
	   		 	<div class="page1">
	   		 		<h2 class="title"> [8/9] 서비스 희망 지역을 남겨주세요</h2>
	    		    <div class="city"><span class="sido">시/도 &nbsp; &nbsp; : </span><input type="text" style="margin-left:2px; margin-bottom:10px;" placeholder="ex. 경기도" name="wish_local1"> <br/>
	    		   <span class="gungu"> 시/군/구 : </span><input type="text" placeholder="ex. 부천시" name="wish_local2"></div>
	   		 	</div>
	   		 	<div class="page1">
	   		 		<h2 class="title"> [9/9] 서비스 관련 문의 및 세부사항을 남겨주세요</h2>
	    		    <div class="texta"><textarea style="width" rows="6" cols="50" name="detailed_matters" placeholder="반려동물의 품종, 병력, 성격 등을 알려주시면 좋아요!"></textarea></div>
	   		 	</div>
	   		 <button type="button" class="buttonc" id="prev1" disabled>이전</button> &nbsp; <input type="button" class="buttonc" id="next1" value="다음">
	   		 <input type="submit" class="buttonb" value="요청보내기">
   		</div> 
   	</form>
   	
   	<form name="frm2"  action="cinsert" method="post" enctype="multipart/form-data">
   		<input type="text" name="uid" value="${id}" style="display:none;">
   		<input type="text" name="nick" value="${nick}" style="display:none;">
 		<div class="modal_wrap" id="modal_wrap2"> <!-- 창 본체 -->
			<div class="modal_close" id="modal_close2"><a href="javascript:void(0);">close</a></div>
	   		 	<div class="page2" id="page2" style="display : block;">
	    		    <h2 class="title">[1/5] 건물유형을 선택해주세요</h2>
	    		    <input type="radio" class="rad" name="building_classification" value="아파트"> 아파트 <br/><br/>
	    		    <input type="radio" class="rad" name="building_classification" value="빌라"> 빌라 <br/><br/>
	    		    <input type="radio" class="rad" name="building_classification" value="주택"> 주택 <br/><br/>
	    		    <input type="radio" class="rad" name="building_classification" value="오피스텔"> 오피스텔 <br/><br/>
	   		 	</div>
	   		 	<div class="page2">
	    		     <h2 class="title">[2/5] 집 면적을 선택해주세요</h2>
	    		      <input type="radio" class="rad" name="house_size" value="10평 미만"> 10평 미만 <br/><br/>
	    		    <input type="radio" class="rad" name="house_size" value="10평대"> 10평대<br/><br/>
	    		    <input type="radio" class="rad" name="house_size" value="20평대"> 20평대<br/><br/>
	    		    <input type="radio" class="rad" name="house_size" value="30평대"> 30평대<br/><br/>
	    		    <input type="radio" class="rad" name="house_size" value=> 기타   <input type="text" id="house_size_text" disabled>
	    		    
	   		 	</div>
	   		 	<div class="page2">
	    		     <h2 class="title">[3/5] 클리닝 원하는 날을 선택해주세요</h2>
	    		      <input type="radio" class="rad" name="wish_date" value="협의"> 협의 가능 <br/><br/>
	    		    <input type="radio" class="rad" name="wish_date" value="가능한 빨리"> 가능한 빨리 <br/><br/>
	    		    <input type="radio" class="rad" name="wish_date" value="일주 이내"> 일주 이내<br/><br/>
	    		    <input type="radio" class="rad" name="wish_date" id="wish_date" value=> 원하는 날 있음 <input type="date" id="wish_date_date" style="display: none;">
	    		    
	   		 	</div>
	   		 	<div class="page2">
	    		     <h2 class="title"> [4/5] 원하는 지역을 선택해주세요</h2>
	    		      <div class="city"><span class="sido">시/도 &nbsp; &nbsp; : </span><input type="text" style="margin-left:2px; margin-bottom:10px;" placeholder="ex. 경기도" name="wish_local1"> <br/>
	    		   <span class="gungu"> 시/군/구 : </span><input type="text" placeholder="ex. 부천시" name="wish_local2"></div>
	   		 	</div>
	   		 	<div class="page2">
	    		     <h2 class="title"> [5/5] 클리닝 관련 희망사항을 남겨주세요</h2>
	    		     <div class="texta"><textarea style="width" rows="6" cols="50" name="hope_matters" placeholder="ex. 냄새 제거 및 살균소독 원해요"></textarea></div>
	   		 	</div>
   		 	 <button type="button" class="buttonc" id="prev2" disabled>이전</button> &nbsp; <input type="button" class="buttonc" id="next2" value="다음">
	   		 <input type="submit" class="buttonb" value="요청보내기">
   		</div> 
  	</form>
  	
  	<form name="frm3"  action="linsert" method="post" enctype="multipart/form-data">
  		<input type="text" name="uid" value="${id}" style="display:none;">
  		<input type="text" name="nick" value="${nick}" style="display:none;">
   		<div class="modal_wrap" id="modal_wrap3"> <!-- 창 본체 -->
			<div class="modal_close" id="modal_close3"><a href="javascript:void(0);">close</a></div>
	   		 	<div class="page3" id="page3" style="display : block;">
	    		   <h2 class="title">[1/11] 어떤 레슨을 원하시나요?</h2>
	    		    <input type="radio" class="rad" name="lesson_classification" value="펫 훈련 레슨"> 훈련 <br/><br/>
	    		    <input type="radio" class="rad" name="lesson_classification" value="펫 미용 레슨"> 미용 <br/><br/>
	    		    <input type="radio" class="rad" name="lesson_classification" value="펫 용품 제작 레슨"> 펫용품 제작 <br/><br/>
	    		    <input type="radio" class="rad" name="lesson_classification" value=> 기타 <input type="text" id="lesson_text" disabled>
	   		 	</div>
	   		 	<div class="page3">
	    		    <h2 class="title">[2/11] 레슨 받는 목적이 무엇인가요?</h2>
	    		    <input type="radio" class="rad" name="lesson_goal" value="홈케어"> 홈 케어 <br/><br/>
	    		    <input type="radio" class="rad" name="lesson_goal" value="자격증 취득"> 자격증 취득 <br/><br/>
	    		    <input type="radio" class="rad" name="lesson_goal" value="취업 준비"> 취업 준비 <br/><br/>
	    		    <input type="radio" class="rad" name="lesson_goal" value="창업 준비"> 창업 준비 <br/><br/>
	   		 	</div>
	   		 	<div class="page3">
	    		    <h2 class="title">[3/11] 어떤 레슨 형태를 원하시나요?</h2>
	    		    <input type="radio" class="rad" name="lesson_method" value="개인 레슨"> 개인 레슨<br/><br/>
	    		    <input type="radio" class="rad" name="lesson_method" value="그룹 레슨"> 그룹 레슨 <br/><br/>
	    		    <input type="radio" class="rad" name="lesson_method" value="온라인 레슨"> 온라인 레슨 <br/><br/>
	    		    <input type="radio" class="rad" name="lesson_method" value="학원"> 학원 <br/><br/>
	   		 	</div>
	   		 	<div class="page3">
	    		    <h2 class="title">[4/11] 연령대를 선택해주세요</h2>
	    		    <input type="radio" class="rad" name="age" value="10대 미만"> 10대 미만<br/><br/>
	    		    <input type="radio" class="rad" name="age" value="10대"> 10대 <br/><br/>
	    		    <input type="radio" class="rad" name="age" value="20대"> 20대 <br/><br/>
	    		    <input type="radio" class="rad" name="age" value="30대"> 30대 <br/><br/>
	    		    <input type="radio" class="rad" name="age" value="40대"> 40대 이상 
	   		 	</div>
	   		 	<div class="page3">
	    		    <h2 class="title">[5/11] 성별이 어떻게 되시나요?</h2>
	    		    <input type="radio" class="rad" name="gender" value="남자"> 남자 <br/><br/>
	    		    <input type="radio" class="rad" name="gender" value="여자"> 여자 <br/><br/>
	   		 	</div>
	   		 	<div class="page3">
	    		    <h2 class="title">[6/11] 선호하는 강사의 성별이 있으신가요?</h2>
	    		    <input type="radio" class="rad" name="wish_gender" value="남자"> 남자 <br/><br/>
	    		    <input type="radio" class="rad" name="wish_gender" value="여자"> 여자 <br/><br/>
	    		    <input type="radio" class="rad" name="wish_gender" value="무관"> 무관 <br/><br/>
	   		 	</div>
	   		 	<div class="page3">
	    		    <h2 class="title">[7/11] 레슨 받기 좋은 날짜를 기입해주세요</h2>
	    		    <label><input type="checkbox" class="rad" name="wish_date" value="월"> 월 </label> <br/>
	    		     <label><input type="checkbox" class="rad" name="wish_date" value="화"> 화</label>  <br/>
	    		     <label><input type="checkbox" class="rad" name="wish_date" value="수"> 수</label>  <br/>
	    		     <label><input type="checkbox" class="rad" name="wish_date" value="목"> 목</label>  <br/>
	    		     <label><input type="checkbox" class="rad" name="wish_date" value="금"> 금</label> <br/>
	    		     <label><input type="checkbox" class="rad" name="wish_date" value="토"> 토</label> <br/>
	    		     <label><input type="checkbox" class="rad" name="wish_date" value="상담 후"></label> 상담 후
	   		 	</div>
	   		 	<div class="page3">
	    		    <h2 class="title">[8/11] 희망하는 레슨 시간대를 선택해주세요</h2>
	    		    <input type="radio" class="rad" name="wish_time" value="이른 오전(9시 이전)"> 이른 오전(9시 이전) <br/>
	    		    <input type="radio" class="rad" name="wish_time" value="오전(9~12시)"> 오전(9~12시) <br/>
	    		    <input type="radio" class="rad" name="wish_time" value="오후(12~3시)"> 오후(12~3시) <br/>
	    		    <input type="radio" class="rad" name="wish_time" value="늦은 오후(3시~6시)"> 늦은 오후(3시~6시) <br/>
	    		    <input type="radio" class="rad" name="wish_time" value="저녁(6~9시)">  저녁(6~9시) <br/>
	    		    <input type="radio" class="rad" name="wish_time" value="늦은 저녁(9시 이후)"> 늦은 저녁(9시 이후) <br/>
	   		 	</div>
	   		 	<div class="page3">
	    		    <h2 class="title">[9/11] 어떻게 진행하기 원하시나요?</h2>
	    		    <input type="radio" class="rad" name="lesson_place" value="교육생 장소로"> 제가 있는 곳으로 와주세요 <br/><br/>
	    		    <input type="radio" class="rad" name="lesson_place" value="레슨실"> 레슨실 <br/><br/>
	    		    <input type="radio" class="rad" name="lesson_place" value="무관"> 무관 <br/><br/>
	    		    <input type="radio" class="rad" name="lesson_place" value=> 기타 <input type="text" id="place_text" disabled>
	   		 	</div>
	   		 	<div class="page3">
	    		    <h2 class="title">[10/11] 원하는 지역을 선택해주세요</h2>
	    		    <div class="city"><span class="sido">시/도 &nbsp; &nbsp; : </span><input type="text" style="margin-left:2px; margin-bottom:10px;" placeholder="ex)경기도" name="wish_local1"> <br/>
	    		   <span class="gungu"> 시/군/구 : </span><input type="text" placeholder="ex)부천시" name="wish_local2"></div>
	   		 	</div>
	   		 	<div class="page3">
	    		    <h2 class="title">[11/11] 레슨 관련 문의 사항을 남겨주세요</h2>
	    		    <div class="texta"><textarea style="width" rows="6" cols="50" name="detailed_matters" placeholder="ex. 펫 미용 자격증을 따고 싶어요"></textarea></div>
	   		 	</div>
   		 	 <button type="button" class="buttonc" id="prev3" disabled>이전</button> &nbsp; <input type="button" class="buttonc" id="next3" value="다음">
	   		 <input type="submit" class="buttonb" value="요청보내기">
   		</div>
 	</form>
 	
</body>

<script>
var pageo = document.getElementsByClassName("page1");
var pages = document.getElementsByClassName("page2");
var paget = document.getElementsByClassName("page3");
var i=0; 
var s=0;
var t=0;


//기타
$("input:radio[name='house_size']").click(function(){
	var etcCheck1 = $('input:radio[name="house_size"]:checked').val();
	if( etcCheck1 == ""){
		$('#house_size_text').attr("disabled", false);
	}else{
		$('#house_size_text').attr("disabled", true);
	}
});

$("input:radio[name='lesson_classification']").click(function(){
	var etcCheck2 = $('input:radio[name="lesson_classification"]:checked').val();
	if( etcCheck2 == ""){
		$('#lesson_text').attr("disabled", false);
	}else{
		$('#lesson_text').attr("disabled", true);
	}
});

$("input:radio[name='lesson_place']").click(function(){
	var etcCheck3 = $('input:radio[name="lesson_place"]:checked').val();
	if( etcCheck3 == ""){
		$('#place_text').attr("disabled", false);
	}else{
		$('#place_text').attr("disabled", true);
	}
});

//원하는 날짜
$("#wish_date").on("click", function(){
	if($(frm2.wish_date_date).css("display") == "none"){
         $(frm2.wish_date_date).show();
	}else{
		$(frm2.wish_date_date).hide();
	}
})

//frm1
$("#next1").on("click", function(){
	pageo[i].style.display = 'none';
	if(i < pageo.length){i++}
	var si= i;
	pageo[si].style.display = 'block';
	$("#prev1").attr("disabled", false);
	if(i == pageo.length - 1){
		$(this).css({display : 'none'});
		$('.buttonb').css({display : 'block'});
	}else{
		$(this).css({display : ''});
		$('.buttonb').css({display : 'none'});
	}
});

$("#prev1").on("click", function(){
	$(".buttonb").css({display:"none"});
	$("#next1").css({display:""});
	pageo[i].style.display = 'none';
	i--
	pageo[i].style.display = 'block';
	if(i == 0){
		$(this).attr("disabled", true);
	}
});

$(frm1).on("submit", function(e){
	e.preventDefault();
	var uid=$(frm1.uid).val();
	var nick=$(frm1.nick).val();
	var pcate = $(':radio[name="pcate"]:checked').val();
	var beauty_classification = $(':radio[name="beauty_classification"]:checked').val();
	var weight = $(':radio[name="weight"]:checked').val();
	var age = $(':radio[name="age"]:checked').val();
	var last_beautydate = $(':radio[name="last_beautydate"]:checked').val();
	var service_place = $(':radio[name="service_place"]:checked').val();
	var wish_date = $(':radio[name="wish_date"]:checked').val();
	var wish_local1 = $(frm1.wish_local1).val();
	var wish_local2 = $(frm1.wish_local2).val();
	var detailed_matters = $(frm1.detailed_matters).val();
	
	alert(nick + "\n" + uid + "\n" + pcate + "\n" + beauty_classification + "\n" +  weight + "\n" + age + "\n" + last_beautydate + "\n" + service_place + 
			"\n" + wish_date + "\n" + wish_local1 + "\n" + wish_local2 + "\n" + detailed_matters);
	if(pcate == null){
		alert("1번 문항을 선택해주세요");
		return;
	}else if(beauty_classification == null){
		alert("2번 문항을 선택해주세요");
		return;
	}else if(weight == null){
		alert("3번 문항을 선택해주세요");
		return;
	}else if(age == null){
		alert("4번 문항을 선택해주세요");
		return;
	}else if(last_beautydate == null){
		alert("5번 문항을 선택해주세요");
		return;
	}else if(service_place == null){
		alert("6번 문항을 선택해주세요");
		return;
	}else if(wish_date == null){
		alert("7번 문항을 선택해주세요");
		return;
	}else if(wish_local1 ==""){
		alert("8번 문항을 기입해주세요");
		return;
	}else if(wish_local2 ==""){
		alert("8번 문항을 기입해주세요");
		return;
	}
	if(!confirm("요청서를 작성하시겠습니까?")) return;
	frm1.submit();
});

//frm2
$("#next2").on("click", function(){
	pages[s].style.display = 'none';
	if(s < pages.length){s++}
	var ss= s;
	pages[ss].style.display = 'block';
	$("#prev2").attr("disabled", false);
	if(s == pages.length - 1){
		$(this).css({display : 'none'});
		$('.buttonb').css({display : 'block'});
	}else{
		$(this).css({display : ''});
		$('.buttonb').css({display : 'none'});
	}
});

$("#prev2").on("click", function(){
	$(".buttonb").css({display:"none"});
	$("#next2").css({display:""});
	pages[s].style.display = 'none';
	s--
	pages[s].style.display = 'block';
	if(s == 0){
		$(this).attr("disabled", true);
	}
});

$(frm2).on("submit", function(e){
	e.preventDefault();
	var uid=$(frm2.uid).val();
	var building_classification = $(':radio[name="building_classification"]:checked').val();
	var house_size = $(':radio[name="house_size"]:checked').val();
	var wish_date = $(':radio[name="wish_date"]:checked').val();
	var wish_local1 = $(frm2.wish_local1).val();
	var wish_local2 = $(frm2.wish_local2).val();
	var hope_matters = $(frm2.hope_matters).val();
	
	var house_size_etc = $("#house_size_text").val();
	var wish_date_date = $("#wish_date_date").val();
	
	alert("uid : " + uid + "\n" + "building_classification : " + building_classification + "\n" +  "house_size : " + house_size + "\n" +   "wish_date : " + wish_date + "\n" + wish_local1 + "\n" + wish_local2 + "\n" + hope_matters
			+ "\n" + "house_size_etc : " + house_size_etc + "\n" + "wish_date_date : " + wish_date_date);
	
	if(building_classification== null){
		alert("1번 문항을 선택해주세요");
		return;
	}else if(house_size == null && house_size_text == ""){
		alert("2번 문항을 선택해주세요");
		return;
	}else if(wish_date == null &&  wish_date_date == ""){
		alert("3번 문항을 선택해주세요");
		return;
	}else if(wish_local1 == ""){
		alert("4번 문항을 선택해주세요");
		return;
	}else if(wish_local2 ==""){
		alert("4번 문항을 선택해주세요");
		return;
	}else{
		if(!confirm("요청서를 작성하시겠습니까?")) return;
		if(wish_date == ""){
			var date = $("#wish_date_date").val();
			$(frm2.wish_date).val(date);
		}
		if(house_size == ""){
			var size = $("#house_size_text").val();
			$(frm2.house_size).val(size);
		}
	}
	
	frm2.submit();
});

//frm3
$("#next3").on("click", function(){
	paget[t].style.display = 'none';
	if(t < paget.length){t++}
	var st= t;
	paget[st].style.display = 'block';
	$("#prev3").attr("disabled", false);
	if(t == paget.length - 1){
		$(this).css({display : 'none'});
		$('.buttonb').css({display : 'block'});
	}else{
		$(this).css({display : ''});
		$('.buttonb').css({display : 'none'});
	}
});

$("#prev3").on("click", function(){
	$(".buttonb").css({display:"none"});
	$("#next3").css({display:""});
	paget[t].style.display = 'none';
	t--
	paget[t].style.display = 'block';
	if(t == 0){
		$(this).attr("disabled", true);
	}
});

$(frm3).on("submit", function(e){
	e.preventDefault();
	var uid=$(frm3.uid).val();
	var lesson_classification = $(':radio[name="lesson_classification"]:checked').val();
	var lesson_goal = $(':radio[name="lesson_goal"]:checked').val();
	var lesson_method = $(':radio[name="lesson_method"]:checked').val();
	var age = $(':radio[name="age"]:checked').val();
	var gender = $(':radio[name="gender"]:checked').val();
	var wish_gender = $(':radio[name="wish_gender"]:checked').val();
	var wish_date = $(':checkbox[name="wish_date"]:checked').val();
	var wish_time = $(':radio[name="wish_time"]:checked').val();
	var lesson_place = $(':radio[name="lesson_place"]:checked').val();
	var wish_local1 = $(frm3.wish_local1).val();
	var wish_local2 = $(frm3.wish_local2).val();
	var detailed_matters = $(frm3.detailed_matters).val();
	
	var lesson_classification_etc = $("#lesson_text").val();
	var lesson_place_etc = $("#place_text").val();
	
	console.log(wish_date);
	alert("uid : " + uid + "\n" + "lesson_classification : " + lesson_classification + "\n" +  
	"lesson_goal : " + lesson_goal + "\n" + "lesson_method : " + lesson_method + "\n" + "age : " + age + "\n" + "gender : " + gender 
	+ "\n" + "wish_gender : " + wish_gender + "\n" + "wish_date : " + wish_date + "\n" + "wish_time : " + wish_time 
	+ "\n" + "lesson_place : " + lesson_place + "\n" + "wish_local1 : " + wish_local1 + "\n" + "wish_local2 : " + wish_local2 +
	"\n" + "detailed_matters : " + detailed_matters + "\n" + "lesson_classification_etc : " + lesson_classification_etc + "\n" 
	+ "lesson_place_etc : " +  lesson_place_etc);
	
	if(lesson_classification == null && lesson_classification_etc == ""){
		alert("1번 문항을 선택해주세요");
		return;
	}else if(lesson_goal == null){
		alert("2번 문항을 선택해주세요");
		return;
	}else if(lesson_method == null){
		alert("3번 문항을 선택해주세요");
		return;
	}else if(age == null){
		alert("4번 문항을 선택해주세요");
		return;
	}else if(gender == null){
		alert("5번 문항을 선택해주세요");
		return;
	}else if(wish_gender == null){
		alert("6번 문항을 선택해주세요");
		return;
	}else if(wish_date == null){
		alert("7번 문항을 선택해주세요");
		return;
	}else if(wish_time == null){
		alert("8번 문항을 선택해주세요");
		return;
	}else if(lesson_place == null && lesson_place_etc == ""){
		alert("9번 문항을 선택해주세요");
		return;
	}else if(wish_local1 == "" || wish_local2 == ""){
		alert("10번 문항을 선택해주세요");
		return;
	}else{
		if(!confirm("요청서를 작성하시겠습니까?")) return;
		if(lesson_classification == ""){
			$(frm3.lesson_classification).val(lesson_classification_etc);
		}
		if(lesson_place == ""){
			$(frm3.lesson_place).val(lesson_place_etc);
		}
	}
	
	frm3.submit();
});

var services = document.getElementsByName("service");

for(a=0; a < services.length; a++){
    services[a].addEventListener('click', function(){
    console.log('function ON');
    console.log(this.id);
    switch(this.id){
        case "modal_btn1" :
        	document.querySelector('.black_bg').style.display ='block';
        	document.querySelector('#modal_wrap1').style.display ='block';
            break;
        case "modal_btn2" :
        	document.querySelector('.black_bg').style.display ='block';
        	document.querySelector('#modal_wrap2').style.display ='block';
            break;             
        case "modal_btn3" :
        	document.querySelector('.black_bg').style.display ='block';
        	document.querySelector('#modal_wrap3').style.display ='block';
            break;
    }
});
}

window.onload = function() {
	 

    function offClick() {
        document.querySelector('#modal_wrap1').style.display ='none';
        document.querySelector('.black_bg').style.display ='none';
        $('.page1').css({display:'none'});
    	$('#page1').css({display:'block'});
    	$("#next1").css({display : ''});
		$('.buttonb').css({display : 'none'});
		i=0;
        
    }
    function offClick1() {
        document.querySelector('#modal_wrap2').style.display ='none';
        document.querySelector('.black_bg').style.display ='none';
        $('.page2').css({display:'none'});
    	$('#page2').css({display:'block'});
    	$("#next2").css({display : ''});
		$('.buttonb').css({display : 'none'});
		s=0;
    }
    function offClick2() {
        document.querySelector('#modal_wrap3').style.display ='none';
        document.querySelector('.black_bg').style.display ='none';
        $('.page3').css({display:'none'});
    	$('#page3').css({display:'block'});
    	$("#next3").css({display : ''});
		$('.buttonb').css({display : 'none'});
		t=0;
    }
    document.querySelector('#modal_close1').addEventListener('click', offClick);
    document.querySelector('#modal_close2').addEventListener('click', offClick1);
    document.querySelector('#modal_close3').addEventListener('click', offClick2);
};
</script>
</html>