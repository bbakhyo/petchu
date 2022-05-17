<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link href="/resources/css/request.css" rel="stylesheet">
<link href="/resources/css/hosread.css" rel="stylesheet"/>
<script src="https://kit.fontawesome.com/e44146d80b.js" crossorigin="anonymous"></script>
<div id="sendrequpage">
	<div id="request">
		<p class="title">
			<b>${vo.dname}</b> ���� �亯�� ������
		</p>
		<table id="petinfo">
			<tr>
				<td width=150 class="title">�̸�</td>
				<td>${vo.pname}</td>
			</tr>
			<tr>
				<td class="title">���ܸ�</td>
				<td>${vo.drdisease}</td>
			</tr>
			<tr>
				<td class="title">����</td>
				<td>${vo.drcontent}</td>
			</tr>
			<tr>
				<td class="title">����û���ݾ�</td>
				<td>${vo.drprice}</td>
			</tr>
			<tr>
				<td><img src="/display?fileName=${vo.drfile}"></td>
			</tr>
		</table>
		<div id="btn">
			<button class="bigbtn" onClick="location.href='result'">����̵�</button>
			<button class="bigbtn" id="openPopup">�����ϱ�</button>
			<button class="bigbtn" id="chatadd">ä&nbsp;&nbsp;&nbsp;��</button>
		</div>
	</div>
	<div id="hosinfo">
		<table id="hospital"></table>
		<script id="temp" type="text/x-handlebars-template">
			<tr>
				<td class="title" style="text-align:center; font-size: 25px"  colspan=4><b>{{dname}} ����</b></td>
			</tr>
			<tr>
				<td width=100><b>���½ð�</b></td>
				<td>{{open}}</td>
				<td width=100><b>�����ð�</b></td>
				<td>{{close}}</td>
			</tr>
			<tr>
				<td><b>���ɽð�</b></td>
				<td colspan=3>{{o_break}} - {{c_break}}</td>
			</tr>
			<tr>
				<td><b>��ȭ��ȣ</b></td>
				<td colspan=3>{{dtel}}</td>
			</tr>
			<tr>
				<td><b>�����Ұ�</b></td>
				<td colspan=3>{{dinfo}}</td>
			</tr>
			<tr>
				<td><b>�ּ�</b></td>
				<td colspan=3>{{daddress1}} {{daddress2}}</td>
			</tr>
			<tr>
				<td colspan=3><input type="text" id="did" value={{id}} style="display:none"></td>
			</tr>
		</script>
		<div id="map"></div>
		<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5c9e09df993f534bf4a2916f4cf43cdd&libraries=services"></script>
		</div>
	<div id="popup01">
		<span id="scno" value="" style="display:none;"></span>
		<h2 style="margin-left: 150px;" id="dname">${vo.dname}</h2>
		<table id="date">
			<tr>
				<td width=100>������</td>
				<td id="checkin">
					<input type="date" id="checkDate"><input type="time" id="checkTime">
				</td>
			</tr>
		</table>
		<hr>
		<div id="user">
			���������� ����<input type="checkbox" id="userCheck" checked>
			<p>������ ����</p>
			<input type="text" id="userName" size=4 value="${uvo.name}">
			<p>������ ����ó</p>
			<input type="hidden" id="userTel" name="userTel" value="${uvo.tel}">
			<input type="text" id="userTel1" size=3>
			<input type="text" id="userTel2" size=4>
			<input type="text" id="userTel3" size=4>
		</div>
		
		<div id="please">
			<p>��û����</p>
			<p><textarea rows="5" cols="50" id="request">��û������ ������ �ּ���.</textarea><p>
		</div>
		<div id="button">
			<button id="btnReserve">�����ϱ�</button>
		</div>
		<div id="btnClose">
			<button class="close">����</button>
		</div>
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
var id = "${id}";
$("#chatadd").on("click", function(e) {
	var doctorid = $("#did").val();
	console.log(doctorid);
	e.preventDefault();
	$.ajax({
		type:"get",
		url:"/chat/create",
		data:{doctorid:doctorid},
		success:function(data){
			console.log("���� �����Ǿ����ϴ�.");
			$.ajax({
				type:"get",
				url:"/chat/selcrno",
				data:{doctorid:doctorid},
				success:function(data1){
					console.log(data1);
					$.ajax({
						type: "post",
						url: "/chat/send",
						data: {message:"������ �ʿ��ؿ�!", id:id, receiver:doctorid, dno:dno, crno:data1, send:1},
						success:function(){
							console.log("������ ����");
							window.open("/chat/room?crno=" + data1,"chat", "width=450, height=700, top=200, left=900");
						}
					}) 
				}
			})
			
		}
	})
	
});

	//��ü��ȭ��ȣ 
	var userTel=$("#userTel").val();
	//��ȭ��ȣ substring
	var tel1=userTel.substring(0,3);
	var tel2=userTel.substring(3,7);
	var tel3=userTel.substring(7,11);
	//substring �� ��ȭ��ȣ ���
	$("#userTel1").val(tel1);
	$("#userTel2").val(tel2);
	$("#userTel3").val(tel3);
	//üũ�ڽ��� ������ ���
	$("#userCheck").on("change", function(){
		if($(this).is(":checked")){
			var name="${uvo.name}"
			$("#userName").val(name);
			$("#userTel1").val(tel1);
			$("#userTel2").val(tel2);
			$("#userTel3").val(tel3);
		}else{
			$("#userName").val("");
			$("#userTel1").val("");
			$("#userTel2").val("");
			$("#userTel3").val("");
		}
	});
	

//����˾� ����
$(document).ready(function( $ ){     
$("#openPopup").on("click", function(event) {  //�˾����� ��ư ������
$("#popup01").show();   //�˾� ����
$("body").append('<div class="backon"></div>'); //�޹�� ����
});

$("body").on("click", function(event) { 
    if(event.target.className == 'close' || event.target.className == 'backon'){
        $("#popup01").hide(); //close��ư �̰ų� �޹�� Ŭ���� �˾� ����
        $(".backon").hide();
    }
  });
var checkin="${checkin}";
	var checkout="${checkout}";
	
	$("#checkinDate").val(checkin);
	$("#checkoutDate").val(checkout);
});

var address="${vo.daddress1}";
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