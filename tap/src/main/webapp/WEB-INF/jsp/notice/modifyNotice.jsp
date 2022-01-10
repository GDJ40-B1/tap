<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style>
	#breadcrumbs	{
		position:relative;
		height:70px;}
	#main	{
		height:auto;
	
	
	
	}
	#list	{
		height:auto;
		margin-bottom: 20px;
	}
</style>
<meta charset="UTF-8">
<title>공지사항 : 수정 | TAP</title>
  <meta content="" name="description">
  <meta content="" name="keywords">
<!-- Favicons -->
  <link href="${pageContext.request.contextPath}/resources/img/tap_favicon.png" rel="icon">
  <link href="${pageContext.request.contextPath}/resources/img/tap_favicon.png" rel="apple-touch-icon">

  
</head>
<body>

	<!-- start : mainHeader -->
    <div id=header>
       <jsp:include page="/partial/mainHeader.jsp"></jsp:include>
    </div>
    <!-- end : mainHeader -->
 
    <main id="main">

    <section id="breadcrumbs" class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h2>공지사항 수정</h2>
          <ol>
            <li><a href="${pageContext.request.contextPath}/">Home</a></li>
            <li><a href="${pageContext.request.contextPath}/questionList">공지사항</a></li>
            <li>공지사항 수정</li>
          </ol>
        </div>

      </div>
    </section>
    	<!-- ======= Table Section ======= -->
    <section id="list" class="list" style="padding-bottom:80px;">
      <div class="container" style="width:60%;">
	    
				
			<form action="${pageContext.request.contextPath}/modifyNotice?noticeId=${notice.noticeId}" method="post">
				<div class="form-group">
					<label for="title" class="form-label mt-4">제목 : </label>
					<input type ="text" class="form-control" value="${notice.title}" id="title" name="title" >
				</div>
				<div class="form-group" style="margin-top:10px;">
					<label for="content" class="form-label mt-4">내용 : </label>
					<textarea class="form-control" rows="10" cols="20" wrap="hard" id="content" name="content" >${notice.content}</textarea>
				</div>
			</form>
				<div style="float:right;">
				<a class="btn btn-outline-primary" href="${pageContext.request.contextPath}/noticeList">목록</a>
				<button type="submit" class="btn btn-secondary">수정</button></div>
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