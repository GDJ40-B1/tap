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
				<li class="breadcrumb-item active" aria-current="page">숙소 카테고리</li>
			</ol>
		</nav>
		
		<div class="card shadow mb-4">
	        <div class="card-header py-3">
	            <h6 class="m-0 font-weight-bold text-primary">숙소 카테고리</h6>
	        </div>
	        <div class="card-body">
	            <div class="table-responsive">
	                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
	                    <thead>
	                        <tr>
	                            <th>카테고리명</th>
	                            <th>수정하기</th>
	                            <th>삭제하기</th>
	                        </tr>
	                    </thead>
	                    <tbody>
	                    	<c:forEach items="${roomCategoryList }" var="rc">
								<tr>
									<td>${rc }</td>
									<td><a href="${pageContext.request.contextPath}/systemAdmin/modifyRoomCategory?roomCategory=${rc}">수정하기</a></td>
									<td><a href="${pageContext.request.contextPath}/systemAdmin/removeRoomCategory?roomCategory=${rc}">삭제하기</a></td>
								</tr>
							</c:forEach>
	                    </tbody>
	                </table>
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

