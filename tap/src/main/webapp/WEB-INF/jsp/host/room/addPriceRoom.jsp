<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
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
			      <input type="text" id="dateRangePicker1" class="form-control" name="startDate" readonly>
			    </div>
			    <div class="form-group col-md-6">
			      <label for="inputState">끝날짜</label>
			      <input type="text" id="dateRangePicker2" class="form-control" name="endDate" readonly>
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
			if($('#dateRangePicker1').val()==''){
				alert('시작날짜를 선택하세요');
				return;
			} else if($('#dateRangePicker2').val()==''){
				alert('끝날짜를 선택하세요');
				return;
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
	<script src="js/lib/jquery/jquery.dataTables.js"></script>
	<script>
		// 선택 불가능하게 할 날짜 리스트 추출
		// '2021-12-24', '2022-1-1'의 형식으로 해야함.
		var disabledDays = new Array();
		<c:forEach items="${priceRoomDate}" var="prd">
			disabledDays.push("${prd}");
			console.log("${prd}");
		</c:forEach>
		
		// 이미 선택된 기간의 시작일만 추출하여 list로 저장
		var disableStartList = new Array();
		<c:forEach items="${priceRoomList}" var="prl">
			disableStartList.push("${prl.startDate}");
		</c:forEach>
		
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
	        $("#dateRangePicker1").datepicker('option','beforeShowDay', disableSomeDay);
	        $("#dateRangePicker1").datepicker('option','maxDate', '+12M'); //현재 날짜에서 1년 후 까지만 가능
	        // 시작일의 날짜가 선택되면
	        $('#dateRangePicker1').datepicker("option", "onClose", function ( selectedDate ) {
	        	// 종료일을 나타내는 Datepicker의 minDate를 시작일 Datepicker의 선택일로 설정
	            $("#dateRangePicker2").datepicker( "option", "minDate", selectedDate );
	            $("#dateRangePicker2").datepicker('option','beforeShowDay', disableSomeDay);
	            
	        	// 종료일을 나타내는 Datepicker의 maxDate를 동적으로 설정하기 위한 코드
	            var endMaxDate = null;
	            for(var i=0;i<disableStartList.length;i++){
	            	var startDate = new Date(disableStartList[i]);
	        		var selectedDay = new Date(selectedDate);
	        		console.log(startDate);
	        		// 선택할 수 없는 날짜들의 시작일만 추출하여, 선택된 날짜가 시작일보다 작으면 시작일을 maxDate로 설정
	        		if(selectedDay<startDate){
	        			endMaxDate = startDate;
	        			console.log("이게 endDay입니다."+startDate);
	        			break;
	        		}
	            }
	    		
	    		// maxDate가 설정되지 않았다면, 선택된 시작일 이후에 선택 불가능한 날짜가 없는것이니,
	    		// 오늘 날짜로부터 1년 후까지만 선택 가능하도록 maxDate를 설정
	    		if(endMaxDate==null){
	    			endMaxDate = '+12M';
	    		}
	            $("#dateRangePicker2").datepicker('option','maxDate', endMaxDate);
	        });
	    });
	
	</script>
	
</body>
</html>