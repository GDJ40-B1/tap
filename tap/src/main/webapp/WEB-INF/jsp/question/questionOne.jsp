<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>${question.questionTitle}</title>
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
          <h2>문의 게시판</h2>
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
		
		<table border="1">
			<tr>
				<td>글 번호</td>
				<td>${question.questionId}</td>
			</tr>
			<tr>
				<td>제목</td>
				<td>${question.questionTitle}</td>
			</tr>
			<tr>
				<td>작성자</td>
				<td>${question.writerId}</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>${question.questionContent}</td>
			</tr>
			<c:if test="${question.writerId == loginUser.userId}">
				<tr>
					<td>비밀글 여부</td>
					<td>${question.secretStatus}</td>
				</tr>
			</c:if>
			<tr>
				<td>작성일</td>
				<td>${question.createDate}</td>
			</tr>
		</table>
       	
       	<c:if test="${question.writerId == loginUser.userId || loginUser.userLevel == 'system_admin'}">
       		<a href="${pageContext.request.contextPath}/modifyQuestion?questionId=${question.questionId}">문의글 수정</a>
			<a href="javascript:removeButton();">문의글 삭제</a>
       	</c:if>
		
      </div>
    </section><!-- End Table Section -->
	
	
	<!-- ======= Answer Section ======= -->
	<c:if test="${loginUser.userLevel == 'system_admin'}">
    <section id="list" class="list">
      <div class="container">

		<form id="questionAnswerForm" action="${pageContext.request.contextPath}/questionOne" method="post">
			<div class="form-group">
				<input type="hidden" name="questionId" value="${question.questionId}">
				<input type="hidden" name="systemAdminId" value="${loginUser.userId}">
				<label for="questionAnswer">답변 작성 : </label>
					<textarea class="form-control" rows="5" placeholder="답변을 작성해주세요" id="questionAnswerContent" name="questionAnswerContent"></textarea>
			</div>
			<div>
				<button id="btn" type ="button">작성</button>
			</div>
		</form>		
		
      </div>
      
      
    </section>
    </c:if><!-- End Answer Section -->	
	
	
  	<!-- ======= Table Section ======= -->
    <section id="list" class="list">
      <div class="container">
		
		<table border="1">
			<tr>
				<th>관리자</th>
				<th>내용</th>
				<th>삭제</th>
			</tr>
			<c:forEach var="a" items="${question.questionAnswer}">
				<tr>
					<td>${a.systemAdminId}</td>
					<td>${a.questionAnswerContent}</td>
					<c:if test="${loginUser != null && loginUser.userLevel == 'system_admin'}">
						<td><a href="javascript:removeAnswer();">삭제</a></td>
					</c:if>
				</tr>
			</c:forEach>
		</table>
		
      </div>
    </section><!-- End Table Section -->
	
	<script>
		function removeButton(){
			if(confirm("문의 글을 삭제 하시겠습니까?") == true){
				location.href="${pageContext.request.contextPath}/removeQuestion?questionId=${question.questionId}";
			} else {
				return;	
			}
		}
		
		$('#btn').click(function(){
			if($('#questionAnswerContent').val() == '') {
				alert('답변을 입력하세요');
				return;
			}
					
			$('#questionAnswerForm').submit();
		});
		
		function removeAnswer(){
			if(confirm("작성하신 답변을 삭제 하시겠습니까?") == true){
				location.href="${pageContext.request.contextPath}/removeQuestionAnswer?questionId=${question.questionId}";
			} else {
				return;	
			}
		}
	</script>
	
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