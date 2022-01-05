<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
	<title>공지사항 관리</title>
	
	<!-- Favicons -->
	<link href="${pageContext.request.contextPath}/resources/img/tap_favicon.png" rel="icon">
	
	<script src="http://code.jquery.com/jquery-latest.js"></script> 
</head>
<body id="page-top">

    <!-- start : systemAdminHeader -->
    <div>
    	<jsp:include page="/partial/systemAdminHeader.jsp"></jsp:include>
    </div>
    <!-- end : systemAdminHeader -->
    
    <!-- start : content -->
	<div id="content" class="container-fluid">
		<!-- DataTales Example -->
	    <div class="card shadow mb-4">
	        <div class="card-header py-3">
	        	<div class="d-flex justify-content-between align-items-center">
					<h6 class="m-0 font-weight-bold text-primary">
		           		<span>공지사항(총 : ${totalNoticeCount}개)</span>
		           	</h6>
		           	<ol style="list-style: none;">
						<li>
							<a class="btn btn-danger" href="${pageContext.request.contextPath}/systemAdmin/addNotice">공지사항 작성</a>
						</li>
					</ol>
	           	</div>
	        </div>
	        <div class="card-body">
	            <div class="table-responsive">
	                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
	                    <thead>
	                    	<tr>
	                    		<th>No.</th>
	                    		<th>제목</th>
	                    		<th>작성자 아이디</th>
	                    		<th>공지 작성일</th>
	                    		<th>공지 수정일</th>
	                    	</tr>
	                    </thead>
	                    <tbody>
	                    	<c:forEach var="n" items="${noticeList.list}">
	                    		<tr>
	                    			<td>${n.noticeId}</td>
	                    			<td><a href="#notice" onclick="result(this)" style="text-overflow: ellipsis;">${n.title}</a></td>
	                    			<td>${n.systemAdminId}</td>
	                    			<td>${n.createDate}</td>
	                    			<td>${n.updateDate}</td>
	                    		</tr>
	                    		<tr class="notice" style="display: none;">
	                    			<td colspan="5">
	                    				<form action="${pageContext.request.contextPath}/systemAdmin/modifyNotice" method="post">
		                    				<input type="hidden" name="noticeId" value="${n.noticeId}">
		                    				<div>[제목]</div>
		                    				<div><input type="text" name="title" value="${n.title}"></div><br>
		                    				
		                    				<div>[내용]</div>
		                    				<div><textarea rows="5" cols="50" name="content">${n.content}</textarea></div>
		                    				
		                    				<div>
		                    					<button type="submit">수정</button>
		                    					<a href="${pageContext.request.contextPath}/systemAdmin/removeNotice?noticeId=${n.noticeId}">삭제</a>
		                    				</div>	                    		
	                    				</form>
	                    			</td>
	                    		</tr>
	                    	</c:forEach>
	                    </tbody>
	                </table>
	            </div>
	        </div>
	        <!-- ======= Paging Section ======= -->
		    <section id="pageNumber" class="pageNumber">
		      <div class="container" style="text-align:center"> 
				<c:if test="${currentPage > 1}">
					<a href="${pageContext.request.contextPath}/systemAdmin/noticeList?currentPage=1">처음으로</a>
					<a href="${pageContext.request.contextPath}/systemAdmin/noticeList?currentPage=${currentPage-1}">이전</a>
				</c:if>
				
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<a href="${pageContext.request.contextPath}/systemAdmin/noticeList?currentPage=${i}"><c:out value="${i}"/></a>
				</c:forEach>
				
				<c:if test="${currentPage < lastPage}">
					<a href="${pageContext.request.contextPath}/systemAdmin/noticeList?currentPage=${currentPage+1}">다음</a>
					<a href="${pageContext.request.contextPath}/systemAdmin/noticeList?currentPage=${lastPage}">끝으로</a>
				</c:if>		
		      </div>
		    </section>
		    <!-- End Paging Section -->
	    </div>
	</div>
	<!-- end : content -->
	
	<script>
		function result(content) {
			var currentRow = $(content).closest('tr');
			var detail = currentRow.next('tr');
			var etc = $('.notice').not(content);
			
			if(detail.is(":visible")){
				detail.hide();
			} else {
				etc.hide();
				detail.show();
			}
		}
	</script>
	
	<!-- start : systemAdminFooter -->
    <div>
       <jsp:include page="/partial/systemAdminFooter.jsp"></jsp:include>
    </div>
    <!-- end : systemAdminFooter -->
</body>
</html>

