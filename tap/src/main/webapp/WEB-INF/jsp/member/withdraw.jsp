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

    <title>회원 탈퇴</title>
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    
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
                    	<img src="${pageContext.request.contextPath}/resources/img/system/escape_user.png"
                    	width="80%" height="80%" style="margin-left: 15%; margin-top: 10%;">
                    </div>
                    <div class="col-lg-7">
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h3 text-gray-900 mb-3">TAP과의 이별을 진행하시겠습니까?</h1><br>
                                <h1 class="h5 text-gray-900 mb-5">전환하지 않은 보유 포인트는 모두 소멸됩니다.</h1>
                            </div>
                            <form id="removeMemberForm" class="user" method="post" action="${pageContext.request.contextPath}/removeMember" >
                                <div class="form-group">
                                    <input type="hidden" class="form-control form-control-user" id="exampleInputEmail"
                                        placeholder="Email Address" name="memberId" value="${loginUser.userId}">
                                </div>                                
                                <div class="form-group">
                                    <input type="text" class="form-control form-control-user" id="memberPw"
                                        placeholder="password" name="memberPw">
                                </div>
                                <button id="removeMemberBtn" type="button" class="btn btn-danger btn-user btn-block">
                                   회원 탈퇴
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
 		// 탈퇴 버튼 클릭 시
		$('#removeMemberBtn').click(function(){
			if($('#memberPw').val()==''){
				alert('비밀번호를 입력하세요.');
			} else{
				$('#removeMemberForm').submit();
			}
		});
    </script>

</body>

</html>