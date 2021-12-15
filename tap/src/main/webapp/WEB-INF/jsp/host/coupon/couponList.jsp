<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
	<title>Insert title here</title>
	<script src="http://code.jquery.com/jquery-latest.js"></script> 
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
				<li class="breadcrumb-item active" aria-current="page">쿠폰목록</li>
			</ol>
		</nav>
		
		<!-- DataTales Example -->
	    <div class="card shadow mb-4">
	        <div class="card-header py-3">
	            <h6 class="m-0 font-weight-bold text-primary">쿠폰 목록</h6>
	        </div>
	        <div class="card-body">
	            <div class="table-responsive">
	                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
	                    <thead>
	                        <tr>
	                            <th>no.</th>
	                            <th>쿠폰 이름</th>
	                            <th>할인률</th>
	                            <th>수량</th>
	                            <th>사용 시작일</th>
	                            <th>사용 종료일</th>
	                            <th>상세보기</th>
	                        </tr>
	                    </thead>
	                    <tfoot>
	                        <tr>
	                            <th>no.</th>
	                            <th>쿠폰 이름</th>
	                            <th>할인률</th>
	                            <th>수량</th>
	                            <th>사용 시작일</th>
	                            <th>사용 종료일</th>
	                            <th>상세보기</th>
	                        </tr>
	                    </tfoot>
	                    <tbody>
	                    	<c:forEach items="${couponList }" var="list">
								<tr>
									<td>${list.couponId }</td>
									<td>${list.couponName }</td>
									<td>${list.discount }${list.couponType }</td>
									<td>${list.couponQuantity }</td>
									<td>${list.couponEffectiveDate }</td>
									<td>${list.couponExpirationDate }</td>
									<td><a href="${pageContext.request.contextPath}/host/couponOne?roomId=${room.roomId}&detailAddressId=${room.detailAddressId }&couponId=${list.couponId }">상세보기</a></td>
								</tr>
							</c:forEach>
	                    </tbody>
	                </table>
	            </div>
	        </div>
	    </div>
	    
	    <!-- 쿠폰 등록 버튼 -->
	    <a href="${pageContext.request.contextPath}/host/addCoupon?roomId=${room.roomId}&detailAddressId=${room.detailAddressId }" class="btn btn-success btn-icon-split">
	    	<span class="icon text-white-50">
	    		<i class="fas fa-check"></i>
	    	</span>
	    	<span class="text">쿠폰을 생성하시겠습니까?</span>
	    </a>
	</div>
	<!-- end : content -->
	
	<!-- start : hostFooter -->
    <div>
       <jsp:include page="/partial/hostFooter.jsp"></jsp:include>
    </div>
    <!-- end : hostFooter -->
</body>
</html>