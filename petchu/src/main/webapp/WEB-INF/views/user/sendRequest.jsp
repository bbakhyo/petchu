<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
<link href="/resources/css/request.css" rel="stylesheet">
<div id="page">
	<p class="title"><b>${vo.nick}</b>�� �������� �ۼ��ϼ���</p>
	<input type="hidden" value="${vo.id}" id="id">

	<div id="selectPet"></div>
	<script id="temp" type="text/x-handlebars-template">
		{{#each .}}
			<div class="row">
				<span class="pno" style="display:none">{{pno}}</span>
				<button class="btnpno">{{pname}}</button>
			</div>
		{{/each}}
	</script>
	<p id="nopet"></p>

	<table id="petlist" style="display:none">
		<tr><td class="bigtitle" colspan=4>�� �� ��</td></tr>
		<tr>
			<td class="title">�ư� �̸�</td>
			<td id="pname"></td>
		</tr>
		<tr>
			<td class="title" width=70>�� �� ��</td>
			<td id="pcate" width=100></td>
			<td class="title" width=60>etc</td>
			<td id="pcate_1" width=70></td>
		</tr>
		<tr>
			<td class="title">ǰ  ��</td>
			<td id="pbreed"></td>
		</tr>
		<tr>
			<td class="title">��  ��</td>
			<td id="pagee"></td>
		</tr>
		<tr>
			<td class="title">�� �� ��</td>
			<td id="pweight"></td>
		</tr>
		<tr>
			<td class="title">��  ��</td>
			<td id="pgender"></td>
			<td class="title">�� �� ȭ</td>
			<td id="pspaying"></td>
		</tr>
	</table>
	<p class="title">�ݷ��� �ݷ����� ���̴� ������ üũ���ּ���</p>
	<form name="frm" method="post" action="/request/send" enctype="multipart/form-data">
		<input type="text" name="pno" style="display: none">
		<div class="diseSelect">
			<input type="checkbox" value=0 name="d1">
			<label for="d1"><span>����</span></label>
			<input type="checkbox" value=0 name="d2">
			<label for="d2"><span>�Ŀ����</span></label>
			<input type="checkbox" value=0 name="d3">
			<label for="d3"><span>���ҰŸ�</span></label>
			<input type="checkbox" value=0 name="d4">
			<label for="d4"><span>����</span></label>
			<input type="checkbox" value=0 name="d5">
			<label for="d5"><span>�к���</span></label>
		</div>
		<p class="title">���û��׿� ���ų� ������ �� �ʿ��� ���� ���� �ۼ����ּ���</p>
		<textarea rows="8" cols="90" name="d_etc"
			placeholder="���� ���� �������ּ���"></textarea>
		<p class="title">������ �Կ��� ������ ÷�����ּ���</p>
		<div id="inputfile">
			<button type="button" id="btninputfile">÷ �� �� ��</button>
			<span>100MB ������ gif, jpg, png ���ϸ� �����մϴ�.(�ִ� 4������)</span>
			<input type="file" name="uploadFile" id="uploadFile" multiple style="display: none">
			<div id="preview" style="display:none"></div>
		</div>

		<div id="buttons">
			<span id="alert"></span><br>
			<input type="reset" id="reset" value="�ۼ����">
			<input type="submit" id="sendrequest" value="������ ��û">
		</div>
	</form>
</div>
<script>
	var id = $("#id").val();
	var pno=0;
	
	//�ݷ����� ����
	$("#selectPet").on("click", ".row .btnpno", function(){
		var row = $(this).parent();
		 pno = row.find(".pno").html();

		$.ajax({
			type: "get",
			dataType: "json",
			data : {pno:pno},
			url: "/pet/readpet",
			success:function(data){


				
 				$.ajax({
 					type: "get",
					dataType:"json",
					data: {pno:pno},
					url: "/request/regdatechk",
 					success:function(dataa){
 						if(dataa!=""){
 							swal("3�� �̳��� ���� �ݷ������� �������� �ۼ��� �� �����ϴ�.");
 							pno=0;
 							return;
 						}else{
 							$("#petlist").show();
 							$("#pname").html(data.pname);
 							$("#pcate").html(data.pcate);
 							$("#pcate_1").html(data.pcate_1);
 							$("#pbreed").html(data.pbreed);
 							$("#pagee").html(data.page+ "��");
 							$("#pweight").html(data.pweight + "kg"); 
 							$("#pgender").html(data.pgender);
 							$("#pspaying").html(data.pspaying);
 						}
 					}
 				})
				
			}
		})
	})
	
	//�ݷ����� ����Ʈ ���
	$.ajax({
		type: "get",
		dataType: "json",
		data : {id:id},
		url: "/pet/petlist",
		success:function(data){
			var template = Handlebars.compile($("#temp").html());
			$("#selectPet").html(template(data));
			if(data==""){
				$("#nopet").html("�ݷ������� ����ϼ���");
			}
			
		}
	})



	//������Ʈ ������
	$(frm).on("submit", function(e){
		e.preventDefault();
		if($(frm.d1).is(":checked")){
			$(frm.d1).val(1);
		}
		if($(frm.d2).is(":checked")){
			$(frm.d2).val(1);
		}
		if($(frm.d3).is(":checked")){
			$(frm.d3).val(1);
		}
		if($(frm.d4).is(":checked")){
			$(frm.d4).val(1);
		}
		if($(frm.d5).is(":checked")){
			$(frm.d5).val(1);
		}
		
		$(frm.pno).val(pno);

		var d_etc = $(frm.d_etc).val();
		if(d_etc==""){
			$("#alert").html("���� ���� ������ �ۼ����ּ���");
			return;
		}
		if(pno==0){
			$("#alert").html("�ݷ������� �������ּ���");
			return;
		}
		
		swal({
				title : '',
				text : '��û���� �����ðڽ��ϱ�?',
				type : "info",
				showCancelButton : true,
				confirmButtonClass : "btn-danger",
				confirmButtonText : "��",
				cancelButtonText : "�ƴϿ�",
				confirmButtonColor: "#A7CA37",
				closeOnConfirm : false,
				closeOnCancel : false
			}, function(isConfirm) {
				if (isConfirm) {
					swal({
						title : '',
						text : '',
						type: 'success',
						confirmButtonColor: "#A7CA37",	
						timer:3000
					});
					frm.submit();
				}else{
					swal({
							title : '',
							text : '��ҵǾ����ϴ�.',
							type: 'error',
							confirmButtonColor: "#A7CA37",	
						});
				}
			});
		


		
		
	})
	
	//÷���ϱ� ��ư Ŭ��
	$("#btninputfile").on("click", function(){
		$("#uploadFile").click();
	});

    var fileCount = 0;
    var totalCount = 4;
    var fileNum = 0;
    var arr=new Array();
    
  $(document).ready(function (e){
    $("input[type='file']").change(function(e){

      //div ���� ����ֱ�
      $('#preview').empty();

      var files = e.target.files;
      arr =Array.prototype.slice.call(files);

      //���ε� ���� �������� üũ
      for(var i=0;i<files.length;i++){
        if(!checkExtension(files[i].name,files[i].size)){
          return false;
        }
      }
      
      if(fileCount + arr.length> totalCount){
    	  swal("������ " + totalCount + "������ ���ε��� �� �ֽ��ϴ�.");
    	  return;
      }else{
    	  fileCount = fileCount + arr.length;
      }
      $('#preview').show();
      preview(arr);
     
    });//file change
    
    function checkExtension(fileName,fileSize){
      var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
      var maxSize = 20971520;  //20MB
      var fileEx = fileName.slice(fileName.indexOf(".")+1).toLowerCase();
      
      if(fileEx!="png" && fileEx!="jpg" && fileEx!="gif"){
    	  alert("��ϰ����� ������ �ƴմϴ�.");
    	  return false;
      }
      
      if(fileSize >= maxSize){
        alert('���� ������ �ʰ�');
        $("input[type='file']").val("");  //���� �ʱ�ȭ
        return false;
      }
      
      if(regex.test(fileName)){
        alert('���ε� �Ұ����� ������ �ֽ��ϴ�.');
        $("input[type='file']").val("");  //���� �ʱ�ȭ
        return false;
      }
      return true;
    }
    
    function preview(arr){
      arr.forEach(function(f){
        
        //���ϸ��� ��� ���ϸ�...���� ó��
        var fileName = f.name;
        if(fileName.length > 10){
          fileName = fileName.substring(0,7)+"...";
        }
        
        //div�� �̹��� �߰�
        var str = '<div style="display: inline-flex; padding: 10px;">';
       
        
        //�̹��� ���� �̸�����
        if(f.type.match('image.*')){
          var reader = new FileReader(); //������ �б� ���� FileReader��ü ����
          reader.onload = function (e) { //���� �о���̱⸦ ���������� ȣ��Ǵ� �̺�Ʈ �ڵ鷯
            //str += '<button type="button" class="delBtn" value="'+f.name+'" style="background: red">x</button><br>';
            str += '<img src="'+e.target.result+'" title="'+f.name+'" width=100 height=100 />';
            str += '<p>'+fileName+'</p>';
            str += '</div>';
            $(str).appendTo('#preview');
          } 
          reader.readAsDataURL(f);
        }else{
          str += '<img src="/resources/img/fileImg.png" title="'+f.name+'" width=100 height=100 />';
          $(str).appendTo('#preview');
        }
      });//arr.forEach
    }
  });
</script>