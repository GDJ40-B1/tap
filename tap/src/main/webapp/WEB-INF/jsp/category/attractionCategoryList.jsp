<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.js"></script> 
<meta charset="UTF-8">
<title>명소 카테고리</title>

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
				<li class="breadcrumb-item active" aria-current="page">명소 카테고리</li>
			</ol>
		</nav>
		
		<div class="card shadow mb-4">
	        <div class="card-header py-3">
	        	<div class="d-flex justify-content-between align-items-center">
		            <h6 class="m-0 font-weight-bold text-primary">명소 카테고리</h6>
		            <ol style="list-style: none;">
						<li>
							<a class="btn btn-danger" href="${pageContext.request.contextPath}/systemAdmin/addAttractionCategory">카테고리 추가</a>
						</li>
					</ol>
				</div>
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
	                    	<c:forEach items="${attractionCategoryList}" var="ac">
								<tr>
									<td><input class="btn btn-outline-primary" type="text" value="${ac.attractionCategory}" readonly="readonly"></td>
									<td>
										<form action="${pageContext.request.contextPath}/systemAdmin/modifyAttractionCategory" method="post">
											<input type="hidden" name="attractionCategory" value="${ac.attractionCategory}">
											<input class="btn btn-outline-dark" type="text" name="newAttractionCategory" value="${ac.attractionCategory}">
											<button class="btn btn-secondary" type="submit">수정하기</button>
										</form>
									<td>
										<form action="${pageContext.request.contextPath}/systemAdmin/removeAttractionCategory" method="post">
											<input type="hidden" name="attractionCategory" value="${ac.attractionCategory}">
											<button class="btn btn-secondary" type="submit">삭제하기</button>
										</form>
									</td>
								</tr>
							</c:forEach>
	                    </tbody>
	                </table>
	            </div>
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

