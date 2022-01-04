<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>deleteNotice.jsp</title>
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
          	<h2>공지사항 삭제하기</h2>
        	</div>
    	</div>
    
	    <section id="list" class="list">
	    	<div class="container">
			    <div><a href="${pageContext.request.contextPath}/noticeList">리스트로</a></div>
				<div><h5>${notice.noticeId}번 공지사항을 삭제하시겠습니까?</h5></div>
				<form action="${pageContext.request.contextPath}/deleteNotice?noticeId=${notice.noticeId}" method="post">
					<div>
						<input type="hidden" name="noticeId" value="${notice.noticeId}" readonly="readonly">
					</div>
					<div>제목 :</div>
					<div><input type="text" name="title" value="${notice.title}" readonly="readonly"></div>
					<div>내용 :</div>
					<div><textarea rows="10" cols="20" name="content" readonly="readonly">${notice.content}</textarea></div>
					<div>종류 :</div>
					<div>
					<select name="kind" value="${notice.kind}" disabled="disabled">
						<option value="Y" >Y</option>
						<option value="N" >N</option>
					</select>
					</div>
					<div><button type="submit">삭제하기</button></div>
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