<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<style>
	#header	{
		position:fixed;

	    width:100%;

	    top:0;

	    left:0;
	    
	    height:70px;




</style>
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="${pageContext.request.contextPath}/resources/img/favicon.png" rel="icon">
  <link href="${pageContext.request.contextPath}/resources/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
  
  <!-- Vendor CSS Files -->
  <link href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
  
  <!-- bootstrap -->
  <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">

  <!-- =======================================================
  * Template Name: MeFamily - v4.7.0
  * Template URL: https://bootstrapmade.com/family-multipurpose-html-bootstrap-template-free/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
  
  
  <!-- ======= Header ======= -->
  <header id="header" class="fixed-top">
    <div class="container d-flex align-items-center justify-content-between">

      <h1 class="logo"><a href="${pageContext.request.contextPath}/">T A P</a></h1>
      <!-- Uncomment below if you prefer to use an image logo -->
      <!-- <a href="index.html" class="logo"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->
      <form class="d-flex" id="searchForm" action="${pageContext.request.contextPath}/searchList">
			<input class="form-control me-sm-2" type="text" id="keyword" name="keyword">
			<button class="btn btn-secondary my-2 my-sm-0" id="btn" type="button">Search</button>
      </form>

      <nav id="navbar" class="navbar">
        <ul>
          <li><a href="${pageContext.request.contextPath}/">홈</a></li>
          <li><a href="${pageContext.request.contextPath}/roomList">숙소</a></li>
          <li><a href="${pageContext.request.contextPath}/attractionList">명소</a></li>
          <li><a href="${pageContext.request.contextPath}/noticeList">공지사항</a></li>
          <li><a href="${pageContext.request.contextPath}/questionList">문의 게시판</a></li>
          <!-- 드롭다운은 필요하면 씁시다!
          <li class="dropdown"><a href="#"><span>Drop Down</span> <i class="bi bi-chevron-down"></i></a>
            <ul>
              <li><a href="#">Drop Down 1</a></li>
              <li class="dropdown"><a href="#"><span>Deep Drop Down</span> <i class="bi bi-chevron-right"></i></a>
                <ul>
                  <li><a href="#">Deep Drop Down 1</a></li>
                  <li><a href="#">Deep Drop Down 2</a></li>
                  <li><a href="#">Deep Drop Down 3</a></li>
                  <li><a href="#">Deep Drop Down 4</a></li>
                  <li><a href="#">Deep Drop Down 5</a></li>
                </ul>
              </li>
              <li><a href="#">Drop Down 2</a></li>
              <li><a href="#">Drop Down 3</a></li>
              <li><a href="#">Drop Down 4</a></li>
            </ul>
          </li>
          -->
          <c:if test="${loginUser!=null}">
            <c:if test="${loginUser.userLevel.equals('host')}">
              <li><a class="active" href="${pageContext.request.contextPath}/hostMyPage">${loginUser.userName}</a></li>
          	</c:if>
          	<c:if test="${loginUser.userLevel.equals('member')}">
              <li><a class="active" href="${pageContext.request.contextPath}/myPage">${loginUser.userName}</a></li>
          	</c:if>
          	<c:if test="${loginUser.userLevel.equals('system_admin')}">
              <li><a class="active" href="${pageContext.request.contextPath}/systemAdminMyPage">${loginUser.userName}</a></li>
          	</c:if>
          	<li><a href="${pageContext.request.contextPath}/logout">logout</a></li>
          </c:if>
          <c:if test="${loginUser==null}">
          	<li><a href="${pageContext.request.contextPath}/login">login</a></li>
          </c:if>
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->

    </div>
  </header><!-- End Header -->
  
  <!-- 기존 부트스트랩에서 footer 하단에 존재하던 js들-->
 <!-- Vendor JS Files -->
  <script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
  
  <!-- 검색창 script -->
  <script>
   $('#btn').click(function(){
      if($('#keyword').val() == '') {
         alert('검색어를 입력하세요');
         return;
      }
      $('#searchForm').submit();
   });
  </script>