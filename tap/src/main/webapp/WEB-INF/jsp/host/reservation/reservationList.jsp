<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 : 목록 | TAP</title>
  <meta content="" name="description">
  <meta content="" name="keywords">
<!-- Favicons -->
  <link href="${pageContext.request.contextPath}/resources/img/tap_favicon.png" rel="icon">
  <link href="${pageContext.request.contextPath}/resources/img/tap_favicon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
</head>
<body id="page-top">
	<!-- start : hostHeader -->
    <div>
    	<jsp:include page="/partial/hostHeader.jsp"></jsp:include>
    </div>
    <!-- end : hostHeader -->
	    
   	<div id="content" class="container-fluid">
	<!-- DataTales Example -->
	    <div class="card shadow mb-4">
	        <div class="card-header py-3">
	             <h5 class="m-0 font-weight-bold text-primary">내 숙소 예약 내역</h5>
	        </div>
	        <div class="card-body">
	            <div class="table-responsive">	
	<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0" style="text-align: center; margin-left: auto; margin-right: auto;">
		<thead>
			<tr>
				<th width="70px">예약 번호</th>
				<th width="70px">숙소 이름</th>
				<th>예약 날짜</th>
				<th>회원 아이디</th>
				<th width="90px">체크인 시간</th>
				<th width="110px">체크아웃 시간</th>
				<th width="70px">숙소 형태</th>
				<th width="70px">최대 인원</th>
				<th>가격</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${result2.reservationList}" var="reservation" >
			<tr>
				<td>${reservation.reservationId}</td>
				<td><a href="${pageContext.request.contextPath}/roomOne?roomId=${reservation.room.roomId}&detailAddressId=${reservation.room.detailAddressId}">${reservation.room.roomName}</a></td>
				<td>${reservation.checkInDate} ~ ${reservation.checkOutDate}</td>
				<td>${reservation.memberId}</td>
				<td>${reservation.room.checkInTime}</td>
				<td>${reservation.room.checkOutTime}</td>
				<td>${reservation.room.roomForm}</td>
				<td>${reservation.peopleNum}명</td>
				<td>${reservation.finalPaymentPrice}원</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	 
	            
	</div>
	        </div>
	    </div>
	    </div>			
	<button type="button" class="btn btn-info"><a href="${pageContext.request.contextPath}/reservationList">전체 예약 보기</a></button>
	<!-- start : hostFooter -->
    <div>
       <jsp:include page="/partial/hostFooter.jsp"></jsp:include>
    </div>
    <!-- end : hostFooter -->
   
   
	</body>
</html>