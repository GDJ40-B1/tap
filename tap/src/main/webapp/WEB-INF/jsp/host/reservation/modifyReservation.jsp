<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 : 수정 | TAP</title>
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
   <br>
   <a href="${pageContext.request.contextPath}/reservationList">리스트로</a>
   
   	   
	<!-- 쓰일 일이 없을 것 같음 보통 예약을 취소하고 다시 잡지 수정은 잘 안하기때문.. -->   
   <form action="${pageContext.request.contextPath}/modifyReservation?reservationId=${reservation.reservationId}" method="post">
	   
	   <div>회원 아이디 :</div>
	   <div>
	   		<input type="text" name="memberId" readonly="readonly" value="${loginUser.userId}">
	   </div>
	   
	   <div>체크인 날짜 : </div>
	   <div>
	   		<input type="date" name="checkInDate" value="${reservation.checkInDate}">
	   </div>
	   <div>체크아웃 날짜 : </div>
	   <div>
	   		<input type="date" name="checkOutDate" value="${reservation.checkOutDate}">
	   </div>
	   <div>인원 : </div>
	   <div>
	   		<input type="text" name="peopleNum" value="${reservation.peopleNum}">인
	   </div>
	   
	   
	   <div>
	   		<button type="submit">수정</button>
	   </div>
   </form>
   
   
   
   <!-- start : mainFooter -->
   <div>
      <jsp:include page="/partial/mainFooter.jsp"></jsp:include>
   </div>
   <!-- end : mainFooter -->
</body>
</html>