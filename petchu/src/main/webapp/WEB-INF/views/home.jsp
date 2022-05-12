<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>PET-CHU</title>
<link href="/resources/css/home.css" rel="stylesheet">

<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script src="/resources/pagination.js"></script>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript" src="/resources/chart.js"></script>
<script type="text/javascript"
	src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
	<!-- PG사 결제API -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

</head>
<body>
	<div id="home_body">
	<header id="header">
		<a href="/"> <img id="logotxt" src="/resources/logo.png"> <img
			id="logoimg" src="/resources/logo_img.png">
		</a>
		<div id="menu">
			<c:if test="${id==null}">
				<a href="/user/login"><button id="login">로그인</button></a>
			</c:if>
			<c:if test="${id!=null}">
				<c:if test="${type=='관리'}">
					<a href="/product/list">쇼핑몰관리</a>
					<span><a href="/user/mypage?id=${id}">${nick}님</a></span>
					<a href="/user/logout"><button id="login">로그아웃</button></a>
				</c:if>
				<c:if test="${type=='일반'}">
					<a href="/request/result">받은 견적서</a>
					<a href="/shopproduct/cart_read">장바구니</a> <!-- 아이콘으로 -->
					<a href="#" id="chat">채팅</a>
						<span>
							<span id="bell">
								<small id="count">0</small>
								<script id="countdata" type="text/x-handlebars-template">
									{{data}}
								</script>
							</span>
						</span>
					<span><a href="/user/mypage?id=${id}">${nick}님</a></span>
					<a href="/user/logout"><button id="login">로그아웃</button></a>
				</c:if>
				<c:if test="${type=='의사'}">
					<a href="/request/list">견적서</a>
					<a href="#">쇼핑몰</a>
					<a href="#" id="chat">채팅</a>
							<span>
							<span id="bell">
								<small id="count">0</small>
								<script id="countdata" type="text/x-handlebars-template">
									{{data}}
								</script>
							</span>
						</span>
					<span><a href="/user/mypage?id=${id}">${nick}님</a></span>
					<a href="/user/logout"><button id="login">로그아웃</button></a>
				</c:if>
				<c:if test="${type=='업체'}">
					<a href="/request/servicelist">서비스 견적서</a>
					<a href="#">쇼핑몰</a>
					<a href="#" id="chat">채팅</a>
					<span><a href="/user/mypage?id=${id}">${nick}님</a></span>
					<a href="/user/logout"><button id="login">로그아웃</button></a>
				</c:if>
			</c:if>

		</div>
	</header>
	<div id="page">
		
		<div id="content">
			<jsp:include page="${pageName}" />
		</div>
		<hr>
		<div id="footer">

			<div class="bottom">
				상호명 및 호스팅 서비스 제공 : PETCHU<br> 팀장 : 박효진<br> 팀원 : 조현식 | 김보하 | 지하영 | 김준엽 | 최웅비 | 김선광 | 오소희<br> 사업자 등록번호 : 120-88-00767<br> 통신판매업신고 :
				2017-서울송파-0680<br> 사업자정보 확인 >
			</div>
			<div class="bottom">
				365고객센터 | 전자금융거래분쟁처리담당<br> 1577-7011 (유료)<br> 서울시 송파구 송파대로
				570<br> email : help@coupang.com
			</div>
			<div class="bottom" id="bottom3">
				<span>자주묻는질문(FAQ)</span><br>
				<a href="/faq/list"> <img id="faqbtn" src="/resources/icon/icon_faq.png" width=130></a>
			</div>
		</div>
	</div>
	</div> 
</body>
<script>
	$("#chat").on(
			"click",
			function(e) {
				e.preventDefault();
				window.open("/chat/main", "chat",
						"width=450, height=700, top=200, left=900");
			});
	getNC();
	function getNC(){
		$.ajax({
			type: "get",
			url: "/chat/notreadall",
			success:function(data){
				if(data==0){
					$("#bell").hide();
				}
				var template = Handlebars.compile($("#countdata").html());
				$("#count").html(data);
			}
		})
	}
</script>
</html>