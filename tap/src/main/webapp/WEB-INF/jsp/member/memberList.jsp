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
    
    <main id="main">

    <!-- ======= Breadcrumbs ======= -->
    <section id="breadcrumbs" class="breadcrumbs">
      <div class="container">
        <div class="d-flex justify-content-between align-items-center">
          <h2>회원 목록</h2>
        </div>
      </div>
    </section><!-- End Breadcrumbs -->
    
    <!-- ======= Table Section ======= -->
    <section id="list" class="list">
      <div class="container">
		
		<table border="1" style="text-align: center">
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
    </section><!-- End Table Section -->

    <!-- ======= Paging Section ======= -->
    <section id="pageNumber" class="pageNumber">
      <div class="container">
      
		<c:if test="${currentPage > 1}">
			<a href="${pageContext.request.contextPath}/systemAdmin/memberList?currentPage=1">처음으로</a>
			<a href="${pageContext.request.contextPath}/systemAdmin/memberList?currentPage=${currentPage-1}">이전</a>
		</c:if>
		
		<c:forEach var="i" begin="${startPage}" end="${endPage}">
			<a href="${pageContext.request.contextPath}/systemAdmin/memberList?currentPage=${i}"><c:out value="${i}"/></a>
		</c:forEach>
		
		<c:if test="${currentPage < lastPage}">
			<a href="${pageContext.request.contextPath}/systemAdmin/memberList?currentPage=${currentPage+1}">다음</a>
			<a href="${pageContext.request.contextPath}/systemAdmin/memberList?currentPage=${lastPage}">끝으로</a>
		</c:if>		
		
      </div>
    </section><!-- End Paging Section -->
    
    </main><!-- End #main -->

  	<!-- start : mainFooter -->
	<div>
      <jsp:include page="/partial/systemAdminFooter.jsp"></jsp:include>
    </div>
 	<!-- end : mainFooter -->
</body>
</html>