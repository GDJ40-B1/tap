<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
	<script src="http://code.jquery.com/jquery-latest.js"></script> 
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
	<meta charset="UTF-8">
	<title>${room.roomName }</title>

	<!-- Favicons -->
    <link href="${pageContext.request.contextPath}/resources/img/tap_favicon.png" rel="icon">
    <link href="${pageContext.request.contextPath}/resources/img/tap_favicon.png" rel="apple-touch-icon">
    
   	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="/resources/demos/style.css">
    
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
	          <h2>숙소 |
	          <!-- 즐겨찾기 등록은 이미지로 변경할 필요가 있음 -->
	        	<c:choose>
					<c:when test="${favorite == '0'}">
						<button type="button" class="btn btn-danger" id='addFavorites'>♡</button>
					</c:when>
					
					<c:when test="${favorite == '1'}">
						<button type="button" class="btn btn-danger" id='removeFavorites'>♥</button>
					</c:when>
				</c:choose>
	          </h2>
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
         		
         		<!-- 숙소 이미지 -->
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
				<br>
				
	            <!-- 쿠폰 -->
	            <div style="margin: 20px">
	            	<c:forEach items="${couponList}" var="c">
	            		<button id="${c.couponId }-couponBtn" type="button" class="btn btn-outline-danger">${c.couponName }</button>
	            	</c:forEach>
	            </div>
	            
	            <!-- 숙소 정보 -->
                <table border="1" class="table" style="width: 100%;">
                     <tr>
                        <td style="width:20%;">숙소명</td>
                        <td id="roomName" style="width:80%;">${room.roomName }</td>
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
                        <td>최대 인원수</td>
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
                <div style="margin-bottom:20px; font-size:17px;"class="badge rounded-pill bg-info">${hashtag }</div>
         
	            <br>
	            <!-- 지도 -->
	            <div id="map" style="width:100%;height:350px;"></div>
            </div>
      </section>
 		<div class="container">
			<div class="form-group row">
				<div class="col-sm-6 mb-3 mb-sm-0">
					<h6><label style="margin:10px;">숙소 구성</label></h6>
					<ul class="list-group">
						<c:forEach items="${roomPartList}" var="p">
							<li class="list-group-item">${p.partName } x${p.quantity }</li>
						</c:forEach>
					</ul>
					
					<h6><label style="margin:10px;">숙소 비품</label></h6>
					<ul class="list-group">
						<li class="list-group-item">
							<c:forEach items="${roomAmenitiesList}" var="a">
								<span>${a }</span>&nbsp;&nbsp;&nbsp;
							</c:forEach>
						</li>
					</ul>
				</div>
					
				<div class="col-sm-6 mb-3 mb-sm-0">
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
		</div>
 	  
 	  <div class="container">
      	<div class="row">
      		<div class="col">
	            <ul class="nav nav-tabs nav-justified">
	              <li class="nav-item">
	                <a class="nav-link active" data-toggle="tab" href="#qwe">문의</a>
	              </li>
	              <li class="nav-item">
	                <a class="nav-link" data-toggle="tab" href="#review">후기</a>
	              </li>
	            </ul>
	            <div class="tab-content">
	            	<div class="tab-pane fade show active" id="qwe">
	            		<p><br>
	            		
			         	<button type="button" class="btn btn-danger" id='insertRoomQna'>문의 작성</button>
						
						<c:choose>
							<c:when test="${empty roomQna.list}">
								<div>문의 내역이 없습니다.</div>
							</c:when>
						
							<c:otherwise>
							
				       		<table style="margin-top:10px;"class="table table-hover" id="roomQna" border="1">
				       			<tr class="table-active">
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
				       				<tr class="qna" style="display: none; text-align:left;">
										<td colspan = "4">
											<div>문의 : ${q.content}</div>
											<c:if test="${loginUser != null && q.memberId == loginUser.userId ||  loginUser.userLevel == 'system_admin'}">
												<br><div><a class="btn btn-danger btn-sm" href="javascript:removeQuestion(${q.roomQna},'${q.memberId}');">삭제</a></div>
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
			       		<div style="text-align:center;">
				      		<c:if test="${roomQna.roomQnaCurrentPage > 1}">
								<a class="btn btn-primary" href="${pageContext.request.contextPath}/roomOne?roomId=${room.roomId}&detailAddressId=${address.detailAddressId}&roomQnaCurrentPage=${roomQna.roomQnaCurrentPage-1}">이전</a>
							</c:if>
							
							<c:forEach var="i" begin="${roomQna.roomQnaStartPage}" end="${roomQna.roomQnaEndPage}">
								<a class="btn btn-outline-primary" href="${pageContext.request.contextPath}/roomOne?roomId=${room.roomId}&detailAddressId=${address.detailAddressId}&roomQnaCurrentPage=${i}"><c:out value="${i}"/></a>
							</c:forEach>
							
							<c:if test="${roomQna.roomQnaCurrentPage < roomQna.roomQnaLastPage}">
								<a class="btn btn-primary" href="${pageContext.request.contextPath}/roomOne?roomId=${room.roomId}&detailAddressId=${address.detailAddressId}&roomQnaCurrentPage=${roomQna.roomQnaCurrentPage+1}">다음</a>
							</c:if>
						</div> 	
	             	</div>
	             	<div class="tab-pane fade" id="review">
	               		<p>
	               			<!-- *** 숙소 후기 *** -->
							<div class="form-group">
								<c:choose>
									<c:when test="${empty roomReview.list}">
										후기 내역이 없습니다.
									</c:when>
									
									<c:otherwise>
										<h4 style="text-align:center;">후기(${roomReview.totalRoomReviewCount})개</h4>
										<h2><span style="color:#fedd7b;">★</span> ${roomReview.avgRoomReviewScore}<span style="font-size:0.5em;">/5</span></h2>
										<hr>
									</c:otherwise>
								</c:choose>
							</div>
							
							<c:forEach var="r" items="${roomReview.list}">
					   			<c:choose>
					   				<c:when test="${loginUser.userId == room.hostId}">
					   					<div>
											<input type="hidden" name="roomId" value="${room.roomId}">
											<input type="hidden" name="detailAddressId" value="${address.detailAddressId}">
											<input type="hidden" class="roomReviewId" name="roomReviewId" value="${r.roomReviewId}">
											<div class="d-flex justify-content-between align-items-center">
												<span></span>
												<ol style="list-style: none;">
													<li>
														<a class="btn btn-outline-dark" href="javascript:deleteRoomReview('${r.roomReviewId}');">숙소후기 삭제</a>
													</li>
												</ol>
											</div>
											<div class="d-flex justify-content-between align-items-center">
												<c:forEach var="rre" items="${r.reservation}">
													${rre.memberId} |
													<c:forEach var="rro" items="${r.room}">
														${rro.roomCategory}[${rro.roomForm}]
													</c:forEach>
												</c:forEach>
												<ol style="list-style: none;"> 
													<li>
														<c:set var="ocreateDate" value="${r.createDate}"/>
														<c:set var="createDate" value="${fn:substring(ocreateDate,0,10)}"/>
														${createDate}
													</li>
												</ol>
											</div>	
											<div>
												숙소후기 평점 : 
												<c:choose>
													<c:when test="${r.roomReviewScore == 1}">
														<td >★☆☆☆☆</td>
													</c:when>
													<c:when test="${r.roomReviewScore == 2}">
														<td>★★☆☆☆</td>
													</c:when>
													<c:when test="${r.roomReviewScore == 3}">
														<td >★★★☆☆</td>
													</c:when>
													<c:when test="${r.roomReviewScore == 4}">
														<td>★★★★☆</td>
													</c:when>
													<c:when test="${r.roomReviewScore == 5}">
														<td>★★★★★</td>
													</c:when>
												</c:choose>
											</div>
											<div>
												숙소후기 내용 :
												${r.roomReviewContent}
											</div>
											<div>
												<c:choose>
													<c:when test="${r.answerStatus == 'N'}">
														<form class="insertCommentForm" action="${pageContext.request.contextPath}/addRoomReviewComment" method="post">
															<div class="form-group">
																<input type="hidden" name="roomId" value="${room.roomId}">
																<input type="hidden" name="detailAddressId" value="${address.detailAddressId}">
																<input type="hidden" name="roomReviewId" value="${r.roomReviewId}">
																<label for="reviewCommentContent">답변 작성 </label>
																	<textarea class="form-control" rows="5" placeholder="답변을 작성해주세요" class="insertComment" name="roomReviewCommentContent"></textarea>
															</div>
															<div>
																<button class="insertCommentBtn" type ="button">작성</button>
															</div>
														</form>
													</c:when>
													<c:otherwise>
														<div>
															<c:forEach var="rc" items="${r.roomReviewComment}">
																<div class="d-flex justify-content-between align-items-center">
																	<span>숙소후기 답변</span>
																	<ol style="list-style: none;">
																		<li>
																			<a class="btn btn-danger" href="javascript:deleteRoomReviewComment('${r.roomReviewId}');">숙소후기 답변삭제</a>
																		</li>
																	</ol>
																</div>
																<textarea class="form-control" rows="5" cols="50" name="roomReviewCommentContent" readonly="readonly">${rc.roomReviewCommentContent}</textarea>
															</c:forEach>
														</div>
													</c:otherwise>
												</c:choose>
												<div>
													<hr style="height: 3px;">
												</div>
											</div>
										</div>
					   				</c:when>
					   				<c:otherwise>
					   					<div class="d-flex justify-content-between align-items-center">
					   						<c:forEach var="rre" items="${r.reservation}">
												${rre.memberId} |
												<c:forEach var="rro" items="${r.room}">
													${rro.roomCategory}[${rro.roomForm}]
												</c:forEach>
											</c:forEach>
											<ol style="list-style: none;">
												<li>
													<c:set var="ocreateDate" value="${r.createDate}"/>
													<c:set var="createDate" value="${fn:substring(ocreateDate,0,10)}"/>
													${createDate}					
												</li>
											</ol>
										</div>
										<div>
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
										</div>
										<div>
											숙소후기 내용 :
											${r.roomReviewContent}
										</div>
										<div>
											<c:if test="${r.answerStatus eq 'Y'}">
												<c:forEach var="rc" items="${r.roomReviewComment}">
													숙소후기 답변
													<textarea class="form-control" rows="5" cols="50" name="roomReviewCommentContent" readonly="readonly">${rc.roomReviewCommentContent}</textarea>
												</c:forEach>
											</c:if>
										</div>
										<div>
											<hr style="height: 3px;">
										</div>
					   				</c:otherwise>
								</c:choose>
							</c:forEach>
							
							<div style="text-align:center;">
								<!-- ======= Paging Section ======= -->
								<c:if test="${roomReviw.roomReviewCurrentPage > 1}">
									<a class="btn btn-primary" href="${pageContext.request.contextPath}/roomOne?roomId=${room.roomId}&detailAddressId=${address.detailAddressId}&roomReviewCurrentPage=${roomReviw.roomReviewCurrentPage-1}">이전</a>
								</c:if>
								
								<c:forEach var="i" begin="${roomReview.startPage}" end="${roomReview.endPage}">
									<a class="btn btn-outline-primary" href="${pageContext.request.contextPath}/roomOne?roomId=${room.roomId}&detailAddressId=${address.detailAddressId}&roomReviewCurrentPage=${i}"><c:out value="${i}"/></a>
								</c:forEach>
								
								<c:if test="${roomReviw.roomReviewCurrentPage < roomReview.lastPage}">
									<a class="btn btn-primary" href="${pageContext.request.contextPath}/roomOne?roomId=${room.roomId}&detailAddressId=${address.detailAddressId}&roomReviewCurrentPage=${roomReviw.roomReviewCurrentPage+1}">다음</a>
								</c:if>		
								<!-- End Paging Section -->
							</div>									
	             	</div>
	            </div>       
	        </div>    
        </div>  
 	  </div>
 	  
      
       
       	
   </main>
   
   <div class="roomOneRv">
		<div class="accordion" id="accordionExample">
		   <div class="accordion-item">
		     <h2 class="accordion-header" id="headingOne">
		       <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="ture" aria-controls="collapseOne">
		         예약
		       </button>
		     </h2>
		     <div id="collapseOne" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
		       <div class="accordion-body">
				<div class="container" style="width:90%;">
			   		<form id="addReservationForm" action="${pageContext.request.contextPath}/member/addPayment" method="get" class="rounded">
					   <input type="hidden" name="roomId" value="${room.roomId}">
					   <input type="hidden" name="room.roomPrice" value="${room.roomPrice}">
					   <input type="hidden" name="room.roomName" value="${room.roomName }">
					   <div class="form-group">
					   		<label for="inputCity" class="form-label mb-2">체크인</label>
						      <input type="text" id="dateRangePicker1" class="form-control" name="checkInDate" readonly>
					   </div>
					   <div class="form-group" style="margin-top:12px;">
					   		<label for="inputState" class="form-label mb-2">체크아웃</label>
						      <input type="text" id="dateRangePicker2" class="form-control" name="checkOutDate" readonly>
					   </div>
					   <div class="form-group" style="margin-top:12px;">
					   		<label class="form-label mb-2">인원수</label>
					   <input type="number" id="peopleNum" class="form-control" name="peopleNum" value="---------">
					   </div>
					   <div class="form-group" style="margin-top:12px;">
					   		<button id="resBtn" type="button" class="btn btn-primary" style="width: 100%;">예약</button>
					   </div>
					</form>
				</div>		         
		       </div>
		     </div>
		   </div>
		</div>
   </div>
   
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
	
	<!-- 예약 유효성 검사 -->
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
	
	<!-- Datepicker 관련 script-->
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
   
   <!-- kakao map API -->
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
   
   /* 명소 리스트 찍기 */
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder_at = new kakao.maps.services.Geocoder();
	
	// 각 숙소의 정보를 토대로 마커를 찍습니다
	<c:forEach items="${attractionList}" var="a" varStatus="status">
		// 주소로 좌표를 검색합니다
		geocoder_at.addressSearch("${a.address.detailAddress}", function(result, status) {

		    // 정상적으로 검색이 완료됐으면 
		    if (status === kakao.maps.services.Status.OK) {
		    	
		    	// 마커 이미지 정보
		    	var imageSrc = '${pageContext.request.contextPath}/resources/img/system/attraction_marker.png', // 마커이미지의 주소입니다    
		        imageSize = new kakao.maps.Size(30, 32), // 마커이미지의 크기입니다
		        imageOption = {offset: new kakao.maps.Point(15, 40)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
		          
		    	// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
		    	var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
				
				var marker_at = new kakao.maps.Marker({
		 	        map: map, // 마커를 표시할 지도
		 	        title: "${a.attractionName}", // 명소 이름
		 	        position: new kakao.maps.LatLng(result[0].y, result[0].x), // 마커의 위치
		 	        image : markerImage
		 	    });
				
			 	// 커스텀 오버레이에 표출될 내용으로 HTML 문자열이나 document element가 가능합니
		           var content = '<span class="badge bg-warning">${a.attractionName}</span>';
		           var custom_position = new kakao.maps.LatLng(result[0].y-0.0001, result[0].x);  

		           // 커스텀 오버레이를 생성합니다
		           var customOverlay = new kakao.maps.CustomOverlay({
		               map: map,
		               position: custom_position,
		               content: content,
		               yAnchor: 1 
		           });

			    // 마커에 클릭 이벤트를 달아줍니다
			    kakao.maps.event.addListener(marker_at, 'click', makeAttractionClickListener("${a.attractionId}","${a.address.detailAddressId}"));
		    }
		});	
	</c:forEach>
	
	/* 숙소 찍기 */
	// 주소로 좌표를 검색합니다
   geocoder.addressSearch($('#address').text(), function(result, status) {

       // 정상적으로 검색이 완료됐으면 
        if (status === kakao.maps.services.Status.OK) {

           var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
           
        	// 마커 이미지 정보
	    	var imageSrc = '${pageContext.request.contextPath}/resources/img/system/room_marker.png', // 마커이미지의 주소입니다    
	    	imageSize = new kakao.maps.Size(64, 69), // 마커이미지의 크기입니다
	        imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
	          
	    	// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
	    	var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
			
           
           // 결과값으로 받은 위치를 마커로 표시합니다
           var marker = new kakao.maps.Marker({
               map: map,
               position: coords,
               image : markerImage
           });
           
           // 숙소 마커 클릭시 길찾기로 이동
           kakao.maps.event.addListener(marker, 'click', function() {
        	   window.open('https://map.kakao.com/link/to/'+$('#roomName').text()+','+result[0].y+','+result[0].x, '_blank');
        	});
           
        // 커스텀 오버레이에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
        var link_room = 'https://map.kakao.com/link/to/'+$('#roomName').text()+','+result[0].y+','+result[0].x;
           var content = '<div class="customoverlay">' +
               '  <a href="'+link_room+'" target="_blank">' +
               '    <span class="title">${room.roomName }</span>' +
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
           // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
           map.setCenter(coords);
       } 
   });

	/* 마커 클릭 이벤트 */
	// 명소 클릭 시 명소 상세보기로 이동
	function makeAttractionClickListener(attractionId,detailAddressId) {
	    return function() {
            // 마커 클릭시 실행할 이벤트 구현
	    	window.open("${pageContext.request.contextPath}/attractionOne?attractionId="+attractionId+"&detailAddressId="+detailAddressId, '_blank');
	    };
	}
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
	 		if(confirm('후기를 삭제하시면 다시 복구할 수 없습니다. 그래도 삭제하시겠습니까?') == true){
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
    
    <!-- 후기 신고 버튼 클릭 시 -->
    <script>	    
	    var roomReviewId = $('.roomReviewId').val();
		
		console.log(roomReviewId);
	
    	$('#insertReport').click(function() {
    		if ("${loginUser.userId}" == "" || "${loginUser.userLevel}" == "member" || "${loginUser.userLevel}" == "system_admin") {
    			if (confirm("해당 호스트만 가능합니다.")) {
    				location.href = '${pageContext.request.contextPath}/login';
    			} else {
    				location.reload();
    			}
    		} else {
    			window.open("${pageContext.request.contextPath}/reportPopup?roomReviewId="+roomReviewId,"_blank","toolbar=yes,menubar=yes,width=700,height=500").focus();
    		}
    	});
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