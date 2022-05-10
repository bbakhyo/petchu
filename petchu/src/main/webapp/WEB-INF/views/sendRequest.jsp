<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="/resources/css/request.css" rel="stylesheet" >
<div id="page">
	<p class="title">${vo.nick}님 견적서를 작성하세요</p>
	<input type="hidden" value="${vo.id}" id="id">

	<div id="selectPet"></div>
	<script id="temp" type="text/x-handlebars-template">
		{{#each .}}
			<div class="row">
				<span class="pno">{{pno}}</span>
				<button class="btnpno">{{pname}}</button>
			</div>
		{{/each}}
	</script>
	<p id="nopet"></p>
	
	<div id="petlist">
		<p id="pname"></p>
	</div>
	
	<p class="title">반려견 반려묘가 보이는 증상을 체크해주세요</p>
	<div class="diseSelect">
		<input type="checkbox" name="disease" value="증상1" id="d_1">
		<label for="d_1"><span>증상1</span></label>
		<input type="checkbox" name="disease" value="증상2" id="d_2">
		<label for="d_2"><span>증상2</span></label>
		<input type="checkbox" name="disease" value="증상3" id="d_3">
		<label for="d_3"><span>증상3</span></label>
		<input type="checkbox" name="disease" value="증상4" id="d_4">
		<label for="d_4"><span>증상4</span></label>
		<input type="checkbox" name="disease" value="증상5" id="d_5">
		<label for="d_5"><span>증상5</span></label>
	</div>
	<p class="title">반려견 반려묘가 보이는 증상을 자세히 설명해주세요</p>
	<textarea rows="5" cols="80" id="d_etc_insert" name="d_etc" placeholder="증상에 대해 설명해주세요"></textarea>
	<p class="title">증상을 촬영한 사진을 첨부해주세요</p>
	<div id="inputfile">
		<button id="btninputfile">첨 부 하 기</button>
			<span>100MB 이하의 gif, jpg 파일만 가능합니다.</span>
		<input type="hidden" id="dvedio"><br>
		<input type="hidden" id="dimg1"><br>
		<input type="hidden" id="dimg2"><br>
		<input type="hidden" id="dimg3"><br>
	</div>
	
	<div id="buttons">
		<span id="alert"></span><br>
		<button id="reset">작성 취소</button>
		<button id="sendrequest">견적서 요청</button>
		
	</div>
	
</div>
<script>
	var id = $("#id").val();
	var pno=0;
	
	//반려동물 선택
	$("#selectPet").on("click", ".row .btnpno", function(){
		var row = $(this).parent();
		 pno = row.find(".pno").html();

		$.ajax({
			type: "get",
			dataType: "json",
			data : {pno:pno},
			url: "/pet/readpet",
			success:function(data){
				$("#pname").html(data.pname);
			}
		})
	})
	
	//반려동물 리스트 출력
	$.ajax({
		type: "get",
		dataType: "json",
		data : {id:id},
		url: "/pet/petlist",
		success:function(data){
			var template = Handlebars.compile($("#temp").html());
			$("#selectPet").html(template(data));
			if(data==""){
				$("#nopet").html("반려동물을 등록하세요");
			}
		}
	})

	//리퀘스트 보내기
	$("#sendrequest").on("click", function(){
		var row = $(this);
		var dvedio = $("#dvedio").val();
		var dimg1 = $("#dimg1").val();
		var dimg2 = $("#dimg2").val();
		var dimg3 = $("#dimg3").val();
		
		var d_1 = 0;
		var d_2 = 0;
		var d_3 = 0;
		var d_4 = 0;
		var d_5 = 0;
		
		if($("#d_1").is(":checked")){
			d_1 = 1;
		}
		if($("#d_2").is(":checked")){
			d_2 = 1;
		}
		if($("#d_3").is(":checked")){
			d_3 = 1;
		}
		if($("#d_4").is(":checked")){
			d_4 = 1;
		}
		if($("#d_5").is(":checked")){
			d_5 = 1;
		}
		
		alert(dvedio + " : " + dimg1);
		
		/*var darray = new Array();
		
	   var obj_length = document.getElementsByName("disease").length;
	   
        for (var i=0; i<obj_length; i++) {
            if (document.getElementsByName("disease")[i].checked == true) {
                darray.push(document.getElementsByName("disease")[i].value);
            }
        }*/
        if(pno==0){
        	$("#alert").html("반려동물을 선택하세요");
			return;
        }
		var d_etc = $("#d_etc_insert").val();
        if(d_etc==""){
			$("#alert").html("증상에 대한 설명을 작성해주세요");
			return;
		}
		
		if(!confirm("견적서를 보내시겠습니까?")) return;
		$.ajax({
			type: "post",
			url: "/request/send",
			data: {pno:pno,d1:d_1, d2:d_2, d3:d_3, d4:d_4, d5:d_5, d_etc:d_etc, dvedio:dvedio, dimg1:dimg1, dimg2:dimg2, dimg3:dimg3},
			success: function(){
				alert("견적서를 성공적으로 보냈습니다.");
			}
		})
	})
</script>