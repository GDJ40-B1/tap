<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.js"></script> 
<meta charset="UTF-8">
<title>카테고리별 관리</title>
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
		<div class="form-group row">
			<div class="col-sm-5">
				<a href="${pageContext.request.contextPath}/systemAdmin/roomCategoryList">
					<img src="${pageContext.request.contextPath}/resources/img/category/room_category.PNG" class="rounded" style="width: 100%;">
				</a>
			</div>
			
			<div class="col-sm-5">
				<a href="${pageContext.request.contextPath}/systemAdmin/attractionCategoryList">
					<img src="${pageContext.request.contextPath}/resources/img/category/attraction_category.PNG" class="rounded" style="width: 100%;">
				</a>
			</div>
		</div>
		 
		<div class="form-group row">
			<div class="col-sm-5">
				<a href="${pageContext.request.contextPath}/systemAdmin/roomPartList">
					<img src="${pageContext.request.contextPath}/resources/img/category/part_category.png" class="rounded" style="width: 100%;">
				</a>
			</div>
			
			<div class="col-sm-5">
				<a href="${pageContext.request.contextPath}/systemAdmin/roomAmenitiesList">
					<img src="${pageContext.request.contextPath}/resources/img/category/amenities_category.png" class="rounded" style="width: 100%;">
				</a>
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

