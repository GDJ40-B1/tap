<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
	<title>탈퇴 내역 리스트</title>
	<!-- Favicons -->
	<link href="${pageContext.request.contextPath}/resources/img/tap_favicon.png" rel="icon">
	
	<script src="http://code.jquery.com/jquery-latest.js"></script> 
</head>
<body id="page-top">

    <!-- start : hostHeader -->
    <div>
    	<jsp:include page="/partial/systemAdminHeader.jsp"></jsp:include>
    </div>
    <!-- end : hostHeader -->
    
    <!-- start : content -->
	<div id="content" class="container-fluid">
		<!-- DataTales Example -->
	    <div class="card shadow mb-4">
	        <div class="card-header py-3">
	            <h6 class="m-0 font-weight-bold text-primary">탈퇴 내역 - 탈퇴 후 30일 경과 시 자동 삭제</h6>
	        </div>
	        <div class="card-body">
	            <div class="table-responsive">
	                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
	                    <thead>
	                        <tr>
	                            <th>탈퇴 ID</th>
	                            <th>탈퇴일</th>
	                            <th>내역 삭제</th>
	                        </tr>
	                    </thead>
	                    <tfoot>
	                        <tr>
	                            <th>탈퇴 ID</th>
	                            <th>탈퇴일</th>
	                            <th>내역 삭제</th>
	                        </tr>
	                    </tfoot>
	                    <tbody>
	                    	<c:forEach items="${list}" var="w">
								<tr>
									<td>${w.memberId}</td>
									<td>${w.createDate}</td>
									<td><a href="${pageContext.request.contextPath}/systemAdmin/removeWithdrawal?userId=${w.memberId}">삭제</a></td>
								</tr>
							</c:forEach>
	                    </tbody>
	                </table>
	            </div>
	        </div>
	    </div>
	</div>
	<!-- end : content -->
	
	<!-- start : hostFooter -->
    <div>
       <jsp:include page="/partial/systemAdminFooter.jsp"></jsp:include>
    </div>
    <!-- end : hostFooter -->
</body>
</html>

