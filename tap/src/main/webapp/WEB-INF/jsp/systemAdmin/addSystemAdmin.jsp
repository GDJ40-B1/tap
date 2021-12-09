<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시스템관리자 추가</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
	<!-- header 불러오기 -->
    <c:import url="/partial/mainHeader.jsp"></c:import>
  
  	<br><br><br>
  	
  	 <main id="main">
  	
	<h1>시스템관리자 추가</h1>
	<form id="addForm" action="/tap/addSystemAdmin" method="post">
		<table>
			<tr>
				<th>아이디</th>
				<td><input type="text" id="systemAdminId" name="systemAdminId" placeholder="Enter id"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" id="systemAdminPw" name="systemAdminPw" placeholder="Enter pw"></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" id="systemAdminName" name="systemAdminName" placeholder="Enter name"></td>
			</tr>
		</table>
		<button type="button" id="addBtn">추가</button>
		<a href="${pageContext.request.contextPath}/systemAdminList">시스템관리자 목록</a>
	</form>
	
	</main><!-- End #main -->
	
	<!-- 푸터 불러오기 -->
 	<c:import url="/partial/mainFooter.jsp"></c:import>
 	
<script>
	$('#addBtn').click(function(){
		if($('#systemAdminId').val() == '') {
			alert('아이디를 입력하세요');
			return;
		}
		if($('#systemAdminPw').val() == '') {
			alert('비밀번호를 입력하세요');
			return;
		}
		if($('#systemAdminName').val() == '') {
			alert('이름을 입력하세요');
			return;
		}
		
		$('#addForm').submit();
	});
</script>	
</body>
</html>