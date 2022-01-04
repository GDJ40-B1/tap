<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modifyNotice.jsp</title>
<!-- Favicons -->
  <link href="${pageContext.request.contextPath}/resources/img/tap_favicon.png" rel="icon">
  <link href="${pageContext.request.contextPath}/resources/img/tap_favicon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
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
          	<h2>공지사항 수정하기</h2>
        	</div>
    	</div>
    
	    <section id="list" class="list">
	    	<div class="container">
				<a href="${pageContext.request.contextPath}/noticeList">리스트로</a>
				<form action="${pageContext.request.contextPath}/modifyNotice?noticeId=${notice.noticeId}" method="post">
				
					<div>제목 :</div>
					<div>
						<input type="text" name="title" value="${notice.title}">
					</div>
					<div>내용 :</div>
					<div>
						<textarea rows="10" cols="20" name="content">${notice.content}</textarea>
					</div>
					<div>종류 :</div>
					<div>
						<select name="kind" value="${notice.kind}">
							<option value="Y">Y</option>
							<option value="N">N</option>
						</select>
					</div>
					<div>	
						<button type="submit">수정</button>
					</div>
				</form>
			</div>
	    </section>
    </section><!-- End Breadcrumbs -->
	</main><!-- End #main -->
	
	<!-- start : mainFooter -->
    <div>
       <jsp:include page="/partial/mainFooter.jsp"></jsp:include>
    </div>
    <!-- end : mainFooter -->
</body>
</html>