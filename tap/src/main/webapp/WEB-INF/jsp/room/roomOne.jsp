<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
 		<div class="container">
			<div class="col-xl-8 col-lg-7">
				<div class="card shadow mb-4">
					<div id="roomChart" class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<h6 class="m-0 font-weight-bold text-primary">${year}년 ${room.roomName} 이용 연령대</h6>
							<select name="year" id="year" onchange="selectYear()">
								<option value="">연도 선택</option>
							</select>
					</div>
					<div class="card-body">
						<div class="chart-area">
							<canvas id="myPieChart"></canvas>
						</div>
					</div>
				</div>
			</div>
		</div>
 
      <section class="event-list">
         	<div class="container">
         	<!-- 즐겨찾기 등록은 이미지로 변경할 필요가 있음 -->
        	<c:choose>
				<c:when test="${favorite == '0'}">
					<button type="button" class="btn btn-danger" id='addFavorites'>즐겨찾기 등록</button>
				</c:when>
				
				<c:when test="${favorite == '1'}">
					<button type="button" class="btn btn-danger" id='removeFavorites'>즐겨찾기 취소</button>
				</c:when>
			</c:choose>

         	<button type="button" class="btn btn-danger" id='insertRoomQna'>문의 작성</button>
			
			<c:choose>
				<c:when test="${empty roomQna.list}">
					<div>문의 내역이 없습니다.</div>
				</c:when>
			
				<c:otherwise>
				
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
									<td>답변완료</td>
								</c:when>
							</c:choose>
						
						<c:choose>
							<c:when test="${q.secretCheck == 'N' || q.secretCheck == 'Y' && loginUser.userId == q.memberId || loginUser.userId == room.hostId || loginUser.userLevel == 'system_admin'}">
								<td><a href="#roomQna" onclick="result(this)" style="text-overflow: ellipsis;">${q.content}</a></td>
							</c:when>
							
							<c:when test="${q.secretCheck == 'Y' && loginUser == null || loginUser.userId != q.memberId}">
								<td>비밀글 입니다.</td>
							</c:when>
						</c:choose>
						<td>${q.memberId}</td>
						<td>${q.createDate}</td>
	       				</tr>
	       				<tr class="qna" style="display: none;">
							<td colspan = "4">
								<div>문의 : ${q.content}</div>
								<c:if test="${loginUser != null && q.memberId == loginUser.userId || loginUser.userId == room.hostId || loginUser.userLevel == 'system_admin'}">
									<div><a href="javascript:removeQuestion(${q.roomQna},'${q.memberId}');">삭제</a></div>
								</c:if>
								<c:if test="${q.roomQnaAnswer.isEmpty() && loginUser != null && room.hostId == loginUser.userId}">
										<div>
											<form class="roomQnaAnswerForm" action="${pageContext.request.contextPath}/roomOne" method="post">
												<div class="form-group">
													<input type="hidden" name="roomId" value="${room.roomId}">
													<input type="hidden" name="detailAddressId" value="${address.detailAddressId}">
													<input type="hidden" name="roomQnaId" value="${q.roomQna}">
													<label for="questionAnswer">답변 작성 : </label>
														<textarea class="form-control" rows="5" placeholder="답변을 작성해주세요" class="answer" name="answer"></textarea>
												</div>
												<div>
													<button class="addRoomQnaAnswer" type ="button">작성</button>
												</div>
											</form>		
										</div>
								</c:if>
								<c:forEach var="a" items="${q.roomQnaAnswer}">
									<div>답변 : ${a.answer}</div>
									<div>등록일 : ${a.answerCreateDate}</div>
									<c:if test="${loginUser != null && room.hostId == loginUser.userId || loginUser.userLevel == 'system_admin'}">
										<div><a href="javascript:removeAnswer(${a.roomQnaId}, '${room.hostId}');">삭제</a></div>
									</c:if>
								</c:forEach>
							</td>
	       				</tr>
	       			</c:forEach>
	       		</table>
       			</c:otherwise>
       		</c:choose>
      		<c:if test="${roomQna.roomQnaCurrentPage > 1}">
				<a href="${pageContext.request.contextPath}/roomOne?roomId=${room.roomId}&detailAddressId=${address.detailAddressId}&roomQnaCurrentPage=${roomQna.roomQnaCurrentPage-1}">이전</a>
			</c:if>
			
			<c:forEach var="i" begin="${roomQna.roomQnaStartPage}" end="${roomQna.roomQnaEndPage}">
				<a href="${pageContext.request.contextPath}/roomOne?roomId=${room.roomId}&detailAddressId=${address.detailAddressId}&roomQnaCurrentPage=${i}"><c:out value="${i}"/></a>
			</c:forEach>
			
			<c:if test="${roomQna.roomQnaCurrentPage < roomQna.roomQnaLastPage}">
				<a href="${pageContext.request.contextPath}/roomOne?roomId=${room.roomId}&detailAddressId=${address.detailAddressId}&roomQnaCurrentPage=${roomQna.roomQnaCurrentPage+1}">다음</a>
			</c:if>		
       		
         	</div>
       </section>
       
       <!-- *** 숙소 후기 *** -->
  	   <section class="event-list">
			<div class="container">
	   		<c:forEach var="r" items="${roomReview.list}">
	   			<c:choose>
	   				<c:when test="${loginUser.userId == room.hostId}">
	   					<div>
							<input type="hidden" name="roomId" value="${room.roomId}">
							<input type="hidden" name="detailAddressId" value="${address.detailAddressId}">
							<input type="hidden" name="roomReviewId" value="${r.roomReviewId}">
							
							<div class="d-flex justify-content-between align-items-center">
								답변상태 : 
								<c:choose>
									<c:when test="${r.answerStatus == 'N'}">
										<td>미답변</td>
									</c:when>
									
									<c:when test="${r.answerStatus == 'Y'}">
										<td>답변완료<td>
									</c:when>
								</c:choose>
								<ol style="list-style: none;">
									<li>
										<a class="btn btn-outline-dark" href="javascript:deleteRoomReview('${r.roomReviewId}');">숙소후기 삭제</a>
									</li>
								</ol>
							</div>
								<span>숙소후기 평점 :</span> 
								<c:choose>
									<c:when test="${r.roomReviewScore == 1}">
										<td>★☆☆☆☆</td>
									</c:when>
									<c:when test="${r.roomReviewScore == 2}">
										<td>★★☆☆☆</td>
									</c:when>
									<c:when test="${r.roomReviewScore == 3}">
										<td>★★★☆☆</td>
									</c:when>
									<c:when test="${r.roomReviewScore == 4}">
										<td>★★★★☆</td>
									</c:when>
									<c:when test="${r.roomReviewScore == 5}">
										<td>★★★★★</td>
									</c:when>
								</c:choose>
								<div>
									숙소후기 내용 :
									${r.roomReviewContent}
								</div>
								<div>
									<c:if test="${r.answerStatus == 'N'}">
										<form class="insertCommentForm" action="${pageContext.request.contextPath}/addRoomReviewComment" method="post">
											<div class="form-group">
												<input type="hidden" name="roomId" value="${room.roomId}">
												<input type="hidden" name="detailAddressId" value="${address.detailAddressId}">
												<input type="hidden" name="roomReviewId" value="${r.roomReviewId}">
												<label for="reviewCommentContent">답변 작성 : </label>
													<textarea class="form-control" rows="5" placeholder="답변을 작성해주세요" class="insertComment" name="roomReviewCommentContent"></textarea>
											</div>
											<div>
												<button class="insertCommentBtn" type ="button">작성</button>
											</div>
										</form>
									</c:if>
									<div>
										<c:forEach var="rc" items="${r.roomReviewComment}">
											<div class="d-flex justify-content-between align-items-center">
												<span>숙소후기 답변</span>
												<ol style="list-style: none;">
													<li>
														<a class="btn btn-outline-dark" href="javascript:deleteRoomReviewComment('${r.roomReviewId}');">숙소후기 답변삭제</a>
													</li>
												</ol>
											</div>
											<textarea class="form-control" rows="5" cols="50" name="roomReviewCommentContent" readonly="readonly">${rc.roomReviewCommentContent}</textarea>
										</c:forEach>
									</div>
									<div>
										<hr style="height: 3px;">
									</div>
								</div>
							</div>
	   				</c:when>
	   				<c:otherwise>
	   					<div>
	   						답변상태 : 
							<c:choose>
								<c:when test="${r.answerStatus == 'N'}">
									<td>미답변</td>
								</c:when>
								
								<c:when test="${r.answerStatus == 'Y'}">
									<td>답변완료<td>
								</c:when>
							</c:choose>
	   					</div>
	   					<div class="d-flex justify-content-between align-items-center">
							숙소후기 평점 : 
							<c:choose>
								<c:when test="${r.roomReviewScore == 1}">
									<td>★☆☆☆☆</td>
								</c:when>
								<c:when test="${r.roomReviewScore == 2}">
									<td>★★☆☆☆</td>
								</c:when>
								<c:when test="${r.roomReviewScore == 3}">
									<td>★★★☆☆</td>
								</c:when>
								<c:when test="${r.roomReviewScore == 4}">
									<td>★★★★☆</td>
								</c:when>
								<c:when test="${r.roomReviewScore == 5}">
									<td>★★★★★</td>
								</c:when>
							</c:choose>
							<ol style="list-style: none;">
								<li>
									<c:set var="ocreateDate" value="${r.createDate}"/>
									<c:set var="createDate" value="${fn:substring(ocreateDate,0,10)}"/>
									${createDate}					
								</li>
							</ol>
						</div>
						<div>
							숙소후기 내용 :
							${r.roomReviewContent}
						</div>
						<div>
							<c:forEach var="rc" items="${r.roomReviewComment}">
								숙소후기 답변
								<textarea class="form-control" rows="5" cols="50" name="roomReviewCommentContent" readonly="readonly">${rc.roomReviewCommentContent}</textarea>
							</c:forEach>
						</div>
						<div>
							<hr style="height: 3px;">
						</div>
	   				</c:otherwise>
				</c:choose>
			</c:forEach>
			
			<!-- ======= Paging Section ======= -->
			<c:if test="${roomReviw.roomReviewCurrentPage > 1}">
				<a href="${pageContext.request.contextPath}/roomOne?roomId=${room.roomId}&detailAddressId=${address.detailAddressId}&roomOne?roomReviewCurrentPage=1">처음으로</a>
				<a href="${pageContext.request.contextPath}/roomOne?roomId=${room.roomId}&detailAddressId=${address.detailAddressId}&roomReviewCurrentPage=${roomReviw.roomReviewCurrentPage-1}">이전</a>
			</c:if>
			
			<c:forEach var="i" begin="${roomReview.startPage}" end="${roomReview.endPage}">
				<a href="${pageContext.request.contextPath}/roomOne?roomId=${room.roomId}&detailAddressId=${address.detailAddressId}&roomReviewCurrentPage=${i}"><c:out value="${i}"/></a>
			</c:forEach>
			
			<c:if test="${roomReviw.roomReviewCurrentPage < roomReview.lastPage}">
				<a href="${pageContext.request.contextPath}/roomOne?roomId=${room.roomId}&detailAddressId=${address.detailAddressId}&roomReviewCurrentPage=${roomReviw.roomReviewCurrentPage+1}">다음</a>
				<a href="${pageContext.request.contextPath}/roomOne?roomId=${room.roomId}&detailAddressId=${address.detailAddressId}&roomReviewCurrentPage=${roomReview.lastPage}">끝으로</a>
			</c:if>		
			<!-- End Paging Section -->
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
 
    <script>
    	$('#insertRoomQna').click(function() {
    		if ("${loginUser.userId}" == "") {
    			if (confirm("로그인 한 회원만 이용가능합니다. 로그인 하시겠습니까?")) {
    				location.href = '${pageContext.request.contextPath}/login';
    			} else {
    				location.reload();
    			}
    		} else if ("${loginUser.userLevel}" != "member") {
    			console.log("userLevel: " + "${loginUser.userLevel}");
    			alert('문의 등록은 일반 회원만 가능합니다.');
    			return;
    		} else {
    			window.open("${pageContext.request.contextPath}/nonMember/roomQnaPopup?roomId="+${room.roomId},"_blank","toolbar=yes,menubar=yes,width=700,height=500").focus();
    		}
    	});
	</script>
	
	<script>
		function result(content) {
			var currentRow = $(content).closest('tr');
			var detail = currentRow.next('tr');
			var etc = $('.qna').not(content);
			
			if(detail.is(":visible")){
				detail.hide();
			} else {
				etc.hide();
				detail.show();
			}
		}
	</script>	
	
	<script>	
		$('.addRoomQnaAnswer').click(function(){
			if($(this).parents(".roomQnaAnswerForm").find('textarea').val() == '') {
				alert('답변을 입력하세요');
				return;
			}

			$(this).parents(".roomQnaAnswerForm").submit();
		});
    </script>
    
    <script>	
		function removeAnswer(roomQnaId, hostId){
			if(confirm("작성하신 답변을 삭제 하시겠습니까?") == true){
				location.href="${pageContext.request.contextPath}/nonMember/removeRoomQnaAnswer?roomQnaId="+roomQnaId+"&hostId="+hostId+"&roomId=${room.roomId}&detailAddressId=${address.detailAddressId}";
			} else {
				return;	
			}
		}
   </script>	
   
   <script>	
		function removeQuestion(roomQna, memberId){
			if(confirm("작성하신 문의를 삭제 하시겠습니까?") == true){
				location.href="${pageContext.request.contextPath}/nonMember/removeRoomQuestion?roomQna="+roomQna+"&memberId="+memberId+"&roomId=${room.roomId}&detailAddressId=${address.detailAddressId}";
			} else {
				return;	
			}
		}
   </script>
   
  <script>
  		$('#addFavorites').click(function() {
  			// 비로그인 회원이 즐겨찾기 등록을 시도한 경우
  			if ("${loginUser.userId}" == "") {
  				if (confirm("로그인 한 회원만 이용가능합니다. 로그인 하시겠습니까?")) {
  					location.href = '${pageContext.request.contextPath}/login';
  				} else {
  					location.reload();
  				}
  				// 호스트, 관리자가 즐겨찾기 등록을 시도한 경우    
  				} else if ("${loginUser.userLevel}" != "member") {
  					console.log("userLevel: " + "${loginUser.userLevel}");
  					alert('즐겨찾기 등록은 일반 회원만 가능합니다.');
  					return;
  				} else {
  					var roomId = "${room.roomId}";
  					var memberId = "${loginUser.userId}";
  					var favoritesTitle = "${room.roomName}";

  					var form = {
  							roomId : roomId,
  							memberId : memberId,
  							favoritesUrl : window.location.href,
  							favoritesTitle : favoritesTitle
  					};
	
  					$.ajax({
  						type : 'POST',
  						contentType: "application/x-www-form-urlencoded; charset=UTF-8",
  						url : '${pageContext.request.contextPath}/addFavorites',
  						cache : false,
  						data : form,
  						success : function(result) {
  							console.log(result);
  							console.log("즐겨찾기 성공!")
  							alert('즐겨찾기 리스트에 등록되었습니다.');
  							location.reload();
  						},
  						error : function(e) {
  							console.log(e);
  							alert('문제가 발생했습니다.');
  							location.reload();
  						}
  					})
  				}
  		});   
   </script>  

  <script>
	  	$('#removeFavorites').click(function() {
	  		var roomId = "${room.roomId}";
	  		var memberId = "${loginUser.userId}";
	  		
	  		var form = {
	  				roomId : roomId,
	  				memberId : memberId
	  		};
	
	  		$.ajax({
	  			type : 'POST',
	  			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	  			url : '${pageContext.request.contextPath}/removeFavorites',
	  			cache : false,
	  			data : form,
	  			success : function(result) {
	  				console.log(result);
	  				console.log("즐겨찾기 삭제 완료")
	  				alert('즐겨찾기 등록을 취소했습니다.');
	  				location.reload();
	  			},
	  			error : function(e) {
	  				console.log(e);
	  				alert('문제가 발생했습니다.');
	  				location.reload();
	  			}
	  		})
	  	});   
   </script>  
   
   <!-- *** 숙소후기 *** -->
   <!--숙소후기 삭제 버튼 클릭 시 -->
    <script>
	 	function deleteRoomReview(roomReviewId) {
	 		if(confirm('후기를 삭제하시면 다시 작성할 수 없습니다. 그래도 삭제하시겠습니까?') == true){
	 			location.href="${pageContext.request.contextPath}/removeRoomReview?roomId=${room.roomId}&detailAddressId=${address.detailAddressId}&roomReviewId="+roomReviewId+"";
	 		} else {
	 			return;
	 		}	
	 	}	
    </script>     
    
    <!--숙소후기 답변 작성 버튼 클릭 시 -->
    <script>
	    $('.insertCommentBtn').click(function(){
			if($(this).parents('.insertCommentForm').find('textarea').val() == '') {
				alert('후기답변을 입력하세요');
				return;
			}	
			$(this).parents('.insertCommentForm').submit();
		});
    </script>
    
    <!--숙소후기 답변 삭제 버튼 클릭 시 -->
    <script>
	    function deleteRoomReviewComment(roomReviewId) {
	 		if(confirm('후기답변을 삭제하시면 다시 작성할 수 없습니다. 그래도 삭제하시겠습니까?') == true){
	 			location.href="${pageContext.request.contextPath}/removeRoomReviewComment?roomId=${room.roomId}&detailAddressId=${address.detailAddressId}&roomReviewId="+roomReviewId+"";
	 		} else {
	 			return;
	 		}	
	 	}	
    </script>
    
 	<script>
		$(function(){
			yearList();
		});   
	
		function yearList(){
			var date = new Date();
			var year = date.getFullYear();
			for(var i=(year); i >= (year-10); i--) {
				$("#year").append("<option value='"+i+"'>" + i + "</option>");
			}
		}
	</script>
	
	<script>	
		function selectYear(){
			var year = $("#year option:selected").val();
			
			location.href="${pageContext.request.contextPath}/roomOne?roomId=${room.roomId}&detailAddressId=${address.detailAddressId}&year="+year;
		}
    </script>
	
	<!-- Page level plugins -->
    <script src="${pageContext.request.contextPath}/resources/vendor/chart.js/Chart.min.js"></script>
	
	<script>
	var arr = new Array();
	var arr2 = new Array();
	
	<c:forEach items="${ageList}" var="a">
		arr.push("${a.ageGroup}");
		arr2.push("${a.age}");
	</c:forEach>
	
	console.log(arr);
	console.log(arr2);

	var ctx = document.getElementById("myPieChart");
	var myPieChart = new Chart(ctx, {
	  type: 'pie',
	  data: {
	    labels: arr,
	    datasets: [{
	      backgroundColor: ['#4e73df', '#1cc88a', '#36b9cc', '#e34f66', '#ebe86e', '#e8c25a'],
	      hoverBackgroundColor: ['#2e59d9', '#17a673', '#2c9faf', '#b8273d', '#c7c332', '#bd9426'],
	      hoverBorderColor: "rgba(234, 236, 244, 1)",
	      data: arr2,
	    }],
	  },
	  options: {
		    maintainAspectRatio: false,
		    tooltips: {
		      backgroundColor: "rgb(255,255,255)",
		      bodyFontColor: "#858796",
		      borderColor: '#dddfeb',
		      borderWidth: 1,
		      displayColors: false,
		      caretPadding: 10,
		    },
		  },
		});
	</script>   
</body>
</html>
