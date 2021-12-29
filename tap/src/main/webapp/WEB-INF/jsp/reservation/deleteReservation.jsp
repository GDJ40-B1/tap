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
   
   <form id="deleteReservationForm" action="${pageContext.request.contextPath}/deleteReservation?reservationId=${reservation.reservationId}" method="post">
   	   <div>회원 아이디 :</div>
	   <div><input type="text" name="memberId" id="memberId" readonly="readonly" value="${loginUser.userId}"></div>
	   <div>체크인 :</div>
	   <input type="date" name="checkInDate" id="checkInDate" readonly="readonly" value="${reservation.checkInDate}">
	   <div>체크아웃 :</div>
	   <input type="date" name="checkOutDate" id="checkOutDate" readonly="readonly" value="${reservation.checkOutDate}">
	   <div>인원</div>
	   <input type="text" name="peopleNum" id="peopleNum" readonly="readonly" value="${reservation.peopleNum}">
   
	   <div>
	   		<button id="deleteBtn" type="button">삭제</button>
	   </div>
   </form>
   <!-- 유효성 검사 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script>
		$("#deleteBtn").click(function(){
			if($("#memberId").val() == "") {
				alert("회원 아이디가 입력되지 않았습니다. 로그인이 필요합니다.");
				return;
			} else if($("#checkInDate").val() == "") {
				alert("체크인 날짜가 입력되지 않았습니다.");
				return;
			} else if($("#checkOutDate").val() == "") {
				alert("체크아웃 날짜가 입력되지 않았습니다.");
				return;	
			} else if($("#peopleNum").val() == "")	{
				alert("인원수가 입력되지 않았습니다.");
				return;
			} else {
				$("#deleteReservationForm").submit();
			}
		});
		
	</script>
   
   
   <!-- start : mainFooter -->
   <div>
      <jsp:include page="/partial/mainFooter.jsp"></jsp:include>
   </div>
   <!-- end : mainFooter -->
</body>
</html>