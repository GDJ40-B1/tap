<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	  <style type="text/css">
	  	.title {	
			font-family: 'Noto Sans KR', sans-serif;
			font-weight: 500
		}
	  </style>

    <meta charset="utf-8">
	<title>Insert title here</title>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	
	  <!-- Google Fonts -->
	  <link rel="preconnect" href="https://fonts.googleapis.com">
	  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
		
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
	            <h6 class="m-0 font-weight-bold text-primary">미답변 문의</h6>
	        </div>
	        <div class="card-body">
	            <div class="table-responsive">
		            <c:choose>
					<c:when test="${empty roomQna.list}">
						<div>미답변 문의 내역이 없습니다.</div>
					</c:when>
				
					<c:otherwise>
	            
					<table class="table table-bordered" id="dataTable">
						<thead>
			       			<tr>
			       				<td>숙소</td>
			       				<td>문의내역</td>
			       				<td>작성자</td>
			       				<td>작성일</td>
			       			</tr>
			       		</thead>
			       		<tbody>
		       			<c:forEach var="q" items="${roomQna.list}">
		       				<tr>
		       					<td><a href="${pageContext.request.contextPath}/roomOne?roomId=${q.roomId}&detailAddressId=${q.detailAddressId}">${q.roomName}</a></td>
								<td><a href="#roomQna" onclick="result(this)" style="text-overflow: ellipsis;">${q.content}</a></td>
								<td>${q.memberId}</td>
								<td>${q.createDate}</td>
		       				</tr>
		       				<tr class="qna" style="display: none;">
								<td colspan = "4">
									<h3 class="title">문의 내역</h3>
									<div style="margin: 20px;">${q.content}</div><br>
									<div>
										<form class="roomQnaAnswerForm" action="${pageContext.request.contextPath}/host/unansweredRoomQna" method="post">
											<div class="form-group">
												<input type="hidden" name="roomQnaId" value="${q.roomQna}">
													<textarea class="form-control" rows="5" cols="20" wrap="hard" placeholder="답변을 작성해주세요" class="answer" name="answer"></textarea>
											</div>
											<div>
												<button class="btn btn-primary addRoomQnaAnswer" type ="button">작성</button>
											</div>
										</form>		
									</div>
								</td>
		       				</tr>
		       			</c:forEach>
		       			</tbody>
		       		</table>
		       		</c:otherwise>
		       	</c:choose>
		       	
		       	
		       	
		       	<div>
				  <ul class="pagination justify-content-end">
				  <c:choose>
				  	<c:when test="${roomQna.unansweredCurrentPage > 1}">
					    <li class="page-item">
				  			<a class="page-link" href="${pageContext.request.contextPath}/host/unansweredRoomQna?unansweredCurrentPage=${roomQna.unansweredCurrentPage-1}">Previous</a>
					    </li>
				  	</c:when>
				  	<c:otherwise>
					    <li class="page-item disabled">
				  			<a class="page-link" href="${pageContext.request.contextPath}/host/unansweredRoomQna?unansweredCurrentPage=${roomQna.unansweredCurrentPage-1}">Previous</a>
					    </li>
				  	</c:otherwise>
				  </c:choose>
				  
					<c:forEach var="i" begin="${roomQna.unansweredStartPage}" end="${roomQna.unansweredEndPage}">
				    	<c:choose>
							<c:when test="${roomQna.unansweredCurrentPage==i}">
								<li class="page-item active">
									<a class="page-link" href="${pageContext.request.contextPath}/host/unansweredRoomQna?unansweredCurrentPage=${i}"><c:out value="${i}"/></a>
								</li>
							</c:when>
							<c:otherwise>
								<li class="page-item">
									<a class="page-link" href="${pageContext.request.contextPath}/host/unansweredRoomQna?unansweredCurrentPage=${i}"><c:out value="${i}"/></a>
								</li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					
					<c:choose>
				  	  <c:when test="${roomReview.currentPage < roomReview.lastPage}">
				  		<li class="page-item">
							<a class="page-link" href="${pageContext.request.contextPath}/host/unansweredRoomQna?unansweredCurrentPage=${roomQna.unansweredCurrentPage+1}">Next</a>
						</li>
				  	  </c:when>
				  	  <c:otherwise>
				  		<li class="page-item disabled">
							<a class="page-link" href="${pageContext.request.contextPath}/host/unansweredRoomQna?unansweredCurrentPage=${roomQna.unansweredCurrentPage+1}">Next</a>
						</li>
				  	  </c:otherwise>
				    </c:choose>
				  </ul>
	       		</div>
	            </div>
	        </div>
	    </div>

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
	</div>
	<!-- end : content -->
	
	<!-- start : hostFooter -->
    <div>
       <jsp:include page="/partial/hostFooter.jsp"></jsp:include>
    </div>
    <!-- end : hostFooter -->
</body>
</html>

