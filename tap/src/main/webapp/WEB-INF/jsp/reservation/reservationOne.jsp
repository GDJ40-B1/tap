<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 정보보기</title>
</head>
<body>
	<!-- start : mainHeader -->
   <div>
      <jsp:include page="/partial/mainHeader.jsp"></jsp:include>
   </div>
   <!-- end : mainHeader -->
   
   <br>
   <br>
   <br>
	<a href="${pageContext.request.contextPath}/reservationList">리스트로</a>
	<h1>예약 상세보기</h1>
	<br>
	<table border="1">
		<tr>
			<td>회원 아이디 :</td>
			<td>${reservation.memberId}</td>
		</tr>
		<tr>
			<td>체크인 날짜 :</td>
			<td>${reservation.checkInDate}일</td>
		</tr>
		<tr>
			<td>체크아웃 날짜 :</td>
			<td>${reservation.checkOutDate}일</td>
		</tr>
		<tr>
			<td>인원수 :</td>
			<td>${reservation.peopleNum}명</td>
		</tr>
		<tr>
			<td>최종 작성일 :</td>
			<td>${reservation.updateDate}</td>
		</tr>
		
	</table>
		<div>
			<a href="${pageContext.request.contextPath}/modifyReservation?reservationId=${reservation.reservationId}">수정</a>
			
			<a href="${pageContext.request.contextPath}/deleteReservation?reservationId=${reservation.reservationId}">삭제</a>
		</div>
		<br>
		<br>
		<br>
		<br>
		<br>
	
	<!-- start : mainFooter -->
   <div>
      <jsp:include page="/partial/mainFooter.jsp"></jsp:include>
   </div>
   <!-- end : mainFooter -->
</body>
</html>