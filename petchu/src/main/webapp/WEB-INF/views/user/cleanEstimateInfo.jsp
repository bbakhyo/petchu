<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link href="/resources/css/request.css" rel="stylesheet">
<style>
	textarea {
	margin-left : 0px;
	}
</style>
<div id="sendrequpage">
	<div id="request">
		<p class="title">
			<b>${cvo.scname}</b>���� �亯�� ������
		</p>
		<table id="petinfo">
			<tr>
				<td class="title" width=100>����</td>
				<td>${cvo.description}</td>
			</tr>
			<tr>
				<td class="title">����û���ݾ�</td>
				<td>${cvo.fprice}��</td>
			</tr>
		</table>
		<div id="btn">
			<button class="bigbtn" onClick="location.href='result'">����̵�</button>
			<button id="bigChoose">ä���ϱ�</button>
			<button class="bigbtn">ä��</button>
		</div>
	</div>
	<div id="hosinfo">
		<table id="hospital">
			<tr>
				<td class="title" style="text-align:center; font-size: 25px"  colspan=4><b>${cvo.scname} ����</b></td>
			</tr>
			<tr>
				<td width=70><b>���½ð�</b></td>
				<td colspan=2>${cvo.opentime}</td>
			</tr>
			<tr>
				<td width=70><b>�����ð�</b></td>
				<td colspan=3>${cvo.closetime}</td>
			</tr>
			<tr>
				<td><b>���ɽð�</b></td>
				<td colspan=3>${cvo.breaktime}</td>
			</tr>
			<tr>
				<td><b>��ȭ��ȣ</b></td>
				<td colspan=3>${cvo.sctel}</td>
			</tr>
			<tr>
				<td><b>�����Ұ�</b></td>
				<td><textarea rows=3 cols=70>${cvo.scdetail_description}</textarea></td>
			</tr>
			<tr>
				<td><b>�ּ�</b></td>
				<td colspan=3>${cvo.scaddress1} ${cvo.scaddress2}</td>
			</tr>
		</table>
		<div id="map"></div>
		<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5c9e09df993f534bf4a2916f4cf43cdd&libraries=services"></script>
	</div>
</div>
<script>
var scname = "${cvo.scname}";
var seno="${cvo.seno}";
var crno="${cvo.crno}"; 

$("#bigChoose").on("click", function(){
 	if(!confirm("�ش� �������� ä���Ͻðڽ��ϱ�?")) return;
	$.ajax({
			type : "post",
			url : "/request/cchoose",
			data : {crno : crno, seno : seno},
			success : function() {
				swal(scname + " ��ü�� �������� ä�� �Ǿ����ϴ�!");
			}
		});
	});

	var address = "${cvo.scaddress1}";
	var mapContainer = document.getElementById('map'), // ������ ǥ���� div 
	mapOption = {
		center : new kakao.maps.LatLng(33.450701, 126.570667), // ������ �߽���ǥ
		level : 3
	// ������ Ȯ�� ����
	};

	//������ �����մϴ�    
	var map = new kakao.maps.Map(mapContainer, mapOption);

	//�ּ�-��ǥ ��ȯ ��ü�� �����մϴ�
	var geocoder = new kakao.maps.services.Geocoder();

	//�ּҷ� ��ǥ�� �˻��մϴ�
	geocoder
			.addressSearch(
					address,
					function(result, status) {

						// ���������� �˻��� �Ϸ������ 
						if (status === kakao.maps.services.Status.OK) {

							var coords = new kakao.maps.LatLng(result[0].y,
									result[0].x);

							// ��������� ���� ��ġ�� ��Ŀ�� ǥ���մϴ�
							var marker = new kakao.maps.Marker({
								map : map,
								position : coords
							});

							// ����������� ��ҿ� ���� ������ ǥ���մϴ�
							var infowindow = new kakao.maps.InfoWindow(
									{
										content : '<div style="width:150px;text-align:center;padding:6px 0;">${vo.dname}</div>'
									});
							infowindow.open(map, marker);

							// ������ �߽��� ��������� ���� ��ġ�� �̵���ŵ�ϴ�
							map.setCenter(coords);
						}
					});
</script>