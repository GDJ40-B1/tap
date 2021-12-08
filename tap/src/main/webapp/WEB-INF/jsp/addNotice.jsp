<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insertNotice.jsp</title>
</head>
<body>
	<a href="/noticeList">리스트로</a>
	<h1>공지사항 추가</h1>
	<form action="${pageContext.request.contextPath}/addNotice" method="post">
		<div>관리자 id :</div>
		<div><input type="text" name="systemAdminId"></div>
		<div>제목 :</div>
		<div><input type="text" name="title"></div>
		<div>내용 :</div>
		<div><textarea rows="10" cols="20" name="content"></textarea></div>
		<div>종류 :</div>
		<div>
		<select name="kind">
			<option value="Y">Y</option>
			<option value="N">N</option>
		</select>
	</div>
		<div><button type="submit">추가</button></div>
	</form>
</body>
</html>