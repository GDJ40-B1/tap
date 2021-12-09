<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>문의 글 수정</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
          <h2>문의 글 수정</h2>
          <ol>
            <li><a href="index.html">Home</a></li>
            <li>문의 게시판</li>
          </ol>
        </div>

      </div>
    </section><!-- End Breadcrumbs -->

    <!-- ======= Table Section ======= -->
    <section id="list" class="list">
      <div class="container">
		
		<form id="modifyQuestionForm" action ="/tap/modifyQuestion" method ="post">
		<!-- 세션 ID, 카테고리 -->
		<input type="hidden" name="questionId" value="${question.questionId}">
		<div class="form-group">
		<label for="questionTitle">제목 : </label>
			<input type ="text" class="form-control" value="${question.questionTitle}" id="questionTitle" name="questionTitle" >
		</div>
		<div class="form-group">
		<label for="questionContent">내용 : </label>
			<textarea class="form-control" rows="5" id="questionContent" name="questionContent" >${question.questionContent}</textarea>
		</div>
		<div class="form-check">
		 <label class="form-check-label">
		    <input type="radio" class="form-check-input" name="secretStatus" value="Y">비밀글 작성
		 </label>
		</div>
		<div class="form-check">
  		<label class="form-check-label">
   			<input type="radio" class="form-check-input" name="secretStatus" value="N" checked>외부 공개 허용
  		</label>
		</div>
		<div>
			<button id="btn" type ="button">수정</button>
		</div>
	</form>
	
	<script>
		$('#btn').click(function(){
			if($('#questionTitle').val() == '') {
				alert('제목을 입력하세요');
				return;
			}
			if($('#questionContent').val() == '') {
				alert('내용을 입력하세요');
				return;
			}
			
			$('#modifyQuestionForm').submit();
		});
	</script>
		
      </div>
    </section><!-- End Table Section -->
	
	
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