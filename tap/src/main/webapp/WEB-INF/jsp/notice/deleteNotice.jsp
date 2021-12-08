<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>deleteNotice.jsp</title>
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
   <br>
   <div><a href="${pageContext.request.contextPath}/noticeList">리스트로</a></div>
	<h1>공지사항 삭제</h1>
	<div><h5>${notice.noticeId}번 공지사항을 삭제하시겠습니까?</h5></div>
	<form action="${pageContext.request.contextPath}/deleteNotice?noticeId=${notice.noticeId}" method="post">
		<div>
			<input type="hidden" name="noticeId" value="${notice.noticeId}" readonly="readonly">
		</div>
		<div>제목 :</div>
		<div><input type="text" name="title" value="${notice.title}" readonly="readonly"></div>
		<div>내용 :</div>
		<div><textarea rows="10" cols="20" name="content" readonly="readonly">${notice.content}</textarea></div>
		<div>종류 :</div>
		<div>
		<select name="kind" value="${notice.kind}" disabled="disabled">
			<option value="Y" >Y</option>
			<option value="N" >N</option>
		</select>
		</div>
		
		<div><button type="submit">삭제하기</button></div>
		
	</form>
		
	<!-- start : mainFooter -->
   <div>
      <jsp:include page="/partial/mainFooter.jsp"></jsp:include>
   </div>
   <!-- end : mainFooter -->
</body>
</html>