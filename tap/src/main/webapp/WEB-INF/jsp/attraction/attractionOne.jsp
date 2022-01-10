<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<html>
<head>
<style>
	.event-list	{
	position:relative;
	padding-bottom:70px;}
	#breadcrumbs	{
		position:relative;
		height:70px;}
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
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<meta charset="UTF-8">
	<title>${attraction.attractionName }</title>
	
	<!-- Favicons -->
    <link href="${pageContext.request.contextPath}/resources/img/tap_favicon.png" rel="icon">
    <link href="${pageContext.request.contextPath}/resources/img/tap_favicon.png" rel="apple-touch-icon">

	<style type="text/css">
    	.customoverlay {position:relative;bottom:85px;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;float:left;}
		.customoverlay:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}
		.customoverlay a {display:block;text-decoration:none;color:#000;text-align:center;border-radius:6px;font-size:14px;font-weight:bold;overflow:hidden;background: #FFBC00;background: #FFBC00 url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;}
		.customoverlay .title {display:block;text-align:center;background:#fff;margin-right:35px;padding:10px 15px;font-size:14px;font-weight:bold;}
		.customoverlay:after {content:'';position:absolute;margin-left:-12px;left:50%;bottom:-12px;width:22px;height:12px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    </style>
</head>
<body>
	<!-- start : mainHeader -->
   <div>
      <jsp:include page="/partial/mainHeader.jsp"></jsp:include>
   </div>
   <!-- end : mainHeader -->
   <main id="main">
   <sectvion class="breadcrumbs">
   	<div class="container">
		<div class="d-flex justify-content-between align-items-center"> 
	<h2>명소</h2>
	</div>
	</div>
	</section>
	<section class="event-list">
		<div class="container">
	<div style="margin-bottom:20px; font-size:20px;"class="badge rounded-pill bg-info">${hashtag }</div>
	<form action="${pageContext.request.contextPath}/attractionOne" method="post">
			<div>	
				<!-- 명소 이미지 -->
         		<c:forEach items="${imageList }" var="img">
			    	<c:choose>
						<c:when test="${fn:length(imageList)==1}">
							<img src="${pageContext.request.contextPath}/resources/img/attraction/${img.imageName }" width="70%" height="500px" style="margin-left: 15%">
						</c:when>
						<c:when test="${fn:length(imageList)==2}">
							<img src="${pageContext.request.contextPath}/resources/img/attraction/${img.imageName }" width="49%" height="400px">
						</c:when>
						<c:otherwise>
							<img src="${pageContext.request.contextPath}/resources/img/attraction/${img.imageName }" width="33%" height="370px">
						</c:otherwise>
					</c:choose>
			    </c:forEach>			
			</div>
		<table border="1" style=" margin-top: 25px;"class="table table-hover">
			<tr>
				<td style="width:20%;">명소 이름</td>
				<td id="attractionName" style="width:80%">${attraction.attractionName }</td>
			</tr>
			<tr>
				<td>명소 카테고리</td>
				<td id="attractionCategory">${ attraction.attractionCategory}</td>
			</tr>
			<tr>
				<td>명소 주소</td>
				<td id="address">${address.detailAddress }</td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td id="attractionPhoneNumber">${attraction.attractionPhoneNumber }</td>
			</tr>
			<tr>
				<td>소개</td>
				<td id="attractionContent">${attraction.attractionContent }</td>
			</tr>
		</table>
		<!-- 지도 -->
		<div id="map" style="width:100%;height:400px;" style="margin-top:25px;"></div>
	</form>
	
	</div>
	</section>
	</main>	
	<!-- start : mainFooter -->
   <div>
      <jsp:include page="/partial/mainFooter.jsp"></jsp:include>
   </div>
   <!-- end : mainFooter -->	
   
   <!-- kakao API -->
   <jsp:include page="/partial/kakaoAPIKey.jsp"></jsp:include>
   
	<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  
	
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	// 주소로 좌표를 검색합니다
	geocoder.addressSearch($('#address').text(), function(result, status) {

	    // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {
	    	 
	    	// 마커 이미지 정보
	    	var imageSrc = '${pageContext.request.contextPath}/resources/img/system/attraction_marker.png', // 마커이미지의 주소입니다    
	        imageSize = new kakao.maps.Size(30, 32), // 마커이미지의 크기입니다
	        imageOption = {offset: new kakao.maps.Point(15, 40)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
	          
	    	// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
	    	var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);

	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	        
	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords,
	            image : markerImage
	        });
	        
	        // 커스텀 오버레이에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
	        var link_attraction = 'https://map.kakao.com/link/to/'+$('#attractionName').text()+','+result[0].y+','+result[0].x;
	           var content = '<div class="customoverlay">' +
	               '  <a href="'+link_attraction+'" target="_blank">' +
	               '    <span class="title">${attraction.attractionName }</span>' +
	               '  </a>' +
	               '</div>';

	           // 커스텀 오버레이가 표시될 위치입니다 
	           var custom_position = new kakao.maps.LatLng(result[0].y, result[0].x);  

	           // 커스텀 오버레이를 생성합니다
	           var customOverlay = new kakao.maps.CustomOverlay({
	               map: map,
	               position: custom_position,
	               content: content,
	               yAnchor: 1 
	           });

	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
	});
	  
	</script>
</body>
</html>