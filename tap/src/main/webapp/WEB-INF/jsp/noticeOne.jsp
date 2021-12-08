<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>noticeOne.jsp</title>
</head>
<body>
	<a href="/noticeList">리스트로</a>
	<h1>공지사항 상세</h1>
	<table border="1">
		<tr>
			<td>제목 :</td>
		</tr>
		<tr>
			<td>${notice.noticeTitle}</td>
		</tr>
		<tr>
			<td>내용</td>
		</tr>
		<tr>
			<td>${notice.noticeContent}</td>
		</tr>
		<tr>
			<td>종류</td>
		</tr>
		<tr>
			<td>${notice.noticeKind}</td>
		</tr>
	</table>
	
	
	
	
	
</body>
</html>