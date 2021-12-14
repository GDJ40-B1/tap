<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.js"></script> 
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body id="page-top">
	<!-- start : hostHeader -->
    <div>
    	<jsp:include page="/partial/hostHeader.jsp"></jsp:include>
    </div>
    <!-- end : hostHeader -->
    
    <!-- start : content -->
	<div id="content" class="container-fluid">
	
		<!-- breadcrumb : 3 level이 되는 부분부터 사용 -->
		<nav aria-label="breadcrumb">
			<ol class="breadcrumb bg-gray-100">
				<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/hostMyPage">홈</a></li>
				<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/host/roomList">숙소목록</a></li>
				<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/host/roomOne?roomId=${room.roomId }&detailAddressId=${room.detailAddressId }">상세보기</a></li>
				<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/host/couponList?roomId=${room.roomId }&detailAddressId=${room.detailAddressId }">쿠폰목록</a></li>
				<li class="breadcrumb-item active" aria-current="page">쿠폰생성</li>
			</ol>
		</nav>
		
		<h1 class="h3 mb-4 text-gray-800">쿠폰 생성</h1>
		<br>
		
		<form id="addCouponForm" action="${pageContext.request.contextPath}/host/addCoupon" method="post">
			<!-- 전달을 위한 값 hidden처리 -->
			<input type="hidden" name="roomId" value="${room.roomId }">
			<input type="hidden" name="detailAddressId" value="${room.detailAddressId }">
			
			<div class="form-group row">
				<div class="col-sm-6 mb-3 mb-sm-0">
					<label>쿠폰명</label>
					<input type="text" class="form-control form-control-user" name="couponName" id="couponName" placeholder="쿠폰명을 입력하세요">
				</div>
				
				<div class="col-sm-6 mb-3 mb-sm-0">
					<label>발급 수량</label>
					<input type="number" class="form-control form-control-user" name="couponQuantity" id="couponQuantity" placeholder="발급 수량을 입력하세요">
				</div>
			</div>
			
			<div class="form-group row">
				<!-- select 방식으로 변경 예정 -->
				<div class="col-sm-6 mb-3 mb-sm-0">
					<label>할인율</label>
					<input type="number" class="form-control form-control-user" name="discount" id="discount" placeholder="할인률을 입력하세요">
				</div>
				
				<div class="col-sm-6 mb-3 mb-sm-0">
					<label>쿠폰형태</label>
					<select class="form-control" name="couponType">
						<option>%</option>
						<option>원</option>
					</select>
				</div>
			</div>
			
			<div class="form-group row">
				<!-- select 방식으로 변경 예정 -->
				<div class="col-sm-6 mb-3 mb-sm-0">
					<label>쿠폰 사용 시작일</label>
					<input type="date" class="form-control form-control-user" name="couponEffectiveDate" id="couponEffectiveDate">
				</div>
				
				<div class="col-sm-6 mb-3 mb-sm-0">
					<label>쿠폰 사용 종료일</label>
					<input type="date" class="form-control form-control-user" name="couponExpirationDate" id="couponExpirationDate">
				</div>
			</div>
			
			<br>
			<button type="button" class="btn btn-primary btn-lg btn-block"  id="addBtn">쿠폰 생성</button>
			<br>
		</form>
		
	</div>
	
	<!-- start : hostFooter -->
	<div>
    	<jsp:include page="/partial/hostFooter.jsp"></jsp:include>
    </div>
    <!-- end : hostFooter -->
	
	<!-- input 유효성 검사 -->
	<script>
	
		// 쿠폰 생성을 클릭했을 때
		$('#addBtn').click(function(){
			if($('#couponName').val()==''){
				alert('쿠폰명을 입력하세요');
			} else if($('#couponQuantity').val()==''){
				alert('발급 수량을 입력하세요');
			} else if($('#discount').val()==''){
				alert('할인률을 입력하세요');
			} else if($('#couponEffectiveDate').val()==''){
				alert('쿠폰 사용 시작일을 선택하세요');
			} else if($('#couponExpirationDate').val()==''){
				alert('쿠폰 사용 종료일을 선택하세요');
			} else{
				$('#addCouponForm').submit();
			}
		});
	</script>
</body>
</html>