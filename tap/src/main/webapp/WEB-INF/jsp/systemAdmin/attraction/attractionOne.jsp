<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
	<title>명소 상세보기</title>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	
    <!-- Custom styles for this template-->
    <link href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">
	 
</head>
<body id="page-top">
	
    <!-- start : systemAdminHeader -->
    <div>
    	<jsp:include page="/partial/systemAdminHeader.jsp"></jsp:include>
    </div>
    <!-- end : systemAdminHeader -->
    
    <!-- start : content -->
	<div id="content" class="container-fluid">
		<!-- DataTales Example -->
	    <div class="card shadow mb-4">
	        <div class="card-header py-3">
	            <h6 class="m-0 font-weight-bold text-primary">명소 상세보기</h6>
	        </div>
	        <div class="card-body">
	        	
	            <div class="table-responsive">
				<form action="${pageContext.request.contextPath}/systemAdmin/attractionOne" method="post">
					<div style="margin-top:20px; margin-bottom:20px; font-size:20px; color:white;"class="badge rounded-pill bg-info">${hashtag }</div>		
					<!-- 지도 -->
					<div id="map" style="width:100%;height:400px; margin-bottom:20px"></div>				        
				        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
							<tr>
								<td>명소 이름</td>
								<td id="attractionName">${attraction.attractionName }</td>
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
								<td>명소 상세주소</td>
								<td id="address2">${address.detailAddress2 }</td>							
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
	                <br>
	                <a class="btn btn-outline-danger" href="${pageContext.request.contextPath }/systemAdmin/removeAttraction?attractionId=${attraction.attractionId }">삭제하기</a>
					<a style="margin-left:20px;" class="btn btn-outline-warning" href="${pageContext.request.contextPath }/systemAdmin/modifyAttraction?attractionId=${attraction.attractionId }&detailAddressId=${address.detailAddressId}">수정하기</a>
					<br>
	                </form>
	            </div>
	        </div>
	    </div>

	</div>
	<!-- end : content -->
	
	<!-- start : systemAdminFooter -->
    <div>
       <jsp:include page="/partial/systemAdminFooter.jsp"></jsp:include>
    </div>
    <!-- end : systemAdminFooter -->
    


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

