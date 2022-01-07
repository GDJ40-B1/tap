<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<meta charset="UTF-8">
	<title>숙소</title>
	
	<!-- Favicons -->
    <link href="${pageContext.request.contextPath}/resources/img/tap_favicon.png" rel="icon">
    <link href="${pageContext.request.contextPath}/resources/img/tap_favicon.png" rel="apple-touch-icon">
    
    <style type="text/css">
    	.customoverlay {position:relative;bottom:85px;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;float:left;}
		.customoverlay:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}
		.customoverlay a {display:block;text-decoration:none;color:#000;text-align:center;border-radius:6px;font-size:14px;font-weight:bold;overflow:hidden;background: #d95050;background: #d95050 url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;}
		.customoverlay .title {display:block;text-align:center;background:#fff;margin-right:35px;padding:10px 15px;font-size:14px;font-weight:bold;}
		.customoverlay:after {content:'';position:absolute;margin-left:-12px;left:50%;bottom:-12px;width:22px;height:12px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    
    	table {	
			text-align: center;
		}
    </style>
</head>
<body>
	<!-- start : mainHeader -->
   <div>
      <jsp:include page="/partial/mainHeader.jsp"></jsp:include>
   </div>
   <!-- end : mainHeader -->
   
   <main id="main">
   		<!-- ======= Breadcrumbs ======= -->
	    <section id="breadcrumbs" class="breadcrumbs">
	      <div class="container">
	
	        <div class="d-flex justify-content-between align-items-center">
	          <h2>숙소</h2>
	          <ol>
	            <li><a href="${pageContext.request.contextPath}">홈</a></li>
	            <li>숙소목록</li>
	          </ol>
	        </div>
	      </div>
	    </section>
	    <!-- End Breadcrumbs -->
	    
   		<section class="event-list">
   			<div class="container">
   				<table>
	               <tr>
	                  <!-- 지도 -->
	                  <td style="width:40%;"><div id="map" style="width:100%;height:350px;"></div></td>
	                  <td style="width:10%;"></td>
	                  <td style="width:50%;">
	                     <table class="table table-hover" border="1">
							<tr class="table-primary">
								<td>숙소명</td>
								<td>카테고리</td>
								<td>가격</td>
								<td>체크인 시간</td>
								<td>체크아웃 시간</td>
							</tr>
							<c:forEach items="${result.roomList }" var="list">
								<tr>
									<td><a href="${pageContext.request.contextPath}/roomOne?roomId=${list.roomId}&detailAddressId=${list.detailAddressId }">${list.roomName }</a></td>
									<td>${list.roomCategory }</td>
									<td>${list.roomPrice }</td>
									<td>${list.checkInTime }</td>
									<td>${list.checkOutTime }</td>
								</tr>
							</c:forEach>
						</table>
	                  </td>
	               </tr>
	            </table>
				<!-- 페이징 -->
				<nav style="margin-top: 50px">
		   			<ul class="pagination" style="justify-content: center;">
					    <c:if test="${result.currentPage!=1}">
						    <li class="page-item"><a class="btn btn-secondary btn-sm" href="${pageContext.request.contextPath}/roomList?currentPage=<%=1 %>">처음</a></li>
						</c:if>
						
						<c:if test="${result.currentnumPage>0}">
						    <li class="page-item"><a class="btn btn-primary" href="${pageContext.request.contextPath}/roomList?currentPage=${result.pagePerPage*(result.currentnumPage-1)+1 }">이전</a></li>
						</c:if>
						
						<c:forEach begin="0" end="${result.pagePerPage-1}" step="1" var="i">
							<c:if test="${result.lastPage>=(result.pagePerPage*result.currentnumPage)+i+1}">
							    <li class="page-item"><a class="btn btn-outline-primary" href="${pageContext.request.contextPath}/roomList?currentPage=${(result.pagePerPage*result.currentnumPage)+i+1 }">${(result.pagePerPage*result.currentnumPage)+i+1 }</a></li>
							</c:if>
						</c:forEach>
						    
						<c:if test="${result.lastnumPage>result.currentnumPage}">
						    <li class="page-item"><a class="btn btn-primary" href="${pageContext.request.contextPath}/roomList?currentPage=${result.pagePerPage*(result.currentnumPage+1)+1 }">다음</a></li>
						</c:if>
						
						<c:if test="${result.currentPage!=result.lastPage && result.lastPage!=0}">
						    <li class="page-item"><a class="btn btn-secondary btn-sm" href="${pageContext.request.contextPath}/roomList?currentPage=${result.lastPage }">끝으로</a></li>
						</c:if>
					</ul>
				</nav>
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
	        level: 10 // 지도의 확대 레벨
	    };
	
	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	// 각 숙소의 정보를 토대로 마커를 찍습니다
	<c:forEach items="${result.roomList}" var="r" varStatus="status">
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch("${r.address.detailAddress}", function(result, status) {

		    // 정상적으로 검색이 완료됐으면 
		    if (status === kakao.maps.services.Status.OK) {
		    	
		    	// 마커 이미지 정보
		    	var imageSrc = '${pageContext.request.contextPath}/resources/img/system/room_marker.png', // 마커이미지의 주소입니다    
		    	imageSize = new kakao.maps.Size(64, 69), // 마커이미지의 크기입니다
		        imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
		          
		    	// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
		    	var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
				
				var marker = new kakao.maps.Marker({
		 	        map: map, // 마커를 표시할 지도
		 	        title: "${r.roomName}", // 숙소 이름
		 	        position: new kakao.maps.LatLng(result[0].y, result[0].x), // 마커의 위치
		 	        image : markerImage
		 	    });
				
			 	// 커스텀 오버레이에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
		        var link_room = '${pageContext.request.contextPath}/roomOne?roomId=${r.roomId}&detailAddressId=${r.address.detailAddressId}';
		           var content = '<div class="customoverlay">' +
		               '  <a href="'+link_room+'">' +
		               '    <span class="title">${r.roomName }</span>' +
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

			    // 마커에 클릭 이벤트를 달아줍니다
			    kakao.maps.event.addListener(marker, 'click', makeClickListener("${r.roomId}","${r.address.detailAddressId}"));
			    console.log(${r.address.detailAddressId});
			    // 첫 숙소의 주소가 중심값이 되도록 설정
			    if(${status.index}==0){
			    	// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        	map.setCenter(new kakao.maps.LatLng(result[0].y, result[0].x));
			    }
		    }
		});	
	</c:forEach>

	// 마커 클릭 이벤트
	function makeClickListener(roomId,detailAddressId) {
		    return function() {
	            // 마커 클릭시 실행할 이벤트 구현
		    	$(location).attr('href', "${pageContext.request.contextPath}/roomOne?roomId="+roomId+"&detailAddressId="+detailAddressId);
		    };
		}
	</script>
</body>
</html>
