<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>회원가입</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	
	<!-- Favicons -->
    <link href="${pageContext.request.contextPath}/resources/img/tap_favicon.png" rel="icon">
    <link href="${pageContext.request.contextPath}/resources/img/tap_favicon.png" rel="apple-touch-icon">
    
    <!-- Custom fonts for this template-->
    <link href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body class="bg-gradient-primary">

    <div class="container">

        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-0">
                <!-- Nested Row within Card Body -->
                <div class="row">
                    <div class="col-lg-5">
                    	<img src="${pageContext.request.contextPath}/resources/img/system/join_user.png"
                    	width="90%" height="70%" style="margin-left:10%; margin-top: 15%;">
                    </div>
                    <div class="col-lg-7">
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">TAP과 함께하시겠습니까?</h1>
                            </div>
                            <form id="addMemberForm" class="user" method="post" action="${pageContext.request.contextPath}/addMember" >
                                <div class="form-group">
                                    <input type="email" class="form-control form-control-user" id="exampleInputEmail"
                                        placeholder="Email Address" name="memberId">
                                </div>                                
                                <div class="form-group">
                                    <input type="password" class="form-control form-control-user" id="exampleInputPw"
                                        placeholder="password" name="memberPw">
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control form-control-user" id="exampleInputName"
                                        placeholder="name" name="memberName">
                                </div>                                
                                <div class="form-group">
                                    <input type="number" class="form-control form-control-user" id="exampleInputAge"
                                        placeholder="age" name="memberAge">
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control form-control-user" id="exampleInputPhone"
                                        placeholder="phone number" name="memberPhone">
                                </div>
								<h4 class="small font-weight-bold">선호지역</h4>
                                <div class="form-group">
                                	<div class="row">
                                		<div class="form-group col-md-6">
                                			<select class="form-control" name="sido" id="sido" onchange="sidoType(this.value);">
										  		<option value="">==선택==</option>
										  	<c:forEach var="s" items="${sidoList}">
										  		<option value="${s}">${s}</option>
										  	</c:forEach>
											</select>
                                		</div>
                                		<div class="form-group col-md-6">
                                			<select class="form-control" name="sigungu" id="sigungu">
												<option value="">==선택==</option>
											</select>
                                		</div>
                                	</div>                            
                                </div>
                                
                                <button id="addMemberBtn" type="button" class="btn btn-primary btn-user btn-block">
                                    가입하기
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap_sb/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>
	
	<script>
	function sidoType(districtSido) {
		$.ajax({
			type: 'GET',
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			url : '${pageContext.request.contextPath}/sido',
			data : { districtSido : districtSido },
			dataType: 'json',
			success : function(result){
				console.log(result)
					
				$("#sigungu").find("option").remove().end().append("<option value=''>==선택==</option>")
				$.each(result, function(i){
					$("#sigungu").append("<option value='"+result[i]+"'>"+result[i]+"</option>")
				});
			}
		}).fail(function (error) {
			alert(JSON.stringify(error));
		})
	}
	</script>
	
	<script>
		$('#addMemberBtn').click(function(){
			if($('#exampleInputEmail').val()==''){
				alert('이메일을 입력하세요.');
			} else if($('#exampleInputPw').val()==''){
				alert('비밀번호를 입력하세요.');
			} else if($('#exampleInputName').val()==''){
				alert('이름을 입력하세요.');
			} else if($('#exampleInputAge').val()==''){
				alert('나이를 입력하세요.');
			} else if($('#exampleInputPhone').val()==''){
				alert('전화번호를 입력하세요.');
			} else if($('#sigungu').val()==''){
				alert('선호지역을 선택해주세요.');
			} else{
				$('#addMemberForm').submit();
			}
		});
    </script>
	
</body>

</html>