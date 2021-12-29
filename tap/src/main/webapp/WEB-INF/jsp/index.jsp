<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>MeFamily Bootstrap Template - Index</title>
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

  <!-- header 불러오기 -->
  <c:import url="/partial/mainHeader.jsp"></c:import>
	
  <!-- ======= Hero Section ======= -->
  <section id="hero" style="height: 500px;">
    <div id="heroCarousel" data-bs-interval="5000" class="carousel slide carousel-fade" data-bs-ride="carousel">

      <ol class="carousel-indicators" id="hero-carousel-indicators"></ol>

      <div class="carousel-inner" role="listbox">

        <!-- Slide 1 -->
        <div class="carousel-item active" style="background-image: url(${pageContext.request.contextPath}/resources/img/slide/index-slide1.jpg)">
        </div>

        <!-- Slide 2 -->
        <div class="carousel-item" style="background-image: url(${pageContext.request.contextPath}/resources/img/slide/index-slide2.jpg)">
        </div>
        
        <!-- Slide 3 -->
        <div class="carousel-item" style="background-image: url(${pageContext.request.contextPath}/resources/img/slide/index-slide3.jpg)">
        </div>
        
        <!-- Slide 4 -->
        <div class="carousel-item" style="background-image: url(${pageContext.request.contextPath}/resources/img/slide/index-slide4.jpg)">
        </div>

      </div>

      <a class="carousel-control-prev" href="#heroCarousel" role="button" data-bs-slide="prev">
        <span class="carousel-control-prev-icon bi bi-chevron-left" aria-hidden="true"></span>
      </a>

      <a class="carousel-control-next" href="#heroCarousel" role="button" data-bs-slide="next">
        <span class="carousel-control-next-icon bi bi-chevron-right" aria-hidden="true"></span>
      </a>

    </div>
  </section>
  <!-- End Hero -->

  <main id="main">

    <!-- ======= My & Family Section ======= -->
    <section id="about" class="about">
      <div class="container">
      
      	<form class="form-inline" id="searchByDistrictForm" action="${pageContext.request.contextPath}/searchListByDistrict">
			<select name="districtSido" id="districtSido" onchange="sidoType(this.value);">
		  		<option value="">==선택==</option>
		  	<c:forEach var="s" items="${sidoList}">
		  		<option value="${s}">${s}</option>
		  	</c:forEach>
			</select>
			<select name="districtSigungu" id="districtSigungu">
				<option value="">==선택==</option>
			</select>
			<input class="form-control mr-sm-2" type="text" id="keyword" name="keyword">
    		<button class="btn btn-primary" id="districtBtn" type="button">검색</button>
		</form>
		
	  	<div id="searchHistory">
	  		<c:forEach var="s" items="${searchList}">
		  		<span><a href="#" onclick="searchKeyword(this)">${s}</a> <a href="#" onclick="removeKeyword('${s}')">x</a></span>
		  	</c:forEach>
	  	</div>
      
		<h1>이달의 ${sigungu} 추천 인기 숙소</h1>
        <div>
        	<c:choose>
			<c:when test="${empty preferRoomMap.list}">
				<div>현재 추천 가능한 숙소가 없습니다.</div>
			</c:when>
			
			<c:otherwise>
            <table class="table" border="1">
            	<tr>
	            	<c:forEach items="${preferRoomMap.list}" var="list">
						<td>
							<div>숙소명 : <a href="${pageContext.request.contextPath}/roomOne?roomId=${list.roomId}&detailAddressId=${list.detailAddressId}">${list.roomName}</a></div>
			
							<div>카테고리 : ${list.roomCategory}</div>
					
							<div>가격 : ${list.roomPrice}</div>
						</td>
					</c:forEach>
				</tr>
			</table>

            
			<!-- 페이징 -->
			<nav style="margin-top: 50px">
	   			<ul class="pagination" style="justify-content: center;">
					<c:if test="${preferRoomMap.preferRoomCurrent > 1}">
						<a href="${pageContext.request.contextPath}/?preferRoomCurrent=1&preferAttractionCurrent=${preferAttractionMap.preferAttractionCurrent}">처음으로</a>
						<a href="${pageContext.request.contextPath}/?preferRoomCurrent=${preferRoomMap.preferRoomCurrent-1}&preferAttractionCurrent=${preferRoomMap.preferAttractionCurrent}">이전</a>
					</c:if>
					
					<c:forEach var="i" begin="${preferRoomMap.startPage}" end="${preferRoomMap.endPage}">
						<a href="${pageContext.request.contextPath}/?preferRoomCurrent=${i}&preferAttractionCurrent=${preferAttractionMap.preferAttractionCurrent}"><c:out value="${i}"/></a>
					</c:forEach>
					
					<c:if test="${preferRoomMap.preferRoomCurrent < preferRoomMap.lastPage}">
						<a href="${pageContext.request.contextPath}/?preferRoomCurrent=${preferRoomMap.preferRoomCurrent+1}&preferAttractionCurrent=${preferAttractionMap.preferAttractionCurrent}">다음</a>
						<a href="${pageContext.request.contextPath}/?preferRoomCurrent=${preferRoomMap.lastPage}&preferAttractionCurrent=${preferAttractionMap.preferAttractionCurrent}">끝으로</a>
					</c:if>		
				</ul>
			</nav>
			</c:otherwise>
			</c:choose>
        </div>

		<h1>이달의 ${sigungu} 추천 인기 명소</h1>
        <div>
        	<c:choose>
			<c:when test="${empty preferAttractionMap.list}">
				<div>현재 추천 가능한 명소가 없습니다.</div>
			</c:when>
			
			<c:otherwise>
            <table class="table" border="1">
            	<tr>
	            	<c:forEach items="${preferAttractionMap.list}" var="list">
						<td>
							<div>명소 카테고리 : ${list.attractionCategory}</div>
			
							<div>이름 : <a href="${pageContext.request.contextPath}/attractionOne?attractionId=${list.attractionId}&detailAddressId=${list.detailAddressId}">${list.attractionName}</a></div>
					
							<div>전화번호 : ${list.attractionPhoneNumber}</div>
						</td>
					</c:forEach>
				</tr>
			</table>

            
			<!-- 페이징 -->
			<nav style="margin-top: 50px">
	   			<ul class="pagination" style="justify-content: center;">
					<c:if test="${preferAttractionMap.preferAttractionCurrent > 1}">
						<a href="${pageContext.request.contextPath}/?preferRoomCurrent=${preferRoomMap.preferRoomCurrent}&preferAttractionCurrent=1">처음으로</a>
						<a href="${pageContext.request.contextPath}/?preferRoomCurrent=${preferRoomMap.preferRoomCurrent}&preferAttractionCurrent=${preferAttractionMap.preferAttractionCurrent-1}">이전</a>
					</c:if>
					
					<c:forEach var="i" begin="${preferAttractionMap.startPage}" end="${preferAttractionMap.endPage}">
						<a href="${pageContext.request.contextPath}/?preferRoomCurrent=${preferRoomMap.preferRoomCurrent}&preferAttractionCurrent=${i}"><c:out value="${i}"/></a>
					</c:forEach>
					
					<c:if test="${preferAttractionMap.preferAttractionCurrent < preferAttractionMap.lastPage}">
						<a href="${pageContext.request.contextPath}/?preferRoomCurrent=${preferRoomMap.preferRoomCurrent}&preferAttractionCurrent=${preferAttractionMap.preferAttractionCurrent+1}">다음</a>
						<a href="${pageContext.request.contextPath}/?preferRoomCurrent=${preferRoomMap.preferRoomCurrent}&preferAttractionCurrent=${preferAttractionMap.lastPage}">끝으로</a>
					</c:if>		
				</ul>
			</nav>
			</c:otherwise>
			</c:choose>
        </div>

        <div class="row content">
          <div class="col-lg-6">
            <img src="${pageContext.request.contextPath}/resources/img/about.jpg" class="img-fluid" alt="">
          </div>
          <div class="col-lg-6 pt-4 pt-lg-0">
            <p>
              Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore
              magna aliqua.
            </p>
            <ul>
              <li><i class="ri-check-double-line"></i> Ullamco laboris nisi ut aliquip ex ea commodo consequat</li>
              <li><i class="ri-check-double-line"></i> Duis aute irure dolor in reprehenderit in voluptate velit</li>
              <li><i class="ri-check-double-line"></i> Ullamco laboris nisi ut aliquip ex ea commodo consequat</li>
            </ul>
            <p>
              Ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate
              velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in
              culpa qui officia deserunt mollit anim id est laborum.
            </p>
            <a href="our-story.html" class="btn-learn-more">Learn More</a>
          </div>
        </div>

      </div>
    </section>
    <!-- End My & Family Section -->

    <!-- ======= Features Section ======= -->
    <section id="features" class="features">
      <div class="container">

        <div class="row">
          <div class="col-lg-4 col-md-6 icon-box">
            <div class="icon"><i class="bi bi-laptop"></i></div>
            <h4 class="title"><a href="">Lorem Ipsum</a></h4>
            <p class="description">Voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident</p>
          </div>
          <div class="col-lg-4 col-md-6 icon-box">
            <div class="icon"><i class="bi bi-bar-chart"></i></div>
            <h4 class="title"><a href="">Dolor Sitema</a></h4>
            <p class="description">Minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat tarad limino ata</p>
          </div>
          <div class="col-lg-4 col-md-6 icon-box">
            <div class="icon"><i class="bi bi-bounding-box"></i></div>
            <h4 class="title"><a href="">Sed ut perspiciatis</a></h4>
            <p class="description">Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur</p>
          </div>
          <div class="col-lg-4 col-md-6 icon-box">
            <div class="icon"><i class="bi bi-broadcast"></i></div>
            <h4 class="title"><a href="">Magni Dolores</a></h4>
            <p class="description">Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum</p>
          </div>
          <div class="col-lg-4 col-md-6 icon-box">
            <div class="icon"><i class="bi bi-camera"></i></div>
            <h4 class="title"><a href="">Nemo Enim</a></h4>
            <p class="description">At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque</p>
          </div>
          <div class="col-lg-4 col-md-6 icon-box">
            <div class="icon"><i class="bi bi-diagram-3"></i></div>
            <h4 class="title"><a href="">Eiusmod Tempor</a></h4>
            <p class="description">Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi</p>
          </div>
        </div>

      </div>
    </section>
    <!-- End Features Section -->

    <!-- ======= Recent Photos Section ======= -->
    <section id="recent-photos" class="recent-photos">
      <div class="container">

        <div class="section-title">
          <h2>Recent Photos</h2>
          <p>Magnam dolores commodi suscipit. Necessitatibus eius consequatur ex aliquid fuga eum quidem. Sit sint consectetur velit. Quisquam quos quisquam cupiditate. Et nemo qui impedit suscipit alias ea. Quia fugiat sit in iste officiis commodi quidem hic quas.</p>
        </div>

        <div class="recent-photos-slider swiper">
          <div class="swiper-wrapper align-items-center">
            <div class="swiper-slide"><a href="${pageContext.request.contextPath}/resources/img/recent-photos/recent-photos-1.jpg" class="glightbox"><img src="${pageContext.request.contextPath}/resources/img/recent-photos/recent-photos-1.jpg" class="img-fluid" alt=""></a></div>
            <div class="swiper-slide"><a href="${pageContext.request.contextPath}/resources/img/recent-photos/recent-photos-2.jpg" class="glightbox"><img src="${pageContext.request.contextPath}/resources/img/recent-photos/recent-photos-2.jpg" class="img-fluid" alt=""></a></div>
            <div class="swiper-slide"><a href="${pageContext.request.contextPath}/resources/img/recent-photos/recent-photos-3.jpg" class="glightbox"><img src="${pageContext.request.contextPath}/resources/img/recent-photos/recent-photos-3.jpg" class="img-fluid" alt=""></a></div>
            <div class="swiper-slide"><a href="${pageContext.request.contextPath}/resources/img/recent-photos/recent-photos-4.jpg" class="glightbox"><img src="${pageContext.request.contextPath}/resources/img/recent-photos/recent-photos-4.jpg" class="img-fluid" alt=""></a></div>
            <div class="swiper-slide"><a href="${pageContext.request.contextPath}/resources/img/recent-photos/recent-photos-5.jpg" class="glightbox"><img src="${pageContext.request.contextPath}/resources/img/recent-photos/recent-photos-5.jpg" class="img-fluid" alt=""></a></div>
            <div class="swiper-slide"><a href="${pageContext.request.contextPath}/resources/img/recent-photos/recent-photos-6.jpg" class="glightbox"><img src="${pageContext.request.contextPath}/resources/img/recent-photos/recent-photos-6.jpg" class="img-fluid" alt=""></a></div>
            <div class="swiper-slide"><a href="${pageContext.request.contextPath}/resources/img/recent-photos/recent-photos-7.jpg" class="glightbox"><img src="${pageContext.request.contextPath}/resources/img/recent-photos/recent-photos-7.jpg" class="img-fluid" alt=""></a></div>
            <div class="swiper-slide"><a href="${pageContext.request.contextPath}/resources/img/recent-photos/recent-photos-8.jpg" class="glightbox"><img src="${pageContext.request.contextPath}/resources/img/recent-photos/recent-photos-8.jpg" class="img-fluid" alt=""></a></div>
          </div>
          <div class="swiper-pagination"></div>
        </div>

      </div>
    </section>
    <!-- End Recent Photos Section -->

  </main>
  <!--  End #main   -->
  
  <!-- 푸터 불러오기 -->
  <c:import url="/partial/mainFooter.jsp"></c:import>

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
  
  	  <script>
	  	$('#districtBtn').click(function(){
	  		if($('#districtSido').val() == '') {
				alert('시도를 선택하세요');
				return;
			}
			
	  		if($('#districtSigungu').val() == '') {
				alert('시군구를 선택하세요');
				return;
			}
	  		
			if($('#districtKeyword').val() == '') {
				alert('검색어를 입력하세요');
				return;
			}
			
			$('#searchByDistrictForm').submit();
		});
	  
	  function searchKeyword(keyword) {
		  var addKeyword = $(keyword).text();
		  
		  $("#keyword").val(addKeyword);
	  }
	  
	  function sidoType(districtSido) {
		  $.ajax({
			  type: 'GET',
			  contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			  url : '${pageContext.request.contextPath}/sido',
			  cache : false,
			  data : { districtSido : districtSido },
			  dataType: 'json',
			  success : function(result){
				  console.log(result)
					
				  $("#districtSigungu").find("option").remove().end().append("<option value=''>==선택==</option>")
				  $.each(result, function(i){
					 $("#districtSigungu").append("<option value='"+result[i]+"'>"+result[i]+"</option>")
				  });
			  }
		  }).fail(function (error) {
			  alert(JSON.stringify(error));
		  })
	  }
	  
	  function removeKeyword(keyword) {
		  $.ajax({
			  type: 'GET',
			  contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			  url : '${pageContext.request.contextPath}/removeSearchHistory',
			  cache : false,
			  data : { keyword : keyword },
			  success : function(result){
				  console.log(result)
				  
				  $("#searchHistory").load(location.href+' #searchHistory');
				
			  }
		  })
	  }
	  </script>
  
</body>

</html>