<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
  
  <!-- Vendor CSS Files -->
  <link href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
  
  <!-- bootstrap -->
  <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">
</head>
<body>
 <!--  
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
          	<h2>공지사항</h2>
          		<ol>
            		<li><a href="${pageContext.request.contextPath}/">홈</a></li>
            		<li>공지사항 목록</li>
          		</ol>
        	</div>
    	</div>
	</section>
	
	<section id="list" class="list">
		<div class="container">

		<c:choose>
			<c:when test="${empty noticeList.list}">
				<div class="section-title" style="margin-top:50px;">
					<h2>작성한 공지사항이 없습니다.</h2>
				</div>	
			</c:when>				
			
			<c:otherwise>	
				<table class="table table-hover">
					<thead class="table-primary">
						<tr>
							<th>글 번호</th>
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
			</c:otherwise>
		</c:choose>
		</div>
    </section><!-- End Breadcrumbs -->
    
    				<!-- 페이징 -->
		<section id="pageNumber" class="pageNumber">
      		<div class="container">	
      			<nav>
	   				<ul class="pagination" style="justify-content: center;">
	   					<li>
							<c:if test="${currentPage!=1}">
								<div class="btn-group me-2" role="group" aria-label="First group" style="justify-content: center;">
									<a class="btn btn-secondary btn-sm" href="${pageContext.request.contextPath}/noticeList?currentNum=1">처음</a>
								</div>
							</c:if>
							<c:if test="${startPage > displayPage}">
								<div class="btn-group me-2" role="group" aria-label="First group" style="justify-content: center;">
									<a class="btn btn-primary" href="${pageContext.request.contextPath}/noticeList?currentNum=${startPage-displayPage}">이전</a>
								</div>
							</c:if>
							<c:set var="loop_flag" value="true" />
							<c:if test="${endPage<lastPage || endPage==lastPage}">
								<div class="btn-group me-2" role="group" aria-label="First group" style="justify-content: center;">
									<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
										<a class="btn btn-outline-primary" href="${pageContext.request.contextPath}/noticeList?currentNum=${i}">${i}</a>
									</c:forEach>
								</div>
							</c:if>
							<c:if test="${endPage>lastPage}">
								<c:forEach var="i" begin="${startPage}" end="${lastPage}" step="1">
									<div class="btn-group me-2" role="group" aria-label="First group" style="justify-content: center;">
										<a class="btn btn-outline-primary" href="${pageContext.request.contextPath}/noticeList?currentNum=${i}">${i}</a>
									</div>
								</c:forEach>
							</c:if>
							<c:if test="${endPage < lastPage}">
								<div class="btn-group me-2" role="group" aria-label="First group" style="justify-content: center;">
									<a class="btn btn-primary" class="btn btn-primary" href="${pageContext.request.contextPath}/noticeList?currentNum=${startPage+displayPage}">다음</a>
								</div>
							</c:if>
							<c:if test="${currentPage != lastPage && endPage != 0}">
								<div class="btn-group me-2" role="group" aria-label="First group" style="justify-content: center;">
									<a class="btn btn-secondary btn-sm" href="${pageContext.request.contextPath}/noticeList?currentNum=${lastPage}">끝</a>
								</div>
							</c:if>
						</li>
					</ul>
				</nav>
			</div>
	    </section>
    
	</main><!-- End #main -->
	
	<!-- start : mainFooter -->
    <div>
       <jsp:include page="/partial/mainFooter.jsp"></jsp:include>
    </div>
    <!-- end : mainFooter -->
</body>
</html>