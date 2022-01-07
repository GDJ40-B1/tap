<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>숙소 문의 작성</title>

<!-- Favicons -->
<link href="${pageContext.request.contextPath}/resources/img/favicon.png" rel="icon">
<link href="${pageContext.request.contextPath}/resources/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- jquery -->	
<script src="http://code.jquery.com/jquery-latest.js"></script> 

<!-- Google Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/vendor/remixicon/remixicon.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

<!-- bootstrap -->
<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">

<!-- Template Main CSS File -->
<link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">

</head>
<body>
	<div class="container">
		
		<form id="addRoomQnaForm" method ="post">
			<input type="hidden" name="memberId" value="${loginUser.userId}">
			<input type="hidden" name="roomId" value="${roomId}">
			<div class="form-group">
				<label for="questionContent" class="form-label mt-4">문의 내용 : </label>
				<textarea class="form-control" rows="10" cols="20" wrap="hard" placeholder="내용을 입력해주세요" id="content" name="content" ></textarea>
			</div>
			<fieldset class="form-group" style="margin-top:10px;">
				<div class="form-check">
		 			<label class="form-check-label">
		    			<input type="radio" class="form-check-input" name="secretCheck" value="Y">비밀글 작성
		 			</label>
				</div>
				<div class="form-check">
  					<label class="form-check-label">
   						<input type="radio" class="form-check-input" name="secretCheck" value="N" checked>외부 공개 허용
  					</label>
				</div>
		</fieldset>
		<div>
			<button id="btn" type ="button" class="btn btn-secondary" style="float:right;">작성</button>
		</div>
		</form>	
    </div>
    
	<script>
		$('#btn').click(function(){
			if($('#content').val() == '') {
				alert('내용을 입력하세요');
				return;
			}
			
			var formData = $("#addRoomQnaForm").serialize();
			
			  $.ajax({
				  type: 'POST',
				  contentType: "application/x-www-form-urlencoded; charset=UTF-8",
				  url : '${pageContext.request.contextPath}/roomQnaPopup',
				  data : formData,
				  success : function(result){
					  console.log(result)
					  
					  window.opener.location.reload();
					  window.close();
					
				  }
			  })
		});
	</script>    
    
</body>
</html>