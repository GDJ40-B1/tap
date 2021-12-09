<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시스템관리자 비밀번호 수정</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
	<!-- header 불러오기 -->
    <c:import url="/partial/mainHeader.jsp"></c:import>
  
  	<br><br><br>

	<h1>${systemAdmin.systemAdminId} 비밀번호 수정</h1>
	<form id="modifyForm" action="/tap/modifySystemAdminPw" method="post" >
		<div>
			<input type="hidden" name="systemAdminId" value="${systemAdmin.systemAdminId}" readonly="readonly">
			<table>
				<tr>
					<th>변경할 비밀번호</th>
					<td><input type="password" id="systemAdminPw" name="systemAdminPw" placeholder="Enter pw"></td>
				</tr>
			</table>
		</div>
		<button type="button" id="modifyBtn">수정</button>
	</form>
	
	<!-- 푸터 불러오기 -->
 	<c:import url="/partial/mainFooter.jsp"></c:import>

<script>
	$('#modifyBtn').click(function(){
		if($('#systemAdminPw').val() == '') {
			alert('비밀번호를 입력하세요');
			return;
		}
		
		$('#modifyForm').submit();
	});	
</script>	
</body>
</html>