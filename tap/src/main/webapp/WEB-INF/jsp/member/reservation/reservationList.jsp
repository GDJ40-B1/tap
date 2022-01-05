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
<body>
	<!-- start : mainHeader -->
   <div>
      <jsp:include page="/partial/memberHeader.jsp"></jsp:include>
   </div>
   <!-- end : mainHeader -->
   
  
	    
  
	<!-- DataTales Example -->
	    <div class="card shadow mb-4">
	        <div class="card-header py-3">
	             <h5 class="m-0 font-weight-bold text-primary">내 예약 내역</h5>
	        </div>
	        <div class="card-body">
	            <div class="table-responsive">
	                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0" style="text-align: center; margin-left: auto; margin-right: auto;">
		
			<tr>
				<th width="70px">예약 번호</th>
				<th width="70px">숙소 이름</th>
				<th>상세주소</th>
				<th>예약 날짜</th>
				<th width="90px">체크인 시간</th>
				<th width="110px">체크아웃 시간</th>
				<th width="75px">숙소 형태</th>
				<th width="70px">최대 인원</th>
				<th> 가격 </th>
				<th width="100px">수정일</th>
			</tr>
			<c:forEach items="${result3.reservationList}" var="reservation" >
			<tr>
				<td>${reservation.reservationId}</td>
				<td><a href="${pageContext.request.contextPath}/roomOne?roomId=${reservation.room.roomId}&detailAddressId=${reservation.room.detailAddressId}">${reservation.room.roomName}</a></td>
				<td>${reservation.address.detailAddress}</td>
				<td>${reservation.checkInDate} ~ ${reservation.checkOutDate}</td>
				<td>${reservation.room.checkInTime}</td>
				<td>${reservation.room.checkOutTime}</td>
				<td>${reservation.room.roomForm}</td>
				<td>${reservation.peopleNum}명</td>
				<td>${reservation.finalPaymentPrice}원</td>
				<td>${reservation.createDate}</td>
			</tr>
		</c:forEach>
	</table>
	</div>
	        </div>
	    </div>
	
	<!-- end : content -->
	
	            <button type="button" class="btn btn-info"><a href="${pageContext.request.contextPath}/roomList">예약하러 가기</a></button>
				<!-- 페이징 -->
				<nav style="margin-top: 50px">
		   			<ul class="pagination" style="justify-content: center;">
					    <c:if test="${result3.currentPage!=1}">
						    <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/member/reservationList?currentPage=<%=1 %>">처음</a></li>
						</c:if>
						
						<c:if test="${result3.currentnumPage>0}">
						    <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/member/reservationList?currentPage=${result3.pagePerPage*(result3.currentnumPage-1)+1 }">이전</a></li>
						</c:if>
						
						<c:forEach begin="0" end="${result3.pagePerPage-1}" step="1" var="i">
							<c:if test="${result3.lastPage>=(result3.pagePerPage*result3.currentnumPage)+i+1}">
							    <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/member/reservationList?currentPage=${(result3.pagePerPage*result.currentnumPage)+i+1 }">${(result3.pagePerPage*result3.currentnumPage)+i+1 }</a></li>
							</c:if>
						</c:forEach>
						    
						<c:if test="${result3.lastnumPage>result.currentnumPage}">
						    <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/member/reservationList?currentPage=${result3.pagePerPage*(result3.currentnumPage+1)+1 }">다음</a></li>
						</c:if>
						
						<c:if test="${result3.currentPage!=result3.lastPage && result3.lastPage!=0}">
						    <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/member/reservationList?currentPage=${result3.lastPage }">끝</a></li>
						</c:if>
					</ul>
				</nav>
			
	
	<!-- start : mainFooter -->
   <div>
      <jsp:include page="/partial/memberFooter.jsp"></jsp:include>
   </div>
   <!-- end : mainFooter -->
   
   
	</body>
</html>