<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.js"></script> 
<meta charset="UTF-8">
<title>addReservation.jsp</title>
</head>
<body>

	<!-- start : mainHeader -->
   <div>
      <jsp:include page="/partial/mainHeader.jsp"></jsp:include>
   </div>
   <!-- end : mainHeader -->
   <br>
   <br>
   <br>
   <br>
   <a href="${pageContext.request.contextPath}/reservationList">리스트로</a>
	<h1>예약하기</h1>
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
                        <td id="roomName">${room.roomName}</td>
                     </tr>
                     <tr>
                        <td>주소</td>
                        <td id="address">${address.detailAddress}</td>
                     </tr>
                     <tr>
                        <td>상세 주소</td>
                        <td>${address.detailAddress2}</td>
                     </tr>
                     <tr>
                        <td>카테고리</td>
                        <td>${room.roomCategory}</td>
                     </tr>
                     <tr>
                        <td>숙소 소개</td>
                        <td>${room.roomIntro}</td>
                     </tr>
                     <tr>
                        <td>가격</td>
                        <td>${room.roomPrice}</td>
                     </tr>
                     <tr>
                        <td>체크인 시간</td>
                        <td>${room.checkInTime}</td>
                     </tr>
                     <tr>
                        <td>체크아웃 시간</td>
                        <td>${room.checkOutTime}</td>
                     </tr>
                     <tr>
                        <td>인원수</td>
                        <td>${room.peopleNum}</td>
                     </tr>
                     <tr>
                        <td>숙소 형태</td>
                        <td>${room.roomForm}</td>
                     </tr>
                     <tr>
                        <td>최소 숙박일</td>
                        <td>${room.minDay}</td>
                     </tr>
                     <tr>
                        <td>숙소 등록일</td>
                        <td>${room.createDate}</td>
                     </tr>
                     <tr>
                        <td>숙소 수정일</td>
                        <td>${room.updateDate}</td>
                     </tr>
                  </table>
                  </td>
               </tr>
            </table>
            
      </section>
   </main>
   
   <form id="addReservationForm" action="${pageContext.request.contextPath}/addReservation" method="post">
	   <input type="hidden" name="roomId" value="${room.roomId}">
	   <input type="hidden" name="room.roomPrice" value="${room.roomPrice}">
	   <div class="form-row">
		    <div class="form-group col-md-6">
		      <label for="inputCity">체크인 날짜</label>
		      <input type="text" id="dateRangePicker1" class="form-control" name="checkInDate" readonly>
		    </div>
		    <div class="form-group col-md-6">
		      <label for="inputState">체크아웃 날짜</label>
		      <input type="text" id="dateRangePicker2" class="form-control" name="checkOutDate" readonly>
		    </div>
	   </div>
	   <label>인원수</label>
	   <input type="number" id="peopleNum" name="peopleNum" value="---------">명
	       
	   <div><button id="resBtn" type="button">예약</button></div>
		
	</form>
	<!-- 유효성 검사 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script>
		$("#resBtn").click(function(){
			if($("#dateRangePicker1").val() == "") {
				alert("체크인 날짜를 입력하세요");
				return;
			} else if($("#dateRangePicker2").val() == "") {
				alert("체크아웃 날짜를 입력하세요");
				return;
			} else if($("#peopleNum").val() == "")	{
				alert("인원수를 입력해주세요");
				return;
			} else if(Number($("#peopleNum").val()) > ${room.peopleNum})	{
				alert("최대 인원수를 확인해주세요");			
				return;
			} else {
				$("#addReservationForm").submit();
			}
		});
		
	</script>
			-->
	
	<!-- start : mainFooter -->
   <div>
      <jsp:include page="/partial/mainFooter.jsp"></jsp:include>
   </div>
   <!-- end : mainFooter -->
   
   	<!-- Datepicker 관련 script-->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="/resources/demos/style.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="js/lib/jquery/jquery.dataTables.js"></script>
   <script>
      // 선택 불가능하게 할 날짜 리스트 추출
      // '2021-12-24', '2022-1-1'의 형식으로 해야함.
      var disabledDays = new Array();
      <c:forEach items="${ReservationListOfDate}" var="rld">
         disabledDays.push("${rld}");
         console.log("${rld}");
      </c:forEach>
      
      // 이미 선택된 기간의 시작일만 추출하여 list로 저장
      var disableStartList = new Array();
      <c:forEach items="${ReservationDateList}" var="rdl">
         disableStartList.push("${rdl.checkInDate}");
      </c:forEach>
      
      // 이미 예약이 존재하는 날짜 
      // 날짜를 나타내기 전에(beforeShowDay) 실행할 함수
      function disableSomeDay(date) {
          var month = date.getMonth();
          var dates = date.getDate();
          var year = date.getFullYear();
          
          // 배열에 해당하는 날짜는 0번째 index에 false를 담아 리턴해준다.
          for (i = 0; i < disabledDays.length; i++) {
              if($.inArray(year + '-' +(month+1) + '-' + dates,disabledDays) != -1) {
                  return [false];
              }
          }
          return [true];
      }
      
       $(function() {
          // 공통 초기 설정
          $.datepicker.setDefaults({
              dateFormat: 'yy-mm-dd',
              prevText: '이전 달',
              nextText: '다음 달',
              // 한글 설정
              monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
              monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
              dayNames: ['일', '월', '화', '수', '목', '금', '토'],
              dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
              dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
              showMonthAfterYear: true,
              yearSuffix: '년'
          });
          
          // 각 input을 Datepicker로 변환
          $("#dateRangePicker1").datepicker();
          $("#dateRangePicker2").datepicker();
           $("#dateRangePicker1").datepicker('option','minDate', 0);
           $("#dateRangePicker1").datepicker('option','beforeShowDay', disableSomeDay);
           $("#dateRangePicker1").datepicker('option','maxDate', '+3M'); //현재 날짜에서 3개월 후 까지만 가능
           // 시작일의 날짜가 선택되면
           $('#dateRangePicker1').datepicker("option", "onClose", function ( selectedDate ) {
              // 종료일을 나타내는 Datepicker의 minDate를 시작일 Datepicker의 선택일로 설정
               $("#dateRangePicker2").datepicker( "option", "minDate", selectedDate );
               $("#dateRangePicker2").datepicker('option','beforeShowDay', disableSomeDay);
               
              // 종료일을 나타내는 Datepicker의 maxDate를 동적으로 설정하기 위한 코드
               var endMaxDate = null;
               for(var i=0;i<disableStartList.length;i++){
                  var startDate = new Date(disableStartList[i]);
                 var selectedDay = new Date(selectedDate);
                 console.log(startDate);
                 // 선택할 수 없는 날짜들의 시작일만 추출하여, 선택된 날짜가 시작일보다 작으면 시작일을 maxDate로 설정
                 if(selectedDay<startDate){
                    endMaxDate = startDate;
                    console.log("이게 endDay입니다."+startDate);
                    break;
                 }
               }
             
             // maxDate가 설정되지 않았다면, 선택된 시작일 이후에 선택 불가능한 날짜가 없는것이니,
             // 오늘 날짜로부터 3개월 후까지만 선택 가능하도록 maxDate를 설정
             if(endMaxDate==null){
                endMaxDate = '+3M';
             }
               $("#dateRangePicker2").datepicker('option','maxDate', endMaxDate);
           });
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