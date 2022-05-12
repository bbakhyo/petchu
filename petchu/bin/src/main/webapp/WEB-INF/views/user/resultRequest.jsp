<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link href="/resources/css/request.css" rel="stylesheet">
<div id="sendrequpage">
	<div id="request">
		<p class="title">
			<b>${vo.dname}</b> 에서 답변한 견적서
		</p>
		<table id="petinfo">
			<tr>
				<td width=100 class="title">이름</td>
				<td>${vo.pname}</td>
			</tr>
			<tr>
				<td class="title">진단명</td>
				<td>${vo.drdisease}</td>
			</tr>
			<tr>
				<td class="title">설명</td>
				<td>${vo.drcontent}</td>
			</tr>
			<tr>
				<td class="title">예상청구금액</td>
				<td>${vo.drprice}</td>
			</tr>
		</table>
		<div id="btn">
			<button id="bigbtn" onClick="location.href='result'">목록이동</button>
			<button id="bigbtn">예약하기</button>
		</div>
	</div>
	<div id="hosinfo">
		<table id="hospital"></table>
		<script id="temp" type="text/x-handlebars-template">
			<tr>
				<td class="title" style="text-align:center; font-size: 25px"  colspan=4><b>{{dname}} 정보</b></td>
			</tr>
			<tr>
				<td width=100><b>오픈시간</b></td>
				<td>{{open}}</td>
				<td width=100><b>마감시간</b></td>
				<td>{{close}}</td>
			</tr>
			<tr>
				<td><b>점심시간</b></td>
				<td colspan=3>{{o_break}} - {{c_break}}</td>
			</tr>
			<tr>
				<td><b>전화번호</b></td>
				<td colspan=3>{{dtel}}</td>
			</tr>
			<tr>
				<td><b>병원소개</b></td>
				<td colspan=3>{{dinfo}}</td>
			</tr>
			<tr>
				<td><b>주소</b></td>
				<td colspan=3>{{daddress1}} {{daddress2}}</td>
			</tr>
		</script>
		
		<div id="map"></div>
		<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5c9e09df993f534bf4a2916f4cf43cdd&libraries=services"></script>
	</div>
</div>
<script>
var dno = "${vo.dno}";

	getList();
	function getList(){
		$.ajax({
			type: "get",
			dataType: "json",
			url: "/request/doctorinfo",
			data:{dno:dno},
			success:function(data){
				var template = Handlebars.compile($("#temp").html());
				$("#hospital").html(template(data));
			}
		})
	}
</script>
<script>

var address="${vo.daddress1}";
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
		center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		level : 3
	// 지도의 확대 레벨
	};

	//지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption);

	//주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();

	//주소로 좌표를 검색합니다
	geocoder
			.addressSearch(
					address,
					function(result, status) {

						// 정상적으로 검색이 완료됐으면 
						if (status === kakao.maps.services.Status.OK) {

							var coords = new kakao.maps.LatLng(result[0].y,
									result[0].x);

							// 결과값으로 받은 위치를 마커로 표시합니다
							var marker = new kakao.maps.Marker({
								map : map,
								position : coords
							});

							// 인포윈도우로 장소에 대한 설명을 표시합니다
							var infowindow = new kakao.maps.InfoWindow(
									{
										content : '<div style="width:150px;text-align:center;padding:6px 0;">${vo.dname}</div>'
									});
							infowindow.open(map, marker);

							// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
							map.setCenter(coords);
						}
					});
</script>