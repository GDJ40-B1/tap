<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<meta charset="UTF-8">
<title>명소 목록</title>

</head>
<body>
	<!-- start : mainHeader -->
   <div>
      <jsp:include page="/partial/mainHeader.jsp"></jsp:include>
   </div>
   <!-- end : mainHeader -->
   <main id="main">
   <section class="breadcrumbs">
	<div class="container">
		<div class="d-flex justify-content-between align-items-center">   
    		<h1>명소</h1>  
    	</div>
   </div>
	<div class="container">
	<form action="${pageContext.request.contextPath}/attractionList" method="post">
		 <table style=" width:100%; height: 100px; margin: auto; text-align: center;"class="table table-hover">
			<tr class="table-primary">
				<th>카테고리</th>
				<th>이름</th>
				<th>전화번호</th>
			</tr>
			<c:forEach items="${list }" var="list">
				<tr>
					<td>${list.attractionCategory }</td>
					<td><a href="${pageContext.request.contextPath}/attractionOne?attractionId=${list.attractionId}&detailAddressId=${list.detailAddressId}">${list.attractionName }</a></td>
					<td>${list.attractionPhoneNumber }</td>
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
		<div class="btn btn-outline-primary" style="margin:20px;">
			<a href="${pageContext.request.contextPath}/member/addAttraction">명소 등록</a>
		</div>
	</div>
	</section>
	</main>
	
	<!-- start : mainFooter -->
   <div>
      <jsp:include page="/partial/mainFooter.jsp"></jsp:include>
   </div>
   <!-- end : mainFooter -->	
</body>
</html>