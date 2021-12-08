<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.js"></script> 
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- start : mainHeader -->
   <div>
      <jsp:include page="/partial/mainHeader.jsp"></jsp:include>
   </div>
   <!-- end : mainHeader -->
   <main id="main">
   <section class="breadcrumbs">
	<h1>숙소 등록하기</h1>
	<form action="${pageContext.request.contextPath}/addRoom" method="post">
		<div>
			숙소 카테고리(카테고리 값 받아와서 해야함) : <input type="text" name="roomCategory">
		</div>
		<div>
			숙소명 : <input type="text" name="roomName">
		</div>
		<div>
			숙소형태(select로 변경) : <input type="text" name="roomForm">
		</div>
		<div>
			숙소 소개 : <input type="text" name="roomIntro">
		</div>
		<div>
			최소숙박일(select로 변경) : <input type="text" name="minDay">
		</div>
		<div>
			체크인시간(select로 변경) : <input type="text" name="checkInTime">
		</div>
		<div>
			체크아웃시간(select로 변경) : <input type="text" name="checkOutTime">
		</div>
		<div>
			인원수(select로 변경) : <input type="text" name="peopleNum">
		</div>
		<div>
			숙박 기본 가격 : <input type="text" name="roomPrice">
		</div>
		<div>
			호스트(임시 설정/1말고 다른걸로 ㄴㄴ) : <input type="text" name="hostId" value="1">
		</div>
		
		<h3>주소 입력</h3>
		<div>
			주소 : <input type="text" name="detailAddress" id="address">
			<button type="button" id="searchBtn">검색</button>
			상세 주소 : <input type="text" name="detailAddress2">
		</div>
		<div id="map" style="width:100%;height:350px;"></div>
		<button type="submit">등록</button>
	</form>
	</section>
	</main>
	
	<!-- start : mainFooter -->
   <div>
      <jsp:include page="/partial/mainFooter.jsp"></jsp:include>
   </div>
   <!-- end : mainFooter -->

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e1c10213787b97f0d88e77cdafcb6687&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  


$('#searchBtn').click(function(){
	// 버튼을 click했을때
	
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	// 주소로 좌표를 검색합니다
	geocoder.addressSearch($('#address').val(), function(result, status) {

	    // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {

	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	        
	        let lat = result[0].y;
	        let lng = result[0].x;
	        getAddr(lat,lng);
	        function getAddr(lat,lng){
	            let geocoder = new kakao.maps.services.Geocoder();

	            let coord = new kakao.maps.LatLng(lat, lng);
	            let callback = function(result, status) {
	                if (status === kakao.maps.services.Status.OK) {
	                    console.log(result[0].road_address.address_name);
	                    $('#address').val(result[0].road_address.address_name);
	                }
	            }
	            geocoder.coord2Address(coord.getLng(), coord.getLat(), callback);
	        }
	        
	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords
	        });

	        // 인포윈도우로 장소에 대한 설명을 표시합니다
	        var infowindow = new kakao.maps.InfoWindow({
	            content: '<div style="width:150px;text-align:center;padding:6px 0;">숙소</div>'
	        });
	        infowindow.open(map, marker);

	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
	});  
});
  
</script>


</body>
</html>