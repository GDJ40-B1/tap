<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.js"></script> 
<meta charset="UTF-8">
<title>modifySelectedAttraction</title>
</head>
<body>
	<!-- start : mainHeader -->
   <div>
      <jsp:include page="/partial/mainHeader.jsp"></jsp:include>
   </div>
   <!-- end : mainHeader -->
   <main id="main">
   <section class="breadcrumbs">
   
	<h1>계획 수정하기</h1>
	<form action="${pageContext.request.contextPath}/modifySelectedAttraction" method="post">
		<!-- 전달 -->
		<input type="hidden" name="selectedAttractionId" value="${selectedAttraction.selectedAttractionId}">
		
		<div>
			<label>선택한 명소</label>
			<input type="text" name="attractionName" value="${attraction.attractionName}">
		</div>
				
		<div>
			<label>날짜</label>
			<input type="text" name="date" value="${selectedAttraction.date}">
		</div>
		
		<div>
			<label>시간</label>
			<input type="text" name="time" value="${selectedAttraction.time}">
		</div>
						
			<br>
		
	<button type="submit" id="modifyBtn">수정하기</button>
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