<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
	#tbl{
		overflow: hidden;
		width: 1400px;
		margin: 0px auto;
		text-align:center;
	}
	.name{
		width: 80px;
	}
</style>
<div id="page">
	<div id="menu">
		<jsp:include page="${submenu}"/>
	</div>
	<table id="tbl"></table>
	<script id="temp" type="text/x-handlebars-template">
		<tr class="title">
			<td width=200>주문번호</td>
			<td width=100>구매자</td>
			<td width=130>가격</td>
			<td width=200>구매일</td>
			<td width=150>수령자</td>
			<td width=800>주소</td>
			<td width=200>전화번호</td>
			<td width=500>배송시 요청사항</td>
			<td width=200>배송현황</td>
		</tr>
	{{#each list}}
		<tr class="row">
			<td class="uono">{{uono}}</td>
			<td class="uid">{{uid}}</td>
			<td>{{display sum}}원({{display point}})</td>
			<td>{{paydate}}</td>
			<td>{{receiver}}</td>
			<td>({{zipcode}}) {{address1}} {{address2}}</td>
			<td>{{tel}}</td>
			<td>{{omessage}}</td>
			<td>
				<select name="state" class="state" state="{{state}}">
					<option value=0>배송준비중</option>
					<option value=1>배송중</option>
					<option value=2>배송완료</option>
				</select>

			</td>

		</tr>
	{{/each}}
	</script>
	<div class="pagination"></div>
</div>
<script>
		Handlebars.registerHelper("display", function(pprice){
			return pprice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
		});
</script>
<script>
	var page=1;
	getList();
	
	$("#tbl").on("click", ".row .pname", function(){
		var row=$(this).parent();
		var pno=row.find(".pno").html();
		location.href="/product/read?pno=" + pno;
	});
	
	$("#tbl").on("click",".row .btnUpdate", function(e){
		var row=$(this).parent().parent();
		var code=row.find(".pno").html();
		var qnt=row.find(".qnt").val();

		if(qnt<0 || qnt.replace(/[0-9]/g,'')){
			alert("변경 수량은 숫자로 입력하세요!");
			row.find(".qnt").focus();
			return;
		}
		
		if(!confirm(code + "번 상품의 수량을 " + qnt + "개로 수정하실래요?")) return;
		$.ajax({
			type: "post",
			url: "/product/qntUpdate",
			data: {code:code, qnt:qnt},
			success: function(){
				alert("수량변경 완료!");
				getList();
			}
		});
	});
	
	function getList(){
		$.ajax({
			type: "get",
			url:"/product/order_list.json",
			data:{page:page},
			dataType:"json",
			success: function(data){
				var template = Handlebars.compile($("#temp").html());
				$("#tbl").html(template(data));
				$(".pagination").html(getPagination(data));
				
// 				배송현황 출력
				$(".state").each(function(){
					var state = $(this).attr("state");
					$(this).val(state).prop("selected", true);
				});
			}
		});
		
	}
	$(".pagination").on("click","a", function(e){
		e.preventDefault();
		page=$(this).attr("href");
		getList();
	});
	
	//배송현황 변경시 DB 업데이트
	$("#tbl").on("change", ".state", function() {
		var change_state = $(this).val();
		var uono = $(this).parent().parent().find(".uono").html();
// 		alert(change_state);
		$.ajax({
			type: "post",
			url: "/product/order_state_update",	
			data: {uono:uono, state:change_state},
			success: function(){
				alert("변경완료!");
			}
		});
	});
</script>