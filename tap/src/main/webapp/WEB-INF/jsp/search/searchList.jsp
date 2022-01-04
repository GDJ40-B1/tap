<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>${keyword} 검색 결과</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="${pageContext.request.contextPath}/resources/img/favicon.png" rel="icon">
  <link href="${pageContext.request.contextPath}/resources/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
  
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
          <h2>${keyword} 검색</h2>
          <ol>
            <li><a href="/tap/index">Home</a></li>
            <li>전체 검색</li>
          </ol>
        </div>
		
      </div>
    </section><!-- End Breadcrumbs -->
    
    <c:choose>
		<c:when test="${empty roomMap.roomList && empty attractionMap.attractionList && empty hashtagRoomMap.hashtagRoomList && empty hashtagAttractionList}">
			<div class="section-title" style="margin-top:50px;">
				<h2>검색 결과가 없습니다.</h2>
			</div>	
		</c:when>
		
		<c:otherwise>
    
	    <c:if test="${!empty roomMap.roomList}">
	     <!-- ======= Breadcrumbs ======= -->
	    <section id="breadcrumbs" class="breadcrumbs" style="margin-top:0px;">
		 <div id="roomList" class="container">
		   <div class="d-flex justify-content-between align-items-center">
		     <h2>숙소 검색 결과</h2>
		   </div>	
		 </div>
	    </section><!-- End Breadcrumbs -->
	    <section id="gallery" class="gallery">
	      <div class="container">
	
	        <div class="row">
	
				<div class="row gallery-container">
					<c:forEach var="r" items="${roomMap.roomList}">
						<div class="col-lg-3 col-md-6 gallery-item filter-home">
							<div class="gallery-wrap">
								<img src="${pageContext.request.contextPath}/resources/img/events-1.jpg" class="img-fluid" alt="">
								<div class="gallery-info">
									<h4>${r.roomName}</h4>
									<p>${r.roomCategory} / ${r.roomForm}</p>
									<p>${r.roomPrice}원</p>
								<div class="gallery-links">
									<a href="${pageContext.request.contextPath}/roomOne?roomId=${r.roomId}&detailAddressId=${r.detailAddressId}">상세보기</a>
								</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
		
				<nav>
			   		<ul class="pagination" style="justify-content: center;">
			   			<li>
							<c:if test="${roomCurrentPage > 1}">
							<div class="btn-group me-2" role="group" aria-label="First group" style="justify-content: center;">
								<a class="btn btn-secondary btn-sm" href="${pageContext.request.contextPath}/searchList?keyword=${keyword}&roomCurrentPage=1&attractionCurrentPage=${attractionCurrentPage}&hashtagRoomCurrentPage=${hashtagRoomCurrentPage}&hashtagAttractionCurrentPage=${hashtagAttractionCurrentPage}#roomList">처음으로</a>
							</div>
							<div class="btn-group me-2" role="group" aria-label="First group" style="justify-content: center;">	
								<a class="btn btn-primary" href="${pageContext.request.contextPath}/searchList?keyword=${keyword}&roomCurrentPage=${roomCurrentPage-1}&attractionCurrentPage=${attractionCurrentPage}&hashtagRoomCurrentPage=${hashtagRoomCurrentPage}&hashtagAttractionCurrentPage=${hashtagAttractionCurrentPage}#roomList">이전</a>
							</div>
							</c:if>
							
							<div class="btn-group me-2" role="group" aria-label="First group" style="justify-content: center;">
								<c:forEach var="i" begin="${roomMap.roomStartPage}" end="${roomMap.roomEndPage}">
									<a class="btn btn-outline-primary" href="${pageContext.request.contextPath}/searchList?keyword=${keyword}&roomCurrentPage=${i}&attractionCurrentPage=${attractionCurrentPage}&hashtagRoomCurrentPage=${hashtagRoomCurrentPage}&hashtagAttractionCurrentPage=${hashtagAttractionCurrentPage}#roomList"><c:out value="${i}"/></a>
								</c:forEach>
							</div>
														
							<c:if test="${roomCurrentPage < roomMap.roomLastPage}">
							<div class="btn-group me-2" role="group" aria-label="First group" style="justify-content: center;">
								<a class="btn btn-primary" href="${pageContext.request.contextPath}/searchList?keyword=${keyword}&roomCurrentPage=${roomCurrentPage+1}&attractionCurrentPage=${attractionCurrentPage}&hashtagRoomCurrentPage=${hashtagRoomCurrentPage}&hashtagAttractionCurrentPage=${hashtagAttractionCurrentPage}#roomList">다음</a>
							</div>
							<div class="btn-group me-2" role="group" aria-label="First group" style="justify-content: center;">	
								<a class="btn btn-secondary btn-sm" href="${pageContext.request.contextPath}/searchList?keyword=${keyword}&roomCurrentPage=${roomMap.roomLastPage}&attractionCurrentPage=${attractionCurrentPage}&hashtagRoomCurrentPage=${hashtagRoomCurrentPage}&hashtagAttractionCurrentPage=${hashtagAttractionCurrentPage}#roomList">끝으로</a>
							</div>
							</c:if>		
						</li>
					</ul>
				</nav>
	        </div>
	      </div>
	    </section>    
	    </c:if>
		
		<c:if test="${!empty attractionMap.attractionList}">
	    <!-- ======= Breadcrumbs ======= -->
	    <section id="breadcrumbs" class="breadcrumbs" style="margin-top:0px;">
	      <div id="attractionList" class="container">
	        <div class="d-flex justify-content-between align-items-center">
	          <h2>명소 검색 결과</h2>
	        </div>	
	      </div>
	    </section><!-- End Breadcrumbs -->
		
	    <section id="gallery" class="gallery">
	      <div class="container">
	
	        <div class="row">
	
				<div class="row gallery-container">
					<c:forEach var="a" items="${attractionMap.attractionList}">
						<div class="col-lg-3 col-md-6 gallery-item filter-home">
							<div class="gallery-wrap">
								<img src="${pageContext.request.contextPath}/resources/img/events-1.jpg" class="img-fluid" alt="">
								<div class="gallery-info">
									<h4>${a.attractionName}</h4>
									<p>${a.attractionCategory}</p>
									<p>${a.attractionPhoneNumber}</p>
								<div class="gallery-links">
									<a href="${pageContext.request.contextPath}/attractionOne?attractionId=${a.attractionId}&detailAddressId=${a.detailAddressId}">상세보기</a>
								</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>			
	
				<nav>
			   		<ul class="pagination" style="justify-content: center;">
			   			<li>
							<c:if test="${attractionCurrentPage > 1}">
							<div class="btn-group me-2" role="group" aria-label="First group" style="justify-content: center;">
								<a class="btn btn-secondary btn-sm" href="${pageContext.request.contextPath}/searchList?keyword=${keyword}&roomCurrentPage=${roomCurrentPage}&attractionCurrentPage=1&hashtagRoomCurrentPage=${hashtagRoomCurrentPage}&hashtagAttractionCurrentPage=${hashtagAttractionCurrentPage}#attractionList">처음으로</a>
							</div>
							<div class="btn-group me-2" role="group" aria-label="First group" style="justify-content: center;">	
								<a class="btn btn-primary" href="${pageContext.request.contextPath}/searchList?keyword=${keyword}&roomCurrentPage=${roomCurrentPage}&attractionCurrentPage=${attractionCurrentPage-1}&hashtagRoomCurrentPage=${hashtagRoomCurrentPage}&hashtagAttractionCurrentPage=${hashtagAttractionCurrentPage}#attractionList">이전</a>
							</div>
							</c:if>
							
							<div class="btn-group me-2" role="group" aria-label="First group" style="justify-content: center;">
								<c:forEach var="i" begin="${attractionMap.attractionStartPage}" end="${attractionMap.attractionEndPage}">
									<a class="btn btn-outline-primary" href="${pageContext.request.contextPath}/searchList?keyword=${keyword}&roomCurrentPage=${roomCurrentPage}&attractionCurrentPage=${i}&hashtagRoomCurrentPage=${hashtagRoomCurrentPage}&hashtagAttractionCurrentPage=${hashtagAttractionCurrentPage}#attractionList"><c:out value="${i}"/></a>
								</c:forEach>
							</div>
														
							<c:if test="${attractionCurrentPage < attractionMap.attractionLastPage}">
							<div class="btn-group me-2" role="group" aria-label="First group" style="justify-content: center;">
								<a class="btn btn-primary" href="${pageContext.request.contextPath}/searchList?keyword=${keyword}&roomCurrentPage=${roomCurrentPage}&attractionCurrentPage=${attractionCurrentPage+1}&hashtagRoomCurrentPage=${hashtagRoomCurrentPage}&hashtagAttractionCurrentPage=${hashtagAttractionCurrentPage}#attractionList">다음</a>
							</div>
							<div class="btn-group me-2" role="group" aria-label="First group" style="justify-content: center;">	
								<a class="btn btn-secondary btn-sm" href="${pageContext.request.contextPath}/searchList?keyword=${keyword}&roomCurrentPage=${roomCurrentPage}&attractionCurrentPage=${attractionMap.attractionLastPage}&hashtagRoomCurrentPage=${hashtagRoomCurrentPage}&hashtagAttractionCurrentPage=${hashtagAttractionCurrentPage}#attractionList">끝으로</a>
							</div>
							</c:if>		
						</li>
					</ul>
				</nav>		
			</div>
		</div>
		</section>	
		</c:if>
	
		<c:if test="${!empty hashtagRoomMap.hashtagRoomList}">
	    <!-- ======= Breadcrumbs ======= -->
	    <section id="breadcrumbs" class="breadcrumbs" style="margin-top:0px;">
	      <div id="hashtagRoomList" class="container">
	        <div class="d-flex justify-content-between align-items-center">
	          <h2>해시태그 숙소 관련 검색 결과</h2>
	        </div>
	      </div>
	    </section><!-- End Breadcrumbs -->
		
	   <section id="gallery" class="gallery">
	      <div class="container">
	
	        <div class="row">
	
				<div class="row gallery-container">
					<c:forEach var="r" items="${hashtagRoomMap.hashtagRoomList}">
						<div class="col-lg-3 col-md-6 gallery-item filter-home">
							<div class="gallery-wrap">
								<img src="${pageContext.request.contextPath}/resources/img/events-1.jpg" class="img-fluid" alt="">
								<div class="gallery-info">
									<h4>${r.roomName}</h4>
									<p>${r.roomCategory} / ${r.roomForm}</p>
									<p>${r.roomPrice}원</p>
								<div class="gallery-links">
									<a href="${pageContext.request.contextPath}/roomOne?roomId=${r.roomId}&detailAddressId=${r.detailAddressId}">상세보기</a>
								</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>		
				
				<nav>
			   		<ul class="pagination" style="justify-content: center;">
			   			<li>
							<c:if test="${hashtagRoomCurrentPage > 1}">
							<div class="btn-group me-2" role="group" aria-label="First group" style="justify-content: center;">
								<a class="btn btn-secondary btn-sm" href="${pageContext.request.contextPath}/searchList?keyword=${keyword}&roomCurrentPage=${roomCurrentPage}&attractionCurrentPage=${attractionCurrentPage}&hashtagRoomCurrentPage=1&hashtagAttractionCurrentPage=${hashtagAttractionCurrentPage}#hashtagRoomList">처음으로</a>
							</div>
							<div class="btn-group me-2" role="group" aria-label="First group" style="justify-content: center;">	
								<a class="btn btn-primary" href="${pageContext.request.contextPath}/searchList?keyword=${keyword}&roomCurrentPage=${roomCurrentPage}&attractionCurrentPage=${attractionCurrentPage}&hashtagRoomCurrentPage=${hashtagRoomCurrentPage-1}&hashtagAttractionCurrentPage=${hashtagAttractionCurrentPage}#hashtagRoomList">이전</a>
							</div>
							</c:if>
							
							<div class="btn-group me-2" role="group" aria-label="First group" style="justify-content: center;">
								<c:forEach var="i" begin="${hashtagRoomMap.hashtagRoomStartPage}" end="${hashtagRoomMap.hashtagRoomEndPage}">
									<a class="btn btn-outline-primary" href="${pageContext.request.contextPath}/searchList?keyword=${keyword}&roomCurrentPage=${roomCurrentPage}&attractionCurrentPage=${attractionCurrentPage}&hashtagRoomCurrentPage=${i}&hashtagAttractionCurrentPage=${hashtagAttractionCurrentPage}#hashtagRoomList"><c:out value="${i}"/></a>
								</c:forEach>
							</div>
														
							<c:if test="${hashtagRoomCurrentPage < hashtagRoomMap.hashtagRoomLastPage}">
							<div class="btn-group me-2" role="group" aria-label="First group" style="justify-content: center;">
								<a class="btn btn-primary" href="${pageContext.request.contextPath}/searchList?keyword=${keyword}&roomCurrentPage=${roomCurrentPage}&attractionCurrentPage=${attractionCurrentPage}&hashtagRoomCurrentPage=${hashtagRoomCurrentPage+1}&hashtagAttractionCurrentPage=${hashtagAttractionCurrentPage}#hashtagRoomList">다음</a>
							</div>
							<div class="btn-group me-2" role="group" aria-label="First group" style="justify-content: center;">	
								<a class="btn btn-secondary btn-sm" href="${pageContext.request.contextPath}/searchList?keyword=${keyword}&roomCurrentPage=${roomCurrentPage}&attractionCurrentPage=${attractionCurrentPage}&hashtagRoomCurrentPage=${hashtagRoomMap.hashtagRoomLastPage}&hashtagAttractionCurrentPage=${hashtagAttractionCurrentPage}#hashtagRoomList">끝으로</a>
							</div>
							</c:if>		
						</li>
					</ul>
				</nav>
			</div>
		</div>
	   	</section>	
		</c:if>
		
		<c:if test="${!empty hashtagAttractionMap.hashtagAttractionList}">
	    <!-- ======= Breadcrumbs ======= -->
	    <section id="breadcrumbs" class="breadcrumbs" style="margin-top:0px;">
	      <div id="hashtagAttractionList" class="container">
	        <div class="d-flex justify-content-between align-items-center">
	          <h2>해시태그 명소 관련 검색 결과</h2>
	        </div>	
	      </div>
	    </section><!-- End Breadcrumbs -->
		
	   <section id="gallery" class="gallery">
	      <div class="container">
	
	        <div class="row">
	
				<div class="row gallery-container">
					<c:forEach var="a" items="${hashtagAttractionMap.hashtagAttractionList}">
						<div class="col-lg-3 col-md-6 gallery-item filter-home">
							<div class="gallery-wrap">
								<img src="${pageContext.request.contextPath}/resources/img/events-1.jpg" class="img-fluid" alt="">
								<div class="gallery-info">
									<h4>${a.attractionName}</h4>
									<p>${a.attractionCategory}</p>
									<p>${a.attractionPhoneNumber}</p>
								<div class="gallery-links">
									<a href="${pageContext.request.contextPath}/attractionOne?attractionId=${a.attractionId}&detailAddressId=${a.detailAddressId}">상세보기</a>
								</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>					
				
				<nav>
			   		<ul class="pagination" style="justify-content: center;">
			   			<li>
							<c:if test="${hashtagAttractionCurrentPage > 1}">
							<div class="btn-group me-2" role="group" aria-label="First group" style="justify-content: center;">
								<a class="btn btn-secondary btn-sm" href="${pageContext.request.contextPath}/searchList?keyword=${keyword}&roomCurrentPage=${roomCurrentPage}&attractionCurrentPage=${attractionCurrentPage}&hashtagRoomCurrentPage=${hashtagRoomCurrentPage}&hashtagAttractionCurrentPage=1#hashtagAttractionList">처음으로</a>
							</div>
							<div class="btn-group me-2" role="group" aria-label="First group" style="justify-content: center;">	
								<a class="btn btn-primary" href="${pageContext.request.contextPath}/searchList?keyword=${keyword}&roomCurrentPage=${roomCurrentPage}&attractionCurrentPage=${attractionCurrentPage}&hashtagRoomCurrentPage=${hashtagRoomCurrentPage}&hashtagAttractionCurrentPage=${hashtagAttractionCurrentPage-1}#hashtagAttractionList">이전</a>
							</div>
							</c:if>
							
							<div class="btn-group me-2" role="group" aria-label="First group" style="justify-content: center;">
								<c:forEach var="i" begin="${hashtagAttractionMap.hashtagAttractionStartPage}" end="${hashtagAttractionMap.hashtagAttractionEndPage}">
									<a class="btn btn-outline-primary" href="${pageContext.request.contextPath}/searchList?keyword=${keyword}&roomCurrentPage=${roomCurrentPage}&attractionCurrentPage=${attractionCurrentPage}&hashtagRoomCurrentPage=${hashtagRoomCurrentPage}&hashtagAttractionCurrentPage=${i}#hashtagAttractionList"><c:out value="${i}"/></a>
								</c:forEach>
							</div>
														
							<c:if test="${hashtagAttractionCurrentPage < hashtagAttractionMap.hashtagAttractionLastPage}">
							<div class="btn-group me-2" role="group" aria-label="First group" style="justify-content: center;">
								<a class="btn btn-primary" href="${pageContext.request.contextPath}/searchList?keyword=${keyword}&roomCurrentPage=${roomCurrentPage}&attractionCurrentPage=${attractionCurrentPage}&hashtagRoomCurrentPage=${hashtagRoomCurrentPage}&hashtagAttractionCurrentPage=${hashtagAttractionCurrentPage+1}#hashtagAttractionList">다음</a>
							</div>
							<div class="btn-group me-2" role="group" aria-label="First group" style="justify-content: center;">	
								<a class="btn btn-secondary btn-sm" href="${pageContext.request.contextPath}/searchList?keyword=${keyword}&roomCurrentPage=${roomCurrentPage}&attractionCurrentPage=${attractionCurrentPage}&hashtagRoomCurrentPage=${hashtagRoomCurrentPage}&hashtagAttractionCurrentPage=${hashtagAttractionMap.hashtagAttractionLastPage}#hashtagAttractionList">끝으로</a>
							</div>
							</c:if>		
						</li>
					</ul>
				</nav>								
			</div>
		 </div>
	   	</section>	
		</c:if>
		</c:otherwise>
	</c:choose>

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