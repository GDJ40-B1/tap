<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>숙소 등록하기</h1>
	<form action="${pageContext.request.contextPath}/addRoom" method="post">
		<div>
			숙소 : <input type="text" name="roomName">
		</div>
		<div>
			주소 : <input type="text" name="detailAddress">
		</div>
		<button type="submit">등록</button>
	</form>
</body>
</html>