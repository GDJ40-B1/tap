<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>deleteNotice.jsp</title>
</head>
<body>
	<h1>공지사항 삭제</h1>
	<form action="/deleteNotice" method="post">
		<div>
			<input type="hidden" name="noticeId" value="${noticeId}" readonly="readonly">
		</div>
		<div>${notice.noticeId}번 공지사항을 삭제하시겠습니까?</div>
		<div><button type="submit">삭제하기</button></div>
		<div><a href="${pageContext.request.contextPath}/noticeList">공지사항 목록</a></div>
	</form>
</body>
</html>