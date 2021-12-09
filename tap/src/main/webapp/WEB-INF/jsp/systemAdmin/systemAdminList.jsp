<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시스템관리자 목록</title>
</head>
<body>
	<!-- header 불러오기 -->
    <c:import url="/partial/mainHeader.jsp"></c:import>
  
  	<br><br><br>
	<h1>시스템관리자 목록</h1>
	<table border="1">
		<tr>
			<th>아이디</th>
			<th>이름</th>
		</tr>
		<c:forEach items="${systemAdminList}" var="list">
			<tr>
				<td>${list.systemAdminId}</td>
				<td><a href="${pageContext.request.contextPath}/systemAdminOne?systemAdminId=${list.systemAdminId}">${list.systemAdminName}</a></td>	
			</tr>	
		</c:forEach>
	</table>
	<a href="${pageContext.request.contextPath}/addSystemAdmin">추가</a>
	
	<!-- 푸터 불러오기 -->
 	<c:import url="/partial/mainFooter.jsp"></c:import>
</body>
</html>