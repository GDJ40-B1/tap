<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>문의 글 수정</title>
	
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- jquery -->	
  <script src="http://code.jquery.com/jquery-latest.js"></script>

  <!-- Favicons -->
  <link href="${pageContext.request.contextPath}/resources/img/tap_favicon.png" rel="icon">
  <link href="${pageContext.request.contextPath}/resources/img/apple-touch-icon.png" rel="apple-touch-icon">

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

    <section id="breadcrumbs" class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h2>문의 글 수정</h2>
          <ol>
            <li><a href="${pageContext.request.contextPath}/">Home</a></li>
            <li><a href="${pageContext.request.contextPath}/questionList">문의 게시판</a></li>
            <li>
            	<a href="${pageContext.request.contextPath}/questionOne?questionId=${question.questionId}&secretStatus=${question.secretStatus}&writerId=${question.writerId}">${question.questionTitle}</a>
            </li>
            <li>문의 글 수정</li>
          </ol>
        </div>

      </div>
    </section>

    <!-- ======= Table Section ======= -->
    <section id="list" class="list" style="padding-bottom:80px;">
      <div class="container" style="width:60%;">
		
		<form id="modifyQuestionForm" action ="${pageContext.request.contextPath}/modifyQuestion" method ="post">
			<!-- 세션 ID, 카테고리 -->
			<input type="hidden" name="questionId" value="${question.questionId}">
			<input type="hidden" name="writerId" value="${question.writerId}">
			<div class="form-group">
			<label for="questionTitle" class="form-label mt-4">제목 : </label>
				<input type ="text" class="form-control" value="${question.questionTitle}" id="questionTitle" name="questionTitle" >
			</div>
			<div class="form-group">
			<label for="questionContent" class="form-label mt-4">내용 : </label>
				<textarea class="form-control" rows="10" cols="20" wrap="hard" id="questionContent" name="questionContent" >${question.questionContent}</textarea>
			</div>
			<fieldset class="form-group" style="margin-top:10px;">
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
			</fieldset>
		</form>
		
		<button type="button" class="btn btn-secondary" style="float:right;" id="modifyBtn">수정</button>
		
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
  
  <script>
  	$('#modifyBtn').click(function(){
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
	
</body>
</html>