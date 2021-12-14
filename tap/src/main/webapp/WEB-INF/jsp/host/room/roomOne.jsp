<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.js"></script> 
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body id="page-top">
	<!-- start : hostHeader -->
    <div>
    	<jsp:include page="/partial/hostHeader.jsp"></jsp:include>
    </div>
    <!-- end : hostHeader -->
    
    <!-- start : content -->
	<div id="content" class="container-fluid">
		
		<!-- breadcrumb : 3 level이 되는 부분부터 사용 -->
		<nav aria-label="breadcrumb">
			<ol class="breadcrumb bg-gray-100">
				<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/hostMyPage">홈</a></li>
				<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/host/roomList">숙소목록</a></li>
				<li class="breadcrumb-item active" aria-current="page">상세보기</li>
			</ol>
		</nav>
		
		<!-- 지도 -->
		<div id="map" style="width:100%;height:400px;"></div>
		<br>
		
		<!-- 호스트정보 카드 -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">숙소 상세보기</h6>
			</div>
			<div class="card-body">
				<h4 class="small font-weight-bold">숙소명<span id="roomName" class="float-right">${room.roomName }</span></h4>
				<h4 class="small font-weight-bold">주소<span id="address" class="float-right">${address.detailAddress }</span></h4>
				<h4 class="small font-weight-bold">상세 주소<span class="float-right">${address.detailAddress2 }</span></h4>
				<h4 class="small font-weight-bold">카테고리<span class="float-right">${room.roomCategory }</span></h4>
				<h4 class="small font-weight-bold">숙소 소개<span class="float-right">${room.roomIntro }</span></h4>
				<h4 class="small font-weight-bold">가격<span class="float-right">${room.roomPrice }</span></h4>
				<h4 class="small font-weight-bold">체크인 시간<span class="float-right">${room.checkInTime }</span></h4>
				<h4 class="small font-weight-bold">체크아웃 시간<span class="float-right">${room.checkOutTime }</span></h4>
				<h4 class="small font-weight-bold">인원수<span class="float-right">${room.peopleNum }</span></h4>
				<h4 class="small font-weight-bold">숙소 형태<span class="float-right">${room.roomForm }</span></h4>
				<h4 class="small font-weight-bold">최소 숙박일<span class="float-right">${room.minDay }</span></h4>
				<h4 class="small font-weight-bold">숙소 등록일<span class="float-right">${room.createDate }</span></h4>
				<h4 class="small font-weight-bold">숙소 수정일<span class="float-right">${room.updateDate }</span></h4>
			</div>
		</div>
		
		<a href="${pageContext.request.contextPath}/host/couponList?roomId=${room.roomId}&detailAddressId=${address.detailAddressId}&roomName=${room.roomName }">쿠폰 목록</a>
		<a href="${pageContext.request.contextPath}/host/modifyRoom?roomId=${room.roomId}&detailAddressId=${address.detailAddressId}">숙소 수정</a>
   		<a href="${pageContext.request.contextPath}/host/removeRoom?roomId=${room.roomId}">숙소 삭제</a>
	</div>
	<!-- end : content -->
	
	<!-- start : hostFooter -->
    <div>
       <jsp:include page="/partial/hostFooter.jsp"></jsp:include>
    </div>
    <!-- end : hostFooter -->
   
   <!-- kakao API -->
   <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e1c10213787b97f0d88e77cdafcb6687&libraries=services"></script>
   
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
	            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+$('#roomName').text()+'</div>'
	        });
	        infowindow.open(map, marker);

	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
	});
	  
	</script>
</body>
</html>

