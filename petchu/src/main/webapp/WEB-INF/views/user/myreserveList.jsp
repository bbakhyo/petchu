<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="/resources/css/myReserve.css" rel="stylesheet"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />

<style>
	.sa-button-container{
	text-align: center;
}
	#popup01{
	    display: none;
	}
	#popup01{
	width: 658px;
	height: 782px;
	position: absolute;
	top: 30%;
	left: 50%;
	margin: -250px 0 0 -250px;
	background-color: #fff;
	z-index: 2;
	padding: 20px 100px;

	border-radius: 30px;
	    }
	.backon{
	    content: "";
	    width: 100%;
	    height: 100%;
	    background: #00000054;
	    position: fixed;
	    top: 0;
	    left: 0;
	    z-index: 1;
	}
	.close{
	  position:relative;
	  top: 40px;
	  right: -195px;
	  cursor:pointer;
	}
	
	.openPopup{
		border: none;
	    padding: 8px 12px 8px 12px;
	    background-color: A7CA37;
	    border-radius: 10px;
	    font-size: 15px;
	    font-weight: 900px;
	    color: white;
	    cursor: pointer;

	}
	.reserveCancel, .reserveCancel2{
		border: none;
	    padding: 8px 12px 8px 12px;
	    background-color: A7CA37;
	    border-radius: 10px;
	    font-size: 15px;
	    font-weight: 900px;
	    color: white;
	    cursor: pointer;

	}
	.list{
		overflow: auto;
		margin: 20px;
		padding: 20px;
		text-align: center;
		font-size: 12px;
		height: 100px;
		cursor: pointer;
	}
	.hiddenbtn{
		display: none;
	}
	#oldreserve{
		margin-left: 150px;
		display: none;
	}
	#btnOldList{
		text-align: center;
		cursor: pointer;
	}
	.oldlist{
		overflow: auto;
		margin: 20px;
		padding: 20px;
		text-align: center;
		font-size: 12px;
		height: 100px;
		cursor: pointer;
	}
   #serviceInfo, #date{
   		border-bottom: 1px solid gray;
   		width: 400px;
   }
   #date{
   	padding: 30px 0px;
   }
   #btnReserve{
   		margin-left: 170px;
   		text-align: center;
   }
   .EditMessage{
   		display: none;
   		color:red;
   }
   .hiddenbtn2{
   		display: none;
   		color:red;
   }
   #sidemenu{
   		margin-left: -100px;
   }
   .list{
   	box-shadow:2px 2px 5px rgba(212,212,212);
   }
   .oldlist{
   	box-shadow:2px 2px 5px rgba(212,212,212);
   }
   .msg{
   	text-align: right;
    margin-right: 30px;
    color: red;
   }
</style>
<div id="page">
	<div id="reserveList">
		<h1>?????? ???????????????</h1>
		<div id="sidemenu">
			<jsp:include page="${sideMenu}" />
		</div>
		<div id="myreserve">
			<table id="tbl"></table>
			<script id="temp" type="text/x-handlebars-template">
				{{#each list}}

					<tbody class="list" isEdit="{{isEdit}}"  isDel="{{isDel}}">
						<tr>
							<td>?????????</td>
							<td><span class="scname">{{scname}}</span></td>
							<td>?????????</td>
							<td><span class="reserveDate">{{reserveDate}}</span></td>
						</tr>
						<tr>	
							<td>????????? ??????</td>
							<td class="userName">{{userName}}</td>
							<td>????????? ?????????</td>
							<td class="userTel">{{userTel}}</td>
						</tr>
					
						<tr>
							<td width=100>????????????</td>
							<td width=200>
								<span class="checkin">{{checkin}}</span>
								&nbsp; ~ &nbsp;
								<span class="checkout">{{checkout}}</span>
							</td>
							<td width=100>?????? ?????????</td>
							<td width=150 class="sctel">{{sctel}}</td>
						</tr>
						<tr>
							<td class="EditMessage" colspan=4 style="border-left: hidden; border-right:hidden; text-align: right;">
								<p class="msg">?????? ?????? ??????????????????</p>
							</td>
							<td colspan=4 class="hiddenbtn" style="border-left: hidden; border-right:hidden; text-align: right;">
								<button class="openPopup" rno={{rno}}>????????????</button> &nbsp;
								<button class="reserveCancel" rno={{rno}}>????????????</button>
							</td>
							<td colspan=3 class="hiddenbtn2" style="border-left: hidden; border-right:hidden; text-align: right;">
								<span class="msg" style="margin-right: -43px;">??????????????? ?????????????????????. ??????????????? ???????????? ???????????? ???????????????.</span>
							</td>
							<td colspan=2 class="hiddenbtn2" style="border-left: hidden; border-right:hidden; text-align: right;">
								<button class="reserveCancel2" rno={{rno}} style="margin-right:30px;">??????</button>
							</td>
						</tr>
						<tr>
							<td colspan=4 style="border-left: hidden; border-right:hidden; text-align: right;"></td>
						</tr>
					</tbody>
				{{/each}}	
		</script>
		</div>
	</div>
	<hr>
	<div id="oldReserveList">
		<p id="btnOldList">?????? ?????? ??????????????? ??????</p>

		<div id="oldreserve">
			<table id="tbl2"></table>
			<script id="temp2" type="text/x-handlebars-template">
				{{#each oldlist}}

					<tbody class="oldlist" rno={{rno}}>
						<tr>
							<td>?????????</td>
							<td><span class="scname">{{scname}}</span></td>
							<td>?????????</td>
							<td><span class="reserveDate">{{reserveDate}}</span></td>
						</tr>
						<tr>	
							<td>????????? ??????</td>
							<td class="userName">{{userName}}</td>
							<td>????????? ?????????</td>
							<td class="userTel">{{userTel}}</td>
						</tr>
						<tr>
							<td width=100>????????????</td>
							<td width=200>
								<span class="checkin">{{checkin}}</span>
								&nbsp; ~ &nbsp;
								<span class="checkout">{{checkout}}</span>
							</td>
							<td width=100>?????? ?????????</td>
							<td width=150 class="sctel">{{sctel}}</td>
						</tr>
						<tr>
							<td colspan=4 style="border-left: hidden; border-right:hidden; text-align: right;"><span class="cancelMessage" isDel={{isDel}}></span></td>
						</tr>
						
					</tbody>
				{{/each}}	
		</script>
		</div>
	</div>
	<div id="popup01"></div>
		<script id="temp3" type="text/x-handlebars-template">
			<div id = "modal">
				<div id="serviceInfo">
					<h2 style="margin-left: 150px;" id="scname">{{scname}}</h2>
					<span id="scno" value="{{scno}}" style="display:none;"></span>
					<p>??????: <span class="num" id="sctel">{{sctel}}</span></p>
					<p>??????: <span id="scaddress1">{{scaddress1}}</span></p>
				</div>
				
				<div id="date">
					<span>????????? <span id="checkin"><input type="date" id="checkinDate" value={{checkin}}></span></span>
					<span>???????????? <span id="checkout"><input type="date" id="checkoutDate" value={{checkout}}></span></span>
				</div>
				
				<div id="user">
					??????????????? ??????<input type="checkbox" id="userCheck" checked>
					<p>????????? ??????</p>
					<input type="text" id="userName" value="{{userName}}">
					<p>????????? ?????????</p>
					<input type="hidden" id="userTel" name="userTel" value="{{userTel}}">
					<input type="text" id="userTel1" size=3>
					<input type="text" id="userTel2" size=4>
					<input type="text" id="userTel3" size=4>
				</div>
				
				<div>
					<p><textarea rows="5" cols="40" id="request">{{request}}</textarea><p>
				</div>
				<div id="button">
					<button id="btnReserve">????????????</button>
				</div>
				<div id="btnClose">
					<button class="close">??????</button>
				</div>
			</div>
		</div>
	</script>
</div>

<script>
	//???????????? ?????????
	$(".close").on("click",function(e){
		e.preventDefault();
		$("#popup01").hide(); //close?????? ????????? ????????? ????????? ?????? ??????
	    $(".backon").hide();
	});
	
	//???????????? ??????
	$(document).ready(function( $ ){     
	$("#myreserve").on("click",".openPopup", function(event) {  //???????????? ?????? ?????????
		$("#popup01").show();   //?????? ??????
		$("body").append('<div class="backon"></div>'); //????????? ??????
		
		var rno = $(this).attr("rno");
	
		$.ajax({
			type: "get",
			url: "/reserve/myReserve.json",
			dataType:"json",
			data: {rno:rno},
			success: function(data){
				var template = Handlebars.compile($("#temp3").html());
				$("#popup01").html(template(data));
			
				
				//???????????? ??????
				var num = $("#popup01").find(".num").html();
	
				var formatNum = '';
			
				if(num.length==11){
				    formatNum = num.replace(/(\d{3})(\d{4})(\d{4})/, '$1-$2-$3');
				}else if(num.length==8){
				    formatNum = num.replace(/(\d{4})(\d{4})/, '$1-$2');
				}else if(num.indexOf('02')==0){
				    formatNum = num.replace(/(\d{2})(\d{4})(\d{4})/, '$1-$2-$3');
				}else{
				    formatNum = num.replace(/(\d{3})(\d{3})(\d{4})/, '$1-$2-$3');
				}
				$("#popup01").find(".num").html(formatNum);
					
				//?????????????????? 
				var userTel=$("#userTel").val();
				//????????????
				var name= $("#userName").val();
	
				//???????????? substring
				var tel1=userTel.substring(0,3);
				var tel2=userTel.substring(3,7);
				var tel3=userTel.substring(7,11);
				//substring ??? ???????????? ??????
				$("#userTel1").val(tel1);
				$("#userTel2").val(tel2);
				$("#userTel3").val(tel3);
				
				//??????????????? ????????? ??????
				$("#userCheck").on("change", function(){
					if($(this).is(":checked")){
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
				//???????????? ????????? ????????? ??????
				$("#button").on("click","#btnReserve", function(){
					var checkin = $("#checkinDate").val();
					var checkout = $("#checkoutDate").val();
					var request = $("#request").val();
					var userName = $("#userName").val();
					var tel1=$("#userTel1").val();
					var tel2=$("#userTel2").val();
					var tel3=$("#userTel3").val();
					var userTel = tel1 + tel2 + tel3;
					var isEdit = 1;
					var isDel = 0;
					console.log("?????????: "+checkin + "\n" +"????????????: "+checkout + "\n" + "????????????: "+request + "\n" +"????????? : "+userName + "\n" +"????????? ????????? : "+userTel + "rno"+ rno);

					swal({
						title : "",
						text : "???????????? ???????????????????",
						type : "warning",
						showCancelButton : true,
						confirmButtonClass : "btn-danger",
						confirmButtonText : "???",
						cancelButtonText : "?????????",
						confirmButtonColor: "#A7CA37",
						closeOnConfirm : false,
						closeOnCancel : false
					}, function(isConfirm) {
						if (isConfirm) {
							$.ajax({
								type:"post",
								url: "/reserve/updateReserve",
								data: {checkin:checkin, checkout:checkout, request:request, userName:userName, userTel:userTel, rno:rno, isEdit:isEdit, isDel:isDel},
								success: function(){
									swal({
										title : '',
										text : '????????? ?????????????????????.',
										type: 'success',
										confirmButtonColor: "#A7CA37",	
									});
									location.href="/reserve/myreserveList?id=${id}";
									
								}
							});
						}else{
							swal({
									title : '',
									text : '????????? ?????????????????????.',
									type: 'error',
									confirmButtonColor: "#A7CA37",	
								});
						}
					});
						
				});
				
			}
		});
	});
	//????????? ?????????
	$("body").on("click", function(event) { 
	    if(event.target.className == 'close' || event.target.className == 'backon'){
	        $("#popup01").hide(); //close?????? ????????? ????????? ????????? ?????? ??????
	          $(".backon").hide();
	    }
	  });
	
	});
	//??????????????? ?????? ?????????
	$("#btnOldList").on("click", function(){
		var target = $("#oldreserve");
	//		target.toggleClass("hidden")
		if(target.css("display") == "none"){
			target.show();
		}else {
			target.hide();
		}
	});
	//??????????????? ???????????? ??? ??????
	$("#tbl").on("click",".list", function(){
		var isEdit = $(this).attr("isEdit");
		var isDel = $(this).attr("isDel");
		var target = $(this).find(".hiddenbtn");	//??????/????????????
		var target2 = $(this).find(".EditMessage");	//???????????????
		var target3 = $(this).find(".hiddenbtn2");	//???????????? ?????????

		if(isEdit==1){		//?????????????????? ??? ??????
			if(target2.css("display") == "none"){
				target2.show();
			}else {
				target2.hide();
			}
			
		}else if(isEdit == 0 && isDel == 0){	//?????????
			if(target.css("display") == "none"){
				target.show();
			}else {
				target.hide();
			}
		}else if(isDel == 1){	//???????????? ??? ??????
			if(target2.css("display") == "none"){
				target2.show();
				target2.html("?????? ?????? ??? ?????????.")
			}else {
				target2.hide();
			}
		}else if(isEdit ==2){	//???????????? ?????????
			if(target3.css("display") == "none"){
				target3.show();
			}else {
				target3.hide();

			}
		}
	});
		
	
		
		
		
	getList();
	getOldList()
	
	function getList(){
		$.ajax({
			type: "get",
			url: "/reserve/myreserveList.json",
			dataType:"json",
			success: function(data){
				var template = Handlebars.compile($("#temp").html());
				if(data.list == ""){
					$("#tbl").html("<h2 style='margin-left:-100px;'>... ?????????????????? ???????????? ...</h2>");
				}else{
					$("#tbl").html(template(data));
				}
				//?????? ????????? ????????? ??????
				$("#tbl").on("click",".reserveCancel2", function(){
					var isEdit = $(this).closest(".list").attr("isEdit");
					var isDel = $(this).closest(".list").attr("isDel");
					var rno = $(this).attr("rno");
					swal({
						title : "",
						text : "????????? ?????????????????????????",
						type : "warning",
						showCancelButton : true,
						confirmButtonClass : "btn-danger",
						confirmButtonText : "???",
						cancelButtonText : "?????????",
						confirmButtonColor: "#A7CA37",
						closeOnConfirm : false,
						closeOnCancel : false
					}, function(isConfirm) {
						if (isConfirm) {
							isEdit = 0;
							isDel = 2;
							$.ajax({
								type: "post",
								url: "/reserve/ReserveEdit",
								data: {isEdit:isEdit, isDel:isDel, rno:rno},
								success: function(){
									swal({
										title : "????????????",
										text : "????????? ?????????????????????????",
										type : "success",
										showCancelButton : true,
										confirmButtonClass : "btn-danger",
										confirmButtonText : "???",
										cancelButtonText : "?????????",
										confirmButtonColor: "#A7CA37",
										closeOnConfirm : false,
										closeOnCancel : true
									}, function(isConfirm) {
										if (isConfirm) {
											location.href="/reserve/myreserveList?id=${id}";
										}else{
											return;
										}
									});

								}
							});

						}else{
							swal({
									title : '',
									text : '?????????????????????.',
									type: 'error',
									confirmButtonColor: "#A7CA37",	
								});
						}
					});
					
				});
				
				//???????????? ????????? ????????? ??????
				$("#tbl").on("click",".reserveCancel", function(){
					var isEdit = $(this).closest(".list").attr("isEdit");
					var isDel = $(this).closest(".list").attr("isDel");
					var rno = $(this).attr("rno");
					swal({
						title : "????????????",
						text : "????????? ???????????????????????????????",
						type : "warning",
						showCancelButton : true,
						confirmButtonClass : "btn-danger",
						confirmButtonText : "???",
						cancelButtonText : "?????????",
						confirmButtonColor: "#A7CA37",
						closeOnConfirm : false,
						closeOnCancel : false
					}, function(isConfirm) {
						if (isConfirm) {
							isEdit = 0;
							isDel = 1;
							$.ajax({
								type: "post",
								url: "/reserve/ReserveEdit",
								data: {isEdit:isEdit, isDel:isDel, rno:rno},
								success: function(){
									swal({
										title : "???????????? ??????",
										text : "????????? ?????? ???????????????????",
										type : "success",
										showCancelButton : true,
										confirmButtonClass : "btn-danger",
										confirmButtonText : "???",
										cancelButtonText : "?????????",
										confirmButtonColor: "#A7CA37",
										closeOnConfirm : false,
										closeOnCancel : false
									}, function(isConfirm) {
										if (isConfirm) {
											location.href="/reserve/myreserveList?id=${id}";
										}else{
											return;
										}
									});
									
								}
							});
						}else{
							swal({
									title : '',
									text : '?????????????????????.',
									type: 'error',
									confirmButtonColor: "#A7CA37",	
								});
						}
					});
					
				});
				
				//???????????? ????????????
				$(".list").each(function(){
					var target = $(this).find(".checkin").html();
					var checkin = target.substring(0,10);
					$(this).find(".checkin").html(checkin);
					
					var target = $(this).find(".checkout").html();
					var checkout = target.substring(0,10);
					$(this).find(".checkout").html(checkout);
					
					//???????????? ??????
					var num = $(this).find(".sctel").html();
					var tel = $(this).find(".userTel").html();
					var formatNum = '';
					var formatTel = '';
					
					if(num.length==11){
					    formatNum = num.replace(/(\d{3})(\d{4})(\d{4})/, '$1-$2-$3');
					}else if(num.length==8){
					    formatNum = num.replace(/(\d{4})(\d{4})/, '$1-$2');
					}else if(num.indexOf('02')==0){
					    formatNum = num.replace(/(\d{2})(\d{4})(\d{4})/, '$1-$2-$3');
					}else{
					    formatNum = num.replace(/(\d{3})(\d{3})(\d{4})/, '$1-$2-$3');
					}
					if(tel.length==11){
					    formatTel = tel.replace(/(\d{3})(\d{4})(\d{4})/, '$1-$2-$3');
					}else if(tel.length==8){
					    formatTel = tel.replace(/(\d{4})(\d{4})/, '$1-$2');
					}else if(tel.indexOf('02')==0){
					    formatTel = tel.replace(/(\d{2})(\d{4})(\d{4})/, '$1-$2-$3');
					}else{
					    formatTel = tel.replace(/(\d{3})(\d{3})(\d{4})/, '$1-$2-$3');
					}
						$(this).find(".sctel").html(formatNum);
						$(this).find(".userTel").html(formatTel);
						
						
				});
			}
		});
	}
	function getOldList(){
		$.ajax({
			type: "get",
			url: "/reserve/myreserveList.json",
			dataType:"json",
			success: function(data){
				var template = Handlebars.compile($("#temp2").html());
				if(data.oldlist == ""){
					$("#tbl2").html("<h2 style='margin-left:-100px;'>... ???????????????????????? ???????????? ...</h2>");
				}else{
					$("#tbl2").html(template(data));
				}
				
				
				//???????????? ????????????
				$("#oldreserve .oldlist").each(function(){
					var target = $(this).find(".checkin").html();
					var checkin = target.substring(0,10);
					$(this).find(".checkin").html(checkin);
					
					var target = $(this).find(".checkout").html();
					var checkout = target.substring(0,10);
					$(this).find(".checkout").html(checkout);
					
					//???????????? ??????
					var num = $(this).find(".sctel").html();
					var tel = $(this).find(".userTel").html();
					var formatNum = '';
					var formatTel = '';
					
					if(num.length==11){
					    formatNum = num.replace(/(\d{3})(\d{4})(\d{4})/, '$1-$2-$3');
					}else if(num.length==8){
					    formatNum = num.replace(/(\d{4})(\d{4})/, '$1-$2');
					}else if(num.indexOf('02')==0){
					    formatNum = num.replace(/(\d{2})(\d{4})(\d{4})/, '$1-$2-$3');
					}else{
					    formatNum = num.replace(/(\d{3})(\d{3})(\d{4})/, '$1-$2-$3');
					}
					if(tel.length==11){
					    formatTel = tel.replace(/(\d{3})(\d{4})(\d{4})/, '$1-$2-$3');
					}else if(tel.length==8){
					    formatTel = tel.replace(/(\d{4})(\d{4})/, '$1-$2');
					}else if(tel.indexOf('02')==0){
					    formatTel = tel.replace(/(\d{2})(\d{4})(\d{4})/, '$1-$2-$3');
					}else{
					    formatTel = tel.replace(/(\d{3})(\d{3})(\d{4})/, '$1-$2-$3');
					}
						$(this).find(".sctel").html(formatNum);
						$(this).find(".userTel").html(formatTel);
						
						var target= $(this).find(".cancelMessage");
						var isDel= target.attr("isDel");
						if(isDel==2){
							target.html("????????? ????????? ?????????.")
							target.css({"color":"red"});
						}
				});
			}
		});
	}
	
	function getModal(){
		
		
	}
</script>