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
	<h1>공지사항</h1>
		
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
				<td>${notice.title}</td>
				<td>${notice.content}</td>
				<td>${notice.updateDate}</td>
			</tr>
		</c:forEach>
	</table>
	<div>
		<c:if test="${currentPage > 1}">
			<a href="/noticeList?currentPage=${currentPage-1}">이전</a>
		</c:if>
			<c:if test="${currentPage < lastPage}">
			<a href="/noticeList?currentPage=${currentPage-1}">다음</a>
		</c:if>
	</div>
	<div>
		<form action="addNotice" method="get">
			<button type="submit">게시글 추가</button>
		</form>
	</div>
</body>
</html>