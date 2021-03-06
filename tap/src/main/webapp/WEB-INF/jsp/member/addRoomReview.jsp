<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>숙소후기 작성</title>
<style>
	@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');

	.font1 {
		font-family: 'Noto Sans KR', sans-serif;
	}
	
	#font2 #font3 {
		font-family: 'Noto Sans KR', sans-serif;
	}
</style>

<!-- Favicons -->
<link href="${pageContext.request.contextPath}/resources/img/tap_favicon.png" rel="icon">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
</head>
<body>
	<!-- start : memberHeader -->
    <div>
    	<jsp:include page="/partial/memberHeader.jsp"></jsp:include>
    </div>
    <!-- end : memberHeader -->
    
    <!-- start : content -->
	<div id="content" class="container-fluid">
		<!-- DataTales Example -->
	    <div class="card shadow mb-4">
	        <div class="card-header py-3">
	            <h6 class="m-0 font-weight-bold text-primary" style="text-align:center">숙소후기 작성</h6>
	        </div>
	        <div class="card-body">
	        	<div class="table-responsive">
	            	<form id="addReviewForm" action="${pageContext.request.contextPath}/member/addRoomReview" method="post">
						<div class="font1">
							<h4>숙소정보<span style="color:#050505;">&nbsp; ${roomName}[${roomForm}]</span></h4>
							<h4>작성자명<span style="color:#050505;">&nbsp; ${loginUser.userName}(loginUser.userId)</span></h4>
							<span>※ 작성한 후기는 다른 사이트에서도 함께 보여질 수 있습니다.</span>
							<hr style="height: 3px;">
						</div>
						<div>
							<input type="hidden" name="paymentId" value="${paymentId}">
							<input type="hidden" name="answerStatus" value="N"> 
						</div>
						<div id="font2" style="color:#050505;">
							이곳에서의 경험은 어떠셨어요?<br> 
							<select name="roomReviewScore" class="custom-select">
								<option value="1">★☆☆☆☆</option>
								<option value="2">★★☆☆☆</option>
								<option value="3">★★★☆☆</option>
								<option value="4">★★★★☆</option>
								<option value="5">★★★★★</option>
							</select>
						</div><br>
						<div class="form-group" id="font3" style="color:#050505;">
							후기를 작성해주세요<br> 
							<textarea class="form-control" id="roomReviewContent" rows="5" cols="50" name="roomReviewContent" placeholder="개인 정보 보호를 위해 고객님의 개인 정보를 입력하지 마세요."></textarea>
						</div>
						<div>
							<button id="addReviewBtn" class="btn btn-danger" type="button">작성</button>
						</div>
					</form>	
				</div>
	        </div>
	    </div>	
	</div>
    
	<!-- start : memberFooter -->
    <div>
       <jsp:include page="/partial/memberFooter.jsp"></jsp:include>
    </div>
    <!-- end : memberFooter -->
    
    <!-- 나의 숙소후기 회원 삭제 버튼 -->
    <script>
	    $('#addReviewBtn').click(function(){
			if($('#roomReviewContent').val() == '') {
				alert('후기를 작성해주세요.');
				return;
			}
			
			$('#addReviewForm').submit();
		});	
    </script>
</body>
</html>