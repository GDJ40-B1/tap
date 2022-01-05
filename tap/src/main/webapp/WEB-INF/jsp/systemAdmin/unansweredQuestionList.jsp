<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
	<title>문의 미답변 리스트</title>
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
	            <h6 class="m-0 font-weight-bold text-primary">문의 미답변 리스트</h6>
	            <a href="${pageContext.request.contextPath}/systemAdmin/unansweredQuestionList?writerCategory=member">회원</a>
				<a href="${pageContext.request.contextPath}/systemAdmin/unansweredQuestionList?writerCategory=host">호스트</a>
	        </div>
	        <div class="card-body">
	            <div class="table-responsive">
	                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
	                    <thead>
	                        <tr>
	                            <th>글 번호</th>
								<th>카테고리</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
	                        </tr>
	                    </thead>
	                    <tfoot>
	                        <tr>
	                            <th>글 번호</th>
								<th>카테고리</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
	                        </tr>
	                    </tfoot>
	                    <tbody>
	                    	<c:forEach var="q" items="${questionList}">
								<tr>
									<td>${q.questionId}</td>
									<td>${q.writerCategory}</td>
									<td><a href="${pageContext.request.contextPath}/questionOne?questionId=${q.questionId}&secretStatus=${q.secretStatus}">${q.questionTitle}</a></td>
									<td>${q.writerId}</td>
									<td>${q.createDate}</td>
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

