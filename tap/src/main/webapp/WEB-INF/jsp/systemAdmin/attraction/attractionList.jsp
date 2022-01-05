<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
	<title>명소 관리</title>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	
    <!-- Custom styles for this template-->
    <link href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">
	 
</head>
<body id="page-top">
	
    <!-- start : systemAdminHeader -->
    <div>
    	<jsp:include page="/partial/systemAdminHeader.jsp"></jsp:include>
    </div>
    <!-- end : systemAdminHeader -->
    
    <!-- start : content -->
	<div id="content" class="container-fluid">
		<!-- DataTales Example -->
	    <div class="card shadow mb-4">
	        <div class="card-header py-3">
	            <h6 class="m-0 font-weight-bold text-primary">명소 관리</h6>
	        </div>
	        <div class="card-body">
	            <div class="table-responsive">
	            	<form action="${pageContext.request.contextPath}/systemAdmin/attractionList" method="post">
	                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
	                    <thead>
	                        <tr>
								<th>명소 카테고리</th>
								<th>명소 이름</th>
								<th>전화번호</th>
								<th>승인여부</th>
	                        </tr>
	                    </thead>
	                    <tbody>
	                    	<c:forEach items="${list }" var="list">
								<tr>
									<td>${list.attractionCategory }</td>
									<td><a href="${pageContext.request.contextPath}/systemAdmin/attractionOne?attractionId=${list.attractionId}&detailAddressId=${list.detailAddressId}">${list.attractionName }</a></td>
									<td>${list.attractionPhoneNumber }</td>
									<td>${list.approvalStatus}</td>
								</tr>
							</c:forEach>
	                    </tbody>
	                </table>
	                </form>
	            </div>
	        </div>
	    </div>
	    
			<div>
			<c:if test="${currentPage > 1}">
				<a href="${pageContext.request.contextPath }/approvalAttractionList?currentPage=${currentPage-1}">이전</a>
			</c:if>
			<c:if test="${currentPage < lastPage}">
				<a href="${pageContext.request.contextPath }/approvalAttractionList?currentPage=${currentPage+1}">다음</a>
			</c:if>
		</div>

	</div>
	<!-- end : content -->
	
	<!-- start : systemAdminFooter -->
    <div>
       <jsp:include page="/partial/systemAdminFooter.jsp"></jsp:include>
    </div>
    <!-- end : systemAdminFooter -->
    
    <!-- Bootstrap core JavaScript-->
    <script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/vendor/bootstrap_sb/js/bootstrap.bundle.min.js"></script>
</body>
</html>

