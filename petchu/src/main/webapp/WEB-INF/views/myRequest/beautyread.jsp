<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<div class="requestInfo" style="text-align : left;">
	<h1>[${bvo.nick}]���� ��û��</h1>
	<h3>1. �ݷ����� �з�</h3>
	<span>${bvo.pcate}</span>
	<hr/>
	<h3>2. ���ϴ� ���� </h3>
	<span>${bvo.beauty_classification}</span>
	<hr/>
	<h3>3. �ݷ������� ü��</h3>
	<span>${bvo.weight}</span>
	<hr/>
	<h3>4. �ݷ������� ����</h3>
	<span>${bvo.age}</span>
	<hr/>
	<h3>5. ������ �̿�ñ�</h3>
	<span>${bvo.last_beautydate}</span>
	<hr/>
	<h3>6. ������</h3>
	<span>${bvo.service_place}</span>
	<hr/>
	<h3>7. ���������</h3>
	<span>${bvo.wish_date}</span>
	<hr/>
	<h3>8. ���� ��� ����</h3>
	<span>${bvo.wish_local1} ${bvo.wish_local2}</span>
	<hr/>
	<h3>9. ���� ���� ���� �� ���λ���</h3>
	<span>${bvo.detailed_matters}</span>
	<br/><br/>
		<div> 
			<button type="button" style="float : right;" id="btnList">����̵�</button> 
		</div>
		<br/>
</div>
<script>
    var brno = $('.requestInfo').attr("brno");
	$("#btnList").on("click" ,function(){
		location.href="/user/myDeadlineList";
	});
	
</script>