<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link href="/resources/css/request.css" rel="stylesheet" > 
<div id="page">
	<div id="request">
		<input style="display:none" value="${hospital}" id="dno"></input>
		<p class="title"><b>${vo.nick}</b>님이 보내주신 견적서</p>
		<input type="hidden" value="${vo.id}" id="id">
	
		<table id="petinfo">
			<tr>
				<td width=100 class="title">이름</td>
				<td>${vo.pname}</td>
			</tr>
			<tr>
				<td class="title">성별</td>
				<td>${vo.pgender}</td>
			</tr>
			<tr>
				<td class="title">나이</td>
				<td>${vo.page}</td>
			</tr>
			<tr>
				<td class="title">몸무게</td>
				<td>${vo.pweight}</td>
			</tr>
			<tr>
				<td class="title">품종</td>
				<td>${vo.pbreed}</td>
			</tr>
			<tr>
				<td class="title">중성화여부</td>
				<td>${vo.pspaying}</td>
			</tr>
		</table>
		
		<div class="diseSelect">
			<p class="title">증상</p>
			<input type="checkbox" name="disease" onClick="return false;" <c:if test="${vo.d1}">checked</c:if>>
			<label for="d_1"><span>증상1</span></label>
			<input type="checkbox" name="disease" onClick="return false;" <c:if test="${vo.d2}">checked</c:if>>
			<label for="d_2"><span>증상2</span></label>
			<input type="checkbox" name="disease" onClick="return false;" <c:if test="${vo.d3}">checked</c:if>>
			<label for="d_3"><span>증상3</span></label>
			<input type="checkbox" name="disease" onClick="return false;" <c:if test="${vo.d4}">checked</c:if>>
			<label for="d_4"><span>증상4</span></label>
			<input type="checkbox" name="disease" onClick="return false;" <c:if test="${vo.d5}">checked</c:if>>
			<label for="d_5"><span>증상5</span></label>
		</div>
		<p class="title d_etc">상세 증상</p>
		<p id="d_etc">${vo.d_etc}</p>
	</div>
	<hr>
	<form name="frm" action="/doctor/replyRequest" method="post" enctype="multipart/form-data">
		<p class="title">진단명</p>
		<input type="text" name="pno" value="${vo.pno}">
		<input type="text" name="dno" value="${hospital}">
		<input type="text" name="drdisease">
		<p class="title">설명</p>
		<textarea name="drcontent" rows="5" cols="80"></textarea><br>
		<input type="file" name="file" style="display:none"><br>
		<button type="button" id="btninputfile">첨 부 하 기</button><br>
		<span class="title" style="float:right">예상청구금액 
		<input type="number" name="drprice"></span>
	
		<div id="buttons">
			<span id="alert"></span><br>
			<input type="button" id="pass" value="보류">
			<input type="submit" value="견적서 보내기">
		</div>
	</form>
	
</div>
<script>
	var rno = "${vo.rno}";
	$("#btninputfile").on("click", function(){
		$(frm.file).click();
	})
	$("#pass").on("click", function(){
		/* $.ajax({
			type: "post",
			url: "/doctor/ischecked",
			data: {rno:rno},
			success:function(){
				swal("보류되었습니다.");
				location.href="/request/list";
			}
		}) */
	})

	$(frm).on("submit", function(e){
		e.preventDefault();
		var drdisease = $(frm.drdisease).val();
		var drcontent = $(frm.drcontent).val();
		var drprice = $(frm.drprice).val();

		if(drdisease==""){
			swal("진단명을 입력하세요");
			$(frm.drdisease).focus();
			return;
		}else if(drcontent==""){
			swal("설명을 입력하세요");
			$(frm.drcontent).focus();
			return;
		}else if(drprice=="" || isNaN(drprice)){
			swal("예상청구금액을 입력하세요");
			$(frm.drprice).focus();
			return;
		}else{
// 			$.ajax({
// 				type: "post",
// 				url: "/doctor/ischecked",
// 				data: {rno:rno},
// 				success:function(){
					
// 				}
// 			})
			frm.submit();
		}
	})
</script>