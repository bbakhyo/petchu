<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="/resources/css/request.css" rel="stylesheet">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div id="listbody">
<p class="title"><b>최근</b>에 도착한 견적서</p>
<c:forEach items="${list}" var="vo">
	<div class="menu_box" drno="${vo.drno}">
		<p id="dname">${vo.dname}</p>
		<p>${vo.pname}</p>
		<p>${vo.drdisease}</p>
		<p id="drprice">${vo.drprice}원</p>
	</div>
</c:forEach>
</div>
<script>

	$(".menu_box").on("click", function(){
		var drno = $(this).attr("drno");
		location.href = "/request/resultread?drno=" + drno;
	})
</script>
