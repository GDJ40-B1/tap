<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
	<title>공지사항 작성</title>
	
	<style>
		@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;500;700&display=swap');
		#font li, h4 {
			font-family: 'Noto Sans KR', sans-serif;
			font-weight: 700;
		} 
	</style>
	
	<!-- Favicons -->
	<link href="${pageContext.request.contextPath}/resources/img/tap_favicon.png" rel="icon">
	
	<script src="http://code.jquery.com/jquery-latest.js"></script> 
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
	        <!-- breadcrumb : 2 level이 되는 부분부터 사용 -->
			<nav aria-label="breadcrumb">
				<ol class="breadcrumb bg-gray-100">
					<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/systemAdmin/noticeList">공지사항 관리</a></li>
					<li class="breadcrumb-item active" aria-current="page">공지사항 작성</li>
				</ol>
			</nav>
	        <div class="card-body">
	            <div class="table-responsive">
	                <form id="addNoticeForm" action="${pageContext.request.contextPath}/systemAdmin/addNotice" method="post">
	              		 <input type="hidden" name="systemAdminId" value="${systemAdminId}"> 	
	              		 <div class="form-group">
						 	<h4><label class="col-form-label mt-4" for="inputDefault">[제목]</label></h4>
							<input type="text" class="form-control-sm btn btn-primary" style="text-align:left;" name="title" id="title">
						 </div>
	              		 
	              		 <div class="form-group">
					     	<h4><label for="exampleTextarea" class="form-label mt-4">[내용]</label></h4>
					     	<textarea class="btn btn-primary" name="content" style="text-align:left;" rows="3" cols="80"></textarea>
					     </div>
	              		 
	              		 <div>
	              		 	<button class="btn btn-outline-primary" type="button" id="addNoticeBtn">작성</button>
	              		 </div>
	                </form>
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
    
    <!-- 공지사항 작성 버튼 클릭 시 -->
    <script>
	    $('#addNoticeBtn').click(function() {
			if ($('#title').val() == '') {
				alert('제목을 입력해주세요');
				return;
			} 
			
			$('#addNoticeForm').submit();
		});
    </script>
</body>
</html>