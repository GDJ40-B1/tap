<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.js"></script> 
<meta charset="UTF-8">
<title>addSelectedAttraction</title>
</head>
<body>
	<!-- start : mainHeader -->
   <div>
      <jsp:include page="/partial/mainHeader.jsp"></jsp:include>
   </div>
   <!-- end : mainHeader -->
   <main id="main">
   <section class="breadcrumbs">
  
   	<h1>명소 등록</h1>
	<form action="${pageContext.request.contextPath}/addSelectedAttraction" method="post">
		
		<div>
			<label>명소 선택</label>
			<div>
				<a href="${pageContext.request.contextPath}/addAttractionList"></a>
			</div>
		</div>
		
		<!-- 나중에 더 예쁘게.. 해보자.. -->
		<div>
			<label>날짜</label>
			<div>
				<input type="text" name="date">				
			</div>
		</div>
		
		<div>
			<label>시간</label>
			<div>
				<input type="text" name="time">				
			</div>
		</div>
		
			<br>
			<button type="submit" id="addBtn"> 선택하기</button>
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