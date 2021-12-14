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
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
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
					<div>[${r.roomCategory}] [${r.roomForm}]</div>
					<div><a href="${pageContext.request.contextPath}/roomOne?roomId=${r.roomId}&detailAddressId=${r.detailAddressId}">${r.roomName}</a></div>
					<div>${r.roomIntro}</div>
					<div>최소 일수 : ${r.minDay} 최소 인원 :  ${r.peopleNum} 가격 : ${r.roomPrice}</div>
				</c:forEach>
				
				<c:if test="${roomCurrentPage > 1}">
					<a href="${pageContext.request.contextPath}/searchList?keyword=${keyword}&roomCurrentPage=${roomCurrentPage-1}&attractionCurrentPage=${attractionCurrentPage}&hashtagRoomCurrentPage=${hashtagRoomCurrentPage}&hashtagAttractionCurrentPage=${hashtagAttractionCurrentPage}">이전</a>
				</c:if>
				
				<c:forEach var="i" begin="${roomStartPage}" end="${roomEndPage}">
					<a href="${pageContext.request.contextPath}/searchList?keyword=${keyword}&roomCurrentPage=${i}&attractionCurrentPage=${attractionCurrentPage}&hashtagRoomCurrentPage=${hashtagRoomCurrentPage}&hashtagAttractionCurrentPage=${hashtagAttractionCurrentPage}"><c:out value="${i}"/></a>
				</c:forEach>
				
				<c:if test="${roomCurrentPage < roomLastPage}">
					<a href="${pageContext.request.contextPath}/searchList?keyword=${keyword}&roomCurrentPage=${roomCurrentPage+1}&attractionCurrentPage=${attractionCurrentPage}&hashtagRoomCurrentPage=${hashtagRoomCurrentPage}&hashtagAttractionCurrentPage=${hashtagAttractionCurrentPage}">다음</a>
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
					<a href="${pageContext.request.contextPath}/searchList?keyword=${keyword}&roomCurrentPage=${roomCurrentPage}&attractionCurrentPage=${attractionCurrentPage-1}&hashtagRoomCurrentPage=${hashtagRoomCurrentPage}&hashtagAttractionCurrentPage=${hashtagAttractionCurrentPage}">이전</a>
				</c:if>
				
				<c:forEach var="i" begin="${attractionStartPage}" end="${attractionEndPage}">
					<a href="${pageContext.request.contextPath}/searchList?keyword=${keyword}&roomCurrentPage=${roomCurrentPage}&attractionCurrentPage=${i}&hashtagRoomCurrentPage=${hashtagRoomCurrentPage}&hashtagAttractionCurrentPage=${hashtagAttractionCurrentPage}"><c:out value="${i}"/></a>
				</c:forEach>
				
				<c:if test="${attractionCurrentPage < attractionLastPage}">
					<a href="${pageContext.request.contextPath}/searchList?keyword=${keyword}&roomCurrentPage=${roomCurrentPage}&attractionCurrentPage=${attractionCurrentPage+1}&hashtagRoomCurrentPage=${hashtagRoomCurrentPage}&hashtagAttractionCurrentPage=${hashtagAttractionCurrentPage}">다음</a>
				</c:if>						
			</c:otherwise>
		</c:choose>	
	
	</div>
	
    <!-- ======= Breadcrumbs ======= -->
    <section id="breadcrumbs" class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h2>해시태그 숙소 관련 검색 결과</h2>
        </div>
		
      </div>
    </section><!-- End Breadcrumbs -->
	
	<div class="container">

		<c:choose>
			<c:when test="${empty hashtagRoomList}">
				<div>검색 결과가 없습니다.</div>
			</c:when>
			
			<c:otherwise>
				<c:forEach var="r" items="${hashtagRoomList}">
					<div>[${r.roomCategory}] [${r.roomForm}]</div>
					<div><a href="${pageContext.request.contextPath}/roomOne?roomId=${r.roomId}&detailAddressId=${r.detailAddressId}">${r.roomName}</a></div>
					<div>${r.roomIntro}</div>
					<div>최소 일수 : ${r.minDay} 최소 인원 :  ${r.peopleNum} 가격 : ${r.roomPrice}</div>
				</c:forEach>	
				
				<c:if test="${hashtagRoomCurrentPage > 1}">
					<a href="${pageContext.request.contextPath}/searchList?keyword=${keyword}&roomCurrentPage=${roomCurrentPage}&attractionCurrentPage=${attractionCurrentPage}&hashtagRoomCurrentPage=${hashtagRoomCurrentPage-1}&hashtagAttractionCurrentPage=${hashtagAttractionCurrentPage}">이전</a>
				</c:if>
				
				<c:forEach var="i" begin="${hashtagRoomStartPage}" end="${hashtagRoomEndPage}">
					<a href="${pageContext.request.contextPath}/searchList?keyword=${keyword}&roomCurrentPage=${roomCurrentPage}&attractionCurrentPage=${attractionCurrentPage}&hashtagRoomCurrentPage=${i}&hashtagAttractionCurrentPage=${hashtagAttractionCurrentPage}"><c:out value="${i}"/></a>
				</c:forEach>
				
				<c:if test="${hashtagRoomCurrentPage < hashtagRoomLastPage}">
					<a href="${pageContext.request.contextPath}/searchList?keyword=${keyword}&roomCurrentPage=${roomCurrentPage}&attractionCurrentPage=${attractionCurrentPage}&hashtagRoomCurrentPage=${hashtagRoomCurrentPage+1}&hashtagAttractionCurrentPage=${hashtagAttractionCurrentPage}">다음</a>
				</c:if>			
			</c:otherwise>
		</c:choose>	
	
	</div>
  
    <!-- ======= Breadcrumbs ======= -->
    <section id="breadcrumbs" class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h2>해시태그 명소 관련 검색 결과</h2>
        </div>
		
      </div>
    </section><!-- End Breadcrumbs -->
	
	<div class="container">

		<c:choose>
			<c:when test="${empty hashtagAttractionList}">
				<div>검색 결과가 없습니다.</div>
			</c:when>
			
			<c:otherwise>
				<c:forEach var="a" items="${hashtagAttractionList}">
					<div>[${a.attractionCategory}] <a href="/tap/">${a.attractionName}</a></div>
					<div>${a.attractionContent}</div>
				</c:forEach>
				
				<c:if test="${hashtagAttractionCurrentPage > 1}">
					<a href="${pageContext.request.contextPath}/searchList?keyword=${keyword}&roomCurrentPage=${roomCurrentPage}&attractionCurrentPage=${attractionCurrentPage}&hashtagRoomCurrentPage=${hashtagRoomCurrentPage}&hashtagAttractionCurrentPage=${hashtagAttractionCurrentPage-1}">이전</a>
				</c:if>
				
				<c:forEach var="i" begin="${hashtagAttractionStartPage}" end="${hashtagAttractionEndPage}">
					<a href="${pageContext.request.contextPath}/searchList?keyword=${keyword}&roomCurrentPage=${roomCurrentPage}&attractionCurrentPage=${attractionCurrentPage}&hashtagRoomCurrentPage=${hashtagRoomCurrentPage}&hashtagAttractionCurrentPage=${i}"><c:out value="${i}"/></a>
				</c:forEach>
				
				<c:if test="${hashtagAttractionCurrentPage < hashtagAttractionLastPage}">
					<a href="${pageContext.request.contextPath}/searchList?keyword=${keyword}&roomCurrentPage=${roomCurrentPage}&attractionCurrentPage=${attractionCurrentPage}&hashtagRoomCurrentPage=${hashtagRoomCurrentPage}&hashtagAttractionCurrentPage=${hashtagAttractionCurrentPage+1}">다음</a>
				</c:if>									
			</c:otherwise>
		</c:choose>	

	  <!-- 임시로 추가 -->
	  <form class="form-inline" action="${pageContext.request.contextPath}/searchList">
      	<input class="form-control mr-sm-2" type="text" name="keyword">
    	<button class="btn btn-primary" type="submit">Search</button>
  	  </form>
	  
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