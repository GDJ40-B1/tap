<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>noticeList.jsp</title>
</head>
<body>
 
	<div>
      <jsp:include page="/partial/mainHeader.jsp"></jsp:include>
   </div>
   <!-- end : mainHeader -->
   <br>
   <br>
   <br>
   <br>
   
	<h1>공지사항</h1>
	<br>
	
	<h5>
		KIND : ${kind}
	</h5>
	
	<form method="get" action="${pageContext.request.contextPath}/noticeList">
		<div>
			<select name="kind">
				<option value="">전체</option>
				<option value="Y">Y</option>
				<option value="N">N</option>
			</select>
			<button type="submit">검색</button>
		</div>
	</form>
	<table border="1">
		<tr>
			<th>No</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
		</tr>
		<c:forEach items="${noticeList}" var="notice" >
			<tr>
				<td>${notice.noticeId}</td>
				<td><a href="${pageContext.request.contextPath}/noticeOne?noticeId=${notice.noticeId}">${notice.title}</a></td>
				<td>${notice.systemAdminId}</td>
				<td>${notice.createDate}</td>
			</tr>
		</c:forEach>
	</table>
	
	<div>
		<c:if test="${currentPage!=1}">
			<a href="${pageContext.request.contextPath}/noticeList?currentNum=1&kind=${kind}">처음</a>
		</c:if>
		<c:if test="${startPage > displayPage}">
			<a href="${pageContext.request.contextPath}/noticeList?currentNum=${startPage-displayPage}&kind=${kind}">이전</a>
		</c:if>
		<c:set var="loop_flag" value="true" />
		<c:if test="${endPage<lastPage || endPage==lastPage}">
			<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
				<a href="${pageContext.request.contextPath}/noticeList?currentNum=${i}&kind=${kind}">${i}</a>
			</c:forEach>
		</c:if>
		<c:if test="${endPage>lastPage}">
			<c:forEach var="i" begin="${startPage}" end="${lastPage}" step="1">
				<a href="${pageContext.request.contextPath}/noticeList?currentNum=${i}&kind=${kind}">${i}</a>
			</c:forEach>
		</c:if>
		<c:if test="${endPage < lastPage}">
			<a href="${pageContext.request.contextPath}/noticeList?currentNum=${startPage+displayPage}&kind=${kind}">다음</a>
		</c:if>
		<c:if test="${currentPage != lastPage && endPage != 0}">
			<a href="${pageContext.request.contextPath}/noticeList?currentNum=${lastPage}&kind=${kind}">끝</a>
		</c:if>
	</div>
	
	<div>
		<form action="${pageContext.request.contextPath}/addNotice" method="get">
			<button type="submit">공지사항 추가</button>
		</form>
	</div>
	<!-- start : mainFooter -->
   <div>
      <jsp:include page="/partial/mainFooter.jsp"></jsp:include>
   </div>
   <!-- end : mainFooter -->
</body>
</html>