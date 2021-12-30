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
   
   	<h1>명소List</h1>
	
	<form action="${pageContext.request.contextPath}/selectedAttractionList" method="post">
		<table border="1">
			<tr>
				<th>숙소 예약 번호</th>
				<th>명소 이름</th>
				<th>날짜</th>
				<th>시간</th>
				<th>수정하기</th>
				<th>삭제하기</th>
			</tr>
			<c:forEach items="${list }" var="list">
				<tr>
					<td>${list.reservationId }</td>
					<td><a href="${pageContext.request.contextPath}/attractionOne?attractionId=${list.attractionId}&detailAddressId=${list.detailAddressId}">${list.attractionName }</a></td>
					<td>${list.date }</td>
					<td>${list.time }</td>
					<td><a href="${pageContext.request.contextPath}/modifySelectedAttraction?selectedAttractionId=${list.selectedAttractionId }"></a>수정하기</td>
					<td><a href="${pageContext.request.contextPath}/removeSelectedAttraction?selectedAttractionId=${list.selectedAttractionId }"></a>삭제하기</td>
				</tr>
				</c:forEach>

		</table>
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