<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link href="/resources/css/serequest.css" rel="stylesheet">
<link rel="short icon" href="#">
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script src="/resources/pagination.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript" src="/resources/chart.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<body>
	<p class="title">��û���� ������ ���� ������ �����ϼ���</p>
	<div id="regi">
		<input type="radio" class="radio1" name="service" id="modal_btn1"> <label for="modal_btn1">�̿�</label> &nbsp;
		<input type="radio" class="radio1"name="service" id="modal_btn2">	<label for="modal_btn2">ȨŬ����</label> &nbsp;
		<input type="radio" class="radio1" name="service" id="modal_btn3">	<label for="modal_btn3">����</label> &nbsp;
	</div>
	
	<div class="black_bg" ></div> <!-- â ������� ��� -->
	<form name="frm1" action="binsert" method="post" enctype="multipart/form-data">
		<input type="text" name="uid" value="${id}" style="display:none;">
		<input type="text" name="nick" value="${nick}" style="display:none;">
		<div class="modal_wrap" id="modal_wrap1"> <!-- â ��ü -->
			<div class="modal_close" id="modal_close1"><a href="javascript:void(0);">close</a></div>
    		<div class="page1" id="page1" style="display : block">
    			<p class="title">[1/9] � �ݷ������ΰ���?</p>
    		    <input type="radio" class="rad" name="pcate" value="������" id="pcatedog">
    		    <label for="pcatedog">������</label><br/><br/>
    		    <input type="radio" class="rad" name="pcate" value="�����" id="pcatecat">
				<label for="pcatecat">�����</label><br/>
   		 	</div>
   		 	<div class="page1">
   		 		<p class="title"> [2/9] � ���񽺸� ���Ͻó���?</p>
    		    <input type="radio" class="rad" name="beauty_classification" value="���" id="beauty_classfication1">
    		    <label for="beauty_classfication1">���</label><br/><br/>
    		    <input type="radio" class="rad" name="beauty_classification" value="��ü�̿�" id="beauty_classfication2">
    		    <label for="beauty_classfication2">��ü�̿�</label><br/><br/>
    		    <input type="radio" class="rad" name="beauty_classification" value="�κй̿�" id="beauty_classfication3">
    		    <label for="beauty_classfication3">�κй̿�</label><br/><br/>
    		    <input type="radio" class="rad" name="beauty_classification" value="�����̿�" id="beauty_classfication4">
    		    <label for="beauty_classfication4">�����̿�</label><br/><br/>
   		 	</div>
   		 	<div class="page1">
   		 		<p class="title">[3/9] �ݷ����� ü���� �������ּ���</p>
    		    <input type="radio" class="rad" name="weight" value="4kg�̸�" id="weight1">
				<label for="weight1">4kg�̸�</label><br/><br/>
    		    <input type="radio" class="rad" name="weight" value="4~7kg" id="weight2"> 
				<label for="weight2">4~7kg</label><br/><br/>
    		    <input type="radio" class="rad" name="weight" value="7~10kg" id="weight3">
				<label for="weight3">7~10kg</label><br/><br/>
    		    <input type="radio" class="rad" name="weight" value="10~14kg" id="weight4">
				<label for="weight4">10~14kg</label><br/><br/>
   		 	</div>
   		 	<div class="page1">
   		 		<p class="title">[4/9] �ݷ����� ���̸� �������ּ���</p>
    		    <input type="radio" class="rad" name="age" value="1��̸�" id="age1">
				<label for="age1">1��̸�</label><br/><br/>
    		    <input type="radio" class="rad" name="age" value="1~9��" id="age2">
				<label for="age2">1~9��</label><br/><br/>
    		    <input type="radio" class="rad" name="age" value="10���̻�" id="age3">
				<label for="age3">10���̻�</label><br/><br/>
   		 	</div>
   		 	<div class="page1">
   		 		<p class="title"> [5/9] ������ �̿�ñ�� �������ּ���</p>
    		    <input type="radio" class="rad" name="last_beautydate" value="ù�̿�" id="last_beautydate1">
				<label for="last_beautydate1">ù�̿�</label><br/><br/>
    		    <input type="radio" class="rad" name="last_beautydate" value="1�� ����" id="last_beautydate2">
				<label for="last_beautydate2">1�� ����</label><br/><br/>
    		    <input type="radio" class="rad" name="last_beautydate" value="2�� ����" id="last_beautydate3">
				<label for="last_beautydate3">2�� ����</label><br/><br/>
    		    <input type="radio" class="rad" name="last_beautydate" value="3�� ����" id="last_beautydate4">
				<label for="last_beautydate4">3�� ����</label><br/><br/>
    		    <input type="radio" class="rad" name="last_beautydate" value="unknown" id="last_beautydate5">
				<label for="last_beautydate5">�� �𸣰ڴ�</label><br/><br/>
   		 	</div>
   		 	<div class="page1">
   		 		<p class="title"> [6/9] ��� �����ϱ⸦ ���Ͻó���?</p>
    		    <input type="radio" class="rad" name="service_place" value="��(���� ����)" id="service_place1">
				<label for="service_place1">��(���� ����)</label><br/><br/>
    		    <input type="radio" class="rad" name="service_place" value="���� �̿��" id="service_place2">
				<label for="service_place2">���� �̿��</label><br/><br/>
    		    <input type="radio" class="rad" name="service_place" value="����" id="service_place3"> 
				<label for="service_place3">����</label><br/><br/>
			</div>
   		 	<div class="page1">
   		 		<p class="title"> [7/9] ����������� �������ּ���</p>
    		    <input type="radio" class="rad" name="wish_date" value="����" id="wish_date1"> 
				<label for="wish_date1">���� ����</label><br/><br/>
    		    <input type="radio" class="rad" name="wish_date" value="������ ���� ����" id="wish_date2">
				<label for="wish_date2">������ ���� ����</label><br/><br/>
    		    <input type="radio" class="rad" name="wish_date" value="���� �̳�" id="wish_date3"> 
				<label for="wish_date3">������ �̳�</label><br/><br/>
    		    <input type="radio" class="rad" name="wish_date" value="��� ����"  id="wish_date4">
				<label for="wish_date4">��� ����</label><br/><br/>
   		 	</div>
   		 	<div class="page1">
   		 		<p class="title"> [8/9] ���� ��� ������ �����ּ���</p>
   		         <table class="city">
    		     	<tr>
    		     		<td>��/��</td>
    		     		<td class="sido"><input type="text" style="margin-left:2px; margin-bottom:10px;" placeholder="ex. ��⵵" name="wish_local1"></td>
    		     	</tr>
    		     	<tr>
    		     		<td>��/��/��</td>
    		     		<td class="gungu"><input type="text" placeholder="ex. ��õ��" name="wish_local2"></td>
    		     	</tr>
    		     </table>
   		 	</div>
   		 	<div class="page1">
   		 		<p class="title"> [9/9] ���� ���� ���� �� ���λ����� �����ּ���</p>
    		    <div class="texta"><textarea style="width" rows="6" cols="50" name="detailed_matters" placeholder="�ݷ������� ǰ��, ����, ���� ���� �˷��ֽø� ���ƿ�!"></textarea></div>
   		 	</div>
   			<button type="button" class="buttonc" id="prev1" disabled>����</button> &nbsp;
   			<input type="button" class="buttonc" id="next1" value="����">
	   		<input type="submit" class="buttonb" value="��û������">
   		</div>
   	</form>
   	
   	<form name="frm2"  action="cinsert" method="post" enctype="multipart/form-data">
   		<input type="text" name="uid" value="${id}" style="display:none;">
   		<input type="text" name="nick" value="${nick}" style="display:none;">
 		<div class="modal_wrap" id="modal_wrap2"> <!-- â ��ü -->
			<div class="modal_close" id="modal_close2"><a href="javascript:void(0);">close</a></div>
	   		 	<div class="page2" id="page2" style="display : block;">
	    		    <p class="title">[1/5] �ǹ������� �������ּ���</p>
	    		    <input type="radio" class="rad" name="building_classification" value="����Ʈ"> ����Ʈ <br/><br/>
	    		    <input type="radio" class="rad" name="building_classification" value="����"> ���� <br/><br/>
	    		    <input type="radio" class="rad" name="building_classification" value="����"> ���� <br/><br/>
	    		    <input type="radio" class="rad" name="building_classification" value="���ǽ���"> ���ǽ��� <br/><br/>
	   		 	</div>
	   		 	<div class="page2">
	    		     <p class="title">[2/5] �� ������ �������ּ���</p>
	    		      <input type="radio" class="rad" name="house_size" value="10�� �̸�"> 10�� �̸� <br/><br/>
	    		    <input type="radio" class="rad" name="house_size" value="10���"> 10���<br/><br/>
	    		    <input type="radio" class="rad" name="house_size" value="20���"> 20���<br/><br/>
	    		    <input type="radio" class="rad" name="house_size" value="30���"> 30���<br/><br/>
	    		    <input type="radio" class="rad" name="house_size" value=> ��Ÿ   <input type="text" id="house_size_text" disabled>
	    		    
	   		 	</div>
	   		 	<div class="page2">
	    		     <p class="title">[3/5] Ŭ���� ���ϴ� ���� �������ּ���</p>
	    		      <input type="radio" class="rad" name="wish_date" value="����"> ���� ���� <br/><br/>
	    		    <input type="radio" class="rad" name="wish_date" value="������ ����"> ������ ���� <br/><br/>
	    		    <input type="radio" class="rad" name="wish_date" value="���� �̳�"> ���� �̳�<br/><br/>
	    		    <input type="radio" class="rad" name="wish_date" id="wish_date" value=> ���ϴ� �� ���� <input type="date" id="wish_date_date" style="display: none;">
	    		    
	   		 	</div>
	   		 	<div class="page2">
	    		     <p class="title"> [4/5] ���ϴ� ������ �������ּ���</p>
	    		     <table class="city">
	    		     	<tr>
	    		     		<td>��/��</td>
	    		     		<td class="sido"><input type="text" style="margin-left:2px; margin-bottom:10px;" placeholder="ex. ��⵵" name="wish_local1"></td>
	    		     	</tr>
	    		     	<tr>
	    		     		<td>��/��/��</td>
	    		     		<td class="gungu"><input type="text" placeholder="ex. ��õ��" name="wish_local2"></td>
	    		     	</tr>
	    		     </table>
	   		 	</div>
	   		 	<div class="page2">
	    		     <p class="title"> [5/5] Ŭ���� ���� ��������� �����ּ���</p>
	    		     <div class="texta"><textarea style="width" rows="6" cols="50" name="hope_matters" placeholder="ex. ���� ���� �� ��ռҵ� ���ؿ�"></textarea></div>
	   		 	</div>
   		 	 <button type="button" class="buttonc" id="prev2" disabled>����</button> &nbsp; <input type="button" class="buttonc" id="next2" value="����">
	   		 <input type="submit" class="buttonb" value="��û������">
   		</div> 
  	</form>
  	
  	<form name="frm3"  action="linsert" method="post" enctype="multipart/form-data">
  		<input type="text" name="uid" value="${id}" style="display:none;">
  		<input type="text" name="nick" value="${nick}" style="display:none;">
   		<div class="modal_wrap" id="modal_wrap3"> <!-- â ��ü -->
			<div class="modal_close" id="modal_close3"><a href="javascript:void(0);">close</a></div>
	   		 	<div class="page3" id="page3" style="display : block;">
	    		   <p class="title">[1/11] � ������ ���Ͻó���?</p>
	    		    <input type="radio" class="rad" name="lesson_classification" value="�� �Ʒ� ����"> �Ʒ� <br/><br/>
	    		    <input type="radio" class="rad" name="lesson_classification" value="�� �̿� ����"> �̿� <br/><br/>
	    		    <input type="radio" class="rad" name="lesson_classification" value="�� ��ǰ ���� ����"> ���ǰ ���� <br/><br/>
	    		    <input type="radio" class="rad" name="lesson_classification" value=> ��Ÿ <input type="text" id="lesson_text" disabled>
	   		 	</div>
	   		 	<div class="page3">
	    		    <p class="title">[2/11] ���� �޴� ������ �����ΰ���?</p>
	    		    <input type="radio" class="rad" name="lesson_goal" value="Ȩ�ɾ�"> Ȩ �ɾ� <br/><br/>
	    		    <input type="radio" class="rad" name="lesson_goal" value="�ڰ��� ���"> �ڰ��� ��� <br/><br/>
	    		    <input type="radio" class="rad" name="lesson_goal" value="��� �غ�"> ��� �غ� <br/><br/>
	    		    <input type="radio" class="rad" name="lesson_goal" value="â�� �غ�"> â�� �غ� <br/><br/>
	   		 	</div>
	   		 	<div class="page3">
	    		    <p class="title">[3/11] � ���� ���¸� ���Ͻó���?</p>
	    		    <input type="radio" class="rad" name="lesson_method" value="���� ����"> ���� ����<br/><br/>
	    		    <input type="radio" class="rad" name="lesson_method" value="�׷� ����"> �׷� ���� <br/><br/>
	    		    <input type="radio" class="rad" name="lesson_method" value="�¶��� ����"> �¶��� ���� <br/><br/>
	    		    <input type="radio" class="rad" name="lesson_method" value="�п�"> �п� <br/><br/>
	   		 	</div>
	   		 	<div class="page3">
	    		    <p class="title">[4/11] ���ɴ븦 �������ּ���</p>
	    		    <input type="radio" class="rad" name="age" value="10�� �̸�"> 10�� �̸�<br/><br/>
	    		    <input type="radio" class="rad" name="age" value="10��"> 10�� <br/><br/>
	    		    <input type="radio" class="rad" name="age" value="20��"> 20�� <br/><br/>
	    		    <input type="radio" class="rad" name="age" value="30��"> 30�� <br/><br/>
	    		    <input type="radio" class="rad" name="age" value="40��"> 40�� �̻� 
	   		 	</div>
	   		 	<div class="page3">
	    		    <p class="title">[5/11] ������ ��� �ǽó���?</p>
	    		    <input type="radio" class="rad" name="gender" value="����"> ���� <br/><br/>
	    		    <input type="radio" class="rad" name="gender" value="����"> ���� <br/><br/>
	   		 	</div>
	   		 	<div class="page3">
	    		    <p class="title">[6/11] ��ȣ�ϴ� ������ ������ �����Ű���?</p>
	    		    <input type="radio" class="rad" name="wish_gender" value="����"> ���� <br/><br/>
	    		    <input type="radio" class="rad" name="wish_gender" value="����"> ���� <br/><br/>
	    		    <input type="radio" class="rad" name="wish_gender" value="����"> ���� <br/><br/>
	   		 	</div>
	   		 	<div class="page3">
	    		    <p class="title">[7/11] ���� �ޱ� ���� ��¥�� �������ּ���</p>
	    		    <input type="checkbox" class="rad" name="wish_date" value="��" id="mon"><label for="mon"> �� </label> <br/>
	    		    <input type="checkbox" class="rad" name="wish_date" value="ȭ" id="tue"><label for="tue"> ȭ</label>  <br/>
	    		    <input type="checkbox" class="rad" name="wish_date" value="��" id="wen"> <label for="wen"> ��</label>  <br/>
	    		    <input type="checkbox" class="rad" name="wish_date" value="��" id="thu"> <label for="thu"> ��</label>  <br/>
	    		    <input type="checkbox" class="rad" name="wish_date" value="��" id="fri"> <label for="fri"> ��</label> <br/>
	    		    <input type="checkbox" class="rad" name="wish_date" value="��" id="sat"> <label for="sat"> ��</label> <br/>
	    		    <input type="checkbox" class="rad" name="wish_date" value="��� ��" id="lat"> <label for="lat">��� ��</label> 
	   		 	</div>
	   		 	<div class="page3">
	    		    <p class="title">[8/11] ����ϴ� ���� �ð��븦 �������ּ���</p>
	    		    <input type="radio" class="rad" name="wish_time" value="�̸� ����(9�� ����)"> �̸� ����(9�� ����) <br/>
	    		    <input type="radio" class="rad" name="wish_time" value="����(9~12��)"> ����(9~12��) <br/>
	    		    <input type="radio" class="rad" name="wish_time" value="����(12~3��)"> ����(12~3��) <br/>
	    		    <input type="radio" class="rad" name="wish_time" value="���� ����(3��~6��)"> ���� ����(3��~6��) <br/>
	    		    <input type="radio" class="rad" name="wish_time" value="����(6~9��)">  ����(6~9��) <br/>
	    		    <input type="radio" class="rad" name="wish_time" value="���� ����(9�� ����)"> ���� ����(9�� ����) <br/>
	   		 	</div>
	   		 	<div class="page3">
	    		    <p class="title">[9/11] ��� �����ϱ� ���Ͻó���?</p>
	    		    <input type="radio" class="rad" name="lesson_place" value="������ ��ҷ�"> ���� �ִ� ������ ���ּ��� <br/><br/>
	    		    <input type="radio" class="rad" name="lesson_place" value="������"> ������ <br/><br/>
	    		    <input type="radio" class="rad" name="lesson_place" value="����"> ���� <br/><br/>
	    		    <input type="radio" class="rad" name="lesson_place" value=> ��Ÿ <input type="text" id="place_text" disabled>
	   		 	</div>
	   		 	<div class="page3">
	    		    <p class="title">[10/11] ���ϴ� ������ �������ּ���</p>
	    		    <div class="city"><span class="sido">��/�� &nbsp; &nbsp; : </span><input type="text" style="margin-left:2px; margin-bottom:10px;" placeholder="ex)��⵵" name="wish_local1"> <br/>
	    		   <span class="gungu"> ��/��/�� : </span><input type="text" placeholder="ex)��õ��" name="wish_local2"></div>
	   		 	</div>
	   		 	<div class="page3">
	    		    <p class="title">[11/11] ���� ���� ���� ������ �����ּ���</p>
	    		    <div class="texta"><textarea style="width" rows="6" cols="50" name="detailed_matters" placeholder="ex. �� �̿� �ڰ����� ���� �;��"></textarea></div>
	   		 	</div>
   		 	 <button type="button" class="buttonc" id="prev3" disabled>����</button> &nbsp; <input type="button" class="buttonc" id="next3" value="����">
	   		 <input type="submit" class="buttonb" value="��û������">
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

//��Ÿ
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

//���ϴ� ��¥
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
	
	if(pcate == null){
		swal("1�� ������ �������ּ���");
		return;
	}else if(beauty_classification == null){
		swal("2�� ������ �������ּ���");
		return;
	}else if(weight == null){
		swal("3�� ������ �������ּ���");
		return;
	}else if(age == null){
		swal("4�� ������ �������ּ���");
		return;
	}else if(last_beautydate == null){
		swal("5�� ������ �������ּ���");
		return;
	}else if(service_place == null){
		swal("6�� ������ �������ּ���");
		return;
	}else if(wish_date == null){
		swal("7�� ������ �������ּ���");
		return;
	}else if(wish_local1 ==""){
		swal("8�� ������ �������ּ���");
		return;
	}else if(wish_local2 ==""){
		swal("8�� ������ �������ּ���");
		return;
	}
	if(!confirm("��û���� �ۼ��Ͻðڽ��ϱ�?")) return;
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
	
	
	if(building_classification== null){
		swal("1�� ������ �������ּ���");
		return;
	}else if(house_size == null && house_size_text == ""){
		swal("2�� ������ �������ּ���");
		return;
	}else if(wish_date == null &&  wish_date_date == ""){
		swal("3�� ������ �������ּ���");
		return;
	}else if(wish_local1 == ""){
		swal("4�� ������ �������ּ���");
		return;
	}else if(wish_local2 ==""){
		swal("4�� ������ �������ּ���");
		return;
	}else{
		if(!confirm("��û���� �ۼ��Ͻðڽ��ϱ�?")) return;
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
	
	if(lesson_classification == null && lesson_classification_etc == ""){
		swal("1�� ������ �������ּ���");
		return;
	}else if(lesson_goal == null){
		swal("2�� ������ �������ּ���");
		return;
	}else if(lesson_method == null){
		swal("3�� ������ �������ּ���");
		return;
	}else if(age == null){
		swal("4�� ������ �������ּ���");
		return;
	}else if(gender == null){
		swal("5�� ������ �������ּ���");
		return;
	}else if(wish_gender == null){
		swal("6�� ������ �������ּ���");
		return;
	}else if(wish_date == null){
		swal("7�� ������ �������ּ���");
		return;
	}else if(wish_time == null){
		swal("8�� ������ �������ּ���");
		return;
	}else if(lesson_place == null && lesson_place_etc == ""){
		swal("9�� ������ �������ּ���");
		return;
	}else if(wish_local1 == "" || wish_local2 == ""){
		swal("10�� ������ �������ּ���");
		return;
	}else{
		if(!confirm("��û���� �ۼ��Ͻðڽ��ϱ�?")) return;
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