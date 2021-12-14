<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고 내역</title>
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
          <h2>신고 내역</h2>
          <ol>
            <li><a href="/tap/index">Home</a></li>
            <li>신고 내역</li>
          </ol>
        </div>
      </div>
    </section><!-- End Breadcrumbs -->
    
    <!-- ======= category Section ======= -->
    <section id="pageNumber" class="pageNumber">
      <div class="container">
      	<a href="/tap/reportList">전체</a>
		<a href="/tap/reportList?writerCategory=member">회원</a>
		<a href="/tap/reportList?writerCategory=host">호스트</a>	
      </div>
    </section><!-- End category Section -->
    
    <!-- ======= Table Section ======= -->
    <section id="list" class="list">
      <div class="container">
		
		<table border="1">
			<tr>
				<th>작성자ID</th>
				<th>신고대상</th>
				<th>신고대상 카테고리</th>
				<th>작성자 카테고리</th>
				<th>신고내용</th>
				<th>승인여부</th>
				<th>정보 생성일</th>
				<th>정보 수정일</th>
				<th>삭제</th>
			</tr>
			<c:forEach var="r" items="${list}">
				<tr>
					<td>${r.writerId}</td>
					<td>${r.reportTarget}</td>
					<td>${r.reportTargetCategory}</td>
					<td>${r.writerCategory}</td>
					<td>${r.reportContent}</td>
					<td>${r.approvalStatus}</td>
					<td>${r.createDate}</td>
					<td>${r.updateDate}</td>
					<th><a href="${pageContext.request.contextPath}/removeReport?writerId=${r.writerId}&reportTarget=${r.reportTarget}&reportTargetCategory=${r.reportTargetCategory}">삭제</a></th>
				</tr>
			</c:forEach>
		</table>
		
		<c:if test="${loginUser.userLevel == 'member' || loginUser.userLevel == 'host'}">
       		<a href="/tap/addReport">신고글 작성</a>
		</c:if>
      </div>
    </section><!-- End Table Section -->
    
    <!-- ======= Paging Section ======= -->
    <section id="pageNumber" class="pageNumber">
      <div class="container">
      
		<c:if test="${currentPage > 1}">
			<a href="/tap/reportList?currentPage=1&writerCategory=${writerCategory}">처음으로</a>
			<a href="/tap/reportList?currentPage=${currentPage-1}&writerCategory=${writerCategory}">이전</a>
		</c:if>
		
		<c:forEach var="i" begin="${startPage}" end="${endPage}">
			<a href="/tap/reportList?currentPage=${i}&writerCategory=${writerCategory}"><c:out value="${i}"/></a>
		</c:forEach>
		
		<c:if test="${currentPage < lastPage}">
			<a href="/tap/reportList?currentPage=${currentPage+1}&writerCategory=${writerCategory}">다음</a>
			<a href="/tap/reportList?currentPage=${lastPage}&writerCategory=${writerCategory}">끝으로</a>
		</c:if>		
		
      </div>
    </section><!-- End Paging Section -->
    
    </main><!-- End #main -->

  	<!-- start : mainFooter -->
	<div>
      <jsp:include page="/partial/mainFooter.jsp"></jsp:include>
    </div>
 	<!-- end : mainFooter -->
</body>
</html>