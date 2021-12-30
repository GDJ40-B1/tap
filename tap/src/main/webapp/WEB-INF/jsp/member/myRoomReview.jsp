<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.removeRoomReviewBtn {
		 background-color: white;
		 color: black;
		 border: 2px solid #555555;
	}
	.removeRoomReviewBtn:hover {
		 background-color: #555555;
 		 color: white;
	}
</style>
</head>
<body>
	<!-- start : memberHeader -->
    <div>
       <jsp:include page="/partial/memberHeader.jsp"></jsp:include>
    </div>
    <!-- end : memberHeader -->
   
	<!-- start : content -->
	<div id="content" class="container-fluid">
		<!-- DataTales Example -->
	    <div class="card shadow mb-4">
	        <div class="card-header py-3">
	            <h6 class="m-0 font-weight-bold text-primary" style="text-align:center">나의 후기(${totalCount}개)</h6>
	        </div>
	        <div class="card-body">
	        	<div class="table-responsive">
	            	<c:forEach var="r" items="${list}">
						<c:forEach var="rr" items="${r.room}">
							<div class="d-flex justify-content-between align-items-center">
								<h2>${rr.roomName}</h2>
								<ol style="list-style: none;">
									<li>
										<form class="removeRoomReviewForm" action="${pageContext.request.contextPath}/member/removeRoomReview" method="post">
											<input type="hidden" name="roomReviewId" value="${r.roomReviewId}">
											<button class="removeRoomReviewBtn" type="button">리뷰 삭제하기</button>
										</form>				
									</li>
								</ol>
							</div>
							<div class="d-flex justify-content-between align-items-center">
								${rr.roomCategory}[${rr.roomForm}]
								<ol style="list-style: none;">
									<li>
										<c:set var="ocreateDate" value="${r.createDate}"/>
										<c:set var="createDate" value="${fn:substring(ocreateDate,0,10)}"/>
										${createDate}					
									</li>
								</ol>
							</div>
						</c:forEach>
					<div>
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
					</div>
					<c:forEach var="rc" items="${r.roomReviewComment}">
						<c:choose>
							<c:when test="${r.answerStatus == 'N'}">
								<span>숙소후기 내용 </span> 
								<textarea class="form-control" rows="3" cols="30" name="roomReviewContent" readonly="readonly">${r.roomReviewContent}</textarea>	
							</c:when>
							<c:otherwise>
								<span>숙소후기 내용 </span> 
								<textarea class="form-control" rows="3" cols="30" name="roomReviewContent" readonly="readonly">${r.roomReviewContent}</textarea>
								<span>숙소후기 답변</span>
								<textarea class="form-control" rows="5" cols="50" name="roomReviewCommentContent" readonly="readonly">${rc.roomReviewCommentContent}</textarea>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<div>
						<hr style="height: 3px;">
					</div>
					</c:forEach>
				</div>
	        </div>
	        <!-- ======= Paging Section ======= -->
		    <section id="pageNumber" class="pageNumber">
		      <div class="container" style="text-align:center"> 
				<c:if test="${currentPage > 1}">
					<a class="btn btn-secondary" href="${pageContext.request.contextPath}/member/memberRoomReviewList?currentPage=1">처음으로</a>
					<a class="btn btn-secondary" href="${pageContext.request.contextPath}/member/memberRoomReviewList?currentPage=${currentPage-1}">이전</a>
				</c:if>
				
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<a class="btn btn-secondary" href="${pageContext.request.contextPath}/member/memberRoomReviewList?currentPage=${i}"><c:out value="${i}"/></a>
				</c:forEach>
				
				<c:if test="${currentPage < lastPage}">
					<a class="btn btn-secondary" href="${pageContext.request.contextPath}/member/memberRoomReviewList?currentPage=${currentPage+1}">다음</a>
					<a class="btn btn-secondary" href="${pageContext.request.contextPath}/member/memberRoomReviewList?currentPage=${lastPage}">끝으로</a>
				</c:if>		
		      </div>
		    </section>
		    <!-- End Paging Section -->
	    </div>	
	</div>
	
	<!-- start : memberFooter -->
    <div>
       <jsp:include page="/partial/memberFooter.jsp"></jsp:include>
    </div>
    <!-- end : memberFooter -->
    
    <!-- 나의 숙소후기 회원 삭제 버튼 -->
    <script>
	    $('.removeRoomReviewBtn').click(function(){	
	    	if(confirm('정말로 후기를 삭제하시겠습니까? 삭제된 후기는 복구할 수 없습니다.') == true) { // 확인
	    		$(this).parents('.removeRoomReviewForm').submit();	
	    	} else { // 취소
	    		return; 
	    	}		
		});
    </script>
</body>
</html>