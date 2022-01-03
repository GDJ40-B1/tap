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
	<!-- start : systemAdminHeader -->
    <div>
    	<jsp:include page="/partial/systemAdminHeader.jsp"></jsp:include>
    </div>
    <!-- end : systemAdminHeader -->
    
    <!-- start : content -->
	<div id="content" class="container-fluid">
		<!-- breadcrumb : 3 level이 되는 부분부터 사용 -->
		<nav aria-label="breadcrumb">
			<ol class="breadcrumb bg-gray-100">
				<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/systemAdminMyPage">홈</a></li>
				<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/systemAdmin/categoryList">카테고리별 관리</a></li>
				<li class="breadcrumb-item active" aria-current="page">카테고리 추가</li>
			</ol>
		</nav>
		
		<div class="card shadow mb-4">
	        <div class="card-header py-3">
	        	<div class="d-flex justify-content-between align-items-center">
		            <h6 class="m-0 font-weight-bold text-primary">카테고리 추가</h6>
				</div>
	        </div>
	        
	        <div>
	        	<h4>※ 숙소 카테고리</h4>
	        	<form action="${pageContext.request.contextPath}/systemAdmin/addRoomCategory" method="post">
	        		추가할 숙소 카테고리 명을 적어주세요<br>
	        		<input type="text" name="roomCategory">
	        		<button type="submit">숙소카테고리 추가</button>
	        	</form>
	        	<hr>
	        </div>
	        
	        <div>
	        	<h4>※ 명소 카테고리</h4>
	        	<form action="${pageContext.request.contextPath}/systemAdmin/addAttractionCategory" method="post">
	        		추가할 명소 카테고리 명을 적어주세요<br>
	        		<input type="text" name="attractionCategory">
	        		<button type="submit">명소카테고리 추가</button>
	        	</form>
	        	<hr>
	        </div>
	        
	        <div>
	        	<h4>※ 숙소구성 카테고리</h4>
	        	<form action="${pageContext.request.contextPath}/systemAdmin/addRoomPart" method="post">
	        		추가할 숙소 구성명을 적어주세요<br>
	        		<input type="text" name="partName">
	        		<button type="submit">숙소구성명 추가</button>
	        	</form>
	        	<hr>
	        </div>
	        
	        <div>
	        	<h4>※ 숙소비품 카테고리</h4>
	        	<form action="${pageContext.request.contextPath}/systemAdmin/addRoomAmenities" method="post">
	        		추가할 숙소 비품명을 적어주세요<br>
	        		<input type="text" name="amenitiesName">
	        		<button type="submit">숙소비품명 추가</button>
	        	</form>
	        	<hr>
	        </div>
		</div>
	</div>
	<!-- end : content -->
	
	<!-- start : systemAdminFooter -->
    <div>
       <jsp:include page="/partial/systemAdminFooter.jsp"></jsp:include>
    </div>
    <!-- end : systemAdminFooter -->
</body>
</html>

