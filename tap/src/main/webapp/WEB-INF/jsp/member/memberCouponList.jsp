<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
	<title>보유 쿠폰</title>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	
	<!-- Favicons -->
    <link href="${pageContext.request.contextPath}/resources/img/tap_favicon.png" rel="icon">
    <link href="${pageContext.request.contextPath}/resources/img/tap_favicon.png" rel="apple-touch-icon">
	
    <!-- Custom styles for this template-->
    <link href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">
	 
</head>
<body id="page-top">
	
    <!-- start : hostHeader -->
    <div>
    	<jsp:include page="/partial/memberHeader.jsp"></jsp:include>
    </div>
    <!-- end : hostHeader -->
    
    <!-- start : content -->
	<div id="content" class="container-fluid">
		<!-- DataTales Example -->
	    <div class="card shadow mb-4">
	        <div class="card-header py-3">
	            <h6 class="m-0 font-weight-bold text-primary">보유 쿠폰</h6>
	        </div>
	        <div class="card-body">
	            <div class="table-responsive">
	                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
	                    <thead>
	                        <tr>
	                            <th>no.</th>
	                            <th>적용 숙소</th>
	                            <th>쿠폰명</th>
	                            <th>할인률</th>
	                            <th>사용 시작일</th>
	                            <th>사용 종료일</th>
	                        </tr>
	                    </thead>
	                    <tbody>
	                    	<c:forEach items="${couponList }" var="c">
								<tr>
									<td>${c.memberCouponId }</td>
									<td><a href="${pageContext.request.contextPath}/roomOne?roomId=${c.room.roomId}&detailAddressId=${c.room.detailAddressId }">${c.room.roomName }</a></td>
									<td>${c.coupon.couponName }</td>
									<td>${c.coupon.discount }${c.coupon.couponType }</td>
									<td>${c.coupon.couponEffectiveDate }</td>
									<td>${c.coupon.couponExpirationDate }</td>
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
       <jsp:include page="/partial/memberFooter.jsp"></jsp:include>
    </div>
    <!-- end : hostFooter -->
</body>
</html>

