<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 목록</title>
</head>
<body>
	<h1>예약 목록</h1>
	<table border="1">
		
			<tr>
				<th>예약 번호</th>
				<th>예약된 숙소 이름</th>
				<th>예약 날짜</th>
				<th>체크인 시간</th>
				<th>체크아웃 시간</th>
				<th>숙소 형태</th>
				<th>인원</th>
				<th>가격</th>
				<th>수정일</th>
			</tr>
			<c:forEach var="r" items="${reservationList}">
			<tr>
				<td>${r.reservationId}</td>
				<td>${r.roomName}</td>
				<td>${r.checkInDate} ~ ${r.checkOutDate}</td>
				<td>${r.checkInTime}</td>
				<td>${r.checkOutTime}</td>
				<td>${r.roomForm}</td>
				<td>${r.peopleNum}</td>
				<td>${r.roomPrice}</td>
				<td>${r.updateDate}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>