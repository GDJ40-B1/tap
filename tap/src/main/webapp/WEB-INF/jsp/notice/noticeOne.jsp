<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 : | TAP</title>
  <meta content="" name="description">
  <meta content="" name="keywords">
<!-- Favicons -->
  <link href="${pageContext.request.contextPath}/resources/img/tap_favicon.png" rel="icon">
  <link href="${pageContext.request.contextPath}/resources/img/tap_favicon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
</head>
<body>

	<!-- start : mainHeader -->
    <div>
       <jsp:include page="/partial/mainHeader.jsp"></jsp:include>
    </div>
    <!-- end : mainHeader -->
   
 	<main id="main">
 	
 	<!-- ======= Breadcrumbs ======= -->
    <section id="breadcrumbs" class="breadcrumbs">
      	<div class="container">
        	<div class="d-flex justify-content-between align-items-center">
          	<h2>공지사항 상세보기</h2>
        	</div>
    	</div>
    
	    <section id="list" class="list">
	      <div class="container">
			<a href="${pageContext.request.contextPath}/noticeList">리스트로</a>
			<input type="hidden" name="noticeId" value="${noticeId}" readonly="readonly">
			<br>
			<table border="1">
				<tr>
					<td>제목 :</td>
					<td>${notice.title}</td>
				</tr>
				<tr>
					<td>내용 :</td>
					<td>${notice.content}</td>
				</tr>
				
			</table>		
				<c:if test="${loginUser.userLevel eq 'system_admin'}">
					<div>
						<a href="${pageContext.request.contextPath}/systemAdmin/modifyNotice?noticeId=${notice.noticeId}">수정</a>
						
						<a href="${pageContext.request.contextPath}/systemAdmin/deleteNotice?noticeId=${notice.noticeId}">삭제</a>
					</div>
				</c:if>
			</div>
	    </section>	
	</section><!-- End Breadcrumbs -->
	
	</main><!-- End #main -->
	
    <!-- start : mainFooter -->
    <div>
       <jsp:include page="/partial/mainFooter.jsp"></jsp:include>
    </div>
    <!-- end : mainFooter -->
    
</body>
</html>