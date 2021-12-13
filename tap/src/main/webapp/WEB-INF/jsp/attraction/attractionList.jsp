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
	
	<form action="${pageContext.request.contextPath}/attractionList" method="post">
		<table border="1">
			<tr>
				<td>명소 카테고리</td>
				<td id="attractionCategory">${ attraction.attractionCategory}</td>
			</tr>
			<tr>
				<td>명소 이름</td>
				<td id="attractionName">${attraction.attractionName }</td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td id="attractionPhoneNumber">${attraction.attractionPhoneNumber }</td>
			</tr>

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