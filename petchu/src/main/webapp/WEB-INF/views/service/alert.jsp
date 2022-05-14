<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
 var message = "${msg}";
 swal(message);
 location.href="/service/request";
</script>