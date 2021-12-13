<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<meta charset="UTF-8">
<title>attractionOne</title>
</head>
<body>
	<h1>명소 상세보기</h1>
	
	<form action="${pageContext.request.contextPath}/attractionOne" method="post">
		<table border="1">
			<tr>
				<td>명소 이름</td>
				<td id="attractionName">${attraction.attractionName }</td>
			</tr>
			<tr>
				<td>명소 카테고리</td>
				<td id="attractionCategory">${ attraction.attractionCategory}</td>
			</tr>
			<tr>
				<td>명소 주소</td>
				<td id="address">${address.detailAddress }</td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td id="attractionPhoneNumber">${attraction.attractionPhoneNumber }</td>
			</tr>
			<tr>
				<td>소개</td>
				<td id="attractionContent">${attraction.attractionContent }</td>
			</tr>
			<tr>
				<td>평균 별점</td>
				<td>구현하기</td>
			</tr>
		</table>
	</form>
	
</body>
</html>