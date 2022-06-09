<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>
<link href="/resources/css/insert.css" rel="stylesheet" />
<link rel="shortcut icon" href="#">
<script src="https://kit.fontawesome.com/21038295a9.js"
	crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script src="/resources/pagination.js"></script>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript" src="/resources/chart.js"></script>
</head>
<div id="page_review">
	<form name="frm" method="post" enctype="multipart/form-data">
		<div class="insert_page">
			<div class="page_title">
				<h2>리뷰 작성</h2>
			</div>

			<div class="page_info">
				<div class="review_details"></div>
				<!--helpcount까지-->
				<div class="inin_page">
					<!--한줄요약까지-->
					<div class="page_heading">
						<h3 class="review_h3"><span id="img_heading" style="position: relative; top: 3px;"><img src="/resources/icon_menu/icon_loyalty.png" width=20 alt="product_image"></span>상품 품질 리뷰</h3>
						<h5>상품에 대해서 얼마나 만족하시나요?</h5>
					</div>
					<!--r_q-->
					<div class="p_info">

						<div class="bno" style="display: none;">
							<select id="uid" name="uid">
								<option value="${vo.uid}" selected>${vo.uid}</option>
							</select>
							<div id="bno">${vo.bno}</div>
							<div id="pno">${vo.pno}</div>
						</div>

						<div class="product_container">
							<div id="p_img">
								<img src=${vo.pimage} width=200 height=200 />
							</div>

							<div class="product_name">
								<b>상품명:</b>
								<div id="pname">

									<div>${vo.pname}</div>
								</div>

								<div class="make_star">
									<div class="star">
										<select id="makeStar" name="star" style="display: none;">
											<option value="0">0</option>
											<option value="1">1</option>
											<option value="2">2</option>
											<option value="3">3</option>
											<option value="4">4</option>
											<option value="5">5</option>
										</select> <br />
										<div class="rate" style="display: inline;">
											<i class="fa-solid fa-star"></i> <i class="fa-solid fa-star"></i>
											<i class="fa-solid fa-star"></i> <i class="fa-solid fa-star"></i>
											<i class="fa-solid fa-star"></i> &nbsp;
											<div style="display: inline" id="evaluation"></div>
										</div>
									</div>
								</div>



							</div>
						</div>

						<!--p_ns-->
					</div>
					<div class="review_details">
						<div class="d_review">
							<h2 class="review_h2">상세리뷰</h2>
						</div>
						<div class="textarea_review">
							<textarea name="review" id="textarea_1" rows="10" cols="80"
								placeholder="리뷰는 10자 이상 작성부탁드립니다"></textarea>

						</div>
						<div class="textarea_review_row_bottom">
							<div class="review_overlay_row">
								<div class="review_overlay">이 상품을 지인에게 추천하실래요?</div>
								<div class="word_count1" data-count="0"></div>
							</div>
						</div>

					</div>

					<div class="r_photo">
						<div class="photo_a">
							<h3 class="review_h3">사진첨부</h3>
						</div>
						<div class="box1">
							<a href="#" class="btn_upload" id="btn_file">사진 첨부하기</a>
						</div>
						<div class="file_wrapper">
							<div class="file">
								<div>사진 업로드</div>
								<input type="file" name="uploadFile" id="uploadFile" multiple
									style="display: none;">
								<div class="preview"></div>
							</div>
							<div id="preview_name"></div>
						</div>
					</div>

					<div class="rtitle">
						<div>
							<h3 class="review_h3" class="review_h">한줄요약</h3>
						</div>
						<div id="rtitle summary_container">
							<div class="textarea_review">
								<textarea name="rtitle" id="textarea_2" rows="3" cols="80"
									placeholder="한 줄 요약을 입력해주세요" maxlength=30></textarea>
							</div>
							<div class="textarea_review_row_bottom">
								<div class="review_overlay_row2">

									<div class="word_count2_container">
										<span class="word_count2" data-count="0"> </span><span>/</span><span>30</span>
									</div>

								</div>
							</div>

						</div>
					</div>
					<!--rtitle-->
				</div>
				<!--inin_page-->
				<div class="h_info" style="display: none;">
					<div class="satis">
						<p>만족도</p>
					</div>
					<div></div>
				</div>
				<div id="review_btn">
					<a href="#" class="review_cancel">취소하기</a>
					<div class="box"></div>

					<a href="#" class="review_submit">등록하기</a>
				</div>
			</div>
			<!--page_info-->

		</div>
		<!--insert_page-->

	</form>
</div>


<script>
	//textarea 저녀 변수 
	var word_count1 = $(".word_count1");
	var word_count2 = $(".word_count2");
	// 초기 글자 수
	word_count1.html(0);
	word_count2.html(0);

	//word counter1, top
	$("#textarea_1").on('keyup', function(event) {
		var textarea_1 = $("#textarea_1").val();
		$(".word_count1").html(textarea_1.length);
	})

	//word counter2, bottom 
	$('#textarea_2').on('keyup', function(event) {
		var textarea_2 = $("#textarea_2").val()
		$(".word_count2").html(textarea_2.length);
	})
</script>

<script>
getList();

function getList() {
	var orno = "${orno}";
	$.ajax({
		type : "get",
		dataType : "json",
		data : {
			orno : orno
		},
		url : "/shopproduct/list.json",
		success : function(data) {
			var template = Handlebars.compile($("#temp").html());
			$("#tbl").html(template(data));
		}
	})
}
</script>
<script>
	//별점
	var rating = $('.rating');

	/* rating.each(function(){ 
		var tagetscore = $(this).attr('data-rate');
		console.log(tagetscore);
		$(this).find('.fa-solid').css({color:'#D3D3D3'});
		$(this).find('.fa-solid:nth-child(-n+' + tagetscore + ')').css({color:'#F08d28'});
	}); */
	var userScore = $('#makeStar');

	userScore.change(function() {
		var userScoreNum = $(this).val();
		switch (userScoreNum) {
		case "1":
			$("#evaluation").html("별로에요");
			break;
		case "2":
			$("#evaluation").html("조금 별로에요");
			break;
		case "3":
			$("#evaluation").html("보통이에요");
			break;
		case "4":
			$("#evaluation").html("좋아요");
			break;
		case "5":
			$("#evaluation").html("아주 좋아요");
			break;
		}
		$('.make_star .fa-solid').css({
			color : '#D3D3D3'
		})
		$('.make_star .fa-solid:nth-child(-n+' + userScoreNum + ')').css({
			color : '#F08d28'
		});
	});
	/*
	var userScore = $('#makeStar');
	userScore.change(function(){
		var userScoreNum = $(this).val();
		switch(userScoreNum){
		case "1":
			$("#evaluation").html("별로에요");
			break;
		case "2":
			$("#evaluation").html("조금 별로에요");
			break;
		case "3":
			$("#evaluation").html("보통이에요");
			break;
		case "4":
			$("#evaluation").html("좋아요");
			break;
		case "5":
			$("#evaluation").html("아주 좋아요");
			break;
	}
		$('.make_star .fa-solid').css({color:'#D3D3D3'})
		$('.make_star .fa-solid:nth-child(-n+' + userScoreNum + ')').css({color:'#F08d28'});
	});*/

	$('.make_star .fa-solid').click(function() {
		var targetNum = $(this).index() + 1;
		//$('#makeStar').val(targetNum);
		var check = $(frm.star).val(targetNum);
		switch (targetNum) {
		case 1:
			$("#evaluation").html("별로에요");
			break;
		case 2:
			$("#evaluation").html("조금 별로에요");
			break;
		case 3:
			$("#evaluation").html("보통이에요");
			break;
		case 4:
			$("#evaluation").html("좋아요");
			break;
		case 5:
			$("#evaluation").html("아주 좋아요");
			break;
		}

		$('.make_star .fa-solid').css({
			color : '#D3D3D3'
		})
		$('.make_star .fa-solid:nth-child(-n+' + targetNum + ')').css({
			color : '#F08d28'
		});

	});

	//사진첨부 버튼클릭
	$("#btn_file").on("click", function() {
		$("#uploadFile").click();
	});

	/* 	//이미지 공간 클릭시 이미지 업로드 버턴 클릭 해주기
	$(".file").on("click",function(){
		
		$("#uploadFile").click();
	}) */

	var fileCount = 0;
	var fileNum = 0;
	var arr = new Array();

	$(document)
			.ready(
					function(e) {
						$("input[type='file']").change(
								function(e) {

									//div 내용 비워주기
									$('.preview').empty();

									var files = e.target.files;
									arr = Array.prototype.slice.call(files);

									//업로드 가능 파일인지 체크
									for (var i = 0; i < files.length; i++) {
										if (!checkExtension(files[i].name,
												files[i].size)) {
											return false;
										}
									}
									$(".file").show();
									preview(arr);

								});//filechange

						function checkExtension(fileName, fileSize) {
							var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
							var maxSize = 20971520; //20MB
							var fileEx = fileName.slice(
									fileName.indexOf(".") + 1).toLowerCase();

							if (fileEx != "png" && fileEx != "jpg"
									&& fileEx != "gif") {
								alert("등록가능한 형식이 아닙니다.");
								return false;
							}

							if (fileSize >= maxSize) {
								alert('파일 사이즈 초과');
								$("input[type='file']").val(""); //파일 초기화
								return false;
							}

							if (regex.test(fileName)) {
								alert('업로드 불가능한 파일이 있습니다.');
								$("input[type='file']").val(""); //파일 초기화
								return false;
							}
							return true;
						}
						function preview(arr) {
							arr
									.forEach(function(f) {

										//파일명이 길면 파일명 ...으로 처리
										var fileName = f.name;
										if (fileName.length > 10) {
											fileName = fileName.substring(0, 7)
													+ "..";

										}
										//div에 이미지 추가
										var str = '<div style = "display: inline-flex; padding : 10px;">'

										//이미지 파일 미리보기
										if (f.type.match('image.*')) { //파일을 읽기 위한 FileReader객체 생성
											var reader = new FileReader(); //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
											reader.onload = function(e) {
												str += '<img src="'+e.target.result + '" title ="'+f.name+'" width=200 height=200/>';
												/* str += '<p>' + fileName
														+ '</p>'; */
												str += '</div>';
												$(str).appendTo('.preview');
												$("#preview_name").html(
														fileName);
											}
											reader.readAsDataURL(f);
										} else {
											str += '<img src ="/resources/img/fileImg.png" title"'+f.name+'" width=100 height=100 />';
											$(str).appendTo(".preview");
										}
									});
						}
					});

	//submit 버튼을 클릭한 경우
	$(frm).on("click", ".review_submit", function(e) {
		e.preventDefault();
		var review = $(frm.review).val();
		var rtitle = $(frm.rtitle).val();
		var star = $(frm.star).val();
		var file = $(frm.uploadFile).val();
		var uid = "${id}";
		alert(file + "\n" + uid);
		if (review == "") {
			alert("리뷰를 입력해주세요");
			$(frm.review).focus();
			return;
		} else if (rtitle == "") {
			alert("한줄요약을 입력해주세요");
			$(frm.rtitle).focus();
			return;
		}

		if (!confirm("리뷰를 등록하실래요?"))
			return;
		alert(file);
		var uid = "${id}"
		alert(uid)
		$(frm.uid).val(uid);
		frm.submit();

	});
</script>