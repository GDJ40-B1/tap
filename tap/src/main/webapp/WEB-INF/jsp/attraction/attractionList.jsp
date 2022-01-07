<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<meta charset="UTF-8">
<title>명소</title>

<!-- Favicons -->
<link href="${pageContext.request.contextPath}/resources/img/tap_favicon.png" rel="icon">
	
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
    		<h2>명소</h2>
    		<ol>
            	<li><a href="${pageContext.request.contextPath}/">홈</a></li>
            	<li>명소 목록</li>
          	</ol>
    	</div>
   	</div>
   </section>
   
   <section id="list" class="list">	
	<div class="container">
	
		<c:choose>
			<c:when test="${empty list}">
				<div class="section-title" style="margin-top:50px;">
					<h2>현재 등록된 명소가 없습니다.</h2>
				</div>	
			</c:when>	
			
			<c:otherwise>
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
					
					<div class="btn btn-outline-primary" style="float:right; margin:20px;">
						<a href="${pageContext.request.contextPath}/member/addAttraction">명소 등록</a>
					</div>
					
					<nav>
			   			<ul class="pagination" style="margin-top:10px; justify-content: center;">
							<li>
								<c:if test="${currentPage > 1}">
									<div class="btn-group me-2" role="group" aria-label="First group" style="justify-content: center;">
										<a class="btn btn-primary" href="/tap/attractionList?currentPage=${currentPage-1}">이전</a>
									</div>
								</c:if>
								<c:if test="${currentPage < lastPage}">
									<div class="btn-group me-2" role="group" aria-label="First group" style="justify-content: center;">
										<a class="btn btn-primary" href="/tap/attractionList?currentPage=${currentPage+1}">다음</a>
									</div>
								</c:if>
							</li>
						</ul>
					</nav>
				</form>
			</c:otherwise>
		</c:choose>
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