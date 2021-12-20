<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
          	<h2>숙소 후기</h2>
          		<ol>
          			<li>
						<div>
							<a href="${pageContext.request.contextPath}/addRoomReview">숙소후기 작성</a>
						</div>
          			</li>
          		</ol>
        	</div>
        		
		<c:forEach var="r" items="${list}">
		<div><br>
			<form id="removeForm" action="${pageContext.request.contextPath}/removeRoomReview?roomReviewId=${r.roomReviewId}" method="post">
				숙소후기 ID : 
				${r.roomReviewId} &emsp;
				<button id="removeBtn" type="button">삭제</button>			
			</form>
		</div>
		<div>
			숙소후기 평점 : 
			${r.roomReviewScore}
		</div>
		<div>
			숙소후기 내용 :
			${r.roomReviewContent}
		</div>
		<div>
			----------------------------------
		</div>
		</c:forEach>

		<!-- ======= Paging Section ======= -->
		<c:if test="${currentPage > 1}">
			<a href="/tap/roomReviewList?currentPage=1">처음으로</a>
			<a href="/tap/roomReviewList?currentPage=${currentPage-1}">이전</a>
		</c:if>
		
		<c:forEach var="i" begin="${startPage}" end="${endPage}">
			<a href="/tap/roomReviewList?currentPage=${i}"><c:out value="${i}"/></a>
		</c:forEach>
		
		<c:if test="${currentPage < lastPage}">
			<a href="/tap/roomReviewList?currentPage=${currentPage+1}">다음</a>
			<a href="/tap/roomReviewList?currentPage=${lastPage}">끝으로</a>
		</c:if>		
		<!-- End Paging Section -->
		
		</div>
	</section>
	
	</main>
	
	<!-- start : mainFooter -->
    <div>
       <jsp:include page="/partial/mainFooter.jsp"></jsp:include>
    </div>
    <!-- end : mainFooter -->
    
    <script>
	$('#removeBtn').click(function(){
		if(confirm('후기를 삭제하시면 다시 작성할 수 없습니다. 그래도 삭제하시겠습니까?') == true) { // 확인
			$('#removeForm').submit();
		} else { // 취소
			return;
		}
	});	
	</script>	
</body>
</html>