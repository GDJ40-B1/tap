<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>예약 목록</title>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	
	<!-- Favicons -->
	<link href="${pageContext.request.contextPath}/resources/img/tap_favicon.png" rel="icon">
	
</head>
<body id="page-top">

    <!-- start : hostHeader -->
    <div>
    	<jsp:include page="/partial/hostHeader.jsp"></jsp:include>
    </div>
    <!-- end : hostHeader -->
    
    <!-- start : content -->
	<div id="content" class="container-fluid">
	
		<!-- start : hostRoomNavi -->
	    <div>
	    	<jsp:include page="/partial/hostRoomNavi.jsp"></jsp:include>
	    </div>
	    <!-- end : hostRoomNavi -->
	    <br>
		
		<!-- 테이블 -->
	    <div class="card shadow mb-4">
	        <div class="card-header py-3">
	            <h6 class="m-0 font-weight-bold text-primary">예약 목록</h6>
	        </div>
	        <div class="card-body">
	            <div class="table-responsive">
	                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
	                    <thead>
	                        <tr>
	                        	<th>no.</th>
	                            <th>체크인</th>
	                            <th>체크아웃</th>
	                            <th>인원수</th>
	                            <th>예약자</th>
	                            <th>결제금액</th>
	                            <th>예약일</th>
	                            <th>예약취소</th>
	                        </tr>
	                    </thead>
	                    <tbody>
	                    	<c:forEach items="${reservationList }" var="list">
								<tr>
									<th>${list.reservationId }</th>
									<td>${list.checkInDate }</td>
									<td>${list.checkOutDate }</td>
									<td>${list.peopleNum }</td>
									<td>${list.memberId }</td>
									<td>${list.finalPaymentPrice }</td>
									<td>${list.createDate }</td>
									<td><button id="${list.reservationId }-delBtn" type="button" class="btn btn-link">삭제</button></td>
								</tr>
							</c:forEach>
	                    </tbody>
	                </table>
	            </div>
	        </div>
	    </div>
	</div>
	<!-- end : content -->
	
	<!-- start : hostFooter -->
    <div>
       <jsp:include page="/partial/hostFooter.jsp"></jsp:include>
    </div>
    <!-- end : hostFooter -->
    
    <!-- 예약 삭제 클릭 시 -->
	<script>
		<c:forEach items="${reservationList}" var="list">
			$('#${list.reservationId }-delBtn').click(function(){
				if(confirm("해당 예약을 취소하시겠습니까?") == true){
					$(location).attr('href', "${pageContext.request.contextPath}/host/removeRoomReservationOne?roomId=${room.roomId}&detailAddressId=${room.detailAddressId }&reservationId=${list.reservationId }");
				} else{
					return;
				}
			});
		</c:forEach>
	</script>
</body>
</html>