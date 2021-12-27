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
		<div class="form-group row">
			<div class="col-sm-4">
				<a href="${pageContext.request.contextPath}/systemAdmin/roomCategoryList">
					<img src="${pageContext.request.contextPath}/resources/img/category/room_category.PNG" class="rounded" style="width: 100%;">
				</a>
			</div>
			
			<div class="col-sm-4">
				<img src="${pageContext.request.contextPath}/resources/img/category/attraction_category.PNG" class="rounded" style="width: 100%;">
			</div>
			
			<div class="col-sm-4">
				<img src="${pageContext.request.contextPath}/resources/img/category/attraction_category.PNG" class="rounded" style="width: 100%;">
			</div>
		</div>
		
		<div class="form-group row">
			<div class="col-sm-4">
				<img src="${pageContext.request.contextPath}/resources/img/category/room_category.PNG" class="rounded" style="width: 100%;">
			</div>
			
			<div class="col-sm-4">
				<img src="${pageContext.request.contextPath}/resources/img/category/attraction_category.PNG" class="rounded" style="width: 100%;">
			</div>
			
			<div class="col-sm-4">
				<img src="${pageContext.request.contextPath}/resources/img/category/attraction_category.PNG" class="rounded" style="width: 100%;">
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

