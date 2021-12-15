<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>deleteReservation.jsp</title>
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
   
   <h5>예약을 취소하시겠습니까?</h5>
   
   <form action="${pageContext.request.contextPath}/deleteReservation?reservationId=${reservation.reservationId}" method="post">
   	   <div>회원 아이디 :</div>
	   <div><input type="text" name="memberId" readonly="readonly" value="${reservation.memberId}"></div>
	   <div>체크인 :</div>
	   <input type="date" name="checkInDate" readonly="readonly" value="${reservation.checkInDate}">
	   <div>체크아웃 :</div>
	   <input type="date" name="checkOutDate" readonly="readonly" value="${reservation.checkOutDate}">
	   <div>인원</div>
	   <input type="text" name="peopleNum" readonly="readonly" value="${reservation.peopleNum}">
   
	   <div>
	   		<button type="submit">삭제</button>
	   </div>
   </form>
   
   
   
   <!-- start : mainFooter -->
   <div>
      <jsp:include page="/partial/mainFooter.jsp"></jsp:include>
   </div>
   <!-- end : mainFooter -->
</body>
</html>