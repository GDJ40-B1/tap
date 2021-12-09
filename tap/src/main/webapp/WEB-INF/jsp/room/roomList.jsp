<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- start : mainHeader -->
   <div>
      <jsp:include page="/partial/mainHeader.jsp"></jsp:include>
   </div>
   <!-- end : mainHeader -->
   
   <main id="main">
   		<section class="breadcrumbs">
			<table border="1">
				<tr>
					<td>숙소명</td>
					<td>카테고리</td>
					<td>가격</td>
					<td>체크인 시간</td>
					<td>체크아웃 시간</td>
				</tr>
				<c:forEach items="${roomList }" var="list">
					<tr>
						<td><a href="${pageContext.request.contextPath}/roomOne?roomId=${list.roomId}&detailAddressId=${list.detailAddressId }">${list.roomName }</a></td>
						<td>${list.roomCategory }</td>
						<td>${list.roomPrice }</td>
						<td>${list.checkInTime }</td>
						<td>${list.checkOutTime }</td>
					</tr>
				</c:forEach>
			</table>
		</section>
	</main>
	
	<!-- start : mainFooter -->
   <div>
      <jsp:include page="/partial/mainFooter.jsp"></jsp:include>
   </div>
   <!-- end : mainFooter -->
</body>
</html>

