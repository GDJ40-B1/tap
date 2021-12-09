<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시스템관리자 상세보기</title>
</head>
<body>
	<!-- header 불러오기 -->
 	<c:import url="/partial/mainHeader.jsp"></c:import>
  
  	<br><br><br>
  	
	<h1>시스템관리자 상세보기</h1>
	<a href="${pageContext.request.contextPath}/systemAdminList">시스템관리자 목록</a>
	<table border="1">
		<tr>
			<th>아이디</th>
			<th>비밀번호</th>
			<th>이름</th>
			<th>정보 생성일</th>
			<th>정보 수정일</th>
		</tr>
		<tr>
			<td>${systemAdminOne.systemAdminId}</td>
			<td>${systemAdminOne.systemAdminPw}</td>
			<td>${systemAdminOne.systemAdminName}</td>
			<td>${systemAdminOne.createDate}</td>
			<td>${systemAdminOne.updateDate}</td>
		</tr>
	</table>
	<div>
		<a href="${pageContext.request.contextPath}/modifySystemAdminPw?systemAdminId=${systemAdminOne.systemAdminId}">비밀번호 수정</a><br>
		<a href="${pageContext.request.contextPath}/modifySystemAdminName?systemAdminId=${systemAdminOne.systemAdminId}">이름 수정</a><br>
		<a href="${pageContext.request.contextPath}/removeSystemAdmin?systemAdminId=${systemAdminOne.systemAdminId}">삭제</a>
	</div>
	
	<!-- 푸터 불러오기 -->
	<c:import url="/partial/mainFooter.jsp"></c:import>
</body>
</html>