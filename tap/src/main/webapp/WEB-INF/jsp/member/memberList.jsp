<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록</title>
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
	            <h6 class="m-0 font-weight-bold text-primary">회원 목록</h6>
	        </div>
	        <div class="card-body">
	        
	        <div class="table-responsive">
            	<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
	            	<thead>
						<tr>
							<th>회원 아이디</th>
							<th>회원 이름</th>
							<th>회원 나이</th>
							<th>회원 전화번호</th>
							<th>회원 포인트</th>
							<th>정보 생성일</th>
							<th>정보 수정일</th>
						</tr>
					</thead>
					<tbody>
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