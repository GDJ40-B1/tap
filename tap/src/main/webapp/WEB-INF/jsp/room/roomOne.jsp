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
	   <!-- ======= Breadcrumbs ======= -->
	    <section id="breadcrumbs" class="breadcrumbs">
	      <div class="container">
	
	        <div class="d-flex justify-content-between align-items-center">
	          <h2>숙소</h2>
	          <ol>
	            <li><a href="${pageContext.request.contextPath}">홈</a></li>
	            <li><a href="${pageContext.request.contextPath}/roomList">숙소목록</a></li>
	            <li>숙소상세</li>
	          </ol>
	        </div>
	      </div>
	    </section>
	    <!-- End Breadcrumbs -->
    
         <section class="event-list">
         	<div class="container">
         		<!-- 지도 -->
	            <div id="map" style="width:100%;height:350px;"></div>
	            
	            <div style="margin: 20px">
	            	<c:forEach items="${couponList}" var="c">
	            		<button id="${c.couponId }-couponBtn" type="button" class="btn btn-outline-danger">${c.couponName }</button>
	            	</c:forEach>
	            </div>
	            <!-- 숙소 정보 -->
                <table border="1" class="table">
                     <tr>
                        <td style="width:10%;">숙소명</td>
                        <td id="roomName" style="width:90%;">${room.roomName }</td>
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
                     <tr>
                        <td></td>
                        <td>${hashtag }</td>
                     </tr>
                </table>
                
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
                <a href="${pageContext.request.contextPath}/member/addReservation?roomId=${room.roomId}&detailAddressId=${address.detailAddressId}">예약</a>
            </div>
      </section>
      
      <section class="event-list">
         	<div class="container">
         	<c:if test="${loginUser != null && loginUser.userLevel == 'member'}">
         		<button type="button" class="btn btn-danger" id='insertRoomQna'>문의 작성</button>
         	</c:if>
       		<table id="roomQna" border="1">
       			<tr>
       				<td>답변상태</td>
       				<td>문의내역</td>
       				<td>작성자</td>
       				<td>작성일</td>
       			</tr>
       			<c:forEach var="q" items="${roomQna.list}">
       				<tr>
       					<c:choose>
						<c:when test="${q.answerCheck == 'N'}">
							<td>미답변</td>
						</c:when>
						
						<c:when test="${q.answerCheck == 'Y'}">
							<td>답변완료<td>
						</c:when>
					</c:choose>
					
					<c:choose>
						<c:when test="${q.secretCheck == 'N' || q.secretCheck == 'Y' && loginUser.userId == q.memberId || loginUser != null && loginUser.userLevel != 'member'}">
							<td><a href="#roomQna" onclick="result(this)" style="text-overflow: ellipsis;">${q.content}</a></td>
						</c:when>
						
						<c:when test="${q.secretCheck == 'Y' && loginUser == null || loginUser.userId != q.memberId}">
							<td>비밀글 입니다.</td>
						</c:when>
					</c:choose>
					<td>${q.memberId}</td>
					<td>${q.createDate}</td>
       				</tr>
       				<tr style="display: none;">
						<td colspan = "4">
							<div>문의 : ${q.content}</div>
							<div><a href="javascript:removeQuestion(${q.roomQna});">삭제</a></div>
							<c:if test="${q.roomQnaAnswer.isEmpty() && loginUser != null && room.hostId == loginUser.userId}">
									<div>
										<form id="roomQnaAnswerForm" action="${pageContext.request.contextPath}/roomOne" method="post">
											<div class="form-group">
												<input type="hidden" name="roomId" value="${room.roomId}">
												<input type="hidden" name="detailAddressId" value="${address.detailAddressId}">
												<input type="hidden" name="roomQnaId" value="${q.roomQna}">
												<label for="questionAnswer">답변 작성 : </label>
													<textarea class="form-control" rows="5" placeholder="답변을 작성해주세요" id="answer" name="answer"></textarea>
											</div>
											<div>
												<button id="btn" type ="button">작성</button>
											</div>
										</form>		
									</div>
							</c:if>
							<c:forEach var="a" items="${q.roomQnaAnswer}">
								<div>답변 : ${a.answer}</div>
								<div>등록일 : ${a.answerCreateDate}</div>
								<c:if test="${loginUser != null && room.hostId == loginUser.userId}">
									<div><a href="javascript:removeAnswer(${a.roomQnaId});">삭제</a></div>
								</c:if>
							</c:forEach>
						</td>
       				</tr>
       			</c:forEach>
       		</table>
       		
      		<c:if test="${roomQna.roomQnaCurrentPage > 1}">
				<a href="${pageContext.request.contextPath}/roomOne?roomId=${room.roomId}&detailAddressId=${address.detailAddressId}&roomQnaCurrentPage=${roomQna.roomQnaCurrentPage-1}#roomQna">이전</a>
			</c:if>
			
			<c:forEach var="i" begin="${roomQna.roomQnaStartPage}" end="${roomQna.roomQnaEndPage}">
				<a href="${pageContext.request.contextPath}/roomOne?roomId=${room.roomId}&detailAddressId=${address.detailAddressId}&roomQnaCurrentPage=${i}#roomQna"><c:out value="${i}"/></a>
			</c:forEach>
			
			<c:if test="${roomQna.roomQnaCurrentPage < roomQna.roomQnaLastPage}">
				<a href="${pageContext.request.contextPath}/roomOne?roomId=${room.roomId}&detailAddressId=${address.detailAddressId}&roomQnaCurrentPage=${roomQna.roomQnaCurrentPage+1}#roomQna">다음</a>
			</c:if>		
       		
         	</div>
       </section>
   </main>
   
   <!-- start : mainFooter -->
   <div>
      <jsp:include page="/partial/mainFooter.jsp"></jsp:include>
   </div>
   <!-- end : mainFooter -->
   
   <!-- 쿠폰 발급 버튼 클릭 시 -->
	<script>
		<c:forEach items="${couponList}" var="c">
			$('#${c.couponId}-couponBtn').click(function(){
				if(confirm("*${c.couponName}*을 받으시겠습니까?") == true){
					$(location).attr('href', "${pageContext.request.contextPath}/member/addMemberCoupon?roomId=${room.roomId}&detailAddressId=${address.detailAddressId}&couponId=${c.couponId}");
				} else{
					return;
				}
			});
		</c:forEach>
	</script>
   
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
 
   <script>
	    $('#insertRoomQna').click(function() {
	    	window.open("${pageContext.request.contextPath}/roomQnaPopup?roomId="+${room.roomId},"_blank","toolbar=yes,menubar=yes,width=700,height=500").focus();
	    });
   
		function result(content) {
			var currentRow = $(content).closest('tr');
			var detail = currentRow.next('tr');
			
			if(detail.is(":visible")){
				detail.hide();
			} else {
				detail.show();
			}
		}
		
		$('#btn').click(function(){
			if($('#answer').val() == '') {
				alert('답변을 입력하세요');
				return;
			}
					
			$('#roomQnaAnswerForm').submit();
		});
		
		function removeAnswer(roomQnaId){
			if(confirm("작성하신 답변을 삭제 하시겠습니까?") == true){
				location.href="${pageContext.request.contextPath}/removeRoomQnaAnswer?roomQnaId="+roomQnaId+"&roomId=${room.roomId}&detailAddressId=${address.detailAddressId}";
			} else {
				return;	
			}
		}
		
		function removeQuestion(roomQna){
			if(confirm("작성하신 문의를 삭제 하시겠습니까?") == true){
				location.href="${pageContext.request.contextPath}/removeRoomQuestion?roomQna="+roomQna+"&roomId=${room.roomId}&detailAddressId=${address.detailAddressId}";
			} else {
				return;	
			}
		}
   </script>      
</body>
</html>
