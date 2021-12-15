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
				<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/host/roomOne?roomId=${room.roomId }&detailAddressId=${room.detailAddressId }">숙소상세보기</a></li>
				<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/host/couponList?roomId=${room.roomId }&detailAddressId=${room.detailAddressId }">쿠폰목록</a></li>
				<li class="breadcrumb-item active" aria-current="page">쿠폰상세보기</li>
			</ol>
		</nav>
		<br>
		
		<!-- 호스트정보 카드 -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">쿠폰 상세보기</h6>
			</div>
			<div class="card-body">
				<h4 class="small font-weight-bold">쿠폰명<span id="roomName" class="float-right">${coupon.couponName }</span></h4>
				<h4 class="small font-weight-bold">할인율<span id="address" class="float-right">${coupon.discount }${coupon.couponType }</span></h4>
				<h4 class="small font-weight-bold">발급수량<span class="float-right">${coupon.couponQuantity } 개</span></h4>
				<h4 class="small font-weight-bold">쿠폰 사용 시작일<span class="float-right">${coupon.couponEffectiveDate }</span></h4>
				<h4 class="small font-weight-bold">쿠폰 사용 종료일<span class="float-right">${coupon.couponExpirationDate }</span></h4>
				<h4 class="small font-weight-bold">쿠폰 등록일<span class="float-right">${coupon.createDate }</span></h4>
				<h4 class="small font-weight-bold">쿠폰 수정일<span class="float-right">${coupon.updateDate }</span></h4>
			</div>
		</div>
		
		<!-- 추후에 남은 수량, 회원들이 발급한 수량, 사용수량등을 보여주면 좋을듯 함 -->
		
		<a href="${pageContext.request.contextPath}/host/modifyCoupon?roomId=${room.roomId}&detailAddressId=${room.detailAddressId}&couponId=${coupon.couponId}">쿠폰 수정</a>
   		<a href="${pageContext.request.contextPath}/host/removeCoupon?roomId=${room.roomId}&detailAddressId=${room.detailAddressId}&couponId=${coupon.couponId}">쿠폰 삭제</a>
	</div>
	<!-- end : content -->
	
	<!-- start : hostFooter -->
    <div>
       <jsp:include page="/partial/hostFooter.jsp"></jsp:include>
    </div>
    <!-- end : hostFooter -->
</body>
</html>

