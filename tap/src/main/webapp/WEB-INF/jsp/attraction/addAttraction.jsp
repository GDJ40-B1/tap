<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.js"></script> 
<meta charset="UTF-8">
<title>addAttraction</title>
</head>
<body>
	<h1>명소 등록</h1>
	<form action="${pageContext.request.contextPath}/addAttraction" method="post">
		<table border="1">
			
			<tr>
				<!-- 명소 이름 -->
				<td>명소 이름</td>
				<td><input type="text" name="attractionName"></td>
			</tr>
			
			<tr>
				<!-- 카테고리 -->
				<td>명소 카테고리</td>
				<td>
					<select name="attractionCategory">
						<c:forEach items="${attractionCategoryList}" var="ac">
							<option>${ac }</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<!-- 전화번호 형태? 예쁘게 만들기+숫자만 들어가게끔 하기 -->
				<td>전화번호</td>
				<td><input type="text" name="attractionPoneNumber"></td>
			</tr>
			<tr>
				<!-- 명소 소개 -->
				<td>명소 소개</td>
				<td><textarea name="attractionContent"></textarea></td>
			</tr>
			<tr>
				<!-- 주소 -->
				<td>주소</td>
				<td><input type="text" name="detailAddress" id="address"></td>
				<!-- 구현하기 -->				
			</tr>
		</table>
	
	
	</form>
	
	
		<!-- kakao API -->
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