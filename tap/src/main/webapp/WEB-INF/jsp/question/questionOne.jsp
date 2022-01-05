<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <style type="text/css">
	.title {
	  display: flex;
	}
	.box-left {
	  flex: 1;
	}
	.box-center {
	  flex: 3;
	  text-align: center;
	}
	.box-right {
	  flex: 1;
	  text-align: right;
	}
  </style>

  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>${question.questionTitle}</title>
  
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="${pageContext.request.contextPath}/resources/img/favicon.png" rel="icon">
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

  <!-- Jquery -->
  <script src="http://code.jquery.com/jquery-latest.js"></script> 

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
            <li><a href="${pageContext.request.contextPath}/questionList">문의 게시판</a></li>
            <li>${question.questionTitle}</li>
          </ol>
        </div>

      </div>
    </section><!-- End Breadcrumbs -->
	
	
    <!-- ======= Table Section ======= -->
    <section id="list" class="list">
      <div class="container" style="width:60%;">
		<table class="table">
			<thead class="table-primary">
			 <tr>
			 	<th>
			 		<div class="title">
				 		<div class='box-left'>${question.questionId}</div>
				 		<div class='box-center'>${question.writerId}</div>
				 		<div class='box-right'>${question.createDate}</div>
			 		</div>
				</th>
			 </tr>
			</thead>
			<tbody>
				<tr>
					<td>
						<div style="margin-top:20px;">
							<h2>${question.questionTitle}</h2>
							<c:if test="${question.writerId == loginUser.userId}">
								<div style="text-align: right;">비밀글 : ${question.secretStatus}</div>
							</c:if>	
						</div>
						<div style="margin: 40px;">${question.questionContent}</div>
					</td>
				</tr>
			</tbody>
		</table>
      </div>
      <div class="container" style="width:60%;">
		<c:if test="${question.writerId == loginUser.userId || loginUser.userLevel == 'system_admin'}">
			<a class="btn btn-outline-danger" style="float:right;" href="javascript:removeButton();">문의글 삭제</a>
       		<a class="btn btn-outline-success" style="float:right; margin-right:10px;" href="${pageContext.request.contextPath}/nonMember/modifyQuestion?questionId=${question.questionId}&writerId=${question.writerId}&secretStatus=${question.secretStatus}">문의글 수정</a>
       	</c:if>
      </div>
    </section><!-- End Table Section -->
	
	
	<!-- ======= Answer Section ======= -->
	<c:if test="${empty question.questionAnswer && loginUser.userLevel == 'system_admin'}">
    <section id="list" class="list">
      <div class="container">

		<form id="questionAnswerForm" action="${pageContext.request.contextPath}/questionOne" method="post">
			<div class="form-group">
				<input type="hidden" name="answerQuestionId" value="${question.questionId}">
				<input type="hidden" name="writerId" value="${question.writerId}">
				<input type="hidden" name="secretStatus" value="${question.secretStatus}">
				<input type="hidden" name="systemAdminId" value="${loginUser.userId}">
				<label for="questionAnswer">답변 작성 : </label>
					<textarea class="form-control" rows="5" placeholder="답변을 작성해주세요" id="questionAnswerContent" name="questionAnswerContent"></textarea>
			</div>
			<div>
				<button id="answerBtn" type ="button">작성</button>
			</div>
		</form>		
		
      </div>
      
      
    </section>
    </c:if><!-- End Answer Section -->	
	
	
  	<!-- ======= Table Section ======= -->
    <section id="list" class="list">
      <div class="container" style="width:60%;">
		<c:choose>
			<c:when test="${empty question.questionAnswer}">
				<div class="section-title">
					<h2>답변 대기중 입니다.</h2>
				</div>
			</c:when>
			
			<c:otherwise>
			<table class="table">
				<thead class="table-primary">
				 <tr>
				 	<th>
				 		<div class="title">
					 		<div class='box-left'>관리자 (${question.questionAnswer.systemAdminId})</div>
					 		<c:if test="${loginUser != null && loginUser.userLevel == 'system_admin'}">
								<div class='box-right'><a class="btn btn-danger btn-sm" href="javascript:removeAnswer();">삭제</a></div>
							</c:if>
				 		</div>
					</th>
				 </tr>
				</thead>
				<tbody>
					<tr>
						<td>
							<div style="margin:20px;">${question.questionAnswer.questionAnswerContent}</div>
						</td>
					</tr>
				</tbody>
			</table>			
			</c:otherwise>
		</c:choose>
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
	function removeButton(){
		if(confirm("문의 글을 삭제 하시겠습니까?") == true){
			location.href="${pageContext.request.contextPath}/nonMember/removeQuestion?questionId=${question.questionId}&writerId=${question.writerId}";
		} else {
			return;	
		}
	}
	
	$('#answerBtn').click(function(){
		if($('#questionAnswerContent').val() == '') {
			alert('답변을 입력하세요');
			return;
		}
				
		$('#questionAnswerForm').submit();
	});
	
	function removeAnswer(){
		if(confirm("작성하신 답변을 삭제 하시겠습니까?") == true){
			location.href="${pageContext.request.contextPath}/nonMember/removeQuestionAnswer?answerQuestionId=${question.questionId}&writerId=${question.writerId}&secretStatus=${question.secretStatus}";
		} else {
			return;	
		}
	}
  </script>

</body>

</html>