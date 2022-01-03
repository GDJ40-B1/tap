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
				<li class="breadcrumb-item active" aria-current="page">숙소구성 카테고리</li>
			</ol>
		</nav>
		
		<div class="card shadow mb-4">
	        <div class="card-header py-3">
	        	<div class="d-flex justify-content-between align-items-center">
		            <h6 class="m-0 font-weight-bold text-primary">숙소구성 카테고리</h6>
		            <ol style="list-style: none;">
						<li>
							<a class="btn btn-outline-dark" href="${pageContext.request.contextPath}/systemAdmin/addRoomPart">카테고리 추가</a>
						</li>
					</ol>
				</div>
	        </div>
	        <div class="card-body">
	            <div class="table-responsive">
	                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
	                    <thead>
	                        <tr>
	                            <th>구성명</th>
	                            <th>수정하기</th>
	                            <th>삭제하기</th>
	                        </tr>
	                    </thead>
	                    <tbody>
	                    	<c:forEach items="${roomPartList}" var="rp">
								<tr>
									<td><input type="text" value="${rp.partName}" readonly="readonly"></td>
									<td>
										<form action="${pageContext.request.contextPath}/systemAdmin/modifyRoomPart" method="post">
											<input type="hidden" name="partName" value="${rp.partName}">
											<input type="text" name="newPartName" value="${rp.partName}">
											<button type="submit">수정하기</button>
										</form>
									<td>
										<form action="${pageContext.request.contextPath}/systemAdmin/removeRoomPart" method="post">
											<input type="hidden" name="partName" value="${rp.partName}">
											<button type="submit">삭제하기</button>
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

