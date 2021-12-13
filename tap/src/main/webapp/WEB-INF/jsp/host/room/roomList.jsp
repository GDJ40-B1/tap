<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
	<title>Insert title here</title>
	<script src="http://code.jquery.com/jquery-latest.js"></script> 
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
	                            <th>상세보기</th>
	                        </tr>
	                    </thead>
	                    <tfoot>
	                        <tr>
	                            <th>no.</th>
	                            <th>숙소</th>
	                            <th>카테고리</th>
	                            <th>형태</th>
	                            <th>최소숙박일</th>
	                            <th>인원수</th>
	                            <th>가격</th>
	                            <th>상세보기</th>
	                        </tr>
	                    </tfoot>
	                    <tbody>
	                    	<c:forEach items="${result.roomList }" var="list">
								<tr>
									<td>${list.roomId }</td>
									<td>${list.roomName }</td>
									<td>${list.roomCategory }</td>
									<td>${list.roomForm }</td>
									<td>${list.minDay }</td>
									<td>${list.peopleNum }</td>
									<td>${list.roomPrice }</td>
									<td><a href="${pageContext.request.contextPath}/host/roomOne?roomId=${list.roomId}&detailAddressId=${list.detailAddressId }">상세보기</a></td>
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
</body>
</html>

