<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
<style>
	.cart_item_img img {width:90px; height:90px;}
	.checkout_delivery_address{text-align:left;}
	.terms_inside_wrapper{text-align:left;}
</style>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link href="/resources/checkout_page.css" rel="stylesheet">
  <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <!-- 경계선 -->
	<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<div class="checkout_page">
    <h1 class="checkout_page_heading">결제하기</h1>

    <div class="checkout_container_main">

      <div class="checkout_left_section">

        <!-- /* 주문 상품 정보 */ -->
        <div class="checkout_cartinfo_card">
          <div class="card_heading">주문 상품 정보</div>

          <div class="checkout_cart_list">
          <table id="tbl"></table>
			<script id="temp" type="text/x-handlebars-template">
			{{#each .}}
            <div class="cartitem_info_card">
              <div class="cartitem_info_left">
                <div class="cart_item_img">
                  <img src="{{pimage}}">
                </div>
              </div>
              <div class="cartitem_info_right" sum={{sum}} pno={{pno}} amount={{amount}}>
                <div class="cartitem_title">{{pname}}</div>
                <div class="cartitem_price" price="{{sum}}"><span class="formatPrice">{{display sum}}</span>원  ({{amount}}개)</div>

              </div>
            </div>
			{{/each}}
			</script>
          </div>
        </div>

        <!--  주문자 정보       -->
        <div class="checkout_buyer_info_card">
          <div class="card_heading">
            <span>주문자 정보</span>
          </div>
          <div class="tbl_buyer">
            <div>
              <div class="buyer_userid buyer">${vo.name}</div>
              <div class="buyer_phone buyer">${vo.tel}</div>
              <div class="buyer_email">${vo.email}</div>

            </div>

          </div>
        </div>

        <!--  배송정보       -->
        <div class="checkout_shipping_info_card">

          <div class=" card_heading"><span>배송 정보</span></div><br>
          <div><input type="checkbox" name="same_address" id="checkout_same_address"><label for="checkout_same_address">주문자 정보와 동일</label></div>

          <div class="checkout_delivery_address">

            <div class="receiver_line1">
              <span><input type="text" name="order_receiver" id="order_receiver" placeholder="수령인"></span>
              <span><input type="text" name="delivery_contact" id="delivery_contact" placeholder="연락처"></span>
            </div>

            <div class="receiver_line2">
              <span><input type="text" name="zipcode" id="zipcode" placeholder="우편번호"></span>
              <span><button id="btn_search_address">주소찾기</button></span>
            </div>

            <div class="receiver_line3">
              <div><input type="text" name="delivery_address1" placeholder="주소1" id="delivery_addy1" size=55></div>
            </div>

            <div>
              <div><input type="text" name="delivery_address2" placeholder="주소2" id="delivery_addy2" size=55></div>
            </div><br>
          </div>
        </div>

        <!--  포인트 정보       -->
        
        <div class="coupon_points_card">
          <div class="card_heading"><span>쿠폰/포인트</span></div>

          <p class="points_header">쿠폰</p>
          <div class="coupon_line1">
            <input type="text" name="apply_coupons" placeholder="보유쿠폰 0장" id="apply_coupons" size=43 readonly>
          <span><button>쿠폰적용</button></span>
          </div>


          
            <p class="points_header">쿠폰번호</p>
          <div class="coupon_line2">
            <input type="text" name="my_coupon_id" placeholder="쿠폰 번호 입력" id="coupon_id" size=43>
            <span><button>코드확인</button></span>
          </div>

          <p class="points_header">포인트</p>
          <div class="coupon_line3">
            <input type="text" name="my_coupon_points" id="#my_coupon_points" placeholder="0" size=43>
            <span><button>전액사용</button></span>
</div>
            <div class="point_paragraphs"><br>
              <p class="points_header">보유 포인트 1,0000</p>
              <p>1,0000 포인트 이상 보류 시 10,000원 이상 구매시</p>
              <p>주문장 최대 30000원 포인트까지 사용 가능</p>
            </div>
          
        </div>
      </div>
        
      <!--     /* COLUMN 2(RIGHT SIDE) 최종결제금액 */       -->
      <div class="checkout_right_section">

        <div class="checkout_total_card">
          <div class="checkout_total_outside" id="checkout_total_outside">
            <div class="checkout_heading">최종결제금액</div>

            <div class="checkout_total_inside">
              <div class="checkout_total_card_line1">

                <div class="card_cart_total_row_left">상품가격</div>
                <div class="card_cart_total_row_right" style="float:right"><span class="items_price"></span>원</div>
              </div><br>

              <div class="checkout_total_card_line2">

                <div class="card_cart_deliveryfee_row_left">배송비</div>
                <div class="card_cart_deliveryfee_row_right">+3,000원</div>
              </div>
              <hr class="transition">

              <div class="checkout_total_card_line3">
                <div class="card_cart_grandtotal_row_left">총 결제금액<span class="item_type_amount">(3개)</span></div>
                <span class="card_cart_grandtotal_row_right" style="font-size:1.2em">353,000원</span>
              </div>

            </div>
          </div>
        </div>

        <div class="checkout_method_card">
          <div class="checkout_method_card_outside_wrapper">
            <div class="checkout_heading">결제수단</div>
            <div class="checkout_radio_option_container_wrap">
              <div class="checkout_radio_option_container">
					
                <label for="credit" for="pay_type">
                  <input type="radio" name="pay_type" class="pay" id="credit" value="credit1">
                  신용카드
                </label>

                <label for="transfer" for="pay_type">
                  <input type="radio" name="pay_type" id="transfer" class="pay" value="transfer1">
                  계좌이체
                </label>

                <label for="payco" for="pay_type">
                  <input type="radio" name="pay_type" id="payco" class="pay" value="payco1">
                  PAYCO
                </label>

                <label for="kakao" for="pay_type">
                  <input type="radio" name="pay_type" id="kakao" class="pay" value="kakaopay1">
                  KakaoPay
                </label>

              </div>
            </div>
          </div>
        </div>

        <div class="checkout_terms_card">
          <div class="terms_outside_wrapper">
            <div class="terms_inside_wrapper">
              <div class="terms_wrapper">
                <div class="terms_line1">
                  <label for="terms_agree_all">
                    <input type="checkbox" name="terms_agree_all" id="terms_agree_all">전체동의
                  </label>
                </div><br>

                <div class="terms_line2">
                  <label for="terms_agreement">
                    &nbsp;<span style='font-size:10px;'></span>&#9493;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="terms_agree_all" id="terms_agreement">구매조건 확인 및 결제진행에 동의</label>
                </div>
              </div>
            </div>
          </div>
          <div class="terms_agree_button_wrapper">
            <div class="btn_shape"><a class="pay_btn" href="#">결제하기</a> </div>
          </div>
        </div>
      </div>

    </div>
  </div>

<script>

Handlebars.registerHelper("display", function(sum){
  return sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
});

</script>

<script>
	var uid = "${id}";
	getList();
	
	//체크했을 떄 불러오기만 하면 나중에 합산가능
	var i = 0;
	$("#tbl").on("click", function(){
		$(".chk:checked").each(function(){
			var sum = $(this).parent().find(".cart_item_info .pay_p .sum").text();
			i = i + Number(sum);
		})
		$(".final_price").html(i);
		i = 0;
	});
	
	
	//buy 정보 불러오기
	function getList(){
		$.ajax({
			type: "get",
			dataType: "json",
			data: {uid: uid},
			url: "/shopproduct/multi_buy.json",
			success:function(data){
				var template = Handlebars.compile($("#temp").html());
				$("#tbl").html(template(data));
				
				//최종결제금액 계산
				var i = 0;
				$("#tbl .cartitem_info_right").each(function(){
					var sum = $(this).attr("sum");
					i = i + Number(sum);
				});
				
				$("#checkout_total_outside .items_price").html(i);
				$("#checkout_total_outside .items_price").attr("price", i);
				
				var fprice = $(".items_price").html();
				fprice=fprice.replace(/\B(?=(\d{3})+(?!\d))/g, ',');
				$(".items_price").html(fprice);
				
				var final_price = i + 3000;
				$(".card_cart_grandtotal_row_right").attr("final_price", final_price);
				$(".card_cart_grandtotal_row_right").html(final_price);
				
				var fmprice = $(".card_cart_grandtotal_row_right").html();
				fmprice=fmprice.replace(/\B(?=(\d{3})+(?!\d))/g, ',');
				$(".card_cart_grandtotal_row_right").html(fmprice+"원");
				
				//아이템 수량
				var item_type_amount = $("#tbl .cartitem_info_right").length;
				$(".item_type_amount").html("("+item_type_amount+"개)");
				
				//로딩시 주문정보 동일 자동체크 & 사용저 배송정보 자동 출력
				$("#checkout_same_address").attr("checked", "checked");	
				getAccountInfo();
			}
		});
	}
	
	
	//주문정보 동일 체크여부 바뀔 경우
	$("#checkout_same_address").on("change", function(){
		//동일 체크 되었을 경우
		if($("#checkout_same_address").is(":checked")) {
			getAccountInfo();
		}else{	//체크 해제되었을 경우
			$("#order_receiver").val("");
			$("#order_receiver").attr("readonly", false);
			$("#delivery_contact").val("");
			$("#delivery_contact").attr("readonly", false);
			$("#zipcode").val("");
			$("#delivery_addy1").val("");
			$("#delivery_addy2").val("");
			$("#delivery_addy2").attr("readonly", false);
		}
	});	
	

	//주문정보 동일이 체크되어있을 경우 (실행 코드)
	function getAccountInfo(){
		if($("#checkout_same_address").is(":checked")) {
			$("#order_receiver").val("${vo.name}");
			$("#order_receiver").attr("readonly", "readonly");
			$("#delivery_contact").val("${vo.tel}");
			$("#delivery_contact").attr("readonly", "readonly");
			$("#zipcode").val("${vo.zipcode}");
			$("#zipcode").attr("readonly", "readonly");
			$("#delivery_addy1").val("${vo.address1}");
			$("#delivery_addy1").attr("readonly", "readonly");
			$("#delivery_addy2").val("${vo.address2}");
			$("#delivery_addy2").attr("readonly", "readonly");
			getNumberFormat();
		}//
	}

	///////////////////////////////////////////////////////////////////////////////////////////
	
	
	
	//주소검색 버튼
	$("#btn_search_address").on("click",function(){
		new daum.Postcode({
			oncomplete:function(data){
				console.log(data);
				
				$("#delivery_addy1").val(data.address);
				$("#zipcode").val(data.zonecode);
				
			}
		}).open();
	})	
	
	/* <!--  (checkout_shipping_info_card)       --> */	
	$(".checkout_container_main").on("click",".pay_btn",function(){
		/* alert("결제하기"); */
		/*card1=checkout_shipping_info_card(배송정보 : 주소 )  */
		var card1 = $(".checkout_shipping_info_card");
		var receiver = card1.find("#order_receiver").val();
		var contact = card1.find("#delivery_contact").val();
		var zipcode = card1.find("#zipcode").val();
		var address1 = card1.find("#delivery_addy1").val();
		var address2 = card1.find("#delivery_addy2").val();
		/* alert("receiver"+receiver+"\n"+"contact:"+contact+"\n"+"zipcode:"+zipcode+"\n"+"address1:"+address1+"\n"+"address2:"+address2+"\n");  */
		
		/*card2=coupon_points_card(포인트 정보)  */
		var card2 = $(".coupon_points_card");
		var applycoupon = card2.find("#apply_coupons").val();
		var couponid = card2.find("#coupon_id").val();
		var mycoupon = card2.find("#my_coupon_points").val();
		
		/*card3=checkout_method_card(결제수단)  */
		var card3 = $(".checkout_method_card");
	
		//결제수단 가저오기
		if ($('input[class="pay"]:checked').length === 0){
		alert("결제 수단을 선택 하세요!"); 
		return;
		}else{
			var select_pay_type = document.getElementsByName('pay_type');
			for(i = 0; i < select_pay_type.length; i++){
				if(select_pay_type[i].type="radio"){
					if(select_pay_type[i].checked)
						var paytype=select_pay_type[i].value;
				}
		   
		} //for
			
		} //else
		
		//유효성 체크
		if(receiver==''||null){
		alert("수령자 이름을 입력 하세요!");
		$("#order_receiver").val();	
		}else if(contact==''||null){
		
		alert("연락처를 입력하세요!")
		$("#delivery_contact").val();	
		}else if(address1==''||null){
			alert("배송지를 선택하세요!");
			
		}else if(address2==''||null){
			 alert("배송지 상세주소를 정확히 입력해주세요!");
			 $('input[name=delivery_address2]').focus();
		}else{
			var pamount = $("#tbl .cartitem_info_card").length;
			pamount = Number(pamount-1);
			//첫 번째 상품명이 출력되야함
			var proname = $(".cartitem_title").html();
			
			//여러 개 주문시 상품명 + 외 n개 
			var itemCount = $(".cartitem_info_card").length;
			if(itemCount==1){
				var pname = proname;
			}else{
				var pname = proname + ' 외 ' + pamount;
			}
			
			var receiver = $("#order_receiver").val();
			var tel = $("#delivery_contact").val();
			var delivery_contact = $("#delivery_contact").val();
			var buyer = "${vo.name}";
			var final_price = $(".card_cart_grandtotal_row_right").attr("final_price");
// 			alert(final_price);
			
			var IMP = window.IMP; // 생략가능
			IMP.init('imp71996590'); 
			// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
			IMP.request_pay({
				pg: 'kakao',
				pay_method: 'card',
				merchant_uid: 'merchant_' + new Date().getTime(),
				/* 
				 *  merchant_uid에 경우 
				 *  https://docs.iamport.kr/implementation/payment
				 *  위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
				 */
				name: '주문명 : ' + pname,
				// 결제창에서 보여질 이름
				// name: '주문명 : ${auction.a_title}',
				// 위와같이 model에 담은 정보를 넣어 쓸수도 있습니다.
				amount: final_price,
				// amount: ${bid.b_bid},
				// 가격 
				buyer_name: '${vo.name}',
				buyer_postcode: '123-456',
				}, function (rsp) {
					//alert("클릭");
					console.log(rsp);
				if (rsp.success) {
					var msg = '결제가 완료되었습니다.';
					var final1 = pname;
					msg += '결제 금액 : ' + rsp.paid_amount;
					
					//결제 성공시 주문목록에 등록
					var orno = Date.now() + uid;
					$(".cartitem_info_right").each(function(){
						var pno = $(this).attr("pno");
						var amount = $(this).attr("amount");
//			 			alert(pno);
//			 			alert(amount);
							$.ajax({
								type: "post",
								url: "/shopproduct/order_insert",	
								data: {uid:uid, pno:pno, amount:amount, orno:orno, zipcode:zipcode, address1:address1, address2:address2, receiver:receiver, tel:tel},
								success: function(){
									location.href="/shopproduct/order_list?uid="+uid;
								}
							});
					});			
				} else {
					var msg = '결제에 실패하였습니다.';
					msg += '에러내용 : ' + rsp.error_msg;
				}
				alert(msg);
				//위에서 담은 msg 내용을 출력
			});
		}
	});

	
	//전체동의 버튼	
	$("#terms_agree_all").on("change", function(){
		//체크 되었을 경우
		if($("#terms_agree_all").is(":checked")) {
			$("#terms_agreement").attr("checked", "checked");
		}else{
			$("#terms_agreement").attr("checked", false);
		}
	});
	
	//일반동의 버튼
	$("#terms_agreement").on("change", function(){
		//체크 되었을 경우
		if($("#terms_agreement").is(":checked")) {
			$("#terms_agree_all").attr("checked", "checked");
		}else{
			$("#terms_agree_all").attr("checked", false);
		}
	});
	

	//전화번호 포멧//////////////여기부터 시작!!!!!!!!!!!!!!!!!! 멀티바이도 수정해야함
	
	
	
	function getNumberFormat(){
		var num = $(".buyer_phone").html();
		var formatNum = '';
		 if(num.length==11){
		     formatNum = num.replace(/(\d{3})(\d{4})(\d{4})/, '$1-$2-$3');
		 }else if(num.length==8){
		     formatNum = num.replace(/(\d{4})(\d{4})/, '$1-$2');
		 }else if(num.indexOf('02')==0){
		     formatNum = num.replace(/(\d{2})(\d{4})(\d{4})/, '$1-$2-$3');
		 }else{
		     formatNum = num.replace(/(\d{3})(\d{3})(\d{4})/, '$1-$2-$3');
		 }
		 $(".buyer_phone").html(formatNum);
		 $("#delivery_contact").val(formatNum);
		 $("#delivery_contact").attr("tel", num);
	}
	//
	//동의버튼 번갈아 사용시 작동 안하니 생각 좀 해보기 
	//
    //readonly가 앞에 있는 buy 페이지에서는 작동하는데 여기서는 안함
    
	
</script>