<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.js"></script> 
<meta charset="UTF-8">
<title>addSelectedAttractionList</title>
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
	
	<form action="${pageContext.request.contextPath}/addSelectedAttractionList" method="post">
		<table border="1">
			<tr>
				<th>명소 카테고리</th>
				<th>명소 이름</th>
				<th>전화번호</th>
				<th>선택하기</th>
			</tr>
			<c:forEach items="${list }" var="list">
				<tr>
					<td>${list.attractionCategory }</td>
					<td><a href="${pageContext.request.contextPath}/addSelectedattractionOne?attractionId=${list.attractionId}&detailAddressId=${list.detailAddressId}">${list.attractionName }</a></td>
					<td>${list.attractionPhoneNumber }</td>
					<td><a href="${pageContext.request.contextPath}/addselectedAttraction?attractionId=${list.attractionId}/">선택</a></td>
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