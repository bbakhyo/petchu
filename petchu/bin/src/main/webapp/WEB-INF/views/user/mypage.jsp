<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<link href="/resources/css/mypage.css" rel="stylesheet" > 
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<div id="page">
	<h1>마이페이지</h1>
	<div id="sidemenu">
		<jsp:include page="${sideMenu}" />
	</div>
	<form id="frm" action="update" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<td width=100>아이디</td>
				<td width=500>
					<input type="text" name="id" value="${vo.id }">
					
				</td>
			</tr>
			<tr>
				<td width=100>이름</td>
				<td width=500><input type="text" name="name" value="${vo.name }"></td>
			</tr>
			<tr>
				<td width=100>닉네임</td>
				<td width=500><input type="text" name="nick" value="${vo.nick }"></td>
			</tr>
			<tr>
				<td width=100>전화번호</td>
				<td width=500>
					<input type="hidden" name="tel"  value="${vo.tel }">
					<input type="number" id="tel1" name="tel1" placeholder="010" style="width: 60px;"> -
					<input type="number" id="tel2" placeholder="1234"  style="width: 60px;"> -
					<input type="number" id="tel3" placeholder="1234"  style="width: 60px;">
		
				</td>
			</tr>
			<tr>
				<td width=100>생년월일</td>
				<td width=500><input type="date" name="birthday" value="${vo.date}" style="width: 120px"></td>
			</tr>
			<tr>
				<td width=100>성별</td>
				<td width=500>
						<input type="radio" name="gender" value="남" id="male" <c:out value="${vo.gender=='남' ? 'checked' : ''}"/>>
						<label for="male">남자</label>
						<input type="radio" name="gender" value="여" id="female" <c:out value="${vo.gender=='여' ? 'checked' : ''}"/>>
						<label for="female">여자</label>
				</td>
			</tr>
			<tr>
				<td width=100>이메일</td>
				<td width=300><input type="text" name="email" value="${vo.email }"></td>
			</tr>
			<tr>
				<td width=100>주소</td>
				<td width=500>
					<input type="text" name="zipcode" size="5" value="${vo.zipcode}">
					<button type="button" id="search" class="smallbtn">주소검색</button><br>
					<input type="text" name="address1" size="50" value="${vo.address1}">
					<input type="text" name="address2" size="50" value="${vo.address2}">
				</td>
			</tr>
			<tr>
				<td width=100>이미지</td>
				<td>
					<img src="/display?fileName=${vo.image}" width=150 id="image" width=150>
					<input type="file" name="file" style="display: none;">
					<input type="hidden" name="image" value="${vo.image}">
				</td>
			</tr>
		</table>
		<div style="text-align: right; margin-top: 20px;">
			<button type="submit">정보수정</button>
			<button type="reset">수정취소</button>
		</div>
	</form>
</div>	
<script>
	//전화번호 잘라서 3개 텍스트박스에 출력
	 $(function() {
		var strTel= $(frm.tel).val();
		var tel1=strTel.substring(0,3);
		var tel2=strTel.substring(3,7);
		var tel3=strTel.substring(7,11);

		$("#tel1").val(tel1);
		$("#tel2").val(tel2);
		$("#tel3").val(tel3);
		
	});
	//서치버튼을 클릭한 경우
	$("#search").on("click",function(){
		new daum.Postcode({
			oncomplete: function(data){
				console.log(data);
				$(frm.address1).val(data.address);
				$(frm.zipcode).val(data.zonecode);
				$(frm.address2).focus();
			}
		}).open();
	});
	//섭밋될때
	$(frm).on("submit", function(e){
		e.preventDefault();
		if(!confirm("회원정보를 수정하실래요?")) return;
		
		//3개의 전화번호 텍스트박스를 병합하여 섭밋
		var strTel1= $(frm.tel1).val();
		var strTel2= $(frm.tel2).val();
		var strTel3= $(frm.tel3).val();
		
		var strTel=strTel1+strTel2+strTel3;
		
		$(frm.tel).val(strTel);
		frm.submit();
	});
	//이미지 미리보기
	$(frm.file).on("change", function(e){
		var file=$(frm.file)[0].files[0];
		$("#image").attr("src", URL.createObjectURL(file));
	});
	//이미지 클릭시 파일열기
	$("#image").on("click", function(){
		$(frm.file).click();
	});
</script>