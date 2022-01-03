<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
	<title>Insert title here</title>
	<script src="http://code.jquery.com/jquery-latest.js"></script> 
	
	<!-- 달력 관련 설정 -->
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/js/tempusdominus-bootstrap-4.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/css/tempusdominus-bootstrap-4.min.css" />
	<link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.css" />
</head>
<body id="page-top">

    <!-- start : hostHeader -->
    <div>
    	<jsp:include page="/partial/hostHeader.jsp"></jsp:include>
    </div>
    <!-- end : hostHeader -->
    
    <!-- start : content -->
	<div id="content" class="container-fluid">
	
		<!-- start : hostRoomNavi -->
	    <div>
	    	<jsp:include page="/partial/hostRoomNavi.jsp"></jsp:include>
	    </div>
	    <!-- end : hostRoomNavi -->
	    <br>
		
		<!-- 테이블 -->
	    <div class="card shadow mb-4">
	        <div class="card-header py-3">
	            <h6 class="m-0 font-weight-bold text-primary">가격 목록</h6>
	        </div>
	        <div class="card-body">
	            <div class="table-responsive">
	                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
	                    <thead>
	                        <tr>
	                        	<th>no.</th>
	                            <th>시작날짜</th>
	                            <th>끝날짜</th>
	                            <th>가격</th>
	                            <th>삭제</th>
	                        </tr>
	                    </thead>
	                    <tbody>
	                    	<c:forEach items="${priceRoomList }" var="list">
								<tr>
									<th>${list.priceRoomId }</th>
									<td>${list.startDate }</td>
									<td>${list.endDate }</td>
									<td>${list.price }</td>
									<td><button id="${list.priceRoomId }-delBtn" type="button" class="btn btn-link">삭제하기</button></td>
								</tr>
							</c:forEach>
	                    </tbody>
	                </table>
	            </div>
	        </div>
	    </div>
	    
	    <!-- 쿠폰 등록 버튼 -->
	    <a href="${pageContext.request.contextPath}/host/addPriceRoom?roomId=${room.roomId}&detailAddressId=${room.detailAddressId }" class="btn btn-success btn-icon-split">
	    	<span class="icon text-white-50">
	    		<i class="fas fa-check"></i>
	    	</span>
	    	<span class="text">가격을 추가하시겠습니까?</span>
	    </a>
	</div>
	<!-- end : content -->
	
	<!-- start : hostFooter -->
    <div>
       <jsp:include page="/partial/hostFooter.jsp"></jsp:include>
    </div>
    <!-- end : hostFooter -->
    
    <!-- 숙소별 가격 삭제 클릭 시 -->
	<script>
		<c:forEach items="${priceRoomList}" var="pr">
			$('#${pr.priceRoomId }-delBtn').click(function(){
				if(confirm("해당 가격을 삭제하시겠습니까?") == true){
					$(location).attr('href', "${pageContext.request.contextPath}/host/removePriceRoom?roomId=${room.roomId}&detailAddressId=${room.detailAddressId }&priceRoomId=${pr.priceRoomId }");
				} else{
					return;
				}
			});
		</c:forEach>
	</script>
</body>
</html>