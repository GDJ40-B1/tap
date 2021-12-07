<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.js"></script> 
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>숙소 등록하기</h1>
	<form action="${pageContext.request.contextPath}/addRoom" method="post">
		<div>
			숙소 카테고리(카테고리 값 받아와서 해야함) : <input type="text" name="roomName">
		</div>
		<div>
			숙소명 : <input type="text" name="roomName">
		</div>
		<div>
			숙소형태(select로 변경) : <input type="text" name="roomForm">
		</div>
		<div>
			숙소 소개 : <input type="text" name="roomIntro">
		</div>
		<div>
			최소숙박일(select로 변경) : <input type="text" name="minDay">
		</div>
		<div>
			체크인시간(select로 변경) : <input type="text" name="checkInTime">
		</div>
		<div>
			체크아웃시간(select로 변경) : <input type="text" name="checkOutTime">
		</div>
		<div>
			인원수(select로 변경) : <input type="text" name="peopleNum">
		</div>
		<div>
			숙박 기본 가격 : <input type="text" name="roomPrice">
		</div>
		<div>
			호스트(임시 설정) : <input type="text" name="hostId" value="1">
		</div>
		
		<h3>주소 입력</h3>
		<div>
			주소 : <input type="text" name="address" id="address" value="경기도 부천시 은성로24번길 8">
			<button type="button" id="searchBtn">검색</button>
			상세 주소 : <input type="text" name="detailAddress2">
		</div>
		<button type="submit">등록</button>
	</form>
	


</body>
</html>