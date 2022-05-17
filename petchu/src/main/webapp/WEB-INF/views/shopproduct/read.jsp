<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="/resources/css/shopproduct_read.css" rel="stylesheet">
<script data-require="jquery@3.1.1" data-semver="3.1.1"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<%-- <head>
<meta charset="UTF-8">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="/resources/css/shopproduct_read.css" rel="stylesheet">
<script data-require="jquery@3.1.1" data-semver="3.1.1"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
</head> --%>
<body id="shopproduct_read_body">
	<div id="shopproduct_read_page">
		<div class="shopproduct_read_container_wrapper">
			
			<div class="shopproduct_img_container">
				<img id="image" src="${vo.pimage}" width=445
					alt="product_img">
			</div>
			
			<div class="shopproduct_info_container">
				<div class="info_container_brandrow1">
						<div class="info_container_product_brand">
							<div class="pbrand">${vo.pbrand}</div>
						</div>
						
						<div class="info_container_product_name">
							<div class="pname">${vo.pname}</div>
						</div>
				</div>
				<!-- 상품금액(RED font) -->
				<div class="info_price_container">
					<div class ="info_price_row">
						<div class="price_container_price_value">
							<span id="product_price" data-pprice="${vo.pprice}"> 상품가격: </span><fmt:formatNumber value="${vo.pprice}" pattern="#,###원" />
						</div>
						<div class="shopproduct_read_buttons">
							<div class="favorite" onclick=favorite()>
								<img src="/resources/icon_menu/share_before.png" alt='share' width=45>
							</div>
							<div class="favorite_active none" onclick=un_favorite()>
								<img src="/resources/icon_menu/share_after.png" alt='share' width=45>
							</div>
							<div class="share_button" onclick=btn_share()>
								<img src="/resources/icon_menu/shopproduct_share.png" alt='share' width=47 onclick=btn_share()>
								<div class="share_options" ></div>
							</div>
							
							
							
							
						</div>
					</div>
				</div>
				
				<!--중간 : 배송 정보 -->
				<div class="info_shippingInfo_container">
					<div class="shipping_date_line">
						<em>내일 도착 예정</em>
					</div>
					<div class="shipping_fee_line">
						<em>배송비: 3,000원</em>
					</div>
				</div>
				<div class="extra_info_wrapper">
					<div class="info_extra_info_container1">
					
						<!-- 금액 -->
						<div class="info_container_row1">
							최종가격: &nbsp;<span class="final_price">${vo.pprice}</span>원
						</div>
						<!-- 결제 버턴 -->
						<div class="info_payment_container3">
							<div class="info_payment_container_row1">
								<div class="quantity buttons_added">
									<input type="button" value="-" class="minus"> <span id="qnt-value"
										title="Qty" class="input-text qty text">1</span> <input
										type="button" value="+" class="plus">
								</div>
								<div class="payment_buttons">
									<div>
										<a href="#" class="cart_add" data-pno="${vo.pno}">장바구니 담기</a>
									</div>
									<div>
										<a href="#" class="buy_now" onclick=buynow() data-pno="${vo.pno}">바로구매 〉</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			
		</div>
	</div>
	<div class="shoproduct_read_terms_page">
		<button class="tablink" onclick="openPage('Info',this, '#535562')"
			id="defaultOpen">상세정보</button>
		<button class="tablink" onclick="openPage('Review',this,'#535562')">리뷰</button>
		<button class="tablink"
			onclick="openPage('Questions', this, '#535562')">Q&A</button>
		<button class="tablink" onclick="openPage('Returns', this, '#535562')">반품/교환</button>
		
		<div id="Info" class="tabcontent">
			
			<!--세세정보 TAB  -->
			<div class="info_tab">
				<div id="itemBrief" class="product-essential-info">
					<div class="product-item__table">
						<p class="table-title">필수 표기정보</p>
						<table class="prod-delivery-return-policy-table">
							<colgroup>
								<col width="150px">
								<col width="340px">
								<col width="150px">
								<col width="*">
							</colgroup>
							<tbody class="return_policy_tbl">
								<tr>
									<th>품명 및 모델명</th>
									<td>90NB</td>
									<th>KC 인증 필 유무</th>
									<td>본품: R-R-LVK-IC3-90NB / 컴퓨터용전원장치: SU04126-10001</td>
								</tr>
								<tr>
									<th>정격전압, 소비전력</th>
									<td>200-240V/ 260W</td>
									<th>에너지소비효율등급</th>
									<td>해당없음</td>
								</tr>
								<tr>
									<th>출시년월</th>
									<td>2020.06</td>
									<th>제조자(수입자)</th>
									<td>Lenovo Information Products (Shen Zhen) Co., Ltd/ 알 수
										없음(업체미제공)</td>
								</tr>
								<tr>
									<th>제조국</th>
									<td>중국</td>
									<th>크기</th>
									<td>컨텐츠 참조</td>
								</tr>
								<tr>
									<th>무게</th>
									<td>컨텐츠 참조</td>
									<th>주요 사양</th>
									<td>컨텐츠 참조</td>
								</tr>
								<tr>
									<th>품질보증기준</th>
									<td>제품 이상 시 공정거래위원회 고시 소비자분쟁해결기준에 의거 보상합니다.</td>
									<th>A/S 책임자와 전화번호</th>
									<td>쿠팡고객센터 1577-7011</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		
		<!--Review TAB  -->
		<div id="Review" class="tabcontent">
			<h3>리뷰</h3>
			<p>Content</p>
		</div>
		
		<!-- Questions TAB  -->
		<div id="Questions" class="tabcontent">
			<div id="prod-inquiry-list" class="prod-tab">
				<div class="prod-inquiry-list">
					<div class="clearFix">
						<h4 class="prod-inquiry-list__title">상품문의</h4>
						<button class="prod-inquiry-list_write-btn">문의하기</button>
					</div>
					<div class="prod-inquiry-list__emphasis">
						<ul>
							<li>구매한 상품의 <b>취소/반품은 마이쿠팡 구매내역에서 신청</b> 가능합니다.
							</li>
							<li>상품문의 및 후기게시판을 통해 취소나 환불, 반품 등은 처리되지 않습니다.</li>
							<li><b>가격, 판매자, 교환/환불 및 배송 등 해당 상품 자체와 관련 없는 문의는 고객센터 내
									1:1 문의하기</b>를 이용해주세요.</li>
							<li><b>"해당 상품 자체"와 관계없는 글, 양도, 광고성, 욕설, 비방, 도배 등의 글은 예고
									없이 이동, 노출제한, 삭제 등의 조치가 취해질 수 있습니다.</b></li>
							<li>공개 게시판이므로 전화번호, 메일 주소 등 고객님의 소중한 개인정보는 절대 남기지 말아주세요.</li>
						</ul>
					</div>
					<div class="prod-inquiry-notice__container"></div>
					<div class="prod-inquiry-list__container">
						<div class="prod-inquiry-items"
							style="padding: 30px; text-align: center;">등록된 문의가 없습니다.</div>
					</div>
					<div class="prod-report">
						<div>
							<p class="prod-report__text">판매 부적격 상품 또는 허위과장광고 및 지식재산권을
								침해하는 상품의 경우 신고하여 주시기 바랍니다.</p>
						</div>
						<button class="prod-report_button" id="productReport" title="신고하기">신고하기</button>
					</div>
				</div>
			</div>
		</div>
		<!--반품교환 TAB  -->
		<div id="Returns" class="tabcontent">
			<h5 class="prod-delivery-return-policy-title">교환/반품 안내</h5>
			<ul class="prod-delivery-return-policy-legal-notice">
				<li>ㆍ교환/반품에 관한 일반적인 사항은 판매자가 제시사항보다 관계법령이 우선합니다. <br>다만,
					판매자의 제시사항이 관계법령보다 소비자에게 유리한 경우에는 판매자 제시사항이 적용됩니다.
				</li>
			</ul>
			<table class="prod-delivery-return-policy-table">
				<colgroup>
					<col width="160px">
					<col width="*">
				</colgroup>
				<tbody>
					<tr>
						<th>교환/반품 비용</th>
						<td>5,000원<br>- 단, 고객 변심의 경우에만 발생<br>- 부분반품 시,
							남은금액이 무료배송 조건을 유지하면 일부 반품비용이 부과
						</td>
					</tr>
					<tr>
						<th>교환/반품 신청 기준일</th>
						<td>
							<p>ㆍ단순변심에 의한 로켓배송 상품의 교환/반품은 제품 수령 후 30일 이내까지, 교환/반품 제한사항에
								해당하지 않는 경우에만 가능 (교환/반품 비용 고객부담)</p>
							<p>
								ㆍ상품의 내용이 표시·광고의 내용과 다른 경우에는 상품을 수령한 날부터 3개월 이내, 그 사실을 안 날 또는 알 수
								있었던 날부터 <span
									class="prod-delivery-return-policy__limit-list__indent">30일
									이내에 청약철회 가능</span>
							</p>
						</td>
					</tr>
				</tbody>
			</table>
			<h5 class="prod-delivery-return-policy-title">교환/반품 제한사항</h5>
			<ul class="prod-delivery-return-policy">
				<li>ㆍ주문/제작 상품의 경우, 상품의 제작이 이미 진행된 경우</li>
				<li>ㆍ상품 포장을 개봉하여 사용 또는 설치 완료되어 상품의 가치가 훼손된 경우 (단, 내용 확인을 위한 포장
					개봉의 경우는 예외)</li>
				<li>ㆍ고객의 사용, 시간경과, 일부 소비에 의하여 상품의 가치가 현저히 감소한 경우</li>
				<li>ㆍ세트상품 일부 사용, 구성품을 분실하였거나 취급 부주의로 인한 파손/고장/오염으로 재판매 불가한 경우</li>
				<li>ㆍ모니터 해상도의 차이로 인해 색상이나 이미지가 실제와 달라, 고객이 단순 변심으로 교환/반품을 무료로
					요청하는 경우</li>
				<li>ㆍ제조사의 사정 (신모델 출시 등) 및 부품 가격 변동 등에 의해 무료 교환/반품으로 요청하는 경우</li>
			</ul>
			<p class="prod-delivery-return-policy__limit-text">※ 각 상품별로 아래와
				같은 사유로 취소/반품이 제한 될 수 있습니다.</p>
			<table class="prod-delivery-return-policy-table">
				<colgroup>
					<col width="150px">
					<col width="*">
				</colgroup>
				<tbody>
					<tr>
						<th>의류/잡화/수입명품</th>
						<td>
							<p>ㆍ상품의 택(TAG) 제거, 라벨 및 상품 훼손, 구성품 누락으로 상품의 가치가 현저히 감소된 경우</p>
						</td>
					</tr>
					<tr>
						<th>계절상품/식품/화장품</th>
						<td>
							<p>ㆍ신선냉동 식품의 단순변심의 경우</p>
							<p>
								ㆍ뷰티 상품 이용 시 트러블(알러지, 붉은 반점, 가려움, 따가움)이 발생하는 경우,<br> <span
									class="prod-delivery-return-policy__limit-list__indent">&nbsp;&nbsp;&nbsp;
									진료 확인서 및 소견서 등을 증빙하면 환불이 가능 (제반비용 고객부담)</span>
							</p>
						</td>
					</tr>
					<tr>
						<th>전자/가전/설치상품</th>
						<td>
							<p>ㆍ설치 또는 사용하여 재판매가 어려운 경우, 액정이 있는 상품의 전원을 켠 경우</p>
							<p>ㆍ상품의 시리얼 넘버 유출로 내장된 소프트웨어의 가치가 감소한 경우 (내비게이션, OS시리얼이 적힌
								PMP)</p>
							<p>ㆍ홀로그램 등을 분리, 분실, 훼손하여 상품의 가치가 현저히 감소하여 재판매가 불가할 경우 (노트북,
								데스크탑 PC 등)</p>
						</td>
					</tr>
					<tr>
						<th>자동차용품</th>
						<td>
							<p>ㆍ상품을 개봉하여 장착한 이후 단순변심인 경우</p>
						</td>
					</tr>
					<tr>
						<th>CD/DVD/GAME/<br>BOOK
						</th>
						<td><span>ㆍ복제가 가능한 상품의 포장 등을 훼손한 경우</span></td>
					</tr>
				</tbody>
			</table>
			<div class="product-item__table product-seller">
				<p class="prod-delivery-return-policy-title">판매자 정보</p>
				<table class="prod-delivery-return-policy-table">
					<colgroup>
						<col width="150px">
						<col width="*">
					</colgroup>
					<tbody>
						<tr>
							<th>판매자</th>
							<td>쿠팡 <a
								class="prod-delivery-return-policy-table__phone-link"
								href="tel:+8215777011" target="_blank">1577-7011</a>
							</td>
						</tr>
					</tbody>
				</table>
				<div class="prod-minor-notice">미성년자가 체결한 계약은 법정대리인이 동의하지 않는 경우
					본인 또는 법정대리인이 취소할 수 있습니다.</div>
			</div>
		</div>
		</div>
		
	
	</div><!-- shopproduct read page -->
	
</body>


<script>
var price = document.querySelector("#product_price");
pprice = price.dataset.pprice;
console.log(pprice);
	var cate1 = "${cate}";
	var cate2 = "${cate2}";
	var cate3 = "${cate3}";
	
	$(".backcontents").on(
			"click",
			function() {
				location.href = "/shopproduct/contents_list?selectCate="
						+ cate1 + "&selectCate2=" + cate2 + "&selectCate3="
						+ cate3;
			});
	//장바구니 버튼을 클릭한 경우 session에 저장된 id를 읽어서 장바구니DB에 등록
	$(".cart_add").on("click", function() {
		var buynow = document.querySelector(".buy_now");
		var pno = buynow.getAttribute('data-pno');
		; // 상품번호
		var uid = "${id}";
		var amount = $(".input-text").html(); //구매자가 정한 수량
		//alert(pno+"\n"+uid+"\n"+amount);

		$.ajax({
			type : "post",
			url : "/shopproduct/insert",
			data : {
				pno : pno,
				uid : uid,
				amount : amount
			},
			success : function(data) {
				//장바구니 페이지로 이동하기
				if (data == 1) {
					//장바구니 등록 완료
					if (!confirm("장바구니로 이동하시겠습니까?"))
						return;
					location.href = "/shopproduct/cart_read?uid=" + uid;
				} else {
					alert('이미 장바구니에 등록된 상품입니다.');
				}
			}
		});
	});
	//상품구매 클릭시 상품수량과 기본가격을 가지고 넘어감
	$(".buy_now").on(
			"click",
			function() {
				var buynow = document.querySelector(".buy_now");
				var pno = buynow.getAttribute('data-pno');
				; // 상품번호
				var amount = $(".input-text").html(); //구매자가 정한 수량
				location.href = "/shopproduct/buy?pno=" + pno + "&amount="
						+ amount + "&uid=${id}";
			})
	//감소버튼 누를 경우 구매수량 감소
	$(".minus").on("click", function() {
		var fcount = $(".input-text").html();
		if (fcount <= 1)
			return;
		fcount--;
		$(".input-text").val(fcount);
		$(".input-text").html(fcount);
		$(".final_price").html(fcount * pprice + 3000);
		
		
		numberFormat();
	});
	//증가버튼 누를 경우 구매수량 증가
	$(".plus").on("click", function() {
		var fcount = $(".input-text").html();
		fcount++;
		$(".input-text").val(fcount);
		$(".input-text").html(fcount);
		;
		$(".final_price").html(fcount * pprice  + 3000);
		numberFormat();
	});
</script>
<script>
	/*페이지 텝  */
	function openPage(pageName, elmnt, color) {
		// Hide all elements with class="tabcontent" by default */
		var i, tabcontent, tablinks;
		tabcontent = document.getElementsByClassName("tabcontent");
		for (i = 0; i < tabcontent.length; i++) {
			tabcontent[i].style.display = "none";
		}
		// Remove the background color of all tablinks/buttons
		tablinks = document.getElementsByClassName("tablink");
		for (i = 0; i < tablinks.length; i++) {
			tablinks[i].style.backgroundColor = "";
		}
		// Show the specific tab content
		document.getElementById(pageName).style.display = "block";
		// Add the specific color to the button used to open the tab content
		elmnt.style.backgroundColor = color;
	}
	// Get the element with id="defaultOpen" and click on it
	document.getElementById("defaultOpen").click();

	//페이지 입장 후 최종가격 출력
	var fcount = $(".input-text").html();
	var fprice = "${vo.pprice}";
	$(".final_price").html(fcount * fprice + 3000);
	
	numberFormat();
	function numberFormat() {
		var fprice = $(".final_price").html();
		fprice = fprice.replace(/\B(?=(\d{3})+(?!\d))/g, ',');
		$(".final_price").html(fprice);
	}
</script>
<script>

	/* 찜버턴 활성화 */
	function favorite(){
		var item = $(".payment_buttons").find(".cart_add");
		var pno = item.data("pno")
		$(".favorite").css("display", "none");
		$(".favorite_active").css("display", "block");
		alert('hello, my pno is:'+pno);
		
	}
	/* 찜버턴 비활성화 */
	function un_favorite(){
		$(".favorite_active").hide();
		$(".favorite").show();
	}
	
	function btn_share(){
		var item = $(".payment_buttons").find(".cart_add");
		var pno = item.data("pno");
		$(".share_options").show();
		
	}
	
</script>
</html>
