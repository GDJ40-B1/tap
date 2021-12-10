<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
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
				<c:forEach items="${result.roomList }" var="list">
					<tr>
						<td><a href="${pageContext.request.contextPath}/roomOne?roomId=${list.roomId}&detailAddressId=${list.detailAddressId }">${list.roomName }</a></td>
						<td>${list.roomCategory }</td>
						<td>${list.roomPrice }</td>
						<td>${list.checkInTime }</td>
						<td>${list.checkOutTime }</td>
					</tr>
				</c:forEach>
			</table>
			
			<!-- 페이징 -->
   			<ul>
			    <c:if test="${result.currentPage!=1}">
				    <li><a href="${pageContext.request.contextPath}/roomList?currentPage=<%=1 %>">처음</a></li>
				</c:if>
				
				<c:if test="${result.currentnumPage>0}">
				    <li><a href="${pageContext.request.contextPath}/roomList?currentPage=${result.pagePerPage*(result.currentnumPage-1)+1 }">이전</a></li>
				</c:if>
				
				<c:forEach begin="0" end="${result.pagePerPage-1}" step="1" var="i">
					<c:if test="${result.lastPage>=(result.pagePerPage*result.currentnumPage)+i+1}">
					    <li><a href="${pageContext.request.contextPath}/roomList?currentPage=${(result.pagePerPage*result.currentnumPage)+i+1 }">${(result.pagePerPage*result.currentnumPage)+i+1 }</a></li>
					</c:if>
				</c:forEach>
				    
				<c:if test="${result.lastnumPage>result.currentnumPage}">
				    <li><a href="${pageContext.request.contextPath}/roomList?currentPage=${result.pagePerPage*(result.currentnumPage+1)+1 }">다음</a></li>
				</c:if>
				
				<c:if test="${result.currentPage!=result.lastPage && result.lastPage!=0}">
				    <li><a href="${pageContext.request.contextPath}/roomList?currentPage=${result.lastPage }">맨끝</a></li>
				</c:if>
			</ul>
		</section>
	</main>
	
	<!-- start : mainFooter -->
   <div>
      <jsp:include page="/partial/mainFooter.jsp"></jsp:include>
   </div>
   <!-- end : mainFooter -->
</body>
</html>
