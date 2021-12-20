<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- start : mainHeader -->
    <div>
       <jsp:include page="/partial/mainHeader.jsp"></jsp:include>
    </div>
    <!-- end : mainHeader -->
    
    <main id="main"> 
	
	 <!-- ======= Breadcrumbs ======= -->
    <section id="breadcrumbs" class="breadcrumbs">
    	<div class="container">
    		<div class="d-flex justify-content-between align-items-center">
          	<h2>숙소후기 작성</h2>
         	 	<ol>
          			<li>
						<div>
							<a href="${pageContext.request.contextPath}/roomReviewList">숙소후기 목록</a>
						</div>
          			</li>
          		</ol>
        	</div><br>
        	
			<form action="${pageContext.request.contextPath}/addRoomReview" method="post">
				<div>
					결제 ID : 
					<input type="text" name="paymentId">
				</div>
				<div>
					<input type="hidden" name="answerStatus" value="N"> 
				</div>
				<div>
					숙소후기 내용 :<br> 
					<textarea rows="5" cols="50" name="roomReviewContent"></textarea>
				</div>
				<div>
					숙소후기 평점 :<br> 
					<select name="roomReviewScore">
						<option value="1">★☆☆☆☆</option>
						<option value="2">★★☆☆☆</option>
						<option value="3">★★★☆☆</option>
						<option value="4">★★★★☆</option>
						<option value="5">★★★★★</option>
					</select>
				</div>
				<div>
					<br>
					<button type="submit">작성</button>
				</div>
			</form>	
		</div>
	</section>
	
	</main>
	
	<!-- start : mainFooter -->
    <div>
       <jsp:include page="/partial/mainFooter.jsp"></jsp:include>
    </div>
    <!-- end : mainFooter -->
</body>
</html>