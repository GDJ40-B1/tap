<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
	<title>공지사항 작성</title>
	
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
	                <form action="${pageContext.request.contextPath}/systemAdmin/addNotice" method="post">
	              		 <input type="hidden" name="systemAdminId" value="${systemAdminId}"> 	
	              		 <div>[제목]</div>	
	              		 <div><input type="text" name="title"></div><br>
	              		 
	              		 <div>[내용]</div>
	              		 <textarea rows="5" cols="50" name="content" placeholder="내용을 입력해주세요"></textarea>
	              		 
	              		 <div>
	              		 	<button type="submit">작성</button>
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
</body>
</html>

