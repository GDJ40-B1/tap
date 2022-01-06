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
	<title>문의 미답변 리스트</title>
	<script src="http://code.jquery.com/jquery-latest.js"></script> 
	
	  <!-- Google Fonts -->
	  <link rel="preconnect" href="https://fonts.googleapis.com">
	  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
	
</head>
<body id="page-top">

    <!-- start : hostHeader -->
    <div>
    	<jsp:include page="/partial/systemAdminHeader.jsp"></jsp:include>
    </div>
    <!-- end : hostHeader -->
    
    <!-- start : content -->
	<div id="content" class="container-fluid">
		<!-- DataTales Example -->
	    <div class="card shadow mb-4">
	        <div class="card-header py-3">
	            <h6 class="m-0 font-weight-bold text-primary">문의 미답변 리스트</h6>
	        </div>
	        <div class="card-body">
		        <ul class="nav nav-tabs">
	        		<li class="nav-item">
	        			<a class="nav-link" href="${pageContext.request.contextPath}/systemAdmin/unansweredQuestionList">전체</a>
	          		</li>
	          		<li class="nav-item">
	            		<a class="nav-link" href="${pageContext.request.contextPath}/systemAdmin/unansweredQuestionList?writerCategory=member">회원</a>
	          		</li>
	          		<li class="nav-item">
	           	 		<a class="nav-link" href="${pageContext.request.contextPath}/systemAdmin/unansweredQuestionList?writerCategory=host">호스트</a>
	          		</li>
	            </ul> 
	            
	            <div class="table-responsive" style="margin-top:20px;">
		            <c:choose>
					<c:when test="${empty questionList.list}">
						<div>미답변 문의 내역이 없습니다.</div>
					</c:when>
				
					<c:otherwise>	            
	            	
	                <table class="table table-bordered" id="dataTable">
	                    <thead>
	                        <tr>
	                            <th>글 번호</th>
								<th>카테고리</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
	                        </tr>
	                    </thead>
	                    <tbody>
	                    	<c:forEach var="q" items="${questionList.list}">
			       				<tr>
			       					<td>${q.questionId}</td>
									<td>${q.writerCategory}</td>
									<td><a href="#roomQna" onclick="result(this)" style="text-overflow: ellipsis;">${q.questionTitle}</a></td>
									<td>${q.writerId}</td>
									<td>${q.createDate}</td>
			       				</tr>
			       				<tr class="qna" style="display: none;">
									<td colspan = "5">
										<h3 class="title">문의 내역</h3>
										<div style="margin: 20px;">${q.questionContent}</div><br>
										<div>
											<form class="questionAnswerForm" action="${pageContext.request.contextPath}/unansweredQuestionList" method="post">
												<div class="form-group">
													<input type="hidden" name="answerQuestionId" value="${q.questionId}">
													<input type="hidden" name="systemAdminId" value="${loginUser.userId}">
														<textarea class="form-control" rows="5" placeholder="답변을 작성해주세요" id="questionAnswerContent" name="questionAnswerContent"></textarea>
												</div>
												<div>
													<button class="btn btn-primary" id="addQnaAnswer" type ="button">작성</button>
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
				  	<c:when test="${questionList.currentPage > 1}">
					    <li class="page-item">
				  			<a class="page-link" href="${pageContext.request.contextPath}/systemAdmin/unansweredQuestionList?currentPage=${questionList.currentPage-1}">Previous</a>
					    </li>
				  	</c:when>
				  	<c:otherwise>
					    <li class="page-item disabled">
				  			<a class="page-link" href="${pageContext.request.contextPath}/systemAdmin/unansweredQuestionList?currentPage=${questionList.currentPage-1}">Previous</a>
					    </li>
				  	</c:otherwise>
				  </c:choose>
				  
					<c:forEach var="i" begin="${questionList.startPage}" end="${questionList.endPage}">
				    	<c:choose>
							<c:when test="${questionList.currentPage==i}">
								<li class="page-item active">
									<a class="page-link" href="${pageContext.request.contextPath}/systemAdmin/unansweredQuestionList?currentPage=${i}"><c:out value="${i}"/></a>
								</li>
							</c:when>
							<c:otherwise>
								<li class="page-item">
									<a class="page-link" href="${pageContext.request.contextPath}/systemAdmin/unansweredQuestionList?currentPage=${i}"><c:out value="${i}"/></a>
								</li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					
					<c:choose>
				  	  <c:when test="${questionList.currentPage < questionList.lastPage}">
				  		<li class="page-item">
							<a class="page-link" href="${pageContext.request.contextPath}/systemAdmin/unansweredQuestionList?currentPage=${questionList.currentPage+1}">Next</a>
						</li>
				  	  </c:when>
				  	  <c:otherwise>
				  		<li class="page-item disabled">
							<a class="page-link" href="${pageContext.request.contextPath}/systemAdmin/unansweredQuestionList?currentPage=${questionList.currentPage+1}">Next</a>
						</li>
				  	  </c:otherwise>
				    </c:choose>
				  </ul>
	       		</div>	                
	                
	            </div>
	        </div>
	    </div>
	</div>
	<!-- end : content -->
	
	<!-- start : hostFooter -->
    <div>
       <jsp:include page="/partial/systemAdminFooter.jsp"></jsp:include>
    </div>
    <!-- end : hostFooter -->
    
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
		$('#addQnaAnswer').click(function(){
			if($(this).parents(".questionAnswerForm").find('textarea').val() == '') {
				alert('답변을 입력하세요');
				return;
			}

			$(this).parents(".questionAnswerForm").submit();
		});
    </script>
</body>
</html>

