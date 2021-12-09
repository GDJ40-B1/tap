<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addReservation.jsp</title>
</head>
<body>
	<h1>예약하기</h1>
	<form action="${pageContext.request.contextPath}/addReservation" method="post">
		<div>회원 아이디 :</div>
		<div><input type="text" name="memberId" readonly="readonly"value="${memberId}"></div>
		<div><input type="hidden" name="roomId" value="${roomId}"></div>
		<div>체크인 날짜 :</div>
		<div><input type=""></div>
		<div>인원 :</div>
		<div><input type=""></div>
		<div>체크아웃 날짜 :</div>
		<div><input type=""></div>
		
		<div><button type="submit">예약</button></div>
	
	</form>
</body>
</html>