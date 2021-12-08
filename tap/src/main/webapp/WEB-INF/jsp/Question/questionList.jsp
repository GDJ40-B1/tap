<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>문의 게시판</title>
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
          <h2>문의 게시판</h2>
          <ol>
            <li><a href="index.html">Home</a></li>
            <li>문의 게시판</li>
          </ol>
        </div>

      </div>
    </section><!-- End Breadcrumbs -->

	<!-- ======= category Section ======= -->
    <section id="pageNumber" class="pageNumber">
      <div class="container">
      
		<a href="/tap/questionList?writerCategory=member">회원</a>
		<a href="/tap/questionList?writerCategory=host">숙소 호스트</a>
		
      </div>
    </section><!-- End category Section -->


    <!-- ======= Table Section ======= -->
    <section id="list" class="list">
      <div class="container">
		
		<table border="1">
			<tr>
				<th>글 번호</th>
				<th>카테고리</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
			</tr>
			<c:forEach var="q" items="${list}">
				<tr>
					<td>${q.questionId}</td>
					<td>${q.writerCategory}</td>
					<!-- 비밀글 여부에 따라 본인 or 관리자인 경우에만 볼 수 있도록 코드 추가 필요 -->
					<td><a href="/tap/questionOne?questionId=${q.questionId}">${q.questionTitle}</a></td>
					<td>${q.writerId}</td>
					<td>${q.createDate}</td>
				</tr>
			</c:forEach>
		</table>
       
		<a href="/tap/addQuestion">문의글 작성</a>
		
      </div>
    </section><!-- End Table Section -->
	
	<!-- ======= Paging Section ======= -->
    <section id="pageNumber" class="pageNumber">
      <div class="container">
      
		<c:if test="${currentPage > 1}">
			<a href="/tap/questionList?currentPage=1&writerCategory=${writerCategory}">처음으로</a>
			<a href="/tap/questionList?currentPage=${currentPage-1}&writerCategory=${writerCategory}">이전</a>
		</c:if>
		
		<c:forEach var="i" begin="1" end="${lastPage}">
			<a href="/tap/questionList?currentPage=${i}&writerCategory=${writerCategory}"><c:out value="${i}"/></a>
		</c:forEach>
		
		<c:if test="${currentPage < lastPage}">
			<a href="/tap/questionList?currentPage=${currentPage+1}&writerCategory=${writerCategory}">다음</a>
			<a href="/tap/questionList?currentPage=${lastPage}&writerCategory=${writerCategory}">끝으로</a>
		</c:if>		
		
      </div>
    </section><!-- End Paging Section -->

  

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