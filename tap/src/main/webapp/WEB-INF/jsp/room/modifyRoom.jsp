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
	<form action="${pageContext.request.contextPath}/modifyRoom" method="post">
		<!-- 숙소ID, 상세 주소ID, 호스트ID 숨김 -->
		<input type="hidden" name="roomId" value="${room.roomId }">
		<input type="hidden" name="detailAddressId" value="${address.detailAddressId }">
		<input type="hidden" name="hostId" value="${room.hostId }">
		<table>
			<tr>
				<td>
					숙소 카테고리
				</td>
				<td>
					<select name="roomCategory">
						<c:forEach items="${roomCategoryList }" var="c">
							<c:choose>
								<c:when test="${c eq room.roomCategory }">
									<option selected>${c }</option>
								</c:when>
								<c:otherwise>
									<option>${c }</option>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td>숙소명</td>
				<td><input type="text" name="roomName" value="${room.roomName }"></td>
			</tr>
			<tr>
				<!-- select형식으로 변경해야 함 -->
				<td>숙소 형태</td>
				<td><input type="text" name="roomForm" value="${room.roomForm }"></td>
			</tr>
			<tr>
				<td>숙소 소개</td>
				<td><textarea name="roomIntro">${room.roomIntro }</textarea></td>
			</tr>
			<tr>
				<!-- 유효성 검사로 숫자인지 확인 -->
				<td>최소숙박일</td>
				<td><input type="text" name="minDay" value="${room.minDay }"></td>
			</tr>
			<tr>
				<td>체크인 시간</td>
				<td>
					<select name="checkInTime">
						<c:forEach  var="CIT" begin="0" end="23">
							<c:choose>
								<c:when test="${(CIT<10 && (('0'+=CIT+=':00') eq room.checkInTime)) ||  (CIT>=10 && ((CIT+=':00') eq room.checkInTime))}">
									<c:choose>
										<c:when test="${CIT<10 }">
											<option selected>0${CIT }:00</option>
										</c:when>
										<c:otherwise>
											<option selected>${CIT }:00</option>
										</c:otherwise>
									</c:choose>
								</c:when>
								<c:otherwise>
									<c:choose>
										<c:when test="${CIT<10 }">
											<option>0${CIT }:00</option>
										</c:when>
										<c:otherwise>
											<option>${CIT }:00</option>
										</c:otherwise>
									</c:choose>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td>체크아웃 시간</td>
				<td>
					<select name="checkOutTime">
						<c:forEach  var="COT" begin="0" end="23">
							<c:choose>
								<c:when test="${(COT<10 && (('0'+=COT+=':00') eq room.checkOutTime)) ||  (COT>=10 && ((COT+=':00') eq room.checkOutTime))}">
									<c:choose>
										<c:when test="${COT<10 }">
											<option selected>0${COT }:00</option>
										</c:when>
										<c:otherwise>
											<option selected>${COT }:00</option>
										</c:otherwise>
									</c:choose>
								</c:when>
								<c:otherwise>
									<c:choose>
										<c:when test="${COT<10 }">
											<option>0${COT }:00</option>
										</c:when>
										<c:otherwise>
											<option>${COT }:00</option>
										</c:otherwise>
									</c:choose>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<!-- 유효성 검사로 숫자인지 확인 -->
				<td>인원수</td>
				<td><input type="text" name="peopleNum" value="${room.peopleNum }"></td>
			</tr>
			<tr>
				<!-- 유효성 검사로 숫자인지 확인 -->
				<td>숙박 기본 가격</td>
				<td><input type="text" name="roomPrice" value="${room.roomPrice }"></td>
			</tr>
		</table>
		<br><br>
		
		<h3>숙소 주소 입력</h3>
		<table>
			<tr>
				<td>주소</td>
				<td><input type="text" name="detailAddress" id="address" value="${address.detailAddress }"></td>
				<td><button type="button" id="searchBtn">검색</button></td>
			</tr>
			<tr>
				<td>상세 주소</td>
				<td><input type="text" name="detailAddress2" value="${address.detailAddress2 }"></td>
				<td></td>
			</tr>
		</table>
		<div id="map" style="width:100%;height:350px;"></div>
		<button type="submit">수정</button>
	</form>
	</section>
	</main>
	
	<!-- start : mainFooter -->
   <div>
      <jsp:include page="/partial/mainFooter.jsp"></jsp:include>
   </div>
   <!-- end : mainFooter -->
   
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