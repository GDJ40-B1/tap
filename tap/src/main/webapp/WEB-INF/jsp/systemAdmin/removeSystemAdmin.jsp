<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>계정 삭제</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
	<!-- header 불러오기 -->
 	<c:import url="/partial/mainHeader.jsp"></c:import>
  
  	<br><br><br>
  	
	<h1>${systemAdmin.systemAdminId} 삭제</h1>
	<form id="removeForm" action="/tap/removeSystemAdmin" method="post">
		<input type="hidden" name="systemAdminId" value="${systemAdmin.systemAdminId}" readonly="readonly">
		<div>
			삭제를 위해 비밀번호를 입력해주세요 :
			<input type="password" id="systemAdminPw" name="systemAdminPw">
		</div>
		<button type="button" id="removeBtn">삭제</button>
	</form>
	
	<!-- 푸터 불러오기 -->
	<c:import url="/partial/mainFooter.jsp"></c:import>
	
<script>
	$('#removeBtn').click(function(){
		if($('#systemAdminPw').val() == '') {
			alert('이름을 입력하세요');
			return;
		}
		
		$('#removeForm').submit();
	});	
</script>		
</body>
</html>