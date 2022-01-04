<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.js"></script> 
<meta charset="UTF-8">
<title>카테고리 추가</title>

<!-- Favicons -->
<link href="${pageContext.request.contextPath}/resources/img/tap_favicon.png" rel="icon">

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
	        </div><br>
	        
        	<ul>
        		<li class="text-dark">
		        	<h4><b>숙소 카테고리</b></h4>
		        	<form action="${pageContext.request.contextPath}/systemAdmin/addRoomCategory" method="post">
		        		<div>
		        			<span>추가할 숙소 카테고리 명을 적어주세요.</span><br>
		        			<input class="btn btn-lg btn-outline-secondary" type="text" name="roomCategory">
		        		</div><br>
		        		<button class="btn btn-danger" type="submit">숙소카테고리 추가</button>
		        	</form>
		        	<hr>
		        </li>
        		<li class="text-dark">
        			<h4><b>명소 카테고리</b></h4>
		        	<form action="${pageContext.request.contextPath}/systemAdmin/addAttractionCategory" method="post">
		        		<div>
		        			<span>추가할 명소 카테고리 명을 적어주세요.</span><br>
		        			<input class="btn btn-lg btn-outline-secondary" type="text" name="attractionCategory">
		        		</div><br>	
		        		<button class="btn btn-danger" type="submit">명소카테고리 추가</button>
		        	</form>
		        	<hr>
        		</li>
        		<li class="text-dark">
        			<h4><b>숙소구성 카테고리</b></h4>
		        	<form action="${pageContext.request.contextPath}/systemAdmin/addRoomPart" method="post">
		        		<div>
		        			<span>추가할 숙소 구성명을 적어주세요.</span><br>
		        			<input class="btn btn-lg btn-outline-secondary" type="text" name="partName">
		        		</div><br>	
		        		<button class="btn btn-danger" type="submit">숙소구성명 추가</button>
		        	</form>
		        	<hr>
        		</li>
        		<li class="text-dark">
        			<h4 class="text-dark"><b>숙소비품 카테고리</b></h4>
		        	<form action="${pageContext.request.contextPath}/systemAdmin/addRoomAmenities" method="post">
			        	<div>	
			        		<span>추가할 숙소 비품명을 적어주세요.</span><br>
			        		<input class="btn btn-lg btn-outline-secondary" type="text" name="amenitiesName">
			        	</div><br>	
		        		<button class="btn btn-danger" type="submit">숙소비품명 추가</button>
		        	</form>
		        	<hr>
        		</li>
        	</ul>
        	
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

