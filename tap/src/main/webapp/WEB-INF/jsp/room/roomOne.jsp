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
            <table>
               <tr>
                  <!-- 지도 -->
                  <td><div id="map" style="width:600px;height:350px;"></div></td>
                  <td style="width:100px;"></td>
                  <td>
                     <!-- 숙소 정보 -->
                     <table border="1">
                     <tr>
                        <td>숙소명</td>
                        <td id="roomName">${room.roomName }</td>
                     </tr>
                     <tr>
                        <td>주소</td>
                        <td id="address">${address.detailAddress }</td>
                     </tr>
                     <tr>
                        <td>상세 주소</td>
                        <td>${address.detailAddress2 }</td>
                     </tr>
                     <tr>
                        <td>카테고리</td>
                        <td>${room.roomCategory }</td>
                     </tr>
                     <tr>
                        <td>숙소 소개</td>
                        <td>${room.roomIntro }</td>
                     </tr>
                     <tr>
                        <td>가격</td>
                        <td>${room.roomPrice }</td>
                     </tr>
                     <tr>
                        <td>체크인 시간</td>
                        <td>${room.checkInTime }</td>
                     </tr>
                     <tr>
                        <td>체크아웃 시간</td>
                        <td>${room.checkOutTime }</td>
                     </tr>
                     <tr>
                        <td>인원수</td>
                        <td>${room.peopleNum }</td>
                     </tr>
                     <tr>
                        <td>숙소 형태</td>
                        <td>${room.roomForm }</td>
                     </tr>
                     <tr>
                        <td>최소 숙박일</td>
                        <td>${room.minDay }</td>
                     </tr>
                     <tr>
                        <td>숙소 등록일</td>
                        <td>${room.createDate }</td>
                     </tr>
                     <tr>
                        <td>숙소 수정일</td>
                        <td>${room.updateDate }</td>
                     </tr>
                  </table>
                  </td>
               </tr>
            </table>
            <a href="${pageContext.request.contextPath}/addReservation?roomId=${room.roomId}&detailAddressId=${address.detailAddressId}">예약</a>
            
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
