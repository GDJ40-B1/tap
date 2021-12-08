<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modifyNotice.jsp</title>
</head>
<body>

	<!-- start : mainHeader -->
   <div>
      <jsp:include page="/partial/mainHeader.jsp"></jsp:include>
   </div>
   <!-- end : mainHeader -->
   <br>
   <br>
   <br>
    
	<a href="${pageContext.request.contextPath}/noticeList">리스트로</a>
	<h1>수정하기</h1>
	<form action="${pageContext.request.contextPath}/modifyNotice?noticeId=${notice.noticeId}" method="post">
	
		<div>제목 :</div>
		<div><input type="text" name="title" value="${notice.title}"></div>
		<div>내용 :</div>
		<div><textarea rows="10" cols="20" name="content">${notice.content}</textarea></div>
		<div>종류 :</div>
		<div>
		<select name="kind" value="${kind}">
			<option value="Y">Y</option>
			<option value="N">N</option>
		</select>
		</div>
		<div><button type="submit">수정</button></div>
	</form>
	<!-- start : mainFooter -->
   <div>
      <jsp:include page="/partial/mainFooter.jsp"></jsp:include>
   </div>
   <!-- end : mainFooter -->
</body>
</html>