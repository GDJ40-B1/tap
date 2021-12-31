<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
	<title>Insert title here</title>
	<script src="http://code.jquery.com/jquery-latest.js"></script> 
</head>
<body id="page-top">

    <!-- start : hostHeader -->
    <div>
    	<jsp:include page="/partial/hostHeader.jsp"></jsp:include>
    </div>
    <!-- end : hostHeader -->
    
    <!-- start : content -->
	<div id="content" class="container-fluid">
		<!-- DataTales Example -->
	    <div class="card shadow mb-4">
	        <div class="card-header py-3">
	            <h6 class="m-0 font-weight-bold text-primary">미답변 숙소후기(${roomReview.totalCount}개)</h6>
	        </div>
	        <div class="card-body">
	            <div class="table-responsive">
		        	<c:choose>
						<c:when test="${empty roomReview.list}">
							<div>미답변 숙소후기 내역이 없습니다.</div>
						</c:when>
				
					<c:otherwise>
					<table class="table table-bordered" id="dataTable">
						<thead>
			       			<tr>
			       				<td>숙소</td>
			       				<td>후기내역</td>
			       				<td>후기평점</td>
			       				<td>작성자</td>
			       				<td>작성일</td>
			       			</tr>
			       		</thead>
		       			<c:forEach var="r" items="${roomReview.list}">
		       			<tbody>
		       				<tr>
		       					<td><a href="${pageContext.request.contextPath}/roomOne?roomId=${r.roomId}&detailAddressId=${r.detailAddressId}">${r.roomName}</a></td>
								<td><a href="#roomReview" onclick="result(this)" style="text-overflow: ellipsis;">${r.roomReviewContent}</a></td>
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
								<td>${r.memberId}</td>
								<td>${r.createDate}</td>
		       				</tr>
		       				<tr class="review" style="display: none;">
								<td colspan = "4">
									<div class="d-flex justify-content-between align-items-center">
										<span>후기 : ${r.roomReviewContent}</span>
										<ol style="list-style: none;">
											<li>
												<a class="btn btn-outline-dark" href="javascript:removeRoomReview('${r.roomReviewId}','${r.roomId}','${r.detailAddressId}');">후기삭제</a>
											</li>
										</ol>
									</div>
									<div>
										<form class="roomReviewAnswerForm" action="${pageContext.request.contextPath}/host/unansweredRoomReview" method="post">
											<div class="form-group">
												<input type="hidden" name="roomReviewId" value="${r.roomReviewId}">
												<label for="roomReviewAnswer">답변 작성 : </label>
													<textarea class="form-control" rows="5" placeholder="후기답변을 작성해주세요" class="roomReviewCommentContent" name="roomReviewCommentContent"></textarea>
											</div>
											<div>
												<button class="addRoomReviewAnswerBtn" type ="button">작성</button>
											</div>
										</form>		
									</div>
								</td>
		       				</tr>
		       			</tbody>
		       			</c:forEach>
		       		</table>
		       		</c:otherwise>
		       	</c:choose>
		    	
		    	<div>
		    		<c:if test="${roomReview.currentPage > 1}">
						<a class="btn btn-secondary" href="${pageContext.request.contextPath}/host/unansweredRoomReview?currentPage=1">처음으로</a>
						<a class="btn btn-secondary" href="${pageContext.request.contextPath}/host/unansweredRoomReview?currentPage=${roomReview.currentPage-1}">이전</a>
					</c:if>
					
					<c:forEach var="i" begin="${roomReview.startPage}" end="${roomReview.endPage}">
						<a class="btn btn-secondary" href="${pageContext.request.contextPath}/host/unansweredRoomReview?currentPage=${i}"><c:out value="${i}"/></a>
					</c:forEach>
					
					<c:if test="${roomReview.currentPage < roomReview.lastPage}">
						<a class="btn btn-secondary" href="${pageContext.request.contextPath}/host/unansweredRoomReview?currentPage=${roomReview.currentPage+1}">다음</a>
						<a class="btn btn-secondary" href="${pageContext.request.contextPath}/host/unansweredRoomReview?currentPage=${roomReview.lastPage}">끝으로</a>
					</c:if>		
	       		</div>	
	       		       	
	            </div>
	        </div>
	    </div>

	<script>
		function result(content) {
			var currentRow = $(content).closest('tr');
			var detail = currentRow.next('tr');
			var etc = $('.review').not(content);
			
			if(detail.is(":visible")){
				detail.hide();
			} else {
				etc.hide();
				detail.show();
			}
		}
	</script>
	
	<script>
	 	function removeRoomReview(roomReviewId, roomId, detailAddressId) {
	 		if(confirm('후기를 삭제하시면 다시 복구할 수 없습니다. 그래도 삭제하시겠습니까?') == true){
	 			location.href="${pageContext.request.contextPath}/removeRoomReview?roomId="+roomId+"&detailAddressId="+detailAddressId+"&roomReviewId="+roomReviewId+"";
	 		} else {
	 			return;
	 		}	
	 	}	
    </script>     
        
	<script>	
		$('.addRoomReviewAnswerBtn').click(function(){
			if($(this).parents(".roomReviewAnswerForm").find('textarea').val() == '') {
				alert('답변을 입력하세요');
				return;
			}

			$(this).parents(".roomReviewAnswerForm").submit();
		});
    </script>
	</div>
	<!-- end : content -->
	
	<!-- start : hostFooter -->
    <div>
       <jsp:include page="/partial/hostFooter.jsp"></jsp:include>
    </div>
    <!-- end : hostFooter -->
</body>
</html>

