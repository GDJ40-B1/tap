<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.js"></script> 
<meta charset="UTF-8">
<title>modifyAttraction</title>
</head>
<body>
	<!-- start : mainHeader -->
   <div>
      <jsp:include page="/partial/mainHeader.jsp"></jsp:include>
   </div>
   <!-- end : mainHeader -->
   <main id="main">
   <section class="breadcrumbs">
   
	<h1>명소 수정</h1>
	<form action="${pageContext.request.contextPath}/systemAdmin/modifyAttraction" method="post">
		<!-- 전달 -->
		<input type="hidden" name="attractionId" value="${attraction.attractionId }">
		<input type="hidden" name="detailAddressId" value="${address.detailAddressId}">
		
		<div>
			<label>승인여부</label>
			<input type="radio" name="approvalStatus" value="Y">Y
			<input type="radio" name="approvalStatus" value="N">N
		</div>
		
		<div>
			<label>명소 이름</label>
			<input type="text" name="attractionName" value="${attraction.attractionName }">
		</div>
		
		<div>
			<label>카테고리</label>
				<select name="attractionCategory">
                  <c:forEach items="${attractionCategoryList}" var="list">
                     <c:choose>
                        <c:when test="${list eq attraction.attractionCategory }">
                           <option selected>${list }</option>
                        </c:when>
                        <c:otherwise>
                           <option>${list }</option>
                        </c:otherwise>
                        </c:choose>
                     </c:forEach>
                </select>			
		</div>
		
		<table border="1">			
			
			<tr>
				<!-- 전화번호 형태? 예쁘게 만들기+숫자만 들어가게끔 하기 -->
				<td>전화번호</td>
				<td><input type="text" name="attractionPhoneNumber" value="${attraction.attractionPhoneNumber }"></td>
			</tr>
			<tr>
				<!-- 명소 소개 -->
				<td>명소 소개</td>
				<td><textarea name="attractionContent">${attraction.attractionContent }</textarea></td>
			</tr>
			<tr>
		</table>
			<div>주소</div>
			<div>
				<input type="text" name="detailAddress" id="address" value="${address.detailAddress }">
			</div>			
			<div>
				<button type="button" name="searchBtn"id="searchBtn">찾기</button>
			</div>
			<div>상세주소</div>
			<div>
				<input type="text" name="detailAddress2" id="detailAddress2" value="${address.detailAddress2 }">
			</div>
			<div id="map" style="width:600px; height:359px;"></div>
			
			<div>
				<label>해시태그</label>
				<input type="text" id="hashtag" name="hashtag" value="${hashtag }">
			</div>
			
			<br>
		
	<button type="submit" id="modifyBtn">수정하기</button>
	</form>
	</section>
	</main>
	
	<!-- start : mainFooter -->
   <div>
      <jsp:include page="/partial/mainFooter.jsp"></jsp:include>
   </div>
   <!-- end : mainFooter -->
   
   <script>
		<!-- 해시태그 관련 script -->
		
		// hashtag input에서 데이터를 모두 지워도 #은 남도록 한다.
		$('#hashtag').keydown(function(event) {
			var oldvalue=$(this).val();
			var field=this;
			setTimeout(function () {
			    if(field.value.indexOf('#') !== 0) {
			        $('#hashtag').val(oldvalue);
			    } 
			}, 1);
			
			// 스페이스바 기능 방지를 위한 변수
			var handled=false;
			  // 스페이스바 or 엔터를 칠 시 #자동생성
			  if (event.keyCode == '13') {
				  $('#hashtag').val($('#hashtag').val()+' #');
			  } else if(event.keyCode == '32'){
				  handled=true; // 기능 제한
				  $('#hashtag').val($('#hashtag').val()+' #');
			  }
			  
			  if(handled){
					event.preventDefault();
				}
		 });
	</script>
		<!-- kakao API -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e1c10213787b97f0d88e77cdafcb6687&libraries=services"></script>
	<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  
	
	var map = new kakao.maps.Map(mapContainer, mapOption);	
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
		            content: '<div style="width:150px;text-align:center;padding:6px 0;">명소</div>'
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