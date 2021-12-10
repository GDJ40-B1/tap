<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>검색 결과</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="${pageContext.request.contextPath}/resources/img/favicon.png" rel="icon">
  <link href="${pageContext.request.contextPath}/resources/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">

  <!-- =======================================================
  * Template Name: MeFamily - v4.7.0
  * Template URL: https://bootstrapmade.com/family-multipurpose-html-bootstrap-template-free/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
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
          <h2>숙소 검색 결과</h2>
        </div>
		
      </div>
    </section><!-- End Breadcrumbs -->

	<div class="container">
		
		<c:choose>
			<c:when test="${empty roomList}">
				<div>검색 결과가 없습니다.</div>
			</c:when>
			
			<c:otherwise>
				<c:forEach var="r" items="${roomList}">
					<div><a href="/tap/">${r.roomName}</a></div>
					<div>${r.roomIntro}</div>
					<div>최소 일수 : ${r.minDay} 최소 인원 :  ${r.peopleNum} 가격 : ${r.roomPrice}</div>
				</c:forEach>
				
				<c:if test="${roomCurrentPage > 1}">
					<a href="/tap/searchList?keyword=${keyword}&roomCurrentPage=${roomCurrentPage-1}&attractionCurrentPage=${attractionCurrentPage}">이전</a>
				</c:if>
				
				<c:forEach var="i" begin="${roomStartPage}" end="${roomEndPage}">
					<a href="/tap/searchList?keyword=${keyword}&roomCurrentPage=${i}&attractionCurrentPage=${attractionCurrentPage}"><c:out value="${i}"/></a>
				</c:forEach>
				
				<c:if test="${roomCurrentPage < roomLastPage}">
					<a href="/tap/searchList?keyword=${keyword}&roomcurrentPage=${roomCurrentPage+1}&attractionCurrentPage=${attractionCurrentPage}">다음</a>
				</c:if>					
			</c:otherwise>
		</c:choose>

	</div>
		
    <!-- ======= Breadcrumbs ======= -->
    <section id="breadcrumbs" class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h2>명소 검색 결과</h2>
        </div>
		
      </div>
    </section><!-- End Breadcrumbs -->
	
	<div class="container">

		<c:choose>
			<c:when test="${empty attractionList}">
				<div>검색 결과가 없습니다.</div>
			</c:when>
			
			<c:otherwise>
				<c:forEach var="a" items="${attractionList}">
					<div>[${a.attractionCategory}] <a href="/tap/">${a.attractionName}</a></div>
					<div>${a.attractionContent}</div>
				</c:forEach>
		
				<c:if test="${attractionCurrentPage > 1}">
					<a href="/tap/searchList?keyword=${keyword}&roomCurrentPage=${roomCurrentPage}&attractionCurrentPage=${attractionCurrentPage-1}">이전</a>
				</c:if>
				
				<c:forEach var="i" begin="${attractionStartPage}" end="${attractionEndPage}">
					<a href="/tap/searchList?keyword=${keyword}&roomCurrentPage=${roomCurrentPage}&attractionCurrentPage=${i}"><c:out value="${i}"/></a>
				</c:forEach>
				
				<c:if test="${attractionCurrentPage < attractionLastPage}">
					<a href="/tap/searchList?keyword=${keyword}&roomcurrentPage=${roomCurrentPage}&attractionCurrentPage=${attractionCurrentPage+1}">다음</a>
				</c:if>						
			</c:otherwise>
		</c:choose>	
	
	</div>
	
    <!-- ======= Breadcrumbs ======= -->
    <section id="breadcrumbs" class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h2>해시태그 검색 결과</h2>
        </div>
		
      </div>
    </section><!-- End Breadcrumbs -->
	
	<div class="container">

		<c:choose>
			<c:when test="${empty hashtagRoomList && empty hashtagAttractionList}">
				<div>검색 결과가 없습니다.</div>
			</c:when>
			
			<c:otherwise>
				<c:forEach var="r" items="${hashtagRoomList}">
					<div>${r.roomName}</div>
					<div>${r.roomIntro}</div>
					<div>최소 일수 : ${r.minDay} 최소 인원 :  ${r.peopleNum} 가격 : ${r.roomPrice}</div>
				</c:forEach>
				
				<c:forEach var="a" items="${hashtagAttractionList}">
					<div>[${a.attractionCategory}] <a href="/tap/">${a.attractionName}</a></div>
					<div>${a.attractionContent}</div>
				</c:forEach>  					
			</c:otherwise>
		</c:choose>	
	
	</div>
  

  </main><!-- End #main -->

  <!-- start : mainFooter -->
	<div>
      <jsp:include page="/partial/mainFooter.jsp"></jsp:include>
    </div>
  <!-- end : mainFooter -->


  <!-- Vendor JS Files -->
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="assets/js/main.js"></script>

</body>

</html>