<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div class="requestInfo" uid="${cvo.uid}}" crno="${cvo.crno}"  style="text-align : left;">
	<h1>[${cvo.nick}]���� ��û��</h1>
	<h3>1. �ǹ�����</h3>
	<span>${cvo.building_classification}</span>
	<hr/>
	<h3>2. �� ���� </h3>
	<span>${cvo.house_size}</span>
	<hr/>
	<h3>3. Ŭ������ ���ϴ� ��</h3>
	<span>${cvo.wish_date}</span>
	<hr/>
	<h3>4. ���ϴ� ����</h3>
	<span>${cvo.wish_local1} ${cvo.wish_local2}</span>
	<hr/>
	<h3>5. Ŭ���� ���� �������</h3>
	<span>${cvo.hope_matters}</span>
	<br/><br/>
		<div> 
			<button type="button" style="float : right;" id="btnList">����̵�</button> 
		</div>
		<br/>
</div>
<script>
	$("#btnList").on("click" ,function(){
		location.href="/user/myDeadlineList";
	});
	
	$(frm).on("submit", function(e){
		e.preventDefault();
		if(!confirm("������ �ۼ��������� �̵��Ͻðڽ��ϱ�?")) return;
		frm.submit();
	});
</script>