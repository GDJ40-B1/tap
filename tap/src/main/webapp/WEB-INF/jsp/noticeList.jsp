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
		<a href="${pageContext.request.contextPath}">공지사항 추가</a>
	<table border="1">
		<tr>
			<th>No</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
		</tr>
		<c:forEach items="${noticelist}" var="notice" >
			<tr>
				<td>${notice.noticeId}</td>
				<td>${notice.title}</td>
				<td>${notice.content}</td>
				<td>${notice.updateDate}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>