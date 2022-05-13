<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
<link href="/resources/css/chat.css" rel="stylesheet" >
<style>
#navi {
    position: sticky;
    top: 0;
    z-index: 1;
}
</style>
<div id="navi">
	<table id="menubar">
		<tr>
			<td width=30 style="padding-left: 10px"><a href="/chat/main"><img src="/resources/icon/back.png" width=20></a></td>
			<td>
				<c:if test="${type=='�ǻ�'}">
				<span id="hosname">${receinfo.nick}</span>
				<input type="text" value=0 id="send" style="display:none">
				<input type="text" value="${roominfo.userid}" id="receiver" style="display:none">
				</c:if>
				<c:if test="${type=='�Ϲ�'}">
				<span id="hosname">${receinfo.dname}</span>
				<input type="text" value=1 id="send" style="display:none">
				<input type="text" value="${roominfo.doctorid}" id="receiver" style="display:none">
				</c:if>
			</td>
		</tr>
	</table>
</div>
<div id="message"></div>
<script id="temp" type="text/x-handlebars-template">
	{{#each .}}
		<div class="all {{display id}}">
				<div class="id {{display id}}">
					{{id}}
				</div>
				<div id="line">
					<span class="messagebox {{display id}}">
						{{message}}
					</span>
					<span class="readdate {{display id}}">{{show readdate}}</span>
				</div>				
			<div class="date {{display id}}">{{regdate}}</div>
		</div>
	{{/each}}
</script>
<div id="sendbox">
	<textarea id="txtMessage" placeholder="������ �Է��ϼ���."></textarea>
</div>
<script>
	Handlebars.registerHelper("display", function(id){
		if(id=="${id}"){
			return "right";
		}else{
			return "left";
		}
	})
	Handlebars.registerHelper("show", function(readdate){
		if(readdate!=null){
			return "����";
		}else{
			return "";
		}
	})
</script>
<script>
	var crno = "${crno}";
	getList();
	getUpdate();
	
	function getUpdate(){
		$.ajax({
			type: "post",
			url: "/chat/update",
			data: {crno:crno},
			success:function(){
				sock.send("updateReadDate");
			}
		})
	}
	function getList(){
		$.ajax({
			type:"get",
			dataType: "json",
			url: "/chat/message.json?crno=" + crno,
			success:function(data){
				var temp = Handlebars.compile($("#temp").html());
				$("#message").html(temp(data));
				window.scrollTo(0, $("#message").prop("scrollHeight"));
			}
			
		})
	}
	//���ϼ���
	var sock = new SockJS("http://localhost:8088/sock_chat");
	sock.onmessage = onMessage;
	
	//�������� �޽��� ������
	function onMessage(msg){
	/* 	// '|'�� ���۵� �޽��� �и��ؼ� �迭����(msg.data.split("|")) ==> ���� ������ ����
		var items = msg.data.split("|");
		var sender = items[0];
		var message = items[1];
		var date = items[2];
		var data = {sender:sender, message:message, date:date};
		
		var temp = Handlebars.compile($("#temp").html());
		$("#chat").append(temp(data));  //append�� �ٲ۰� ����Ʈ�� ��� �߰��Ǵϱ� append�� Handlebar ���� ���� �ѹ� ��� ����~
		 */
		 getList();
	}
	
	//enterŬ��
	$("#txtMessage").on("keydown", function(e){
		if(e.keyCode==13 && !e.shiftKey){
			e.preventDefault();
			var message = $(this).val();
			if(message==""){
				alert("������ �Է��ϼ���");
				return;
			}
			var id = "${id}";
			var receiver = $("#receiver").val();
			dno = "${receinfo.dno}";
			var crno = "${crno}";
			var send = $("#send").val();
			/* alert("id : " + id + "\nreceiver : " + receiver + "\ndno : " + dno + "\ncrno : " + crno + "\nsend : " + send); */
			$.ajax({
				type: "post",
				url: "/chat/send",
				data: {message:message, id:id, receiver:receiver, dno:dno, crno:crno, send:send},
				success:function(){
					sock.send("insert");
					//sock.send(uid + "|" + message);
					$("#txtMessage").val("");
				}
			}) 
			
		}
	})
</script>