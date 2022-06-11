<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link href="/resources/css/request.css" rel="stylesheet" > 
<div id="pagee" class="receRequest">
	<div id="request">
		<input style="display:none" value="${hospital}" id="dno"></input>
		<p class="title"><b>${vo.nick}</b>���� �����ֽ� ������</p>
		<input type="hidden" value="${vo.id}" id="id">
	
		<table id="petlist">
			<tr><td class="bigtitle" colspan=4>�� �� ��</td></tr>
			<tr>
				<td class="title">�ư� �̸�</td>
				<td>${vo.pname}</td>
			</tr>
			<tr>
				<td class="title" width=70>�� �� ��</td>
				<td width=100>${vo.pcate}</td>
				<td class="title" width=60>etc</td>
				<td width=70>${vo.pcate_1}</td>
			</tr>
			<tr>
				<td class="title">ǰ  ��</td>
				<td>${vo.pbreed}</td>
			</tr>
			<tr>
				<td class="title">��  ��</td>
				<td>${vo.page}</td>
			</tr>
			<tr>
				<td class="title">�� �� ��</td>
				<td>${vo.pweight}</td>
			</tr>
			<tr>
				<td class="title">��  ��</td>
				<td>${vo.pgender}</td>
				<td class="title">�� �� ȭ</td>
				<td>${vo.pspaying}</td>
			</tr>
		</table>
		
		<div class="diseSelect">
			<p class="title">����</p>
			<input type="checkbox" name="disease" onClick="return false;" <c:if test="${vo.d1}">checked</c:if>>
			<label for="d_1"><span>����</span></label>
			<input type="checkbox" name="disease" onClick="return false;" <c:if test="${vo.d2}">checked</c:if>>
			<label for="d_2"><span>�Ŀ����</span></label>
			<input type="checkbox" name="disease" onClick="return false;" <c:if test="${vo.d3}">checked</c:if>>
			<label for="d_3"><span>���ҰŸ�</span></label>
			<input type="checkbox" name="disease" onClick="return false;" <c:if test="${vo.d4}">checked</c:if>>
			<label for="d_4"><span>����</span></label>
			<input type="checkbox" name="disease" onClick="return false;" <c:if test="${vo.d5}">checked</c:if>>
			<label for="d_5"><span>�к���</span></label>
		</div>
		<p class="title d_etc">�� ����</p>
		<p id="d_etc">${vo.d_etc}</p>
		<p class="title">÷�λ���</p>
		<div id="dimgbox">
			<c:if test="${vo.dimg1!=null}">
				<img src="/display?fileName=${vo.dimg1}"/>
			</c:if>
			<c:if test="${vo.dimg2!=null}">
				<img src="/display?fileName=${vo.dimg2}"/>
			</c:if>
			<c:if test="${vo.dimg3!=null}">
				<img src="/display?fileName=${vo.dimg3}"/>
			</c:if>
			<c:if test="${vo.dimg4!=null}">
				<img src="/display?fileName=${vo.dimg4}"/>
			</c:if>
		</div>
	</div>
	<hr>
	<form name="frm" action="/doctor/replyRequest" method="post" enctype="multipart/form-data">
		<p class="title">���ܸ�</p>
		<input type="text" name="pno" value="${vo.pno}" style="display:none">
		<input type="text" name="dno" value="${hospital}" style="display:none">
		<input type="text" name="drdisease">
		<p class="title">����</p>
		<textarea name="drcontent" rows="5" cols="80"></textarea><br>
		<!-- <input type="file" name="file" style="display:none"><br>
		<button type="button" id="btninputfile">÷ �� �� ��</button><br> -->
		<div class="rece" id="inputfile">
			<button type="button" id="btninputfile">÷ �� �� ��</button>
			<span>100MB ������ gif, jpg, png ���ϸ� �����մϴ�.</span>
			<input type="file" name="file" style="display:none">
			<div id="preview" style="display:none"></div>
		</div>
		<span class="title" style="float:right">����û���ݾ�
		<input type="number" name="drprice"></span>
	
		<div id="buttons2">
			<span id="alert"></span><br>
			<input type="button" id="pass" value="����">
			<input type="submit" id="sendrequest" value="������ ������">
		</div>
	</form>
	
</div>
<script>
	var rno = "${vo.rno}";
	$("#btninputfile").on("click", function(){
		$(frm.file).click();
	})
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
	$("#pass").on("click", function(){
		/* $.ajax({
			type: "post",
			url: "/doctor/ischecked",
			data: {rno:rno},
			success:function(){
				swal("�����Ǿ����ϴ�.");
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
			swal("���ܸ��� �Է��ϼ���");
			$(frm.drdisease).focus();
			return;
		}else if(drcontent==""){
			swal("������ �Է��ϼ���");
			$(frm.drcontent).focus();
			return;
		}else if(drprice=="" || isNaN(drprice)){
			swal("����û���ݾ��� �Է��ϼ���");
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