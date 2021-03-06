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
	#breadcrumbs	{
		position:relative;
		height:70px;}
		
	#list	{
		height:auto;
	min-height:100%;
	padding-bottom:150px;
	}
	
  </style>

  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>${question.questionTitle}</title>
 	
  <meta content="" name="description">
  <meta content="" name="keywords">

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
          <h2>?????? ?????????</h2>
          <ol>
            <li><a href="index.html">Home</a></li>
            <li><a href="${pageContext.request.contextPath}/questionList">?????? ?????????</a></li>
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
								<div style="text-align: right;">????????? : ${question.secretStatus}</div>
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
			<a class="btn btn-outline-danger" style="float:right;" href="javascript:removeButton();">????????? ??????</a>
       		<a class="btn btn-outline-success" style="float:right; margin-right:10px;" href="${pageContext.request.contextPath}/nonMember/modifyQuestion?questionId=${question.questionId}&writerId=${question.writerId}&secretStatus=${question.secretStatus}">????????? ??????</a>
       	</c:if>
      </div>
    </section><!-- End Table Section -->
	
  	<!-- ======= Table Section ======= -->
    <section id="list" class="list">
      <div class="container" style="width:60%;">
		<c:choose>
			<c:when test="${empty question.questionAnswer}">
				<div class="section-title">
					<h2>?????? ????????? ?????????.</h2>
				</div>
			</c:when>
			
			<c:otherwise>
			<table class="table">
				<thead class="table-primary">
				 <tr>
				 	<th>
				 		<div class="title">
					 		<div class='box-left'>????????? (${question.questionAnswer.systemAdminId})</div>
					 		<c:if test="${loginUser != null && loginUser.userLevel == 'system_admin'}">
								<div class='box-right'><a class="btn btn-danger btn-sm" href="javascript:removeAnswer();">??????</a></div>
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
		if(confirm("?????? ?????? ?????? ???????????????????") == true){
			location.href="${pageContext.request.contextPath}/nonMember/removeQuestion?questionId=${question.questionId}&writerId=${question.writerId}";
		} else {
			return;	
		}
	}
	
	$('#answerBtn').click(function(){
		if($('#questionAnswerContent').val() == '') {
			alert('????????? ???????????????');
			return;
		}
				
		$('#questionAnswerForm').submit();
	});
	
	function removeAnswer(){
		if(confirm("???????????? ????????? ?????? ???????????????????") == true){
			location.href="${pageContext.request.contextPath}/nonMember/removeQuestionAnswer?answerQuestionId=${question.questionId}&writerId=${question.writerId}&secretStatus=${question.secretStatus}";
		} else {
			return;	
		}
	}
  </script>

</body>

</html>