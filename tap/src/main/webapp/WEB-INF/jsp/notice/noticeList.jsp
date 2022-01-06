<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
  	table {	
		text-align: center;
	}
  </style>

  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta charset="UTF-8">
<title>공지사항 : 목록 | TAP</title>
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
    <br>
  	<br>
  	<br>
    <main id="main">
    
    <!-- ======= Breadcrumbs ======= -->
    <section id="breadcrumbs" class="breadcrumbs">
    	<div class="container">
        	<div class="d-flex justify-content-between align-items-center">
          	<h2>공지사항</h2>
          		<ol>
          			<li>
          				<c:if test="${loginUser.userLevel eq 'system_admin'}">
						<div>
							<form action="${pageContext.request.contextPath}/systemAdmin/addNotice" method="get">
								<button class="btn btn-outline-primary" type="submit">공지사항 추가</button>
							</form>
						</div> 
						</c:if>
          			</li>
          		</ol>
        	</div>
    	</div>
	
		<section id="list" class="list">
	      <div class="container">
				
				
				<table class="table table-hover">
					<thead class="table-primary">
						<tr>
							<th>No</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${noticeList.list}" var="notice" >
							<tr>
								<td>${notice.noticeId}</td>
								<td><a href="${pageContext.request.contextPath}/noticeOne?noticeId=${notice.noticeId}">${notice.title}</a></td>
								<td>${notice.systemAdminId}</td>
								<td>${notice.createDate}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<!-- 페이징 -->
				<section id="pageNumber" class="pageNumber">
      			<div class="container">
				<div>
					<c:if test="${currentPage!=1}">
						<a class="btn btn-primary" href="${pageContext.request.contextPath}/noticeList?currentNum=1">처음</a>
					</c:if>
					<c:if test="${startPage > displayPage}">
						<a class="btn btn-primary" href="${pageContext.request.contextPath}/noticeList?currentNum=${startPage-displayPage}">이전</a>
					</c:if>
					<c:set var="loop_flag" value="true" />
					<c:if test="${endPage<lastPage || endPage==lastPage}">
						<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
							<a class="btn btn-outline-primary" href="${pageContext.request.contextPath}/noticeList?currentNum=${i}">${i}</a>
						</c:forEach>
					</c:if>
					<c:if test="${endPage>lastPage}">
						<c:forEach var="i" begin="${startPage}" end="${lastPage}" step="1">
							<a class="btn btn-outline-primary" href="${pageContext.request.contextPath}/noticeList?currentNum=${i}">${i}</a>
						</c:forEach>
					</c:if>
					<c:if test="${endPage < lastPage}">
						<a class="btn btn-primary" class="btn btn-primary" href="${pageContext.request.contextPath}/noticeList?currentNum=${startPage+displayPage}">다음</a>
					</c:if>
					<c:if test="${currentPage != lastPage && endPage != 0}">
						<a class="btn btn-primary" href="${pageContext.request.contextPath}/noticeList?currentNum=${lastPage}">끝</a>
					</c:if>
				</div>
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