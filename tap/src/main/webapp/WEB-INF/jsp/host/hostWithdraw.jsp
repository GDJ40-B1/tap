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

    <title>SB Admin 2 - Register</title>
	<script src="http://code.jquery.com/jquery-latest.js"></script> 
	
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
                    <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
                    <div class="col-lg-7">
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h3 text-gray-900 mb-3">저희를 떠나실 건가요?</h1>
                                <h1 class="h5 text-gray-900 mb-5">확인을 위해 비밀번호를 입력해 주세요.<br>전환하지 않은 보유 포인트는 모두 소멸됩니다.</h1>
                                <h1 class="h5 text-gray-900 mb-6">등록하신 숙소를 모두 지워주셔야 탈퇴가 정상적으로 처리됩니다.</h1>
                            </div>
                            <form id="removeHostForm" class="user" method="post" action="${pageContext.request.contextPath}/removeHost" >
                                <div class="form-group">
                                    <input type="hidden" class="form-control form-control-user" id="exampleInputEmail"
                                        placeholder="Email Address" name="hostId" value="${loginUser.userId}">
                                </div>                                
                                <div class="form-group">
                                    <input type="password" class="form-control form-control-user" id="exampleInputPw"
                                        placeholder="password" name="hostPw">
                                </div>
                                <button type="button" id="removeHostBtn" class="btn btn-danger btn-user btn-block">
                                   withdraw Account
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
    
    <script>
 		// 탈퇴 버튼 클릭 시
		$('#removeHostBtn').click(function(){
			if($('#exampleInputPw').val()==''){
				alert('비밀번호를 입력하세요.');
			} else if(${roomNum}!=0){
				alert('등록하신 숙소가 존재하여 탈퇴할 수 없습니다.');
				$(location).attr('href', "${pageContext.request.contextPath}/hostMyPage");
			} else{
				<!-- postAddRoom으로 이동 -->
				$('#removeHostForm').submit();
			}
		});
    </script>

    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap_sb/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>

</body>

</html>