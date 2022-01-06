<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호스트 목록</title>
<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');

h6 {
 font-family: 'Noto Sans KR', sans-serif;
}
</style>

<!-- Favicons -->
<link href="${pageContext.request.contextPath}/resources/img/tap_favicon.png" rel="icon">

</head>
<body>
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
	            <h6 class="m-0 font-weight-bold text-primary">호스트 목록</h6>
	        </div>
	        <div class="card-body">
    
    		<!-- ======= Table Section ======= -->
    		<div class="table-responsive">
            	<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
            		<thead>
	            		<tr>
							<th>호스트 아이디</th>
							<th>호스트 이름</th>
							<th>호스트 나이</th>
							<th>호스트 전화번호</th>
							<th>사업자 번호</th>
							<th>호스트 포인트</th>
							<th>정보 생성일</th>
							<th>정보 수정일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="h" items="${list}">
							<tr>
								<td>${h.hostId}</td>
								<td>${h.hostName}</td>
								<td>${h.hostAge}</td>
								<td>${h.hostPhone}</td>
								<td>${h.businessNumber}</td>
								<td>${h.hostPoint}</td>
								<td>${h.createDate}</td>
								<td>${h.updateDate}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>	
			
    		</div>
	    </div>	
	</div>

  	<!-- start : systemAdminFooter -->
	<div>
      <jsp:include page="/partial/systemAdminFooter.jsp"></jsp:include>
    </div>
 	<!-- end : systemAdminFooter -->
</body>
</html>