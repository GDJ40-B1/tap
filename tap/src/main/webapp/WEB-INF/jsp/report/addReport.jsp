<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고 페이지</title>
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
          <h2>신고 추가</h2>
          <ol>
            <li><a href="${pageContext.request.contextPath}/tap/systemAdminMyPage">Home</a></li>
            <li>신고 추가</li>
          </ol>
        </div>
      
    <form id="addForm" action="${pageContext.request.contextPath}/addReport" method="post">
    	<input type="hidden" name="writerId" value="${loginUser.userId}">
    	<input type="hidden" name="writerCategory" value="${loginUser.userLevel}">
    	<input type="hidden" name="approvalStatus" value="N">
    	
    	<div class="form-group">
	    	<label for="reportTarget">신고대상 :</label>
	    	<input type="text" class="form-control" name="reportTarget">
	    </div>	
    	<div class="form-group">
	    	<label for="reportTargetCategory">신고대상 카테고리 :</label>
	    		<select name="reportTargetCategory">
					<option value="room_review">room_review</option>
					<option value="attraction_review">attraction_review</option>			
	    		</select>
	    </div>
	    <div class="form-group">		
	    	<label for="reportContent">신고내용 :</label>
	    	<textarea class="form-control" id="reportContent" name="reportContent" rows="5" cols="50" placeholder="신고 내용"></textarea>	
    	</div>
    	<button type="button" id="addBtn">신고</button>
    </form>
    
    	</div>
    </section><!-- End Breadcrumbs -->
    
    </main><!-- End #main -->
    
    <!-- start : mainFooter -->
	<div>
      <jsp:include page="/partial/mainFooter.jsp"></jsp:include>
    </div>
 	<!-- end : mainFooter -->
 	
 	<script>
	$('#addBtn').click(function(){
		if($('#reportContent').val() == '') {
			alert('신고 내용을 입력해주세요. 허위신고는 그에 따른 패널티를 부여하겠습니다.');
			return;
		}
				
		$('#addForm').submit();
	});	
	</script>	
</body>
</html>