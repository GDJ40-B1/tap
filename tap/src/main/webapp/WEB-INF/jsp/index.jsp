<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
<style>
	.pagination	{
	position:relative;
	padding-bottom:50px;
	}
	#list	{
		height:auto;
	min-height:100%;
	padding-bottom:150px;
	}
	#main	{
		height:auto;
	min-height:100%;
	padding-bottom:200px;
	}
</style>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>TAP - 숙박 공유 서비스</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="${pageContext.request.contextPath}/resources/img/tap_favicon.png" rel="icon">
  <link href="${pageContext.request.contextPath}/resources/img/tap_favicon.png" rel="apple-touch-icon">

  <!-- Vendor CSS Files -->
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
      		<div class="form-group">
      			<div class="input-group mb-3">
      				<div class="input-group-prepend">
					<select class="form-select" name="districtSido" id="districtSido" onchange="sidoType(this.value);">
				  		<option value="" selected disabled>시도</option>
					  	<c:forEach var="s" items="${sidoList}">
					  		<option value="${s}">${s}</option>
					  	</c:forEach>
					</select>
					</div>
					<div class="input-group-prepend">
					<select class="form-select" name="districtSigungu" id="districtSigungu">
						<option value="" selected disabled>시군구</option>
					</select>
					</div>
					<input class="form-control" type="text" id="districtKeyword" name="districtKeyword">
	    			<button class="btn btn-primary" id="districtBtn" type="button">검색</button>
	    		</div>
    		</div>
		</form>
		
		<div class="card border-primary">
			<div class="card-header">최근 검색어</div>
			<div id="searchHistory" class="card-body">
				<c:forEach var="s" items="${searchList}" begin="0" end="6">
					<div class="btn-group" role="group" aria-label="Button group with nested dropdown" style="margin-left: 7px; margin-right: 7px;">
						<button type="button" class="btn btn-primary" onclick="searchKeyword(this)">${s}</button>
						<div class="btn-group" role="group">
 							<button type="button" class="btn btn-outline-dark" onclick="removeKeyword('${s}')">x</button>
 						</div>
					</div>
				</c:forEach>
			</div>
        </div>
      </div>
    </section>
    <!-- End My & Family Section -->

    <!-- ======= Features Section ======= -->
    <section id="event-list" class="event-list">
      <div class="container">

        <div class="row">
	        	<c:choose>
				<c:when test="${empty preferRoomMap.list}">
			        <div class="section-title">
						<h2>현재 추천 가능한 숙소가 없습니다.</h2>
					</div>
				</c:when>
				
				<c:otherwise>
				<div id="room" class="section-title">
					<h2>이달의 ${sigungu} 추천 인기 숙소</h2>
				</div>
				
				<c:forEach items="${preferRoomMap.list}" var="list">
				<div class="col-lg-3 col-md-6 d-flex align-items-stretch">
		            <div class="card">
		              <div class="card-img">
		                <a href="${pageContext.request.contextPath}/roomOne?roomId=${list.roomId}&detailAddressId=${list.detailAddressId}"><img src="${pageContext.request.contextPath}/resources/img/room/${list.imageName}" class="img-fluid" alt="숙소 이미지"></a>
		              </div>
		              <div class="card-body">
		                <h5 class="card-title">${list.roomName}</h5>
		                <p class="text-center">${list.roomCategory}</p>
		                <p class="text-center">${list.roomPrice}원</p>
		                <p class="card-text">${list.roomIntro}</p>
		              </div>
		            </div>
		        </div>
		        </c:forEach>			

				<!-- 페이징 -->
				<nav>
			   		<ul class="pagination" style="justify-content: center;">
			   			<li>
							<c:if test="${preferRoomMap.preferAttractionCurrent > 1}">
							<div class="btn-group me-2" role="group" aria-label="First group" style="justify-content: center;">
								<a class="btn btn-secondary btn-sm" href="${pageContext.request.contextPath}/?preferRoomCurrent=1&preferAttractionCurrent=${preferAttractionMap.preferAttractionCurrent}#room">처음으로</a>
							</div>
							<div class="btn-group me-2" role="group" aria-label="First group" style="justify-content: center;">	
								<a class="btn btn-primary" href="${pageContext.request.contextPath}/?preferRoomCurrent=${preferRoomMap.preferRoomCurrent-1}&preferAttractionCurrent=${preferRoomMap.preferAttractionCurrent}#room">이전</a>
							</div>
							</c:if>
							
							<div class="btn-group me-2" role="group" aria-label="First group" style="justify-content: center;">
								<c:forEach var="i" begin="${preferRoomMap.startPage}" end="${preferRoomMap.endPage}">
									<a class="btn btn-outline-primary" href="${pageContext.request.contextPath}/?preferRoomCurrent=${i}&preferAttractionCurrent=${preferAttractionMap.preferAttractionCurrent}#room"><c:out value="${i}"/></a>
								</c:forEach>
							</div>
														
							<c:if test="${preferRoomMap.preferRoomCurrent < preferRoomMap.lastPage}">
							<div class="btn-group me-2" role="group" aria-label="First group" style="justify-content: center;">
								<a class="btn btn-primary" href="${pageContext.request.contextPath}/?preferRoomCurrent=${preferRoomMap.preferRoomCurrent+1}&preferAttractionCurrent=${preferAttractionMap.preferAttractionCurrent}#room">다음</a>
							</div>
							<div class="btn-group me-2" role="group" aria-label="First group" style="justify-content: center;">	
								<a class="btn btn-secondary btn-sm" href="${pageContext.request.contextPath}/?preferRoomCurrent=${preferRoomMap.lastPage}&preferAttractionCurrent=${preferAttractionMap.preferAttractionCurrent}#room">끝으로</a>
							</div>
							</c:if>		
						</li>
					</ul>
				</nav>				
				</c:otherwise>
				</c:choose>
        </div>
      </div>
    </section>
    <!-- End Features Section -->
    
	<div class="container">
		<hr>
	</div>
	
    <!-- ======= Features Section ======= -->
    <section id="event-list" class="event-list">
      <div id="attraction" class="container">

        <div class="row">
        	<c:choose>
			<c:when test="${empty preferAttractionMap.list}">
		        <div class="section-title">
					<h2>현재 추천 가능한 명소가 없습니다.</h2>
				</div>	
			</c:when>
			
			<c:otherwise>
			<div class="section-title">
				<h2>${sigungu} 추천 인기 명소</h2>
			</div>			
			
			<c:forEach items="${preferAttractionMap.list}" var="list">
			<div class="col-lg-3 col-md-6 d-flex align-items-stretch">
	            <div class="card">
	              <div class="card-img">
	                <a href="${pageContext.request.contextPath}/attractionOne?attractionId=${list.attractionId}&detailAddressId=${list.detailAddressId}"><img src="${pageContext.request.contextPath}/resources/img/attraction/${list.imageName}" class="img-fluid" alt="명소 이미지"></a>
	              </div>
	              <div class="card-body">
	                <h5 class="card-title">${list.attractionName}</h5>
	                <p class="text-center">${list.attractionCategory}</p>
	                <p class="text-center">${list.attractionPhoneNumber}</p>
	                <p class="card-text">${list.attractionContent}</p>
	              </div>
	            </div>
	        </div>
	        </c:forEach>		
            
			<!-- 페이징 -->
			<nav>
		   		<ul class="pagination" style="justify-content: center;">
		   			<li>
						<c:if test="${preferAttractionMap.preferAttractionCurrent > 1}">
						<div class="btn-group me-2" role="group" aria-label="First group" style="justify-content: center;">
							<a class="btn btn-secondary btn-sm" href="${pageContext.request.contextPath}/?preferRoomCurrent=${preferRoomMap.preferRoomCurrent}&preferAttractionCurrent=1#attraction">처음으로</a>
						</div>
						<div class="btn-group me-2" role="group" aria-label="First group" style="justify-content: center;">	
							<a class="btn btn-primary" href="${pageContext.request.contextPath}/?preferRoomCurrent=${preferRoomMap.preferRoomCurrent}&preferAttractionCurrent=${preferAttractionMap.preferAttractionCurrent-1}#attraction">이전</a>
						</div>
						</c:if>
						
						<div class="btn-group me-2" role="group" aria-label="First group" style="justify-content: center;">
							<c:forEach var="i" begin="${preferAttractionMap.startPage}" end="${preferAttractionMap.endPage}">
								<a class="btn btn-outline-primary" href="${pageContext.request.contextPath}/?preferRoomCurrent=${preferRoomMap.preferRoomCurrent}&preferAttractionCurrent=${i}#attraction"><c:out value="${i}"/></a>
							</c:forEach>
						</div>
													
						<c:if test="${preferAttractionMap.preferAttractionCurrent < preferAttractionMap.lastPage}">
						<div class="btn-group me-2" role="group" aria-label="First group" style="justify-content: center;">
							<a class="btn btn-primary" href="${pageContext.request.contextPath}/?preferRoomCurrent=${preferRoomMap.preferRoomCurrent}&preferAttractionCurrent=${preferAttractionMap.preferAttractionCurrent+1}#attraction">다음</a>
						</div>
						<div class="btn-group me-2" role="group" aria-label="First group" style="justify-content: center;">	
							<a class="btn btn-secondary btn-sm" href="${pageContext.request.contextPath}/?preferRoomCurrent=${preferRoomMap.preferRoomCurrent}&preferAttractionCurrent=${preferAttractionMap.lastPage}#attraction">끝으로</a>
						</div>
						</c:if>		
					</li>
				</ul>
			</nav>
			</c:otherwise>
			</c:choose>
        </div>
      </div>
    </section>
    <!-- End Features Section -->

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
		  
		  $("#districtKeyword").val(addKeyword);
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
					
				  $("#districtSigungu").find("option").remove().end().append("<option value='' selected disabled>시군구 선택</option>")
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
				  $("#searchHistory").load(location.href+' #searchHistory>*', "");
				
			  }
		  })
	  }
	  </script>
  
</body>

</html>