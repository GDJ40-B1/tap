<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
	<title>사이트 내 결제 내역</title>
	<!-- Favicons -->
    <link href="${pageContext.request.contextPath}/resources/img/tap_favicon.png" rel="icon">
    <link href="${pageContext.request.contextPath}/resources/img/tap_favicon.png" rel="apple-touch-icon">
    
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<!-- Datepicker 관련 요소 -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="/resources/demos/style.css">
</head>
<body id="page-top">

    <!-- start : hostHeader -->
    <div>
    	<jsp:include page="/partial/systemAdminHeader.jsp"></jsp:include>
    </div>
    <!-- end : hostHeader -->
    
    <!-- start : content -->
    <div id="content" class="container-fluid">
		<div class="card shadow mb-4">
			<div id="favoritesList" class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">내역 조회 기간</h6>
			</div>
			<div class="card-body">
				<div class="text-center">
					<div class="form-row">
						<div class="form-group col-md-6">
							<label for="inputCity">시작날짜</label>
							<input type="text" id="dateRangePicker1" class="form-control" name="minDay" readonly>
						</div>
						<div class="form-group col-md-6">
							<label for="inputState">끝날짜</label>
							<input type="text" id="dateRangePicker2" class="form-control" name="maxDay" readonly>
						</div>
					</div>
					<button class="btn btn-primary" id="dateBtn" type="button">조회</button>
				</div>
			</div>
		</div>
	
		<!-- DataTales Example -->
	    <div class="card shadow mb-4">
	        <div class="card-header py-3">
	            <h6 class="m-0 font-weight-bold text-primary">사이트 내 포인트 내역</h6>
	        </div>
	        <div class="card-body">
	            <div class="table-responsive">
	                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
	                    <thead>
	                        <tr>
	                            <th>ID</th>
	                            <th>내역</th>
	                            <th>현재 포인트</th>
	                            <th>변동 내역</th>
	                           	<th>등록일</th>
	                        </tr>
	                    </thead>
	                    <tfoot>
	                        <tr>
	                            <th>ID</th>
	                            <th>내역</th>
	                            <th>현재 포인트</th>
	                            <th>변동 내역</th>
	                           	<th>등록일</th>
	                        </tr>
	                    </tfoot>
	                    <tbody>
	                    	<c:forEach items="${historyList}" var="h">
								<tr>
									<td>${h.userId}</td>
									<td>${h.pointHistoryCategory}</td>
									<td>${h.point}</td>
									<td>${h.changedPoint}</td>
									<td>${h.createDate}</td>
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
       <jsp:include page="/partial/systemAdminFooter.jsp"></jsp:include>
    </div>
    <!-- end : hostFooter -->
   	<!-- Datepicker 관련 script-->
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="js/lib/jquery/jquery.dataTables.js"></script>	
	    
    <script>
	    $(function() {
	    	// 공통 초기 설정
	    	$.datepicker.setDefaults({
		        dateFormat: 'yy-mm-dd',
		        prevText: '이전 달',
		        nextText: '다음 달',
		        // 한글 설정
		        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		        dayNames: ['일', '월', '화', '수', '목', '금', '토'],
		        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
		        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
		        showMonthAfterYear: true,
		        yearSuffix: '년'
		    });
	    	
	    	// 각 input을 Datepicker로 변환
	    	$("#dateRangePicker1").datepicker();
	    	$("#dateRangePicker2").datepicker();
	        $("#dateRangePicker1").datepicker('option','minDate');
	        $("#dateRangePicker1").datepicker('option','maxDate', 0); 
	        // 시작일의 날짜가 선택되면
	        $('#dateRangePicker1').datepicker("option", "onClose", function ( selectedDate ) {
	            $("#dateRangePicker2").datepicker( "option", "minDate", selectedDate);
	            $("#dateRangePicker2").datepicker('option','maxDate', 0);
	        });
	    });		
	</script>

	<script>	
		$('#dateBtn').click(function(){
			if($('#dateRangePicker1').val() == '') {
				alert('시작날짜를 선택하세요');
				return;
			} else if($('#dateRangePicker2').val() == '') {
				alert('끝날짜를 선택하세요');
				return;
			} 
			
			var roomId = $("#room option:selected").val();
			var roomName = $("#room option:selected").text();
			var minDay = $("#dateRangePicker1").val();
			var maxDay = $("#dateRangePicker2").val();
			
			location.href="${pageContext.request.contextPath}/systemAdmin/pointHistoryList?&minDay="+minDay+"&maxDay="+maxDay;
		});
    </script>
</body>
</html>

