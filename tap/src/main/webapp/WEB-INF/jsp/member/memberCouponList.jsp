<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<meta charset="UTF-8">
<title>attractionList</title>
</head>
<body>
	<!-- start : mainHeader -->
   <div>
      <jsp:include page="/partial/mainHeader.jsp"></jsp:include>
   </div>
   <!-- end : mainHeader -->
   <main id="main">
   <section class="breadcrumbs">
   
   	<h1>나의 보유 쿠폰</h1>
	
	<form action="${pageContext.request.contextPath}/member/memberCouponList" method="get">
		<table border="1">
			<tr>
				<th>보유 쿠폰 ID</th>
				<th>쿠폰 ID</th>
				<th>사용여부</th>
			</tr>
			<c:forEach items="${list }" var="list">
				<tr>
					<td>${list.memberCouponId }</td>
					<td>${list.couponId }</td>
					<td>${list.useStatus}</td>
				</tr>
				</c:forEach>

		</table>
			<div>
			<c:if test="${currentPage > 1}">
				<a href="/tap/attractionList?currentPage=${currentPage-1}">이전</a>
			</c:if>
			<c:if test="${currentPage < lastPage}">
				<a href="/tap/attractionList?currentPage=${currentPage+1}">다음</a>
			</c:if>
		</div>
	</form>
	</section>
	</main>
	
	<!-- start : mainFooter -->
   <div>
      <jsp:include page="/partial/mainFooter.jsp"></jsp:include>
   </div>
   <!-- end : mainFooter -->	
</body>
</html>