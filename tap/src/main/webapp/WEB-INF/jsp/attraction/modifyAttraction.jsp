<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modifyAttraction</title>
</head>
<body>
	<!-- start : mainHeader -->
   <div>
      <jsp:include page="/partial/mainHeader.jsp"></jsp:include>
   </div>
   <!-- end : mainHeader -->
   <main id="main">
   <section class="breadcrumbs">
   
	<h1>명소 수정</h1>
	<form action="${pageContext.request.contextPath}/modifyAttraction" method="post">
		<table border="1">
			<tr>
				<td>승인여부</td>
				<td>
					<select name="approvalStatus">
						<option value='Y'>Y</option>
						<option value='N'>N</option>
					</select>
				</td>
			</tr>
			
			<tr>
				<!-- 명소 이름 -->
				<td>명소 이름</td>
				<td><input type="text" name="attractionName"></td>
			</tr>
			
			<tr>
				<!-- 카테고리 -->
				<td>명소 카테고리</td>
				<td>
					<select name="attractionCategory">
						<c:forEach items="${attractionCategoryList}" var="ac">
							<option>${ac }</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<!-- 전화번호 형태? 예쁘게 만들기+숫자만 들어가게끔 하기 -->
				<td>전화번호</td>
				<td><input type="text" name="attractionPoneNumber"></td>
			</tr>
			<tr>
				<!-- 명소 소개 -->
				<td>명소 소개</td>
				<td><textarea name="attractionContent"></textarea></td>
			</tr>
			<tr>
				<!-- 주소 -->
				<td>주소</td>
				<td><input type="text" name="detailAddress" id="address"></td>
				<!-- 구현하기 -->				
			</tr>
		</table>
	
	
	</form>
	</section>
	</main>
	
	<!-- start : mainFooter -->
   <div>
      <jsp:include page="/partial/mainFooter.jsp"></jsp:include>
   </div>
   <!-- end : mainFooter -->
   
   </body>
</html>