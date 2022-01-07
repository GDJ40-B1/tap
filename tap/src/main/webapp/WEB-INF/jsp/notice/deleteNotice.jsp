<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 : 삭제 | TAP</title>
  <meta content="" name="description">
  <meta content="" name="keywords">
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

    <section id="breadcrumbs" class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h2>공지사항 삭제</h2>
          <ol>
            <li><a href="${pageContext.request.contextPath}/">Home</a></li>
            <li><a href="${pageContext.request.contextPath}/questionList">공지사항</a></li>
            <li>공지사항 삭제</li>
          </ol>
        </div>

      </div>
    </section>
	    <section id="list" class="list">
	    	<div class="container">
				<div><h5>${notice.noticeId}번 공지사항을 삭제하시겠습니까?</h5></div>
				<form action="${pageContext.request.contextPath}/deleteNotice?noticeId=${notice.noticeId}" method="post">
					<div>
						<input type="hidden" name="noticeId" value="${notice.noticeId}" readonly="readonly">
					</div>
					<div class="form-group">
					<label for="title" class="form-label mt-4">제목 : </label>
					<div><input type="text" class="form-control" name="title" value="${notice.title}" readonly="readonly"></div>
					</div>
					<div class="form-group" style="margin-top:10px;">
					<div>내용 :</div>
					<div><textarea class="form-control" rows="10" cols="20" name="content" readonly="readonly">${notice.content}</textarea></div>
					</div>
				
					<div style="float:right; margin-top:10px;">
					<a class="btn btn-outline-primary" href="${pageContext.request.contextPath}/noticeList">목록</a>
					<button type="submit" class="btn btn-secondary">삭제</button></div>
				</form>
			</div>
				
					
	    </section>
    <!-- End Breadcrumbs -->
	
	</main><!-- End #main -->
		
	<!-- start : mainFooter -->
    <div>
       <jsp:include page="/partial/mainFooter.jsp"></jsp:include>
    </div>
    <!-- end : mainFooter -->
</body>
</html>