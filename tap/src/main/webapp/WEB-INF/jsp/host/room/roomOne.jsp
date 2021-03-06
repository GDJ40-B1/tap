<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.js"></script> 
<meta charset="UTF-8">
<title>숙소 상세보기</title>
<!-- Favicons -->
<link href="${pageContext.request.contextPath}/resources/img/tap_favicon.png" rel="icon">
</head>
<body id="page-top">
	<!-- start : hostHeader -->
    <div>
    	<jsp:include page="/partial/hostHeader.jsp"></jsp:include>
    </div>
    <!-- end : hostHeader -->
    
    <!-- start : content -->
	<div id="content" class="container-fluid">
	
		<!-- start : hostRoomNavi -->
	    <div>
	    	<jsp:include page="/partial/hostRoomNavi.jsp"></jsp:include>
	    </div>
	    <!-- end : hostRoomNavi -->
	    <br>
	    
	    <h1 class="h3 mb-4 text-gray-800">[${room.roomCategory }] ${room.roomName }</h1>
		<br>
	    
	    <c:forEach items="${imageList }" var="img">
	    	<c:choose>
				<c:when test="${fn:length(imageList)==1}">
					<img src="${pageContext.request.contextPath}/resources/img/room/${img.imageName }" width="70%" height="500px" style="margin-left: 15%">
				</c:when>
				<c:when test="${fn:length(imageList)==2}">
					<img src="${pageContext.request.contextPath}/resources/img/room/${img.imageName }" width="49%" height="400px">
				</c:when>
				<c:otherwise>
					<img src="${pageContext.request.contextPath}/resources/img/room/${img.imageName }" width="33%" height="370px">
				</c:otherwise>
			</c:choose>
	    </c:forEach>
		<br><br>
		
		<div class="form-group row">
			<div class="col-sm-6 mb-3 mb-sm-0">
				<!-- 지도 -->
				<div class="form-control" id="map" style="height:95%;"></div>
			</div>
			
			<div class="col-sm-6 mb-3 mb-sm-0">
				<!-- 호스트정보 카드 -->
				<div class="card shadow mb-4">
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary">숙소 상세정보</h6>
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
						<br>
						<h4 class="small font-weight-bold">${hashtag }</h4>
					</div>
				</div>
			</div>
		</div>
		
		<div class="form-group row">
			<div class="col-sm-6 mb-3 mb-sm-0">
				<label>숙소 구성</label>
				<ul class="list-group">
					<c:forEach items="${roomPartList}" var="p">
						<li class="list-group-item">${p.partName } x${p.quantity }</li>
					</c:forEach>
				</ul>
			</div>
			
			<div class="col-sm-6 mb-3 mb-sm-0">
				<label>숙소 비품</label>
				<ul class="list-group">
					<li class="list-group-item">
						<c:forEach items="${roomAmenitiesList}" var="a">
							<span>${a }</span>&nbsp;&nbsp;&nbsp;
						</c:forEach>
					</li>
				</ul>
			</div>
		</div>
		<button type="button" class="btn btn-info" onclick="location.href='${pageContext.request.contextPath}/host/modifyRoom?roomId=${room.roomId}&detailAddressId=${address.detailAddressId}' ">숙소 수정</button>
   		<button type="button" id="delBtn" class="btn btn-info">숙소 삭제</button>
	</div>
	<!-- end : content -->
	
	<!-- start : hostFooter -->
    <div>
       <jsp:include page="/partial/hostFooter.jsp"></jsp:include>
    </div>
    <!-- end : hostFooter -->
    
    
    <!-- 숙소 삭제 클릭 시 -->
	<script>
		$('#delBtn').click(function(){
			if(confirm("숙소를 삭제하시겠습니까? (해당 숙소의 모든 정보가 날아갑니다. 미방문 예약건이 있다면 예약취소를 먼저 해야합니다.)") == true){
				if(${yetReservationNum}==0){
					$(location).attr('href', "${pageContext.request.contextPath}/host/removeRoom?roomId=${room.roomId}");
				} else{
					alert('해당 숙소에 미방문 예약건이 남아있어 삭제할 수 없습니다.');
				}
			} else{
				return;
			}
		});
	</script>
   
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

