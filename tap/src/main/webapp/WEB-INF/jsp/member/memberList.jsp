<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록</title>
</head>
<body>
	<!-- start : mainHeader -->
    <div>
       <jsp:include page="/partial/systemAdminHeader.jsp"></jsp:include>
    </div>
    <!-- end : mainHeader -->

    <!-- start : content -->
	<div id="content" class="container-fluid">
		<!-- DataTales Example -->
	    <div class="card shadow mb-4">
	        <div class="card-header py-3">
	            <h6 class="m-0 font-weight-bold text-primary">회원 목록</h6>
	        </div>
	        <div class="card-body">
	        
	        <div class="table-responsive">
	            	<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
					<tr>
						<th>회원 아이디</th>
						<th>회원 이름</th>
						<th>회원 나이</th>
						<th>회원 전화번호</th>
						<th>회원 포인트</th>
						<th>정보 생성일</th>
						<th>정보 수정일</th>
					</tr>
					<c:forEach var="m" items="${list}">
						<tr>
							<td>${m.memberId}</td>
							<td>${m.memberName}</td>
							<td>${m.memberAge}</td>
							<td>${m.memberPhone}</td>
							<td>${m.memberPoint}</td>
							<td>${m.createDate}</td>
							<td>${m.updateDate}</td>
						</tr>
					</c:forEach>
					</table>
				</div>
	        </div>
	        <!-- ======= Paging Section ======= -->
		    <section id="pageNumber" class="pageNumber">
		      <div class="container" style="text-align:center"> 
				<c:if test="${currentPage > 1}">
					<a class="btn btn-secondary" href="${pageContext.request.contextPath}/systemAdmin/memberList?currentPage=1">처음으로</a>
					<a class="btn btn-secondary" href="${pageContext.request.contextPath}/systemAdmin/memberList?currentPage=${currentPage-1}">이전</a>
				</c:if>
				
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<a class="btn btn-secondary" href="${pageContext.request.contextPath}/systemAdmin/memberList?currentPage=${i}"><c:out value="${i}"/></a>
				</c:forEach>
				
				<c:if test="${currentPage < lastPage}">
					<a class="btn btn-secondary" href="${pageContext.request.contextPath}/systemAdmin/memberList?currentPage=${currentPage+1}">다음</a>
					<a class="btn btn-secondary" href="${pageContext.request.contextPath}/systemAdmin/memberList?currentPage=${lastPage}">끝으로</a>
				</c:if>		
		      </div>
		    </section>
		    <!-- End Paging Section -->
	    </div>	
	</div>
    
  	<!-- start : mainFooter -->
	<div>
      <jsp:include page="/partial/systemAdminFooter.jsp"></jsp:include>
    </div>
 	<!-- end : mainFooter -->
</body>
</html>