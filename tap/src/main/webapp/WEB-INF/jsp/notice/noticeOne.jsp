<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<style type="text/css">
	.title {
	  display: flex;
	}
	.box-left {
	  flex: 1;
	}
	.box-center {
	  flex: 3;
	  text-align: center;
	}
	.box-right {
	  flex: 1;
	  text-align: right;
	}
	#breadcrumbs	{
		position:relative;
		height:70px;}
		
	#list	{
		height:auto;
	min-height:100%;
	padding-bottom:150px;
	}
	#main	{
		height:auto;
	min-height:100%;
	padding-bottom:200px;
	}
</style>
<meta charset="UTF-8">
<title>공지사항 : | TAP</title>
  <meta content="" name="description">
  <meta content="" name="keywords">
<!-- Favicons -->
  <link href="${pageContext.request.contextPath}/resources/img/tap_favicon.png" rel="icon">
  <link href="${pageContext.request.contextPath}/resources/img/tap_favicon.png" rel="apple-touch-icon">
  
 
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
          <h2>공지사항</h2>
          <ol>
            <li><a href="index.html">Home</a></li>
            <li><a href="${pageContext.request.contextPath}/questionList">공지사항</a></li>            
          </ol>
        </div>

      </div>
    </section><!-- End Breadcrumbs -->
    
	    
	      
			
			
			<!-- ======= Table Section ======= -->
   	 		<section id="list" class="list">
   	 		
      			<div class="container">
					<table class="table">
						<thead class="table-primary">
							<tr>
								<th>
									<div class="title">
										<div class='box-left'>${notice.noticeId}</div>
										<div class='box-center'>${notice.title}</div>
										<div class='box-right'>${notice.updateDate}</div>
									</div>
								</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>
									<div style="margin-top:40px; margin-bottom:40px; height:auto; min-height:300px;">
										${notice.content}
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>		
				<c:if test="${loginUser.userLevel eq 'system_admin'}">
					<div style="float:right; margin-right:200px;">
						<a class="btn btn-outline-success" href="${pageContext.request.contextPath}/systemAdmin/modifyNotice?noticeId=${notice.noticeId}">글 수정</a>						
						<a class="btn btn-outline-danger" href="${pageContext.request.contextPath}/systemAdmin/deleteNotice?noticeId=${notice.noticeId}">글 삭제</a> 
					</div>
				</c:if>
				<div style="float:left; margin-left:200px;">
					<a class="btn btn-outline-primary" href="${pageContext.request.contextPath}/noticeList">목록</a>
				</div>
					<!--  <input type="hidden" name="noticeId" value="${noticeId}" readonly="readonly"> -->
			
	    </section><!-- End Breadcrumbs --> 
	
	</main><!-- End #main -->
	
    <!-- start : mainFooter -->
    <div>
       <jsp:include page="/partial/mainFooter.jsp"></jsp:include>
    </div>
    <!-- end : mainFooter -->
    
</body>
</html>