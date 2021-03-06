<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<meta charset="UTF-8">
<title>예약 : 결제 | TAP</title>
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
   
   <main id="main">
	   <!-- ======= Breadcrumbs ======= -->
	    <section id="breadcrumbs" class="breadcrumbs">
	      <div class="container">
	
	        <div class="d-flex justify-content-between align-items-center">
	          <h2>결제</h2>
	          <ol>
	            <li><a href="${pageContext.request.contextPath}">홈</a></li>
	            <li><a href="${pageContext.request.contextPath}/roomList">숙소목록</a></li>
	            <li>결제</li>
	          </ol>
	        </div>
	      </div>
	    </section>
	    <!-- End Breadcrumbs -->
	    
   		<section class="event-list">
   			<div class="container">
   				<form id="addPaymentForm" action="${pageContext.request.contextPath}/member/addPayment" method="post">
   					<label class="form-label mt-4">회원</label>
				   <input class="form-control" type="text" name="memberId" value="${reservation.memberId}" readonly="readonly">
				   <br>
				   <!-- 숙소ID -->
				   <input class="form-control" type="hidden" name="roomId" value="${reservation.roomId}" readonly="readonly">
				   <label class="form-label mt-4">숙소명</label>
				   <input class="form-control" type="text" name="room.roomName" value="${reservation.room.roomName }" readonly="readonly">
				   <br>
				   <label class="form-label mt-4">체크인 날짜</label>
				   <input class="form-control" type="text" name="checkInDate" value="${reservation.checkInDate}" readonly="readonly">
				   <br>
				   <label class="form-label mt-4">체크아웃 날짜</label>
				   <input  class="form-control" type="text" name="checkOutDate" value="${reservation.checkOutDate}" readonly="readonly">
				   <br>
				   <label class="form-label mt-4">최대 인원수</label>
				   <input class="form-control" type="text" name="peopleNum" value="${reservation.peopleNum }" readonly="readonly">
				   <br>
				   <label class="form-label mt-4">쿠폰</label>
					<select class="form-control" id="coupon" name="couponId" onchange="chageLangSelect()">
						<option value="0">==쿠폰 없이 결제할게요==</option>
						<c:forEach items="${couponList }" var="c">
							<option value="${c.couponId }">${c.couponName }</option>
						</c:forEach>
					</select>
					<br>
				   <label class="form-label mt-4">예상 결제 금액</label>
				   <input type="hidden" id="realFinalPaymentPrice" value="${reservation.finalPaymentPrice }">
				   <input class="form-control" type="text" id="finalPaymentPrice" name="finalPaymentPrice" value="${reservation.finalPaymentPrice }" readonly="readonly">
				   <br>
				   <button type="button" id="paymentBtn" class="btn btn-outline-success">결제하기</button>
				</form>
			</div>
		</section>
	</main>
	
	<!-- start : mainFooter -->
   <div>
      <jsp:include page="/partial/mainFooter.jsp"></jsp:include>
   </div>
   <!-- end : mainFooter -->
   
   <script>
		$("#paymentBtn").click(function(){
			$("#addPaymentForm").submit();
		});
		
		function chageLangSelect(){
			var couponId = $("#coupon").val();
			var couponIdList = new Array();
			var couponPriceList = new Array();
			var cuoponTypeList = new Array();
			<c:forEach items="${couponList }" var="c">
				couponIdList.push("${c.couponId}");
				couponPriceList.push("${c.discount}");
				cuoponTypeList.push("${c.couponType}");
			</c:forEach>
			
			if(couponId==0){
				$('#finalPaymentPrice').val($('#realFinalPaymentPrice').val());
			} else{
				for(var i=0; i<couponIdList.length; i++){
					if(couponIdList[i]== couponId){
						if(cuoponTypeList[i] == '%'){
							$('#finalPaymentPrice').val($('#realFinalPaymentPrice').val()-($('#realFinalPaymentPrice').val()*couponPriceList[i]*0.01));
						} else if(cuoponTypeList[i] == '원'){
							if(($('#finalPaymentPrice').val()-couponPriceList[i])>0){
								$('#finalPaymentPrice').val($('#realFinalPaymentPrice').val()-couponPriceList[i]);
							} else{
								$('#coupon').val('0').prop("selected", true);
								$('#finalPaymentPrice').val($('#realFinalPaymentPrice').val());
								alert("결제 금액보다 큰 할인가의 쿠폰을 사용할 수 없습니다.");
							}
						}
					}
				}
			}
		}
	</script>
</body>
</html>
