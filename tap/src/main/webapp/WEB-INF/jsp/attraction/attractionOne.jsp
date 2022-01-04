<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<meta charset="UTF-8">
<title>명소상세보기</title>
</head>
<body>
	<!-- start : mainHeader -->
   <div>
      <jsp:include page="/partial/mainHeader.jsp"></jsp:include>
   </div>
   <!-- end : mainHeader -->
   <main id="main">
   <section class="breadcrumbs">
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
			
		<!-- 지도 -->
		<div id="map" style="width:100%;height:400px;"></div>
		<table border="1" style=" margin-top: 20px;"class="table table-hover"">
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

	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	        
	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords
	        });

	        // 인포윈도우로 장소에 대한 설명을 표시합니다
	        var infowindow = new kakao.maps.InfoWindow({
	            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+$('#attractionName').text()+'</div>'
	        });
	        infowindow.open(map, marker);

	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
	});
	  
	</script>
</body>
</html>