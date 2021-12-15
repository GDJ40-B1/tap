<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modifyReservation.jsp</title>
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
   
   	   
	   
   <form action="${pageContext.request.contextPath}/modifyReservation?reservationId=${reservation.reservationId}" method="post">
	   
	   <div>회원 아이디 :</div>
	   <div>
	   		<input type="text" name="memberId" readonly="readonly" value="${reservation.memberId}">
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