<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="/resources/css/request.css" rel="stylesheet">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style>
.smallBox {
	border: 2px double gray;
	margin-bottom: 10px;
	margin-right: 5px;
	width: 180px;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	display: inline-block;
	cursor : pointer;
}

#tbl p {
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

#tbl {
	width: 800px;
	overflow: hidden;
	float: left;
}

.modal_wrap {
	display: none;
	width: 500px;
	min-height: 400px;
	position: absolute;
	top: 40%;
	left: 50%;
	margin: -250px 0 0 -250px;
	background: #FFFFFF;
	z-index: 2;
	border-radius: 30px;
	padding : 25px;

}

.black_bg {
	display: none;
	position: absolute;
	content: "";
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5);
	top: 0;
	left: 0;
	z-index: 1;
}

.modal_close {
	width: 26px;
	height: 26px;
	position: absolute;
	top: -30px;
	right: 0;
}

.modal_close>a {
	display: block;
	width: 100%;
	height: 100%;
	background: url(https://img.icons8.com/metro/26/000000/close-window.png);
	background-color : skyblue;
	text-indent: -9999px;
}

.modal_wrap p{
	font-size : 15px;
}

textarea {
	margin-left : 0px;
}

.smallBox {
	margin-left : 30px;
	min-height : 256px;
}

.drprice {
	text-align : left;
} 
#sidemenu{
	margin-left: -100px;
}
</style>

<h1>�̿� ������ ���</h1>
<div id="sidemenu">
	<jsp:include page="/WEB-INF/views/user/mypageSidemenu.jsp"/>
</div>
	<h2 id="text" style="display:none;">�ۼ��� �������� �����ϴ�</h2>
<div>
	<div id="tbl" ></div>
	<script id="temp" type="text/x-handlebars-template">
	      {{#each .}}
			<div class="smallBox" brno={{brno}} scno={{scno}}>
		       <p style="text-align : center;" class="dname">{{nick}}���� ��û��</p>
		       <p>{{beauty_classification}}</p>
		       <span>{{wish_local1}}</span> <span>{{wish_local2}}</span> </br>
			   <p>�������� : {{description}}</p>
			   <p class="drprice">���� : {{printPrice price}}</p>
			   <p class="isDelete" isDelete="{{isDelete}}">{{isDelete}}</p>
			   <p class="secheck" secheck="{{secheck}}" >{{secheck}}</p>
			   <p class="choose_check" choose_check="{{choose_check}}">ä��</p>
			</div>
	      {{/each}}
	</script>
		<div class="black_bg" ></div> <!-- â ������� ��� -->
		<div class="modal_wrap" id="modal_wrap1"></div> <!-- â ��ü -->
		<script id="temp2" type="text/x-handlebars-template">
			<div class="modal_close" id="modal_close1"><a href="javascript:void(0);">close</a></div>
			<h2 style="text-align : center;">{{nick}}���� ��û���װ� ����</h2>
			<p>�� �з� : {{pcate}}</p>
			<p>���ϴ� ���� : {{beauty_classification}}</p>
            <p>ü��/���� : {{weight}}, {{age}}</p>
            <p>������ �̿�ñ� : {{last_beautydate}}</p>
            <p>���� ��� : {{service_place}}</p> <p>��� ������  : {{wish_date}}</p>
			<p>���ǻ��� : {{detailed_matters}}</p>
			<h4 style="margin-bottom : 3px;">���� ����</h4>
			<textarea cols="66.5" rows="13" readonly>{{description}}</textarea>
		</script>
</div>
<script>
Handlebars.registerHelper("printPrice", function(price){
    return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
 });
 
 
var target = document.getElementsByClassName("isDelete");
var target1 = document.getElementsByClassName("secheck");
var target2 = document.getElementsByClassName("choose_check");
var text = document.getElementById("text");

getList();
	function getList(){

		var i = 1;
		$.ajax({
			type : "get",
			dataType : "json",
			url : "/service/beslist.json",
			success:function(data){
				var template = Handlebars.compile($("#temp").html());
				$("#tbl").html(template(data));
				
				for(i=0; i <target.length; i++){
					var isDelete = target[i].getAttribute("isDelete");
					var secheck = target1[i].getAttribute("secheck");
					if(isDelete == 1 && secheck == 0){
						target[i].style.display = 'block';
					}
				}
				for(i=0; i <target1.length; i++){
					var secheck = target1[i].getAttribute("secheck");
					if(secheck == 1){
						target1[i].style.display = 'block';
					}
				}
			},
			error : function(xhr, ajaxSettings, thrownError) 
			   {
				text.style.display = 'block';
			   }

		});
	}
	$("#tbl").on("click", ".smallBox", function(){
		var brno = $(this).attr('brno');
		var scno = $(this).attr('scno');

		document.querySelector('.black_bg').style.display ='block';
    	document.querySelector('#modal_wrap1').style.display ='block';
    		$.ajax({
    			type : "get",
    			dataType : "json",
    			data :{brno:brno, scno:scno},
    			url : "besread.json",
    			success:function(data){
    				var template = Handlebars.compile($("#temp2").html());
    				$("#modal_wrap1").html(template(data));
    				$('#modal_close1').click(function(){
    					offClick();
    				});
    			}
    		});
    	
	});
	    function offClick() {
	        document.querySelector('#modal_wrap1').style.display ='none';
	        document.querySelector('.black_bg').style.display ='none';
	    }
</script>