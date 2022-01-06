<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
	<title>숙소 즐겨찾기 리스트</title>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	
	<!-- Favicons -->
    <link href="${pageContext.request.contextPath}/resources/img/tap_favicon.png" rel="icon">
    <link href="${pageContext.request.contextPath}/resources/img/tap_favicon.png" rel="apple-touch-icon">
	
    <!-- Custom styles for this template-->
    <link href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">
	 
</head>
<body id="page-top">
	
    <!-- start : hostHeader -->
    <div>
    	<jsp:include page="/partial/memberHeader.jsp"></jsp:include>
    </div>
    <!-- end : hostHeader -->
    
    <!-- start : content -->
	<div id="content" class="container-fluid">
		<!-- DataTales Example -->
	    <div class="card shadow mb-4">
	        <div class="card-header py-3">
	            <h6 class="m-0 font-weight-bold text-primary">즐겨찾기 추가 숙소 리스트</h6>
	        </div>
	        <div class="card-body">
	            <div class="table-responsive">
	                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
	                    <thead>
	                        <tr>
	                            <th>숙소명</th>
	                            <th>삭제</th>
	                        </tr>
	                    </thead>
	                    <tbody>	
	                    	<c:forEach var="f" items="${favoritesList}">
								<tr>
									<td><a href="${f.favoritesUrl}">${f.favoritesTitle}</a></td>
									<td><button type="button" class="btn btn-danger" value="${f.roomId}" id='removeFavorites'>취소</button></td>
								</tr>
							</c:forEach>
	                    </tbody>
	                </table>
	            </div>
	        </div>
	    </div>
	</div>
	<!-- end : content -->
	
	<!-- start : hostFooter -->
    <div>
       <jsp:include page="/partial/memberFooter.jsp"></jsp:include>
    </div>
    <!-- end : hostFooter -->
    
	
	<script>
	   $('#removeFavorites').click(function() {
           var roomId = $(this).val();
           var memberId = "${member.memberId}";

           console.log("roomId: " + roomId);
           console.log("memberId: " + memberId);

           var form = {
               roomId : roomId,
               memberId : memberId,
           };

           $.ajax({
               type : 'POST',
               contentType: "application/x-www-form-urlencoded; charset=UTF-8",
               url : '${pageContext.request.contextPath}/removeFavorites',
               cache : false,
               data : form,
               success : function(result) {
                   console.log(result);
                   console.log("즐겨찾기 삭제 완료")
                   alert('즐겨찾기 등록을 취소했습니다.');
                   location.reload();
               },
               error : function(e) {
                   console.log(e);
                   alert('문제가 발생했습니다.');
                   location.reload();
               }
           })
	   });   
    </script>
        
</body>
</html>

