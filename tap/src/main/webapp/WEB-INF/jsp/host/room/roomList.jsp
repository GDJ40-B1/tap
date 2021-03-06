<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
	<title>나의 숙소</title>
	<!-- Favicons -->
	<link href="${pageContext.request.contextPath}/resources/img/tap_favicon.png" rel="icon">
	
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	
    <!-- Custom styles for this template-->
    <link href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">
	 
</head>
<body id="page-top">
	
    <!-- start : hostHeader -->
    <div>
    	<jsp:include page="/partial/hostHeader.jsp"></jsp:include>
    </div>
    <!-- end : hostHeader -->
    
    <!-- start : content -->
	<div id="content" class="container-fluid">
		<!-- DataTales Example -->
	    <div class="card shadow mb-4">
	        <div class="card-header py-3">
	            <h6 class="m-0 font-weight-bold text-primary">숙소 목록</h6>
	        </div>
	        <div class="card-body">
	            <div class="table-responsive">
	                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
	                    <thead>
	                        <tr>
	                            <th>no.</th>
	                            <th>숙소</th>
	                            <th>카테고리</th>
	                            <th>형태</th>
	                            <th>최소숙박일</th>
	                            <th>인원수</th>
	                            <th>가격</th>
	                            <th>페이지로 이동</th>
	                        </tr>
	                    </thead>
	                    <tbody>
	                    	<c:forEach items="${roomList }" var="room">
								<tr>
									<td>${room.roomId }</td>
									<td><a href="${pageContext.request.contextPath}/host/roomOne?roomId=${room.roomId}&detailAddressId=${room.detailAddressId }">${room.roomName }</a></td>
									<td>${room.roomCategory }</td>
									<td>${room.roomForm }</td>
									<td>${room.minDay }</td>
									<td>${room.peopleNum }</td>
									<td>${room.roomPrice }</td>
									<td><a href="${pageContext.request.contextPath}/roomOne?roomId=${room.roomId}&detailAddressId=${room.detailAddressId }">이동</a></td>
								</tr>
							</c:forEach>
	                    </tbody>
	                </table>
	            </div>
	        </div>
	    </div>
	    
	    <!-- 숙소 등록 버튼 -->
	    <a href="${pageContext.request.contextPath}/host/addRoom" class="btn btn-success btn-icon-split">
	    	<span class="icon text-white-50">
	    		<i class="fas fa-check"></i>
	    	</span>
	    	<span class="text">숙소를 등록하시겠습니까?</span>
	    </a>
	</div>
	<!-- end : content -->
	
	<!-- start : hostFooter -->
    <div>
       <jsp:include page="/partial/hostFooter.jsp"></jsp:include>
    </div>
    <!-- end : hostFooter -->
    
    <!-- Bootstrap core JavaScript-->
    <script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/vendor/bootstrap_sb/js/bootstrap.bundle.min.js"></script>
</body>
</html>

