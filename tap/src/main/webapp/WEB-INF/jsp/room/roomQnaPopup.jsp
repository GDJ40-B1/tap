<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.js"></script> 
</head>
<body>
	<div class="container">
		
		<form id="addRoomQnaForm" method ="post">
		<input type="hidden" name="memberId" value="${loginUser.userId}">
		<input type="hidden" name="roomId" value="${roomId}">
		<div class="form-group">
		<label for="questionContent">문의 내용 : </label>
			<textarea class="form-control" rows="5" placeholder="내용을 입력해주세요" id="content" name="content" ></textarea>
		</div>
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
		<div>
			<button id="btn" type ="button">작성</button>
		</div>
	</form>
	
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
		
    </div>
</body>
</html>