<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고 내역</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body id="page-top">
	<!-- start : mainHeader -->
    <div>
       <jsp:include page="/partial/systemAdminHeader.jsp"></jsp:include>
    </div>
    <!-- end : mainHeader -->
    
    <main id="main">
	
	<!-- start : content -->
	<div id="content" class="container-fluid">
		<!-- DataTales Example -->
	    <div class="card shadow mb-4">
	        <div class="card-header py-3">
	            <h6 class="m-0 font-weight-bold text-primary">신고 내역</h6>
	        </div>
	        <div class="card-body">
	        	
	        	<!-- ======= Start category  ======= -->
	        	<div class="dropdown">
				  <button type="button" class="btn btn-outline-secondary dropdown-toggle" data-toggle="dropdown">
				    작성자 카테고리
				  </button>
				  <div class="dropdown-menu">
				    <a class="dropdown-item" href="/tap/reportList">전체</a>
				    <a class="dropdown-item" href="/tap/reportList?writerCategory=member">회원</a>
				    <a class="dropdown-item" href="/tap/reportList?writerCategory=host">호스트</a>
				  </div>
				</div><br>
				<!-- End category -->
			    
	            <div class="table-responsive">
	            	<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
					<tr>
						<th>작성자ID</th>
						<th>신고대상</th>
						<th>신고대상 카테고리</th>
						<th>작성자 카테고리</th>
						<th>신고내용</th>
						<th>승인여부</th>
						<th>정보 생성일</th>
						<th>정보 수정일</th>
						<th>삭제</th>
					</tr>
						<c:forEach var="r" items="${list}">
							<tr>
								<td>${r.writerId}</td>
								<td>${r.reportTarget}</td>
								<td>${r.reportTargetCategory}</td>
								<td>${r.writerCategory}</td>
								<td>${r.reportContent}</td>
								<td>
									<form action="${pageContext.request.contextPath}/modifyReport?writerId=${r.writerId}&reportTarget=${r.reportTarget}&reportTargetCategory=${r.reportTargetCategory}" method="post">
										<select class="btn btn-outline-dark" name="approvalStatus">
											<c:choose>
												<c:when test="${r.approvalStatus eq 'Y'}">
													<option value="Y" selected="selected">Y</option>
													<option value="N">N</option>
												</c:when>
												
												<c:when test="${r.approvalStatus eq 'N'}">
													<option value="Y">Y</option>
													<option value="N" selected="selected">N</option>
												</c:when>
											</c:choose>
										</select>
										<button class="btn btn-link" type="submit">수정</button>
									</form>
								</td>
								<td>${r.createDate}</td>
								<td>${r.updateDate}</td>
								<th><a href="${pageContext.request.contextPath}/removeReport?writerId=${r.writerId}&reportTarget=${r.reportTarget}&reportTargetCategory=${r.reportTargetCategory}">삭제</a></th>
							</tr>
						</c:forEach>
					</table>
					<c:if test="${loginUser.userLevel == 'member' || loginUser.userLevel == 'host'}">
			       		<a href="/tap/addReport">신고글 작성</a>
					</c:if>
				</div>
	        </div>
	        <!-- ======= Paging Section ======= -->
		    <section id="pageNumber" class="pageNumber">
		      <div class="container" style="text-align:center">
				<c:if test="${currentPage > 1}">
					<a class="btn btn-secondary" href="/tap/reportList?currentPage=1">처음으로</a>
					<a class="btn btn-secondary" href="/tap/reportList?currentPage=${currentPage-1}&writerCategory=${writerCategory}">이전</a>
				</c:if>
				
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<c:choose>
						<c:when test="${writerCategory eq 'member' || writerCategory eq 'host'}">
							<a class="btn btn-secondary" href="/tap/reportList?currentPage=${i}&writerCategory=${writerCategory}"><c:out value="${i}"/></a>
							
						</c:when>
					
						<c:otherwise>
							<a class="btn btn-secondary" href="/tap/reportList?currentPage=${i}"><c:out value="${i}"/></a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				
				<c:if test="${currentPage < lastPage}">
					<a class="btn btn-secondary" href="/tap/reportList?currentPage=${currentPage+1}&writerCategory=${writerCategory}">다음</a>
					<a class="btn btn-secondary" href="/tap/reportList?currentPage=${lastPage}&writerCategory=${writerCategory}">끝으로</a>
				</c:if>		
		      </div>
		    </section>
		    <!-- End Paging Section -->
	    </div>	
	</div>
    
	</main><!-- End #main -->

  	<!-- start : mainFooter -->
	<div>
      <jsp:include page="/partial/systemAdminFooter.jsp"></jsp:include>
    </div>
 	<!-- end : mainFooter -->
</body>
</html>