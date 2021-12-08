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

	<!-- start : mainHeader -->
   <div>
      <jsp:include page="/partial/mainHeader.jsp"></jsp:include>
   </div>
   <!-- end : mainHeader -->
   
   <br>
   <br>
   <br>
	<a href="${pageContext.request.contextPath}/noticeList">리스트로</a>
	<h1>공지사항 상세</h1>
	<input type="hidden" name="noticeId" value="${noticeId}" readonly="readonly">
	<table border="1">
		<tr>
			<td>제목 :</td>
			<td>${notice.title}</td>
		</tr>
		<tr>
			<td>내용 :</td>
			<td>${notice.content}</td>
		</tr>
		<tr>
			<td>종류 :</td>
			<td>${notice.kind}</td>
		</tr>
		
	</table>
		<div>
			<a href="${pageContext.request.contextPath}/modifyNotice?noticeId=${notice.noticeId}">수정</a>
			
			<a href="${pageContext.request.contextPath}/deleteNotice?noticeId=${notice.noticeId}">삭제</a>
		</div>
	
	<!-- start : mainFooter -->
   <div>
      <jsp:include page="/partial/mainFooter.jsp"></jsp:include>
   </div>
   <!-- end : mainFooter -->
	
	
</body>
</html>