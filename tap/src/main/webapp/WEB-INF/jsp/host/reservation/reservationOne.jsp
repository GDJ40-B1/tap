<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 : 상세 | TAP</title>
  <meta content="" name="description">
  <meta content="" name="keywords">
<!-- Favicons -->
  <link href="${pageContext.request.contextPath}/resources/img/tap_favicon.png" rel="icon">
  <link href="${pageContext.request.contextPath}/resources/img/tap_favicon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
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
			<td>최대 인원수 :</td>
			<td>${reservation.peopleNum}명</td>
		</tr>
		<tr>
			<td>최종 작성일 :</td>
			<td>${reservation.updateDate}</td>
		</tr>
		
	</table>
		<div>
			<!--  <a href="${pageContext.request.contextPath}/modifyReservation?reservationId=${reservation.reservationId}">예약수정</a> -->
			
			<!-- reservationOne까지는 누구나 볼 수 있지만 예약삭제는 로그인 한 사람만 볼 수 있도록 하려함 삭제는 회원이 자기가 한 예약을 그리고 호스트가 삭제할 수 있도록 하겠다.  -->
		<c:if test="${loginUser.userLevel == 'member' || loginUser.userLevel == 'host' || loginUser.userLevel == 'system_admin'}">
			<a href="${pageContext.request.contextPath}/deleteReservation?reservationId=${reservation.reservationId}">예약삭제</a>
		</c:if>
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