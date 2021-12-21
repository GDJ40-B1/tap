<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	
	<!-- Datepicker 관련 요소 -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="/resources/demos/style.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body id="page-top">
	<!-- start : hostHeader -->
    <div>
    	<jsp:include page="/partial/hostHeader.jsp"></jsp:include>
    </div>
    <!-- end : hostHeader -->
    
    <!-- start : content -->
	<div id="content" class="container-fluid">
	
		<!-- breadcrumb : 3 level이 되는 부분부터 사용 -->
		<nav aria-label="breadcrumb">
			<ol class="breadcrumb bg-gray-100">
				<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/hostMyPage">홈</a></li>
				<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/host/roomList">숙소목록</a></li>
				<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/host/roomOne?roomId=${room.roomId }&detailAddressId=${room.detailAddressId }">숙소상세보기</a></li>
				<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/host/priceRoomList?roomId=${room.roomId }&detailAddressId=${room.detailAddressId }">가격목록</a></li>
				<li class="breadcrumb-item active" aria-current="page">가격추가</li>
			</ol>
		</nav>
		
		<h1 class="h3 mb-4 text-gray-800">가격 등록</h1>
		<br>
		
		<form id="addPriceRoomForm" action="${pageContext.request.contextPath}/host/addPriceRoom" method="post">
			<!-- 전달을 위한 값 hidden처리 -->
			<input type="hidden" name="roomId" value="${room.roomId }">
			<input type="hidden" name="detailAddressId" value="${room.detailAddressId }">
			
			<div class="form-row">
			    <div class="form-group col-md-6">
			      <label for="inputCity">시작날짜</label>
			      <input type="text" id="dateRangePicker1" name="startDate" readonly>
			    </div>
			    <div class="form-group col-md-6">
			      <label for="inputState">끝날짜</label>
			      <input type="text" id="dateRangePicker2" name="endDate" readonly>
			    </div>
		    </div>
			
			<div class="form-group">
				<label>가격</label>
				<input class="form-control" type="number" id="price" name="price">
			</div>
			
			<br>
			<button type="button" class="btn btn-primary btn-lg btn-block"  id="addBtn">가격 등록</button>
			<br>
		</form>
	</div>
	
	<!-- start : hostFooter -->
	<div>
    	<jsp:include page="/partial/hostFooter.jsp"></jsp:include>
    </div>
    <!-- end : hostFooter -->
    
	<script>
		<!-- input 유효성 검사 -->
		
		// 숙소 등록을 클릭했을 때
		$('#addBtn').click(function(){
			if($('#datetimepicker1').val()==''){
				alert('시작날짜를 선택하세요');
			} else if($('#datetimepicker2').val()==''){
				alert('끝날짜를 선택하세요');
			} else if($('#price').val()==''){
				alert('가격을 숫자만으로 입력하세요');
			} else{
				<!-- postAddPriceRoom으로 이동 -->
				$('#addPriceRoomForm').submit();
			}
		});
		
	</script>
	
	<!-- Datepicker 관련 script-->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="/resources/demos/style.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script>
		var disabledDays = new Array();
		<c:forEach  items="${priceRoomDate}" var="prd">
			disabledDays.push("${prd}");
		</c:forEach>
		console.log(disabledDays[0]+"!!");
		// 이미 가격이 설정된 날짜 
		// 날짜를 나타내기 전에(beforeShowDay) 실행할 함수
		function disableSomeDay(date) {
		    var month = date.getMonth();
		    var dates = date.getDate();
		    var year = date.getFullYear();
		    
		    // 배열에 해당하는 날짜는 0번째 index에 false를 담아 리턴해준다.
		    for (i = 0; i < disabledDays.length; i++) {
		        if($.inArray(year + '-' +(month+1) + '-' + dates,disabledDays) != -1) {
		            return [false];
		        }
		    }
		    return [true];
		}
		
	    $(function() {
	    	// 공통 초기 설정
	    	$.datepicker.setDefaults({
		        dateFormat: 'yy-mm-dd',
		        prevText: '이전 달',
		        nextText: '다음 달',
		        maxDate: '+2M', //현재 날짜에서 2개월 후 까지만 가능
		        beforeShowDay: disableSomeDay,
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
	    	
	        $("#dateRangePicker1").datepicker('option','minDate', 0);
	        $('#dateRangePicker1').datepicker("option", "onClose", function ( selectedDate ) {
	            $("#dateRangePicker2").datepicker( "option", "minDate", selectedDate );
	        });
	    });
		
	 // 특정일 선택막기
	    function disableAllTheseDays(date) {
	    	var m = date.getMonth(), d = date.getDate(), y = date.getFullYear();
	    	for (i = 0; i < disabledDays.length; i++) {
	    		if($.inArray(y + '-' +(m+1) + '-' + d,disabledDays) != -1) {
	    			return [false];
	    		}
	    	}
	    	return [true];
	    }
	
	</script>
	
</body>
</html>