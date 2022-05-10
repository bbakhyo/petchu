<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
	@font-face {
    font-family: 'SDSamliphopangche_Basic';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts-20-12@1.0/SDSamliphopangche_Basic.woff') format('woff');
    font-weight: normal;
    font-style: normal;
	}
	.bigPrame{
		margin: 0px auto;
		width: 500px;
		float: right;
	}
	#sideMenu{
		float: left;
		width: 150px;
		margin: 10px;
	}
	.prame{
/* 		사용자가 올린 백그라운드 이미지 */
		text-align: left;
		background-size: 500px 200px; 
		width: 600px;
		height: 160px;
		padding: 20px;
		margin: 10px;
		float: right;
		box-shadow: 5px 5px 5px 1px gray;
	}
	.scname{
		font-family: 'SDSamliphopangche_Basic';
		font-size: 30px;
		color: white;
		
	}
	.sctel{
		float: right;
		font-size: 17px;


	}
	.sconeline {
		font-size: 15px;
	}
	.scprice{
		float: right;
		font-size: 20px;
		margin-bottom: 10px;
	}
	#checkin, #checkout{
		width: 200px;
		height: 30px;
		
	}
	#tag {
		width: 200px;
	}
	.tag{
		margin-right: 3px;
		cursor: pointer;
		font-size: 15px;
	}
	.tag:hover{
		font-weight: bold;
		color: #A7CA37;
		
	}

	#keyword{
		width: 300px;
		height: 50px;
		margin-top: 50px;
		border-radius: 20px;
	}
	
	#search{
		width: 100px;
		height: 50px;
		background: #A7CA37;
		color: white;
		border: none;
		border-radius: 20px;
		font-size: 17px;
	}
</style>
<div id="page">
	<form name="frm" style="text-align: center;">
		<input type="text" id="keyword" name="keyword" >
		<button id="search" name="search" type="submit" >검색</button>
	</form>
	<div id="sort">
		<input type="radio" name="sort"  class="sort" value="rate">별점높은순
		<input type="radio" name="sort"  class="sort" value="rowPrice">낮은가격순
		<input type="radio" name="sort"  class="sort" value="higPrice">높은가격순
	</div>
	<div id="sideMenu">

			<div id="tag"> 
				<p style="font-size: 25px;">날짜</p>
				<p>체크인</p>
				<span id="checkinArea"><input id="checkin" type="date"></span>
				<p>체크아웃</p>
				<span id="checkoutArea"><input id="checkout" type="date"></span>
			
				
				<p style="font-size: 25px;">태그</p>
				<span class="tag" tag="산책">#산책</span>
				<span class="tag" tag="놀이터">#야외놀이터</span>
				<span class="tag" tag="수영장">#펫수영장</span>
				<span class="tag" tag="종일반">#종일반</span>
				<span class="tag" tag="1박">#1박2일</span>
				<span class="tag" tag="2박">#2박3일</span>
				<span class="tag" tag="3박">#3박4일</span>
				<span class="tag" tag="4박">#4박5일</span>
				<span class="tag" tag="장박">#장박</span>
				<span class="tag" tag="단독실">#단독실</span>
				<span class="tag" tag="대형">#대형</span>
				<span class="tag" tag="중형">#중형</span>
				<span class="tag" tag="소형">#소형</span>
				<span class="tag" tag="수의사">#수의사</span>
				<span class="tag" tag="cctv">#cctv</span>
				<span class="tag" tag="애견훈련">#애견훈련</span>
				<span class="tag" tag="애견카페">#애견카페</span>
				<span class="tag" tag="픽업">#픽업</span>
				<span class="tag" tag="당일 입실">#당일 입실</span>
				<span class="tag" tag="위생관리">#위생관리</span>
				<span class="tag" tag="목욕">#목욕</span>
				<span class="tag" tag="서울특별시">#서울특별시</span>
				<span class="tag" tag="인천광역시">#인천광역시</span>
				<span class="tag" tag="경기도">#경기도</span>
			</div>

	</div>
	<div id="bigPrame"></div>
	<script id="temp" type="text/x-handlebars-template">
		{{#each list}}
		<div class= "prame" scno="{{scno}}"> 
			<span class="scname">{{scname}}</span>
			<span class="sctel">{{sctel}}</span>
			<p><div class="sconeline">{{sconeline}}</div></p>
			<p><div class="rate">별점</div></p>
			<p><div class="scprice">{{display scprice}}원</div></p>
			<P><input class="isDelete" type="hidden" value={{isDelete}}></p>
		</div>
		{{/each}}

	</script>
	<script>
	Handlebars.registerHelper("display", function(scprice){
		return scprice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
	});
	</script>
</div>
<script>
	var date = new Date().toISOString().slice(0, 10);
	var keyword = $(frm.keyword).val();
	var sort = "";
	var checkin = "";
	var checkout = "";

	//체크인 체크아웃 오늘날짜로 설정
	document.getElementById('checkin').value = new Date().toISOString().substring(0, 10);
	document.getElementById('checkout').value = new Date().toISOString().substring(0, 10);
	
	
	checkin = document.getElementById('checkin').value;
	checkout = document.getElementById('checkout').value;
	
	getList();
	
	//체크인이 체인지 된 경우
	$("#tag").on("change","#checkin",function(){
		checkin= $(this).val();
		checkout=$(this).closest("#tag").find("#checkout");
		checkout.val(checkin);
		checkout=checkin;
		
		console.log("체크인이 첸지된 경우" + "\n 체크인" + checkin + "\n 체크아웃" + checkout)
		
		if(checkin < date){
			alert("당일보다 이전날짜는 선택할 수 없습니다.")
		}
		getList();
		
	});
	//체크아웃이 체인지 된 경우
	$("#tag").on("change", "#checkout",function(){
		checkin=$(this).closest("#tag").find("#checkin").val();
		checkout=$(this).val();
		console.log("체크아웃이 첸지된 경우" + checkin +"/n" + checkout);
		if(checkout<checkin){
			alert("체크아웃은 체크인 이후로 입력가능합니다.");
		}
		getList();
		
	});

	//데이트 클릭할때 달력표시하고싶은데 ...........
	$("#checkinArea").on("click", function(){
		$(this).find("#checkin");

	});
		
	//소트를 체크한 경우
	$("#sort").on("click",".sort", function(){
		sort = $(this).val();
		
		getList();
	});

	function getList(){
		console.log('겟리스트가 받은 데이타'+"\n"+'키워드:'+keyword+"\n"+'소트:'+sort+"\n"+'체크인:'+checkin+"\n"+'체크아웃:'+checkout)
		$.ajax({
			type:"get",
			url:"/hoschool/list.json",
			dataType:"json",
			data:{keyword:keyword, sort:sort, checkin:checkin, checkout:checkout},
			success: function(data){
				console.log(data);
				
				var template = Handlebars.compile($("#temp").html());
				$("#bigPrame").html(template(data));
				
				var i = 0;
				$(".prame").each(function(){
					var bg=$(".image").html();
						//백그라운드 이미지 수만큼 반복
							if(i==0){
								//$(this).style.backgroundimage="url('/resources/TBN/TBN01.jpg')";
								$(this).css({"background":"url(/resources/TBN/TBN01.jpg"}); 
								$(this).css({"background-size":"700px 200px"}); 
								i++;
							}else if(i==1){
								$(this).css({"background":"url(/resources/TBN/TBN04.png"});
								$(this).css({"background-size":"700px 200px"}); 
								i++;
							}else if(i==2){
								$(this).css({"background":"url(/resources/TBN/TBN05.png"});
								$(this).css({"background-size":"700px 200px"}); 
								i++;
							}else if(i==3){
								$(this).css({"background":"url(/resources/TBN/TBN06.png"});
								$(this).css({"background-size":"700px 200px"}); 
								i=0;
							}
						
							var num = $(this).find(".sctel").html();
							var formatNum = '';
							
						    if(num.length==11){
						        formatNum = num.replace(/(\d{3})(\d{4})(\d{4})/, '$1-$2-$3');
						    }else if(num.length==8){
						        formatNum = num.replace(/(\d{4})(\d{4})/, '$1-$2');
						    }else if(num.indexOf('02')==0){
						        formatNum = num.replace(/(\d{2})(\d{4})(\d{4})/, '$1-$2-$3');
						    }else if(num.length==12){
						        formatNum = num.replace(/(\d{4})(\d{4})(\d{4})/, '$1-$2-$3');
						    }else{
						        formatNum = num.replace(/(\d{3})(\d{3})(\d{4})/, '$1-$2-$3');
						    }
						    	$(this).find(".sctel").html(formatNum);
						    	
				});
				
				
					
				
			}
		});
	}
	
		//검색버튼을 클릭했을 때
	  $(frm).on("submit",function(e){
		  e.preventDefault();
		  keyword=$(frm.keyword).val();

		  getList();
	  });
		
	  //태그를 클릭한 경우
	  $(".tag").on("click", function(){
		  keyword=$(this).attr("tag");
		  
		  getList();
	  });
	  
	  //프레임을 클릭한 경우
	  $("#bigPrame").on("click",".prame",function(){
		 var scno=$(this).attr("scno");
		 var id="${id}";
		 var target = $(this).find('.prame');
		 var checkin = $("#checkin").val();
		 var checkout = $("#checkout").val();
		 	location.href="/hoschool/read?scno=" + scno + "&id=" + id + "&checkin=" + checkin + "&checkout=" + checkout;
		 
	  });
</script>
