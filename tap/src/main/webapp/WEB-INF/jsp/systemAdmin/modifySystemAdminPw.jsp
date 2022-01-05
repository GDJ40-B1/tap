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

    <title>비밀번호 수정</title>
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
                    	<img src="${pageContext.request.contextPath}/resources/img/system/update_password.png"
                    	width="66%" height="70%" style="margin-left: 17%; margin-top: 15%;">
                    </div>
                    <div class="col-lg-7">
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">비밀번호를 수정하세요!</h1>
                            </div>
                            <form id="modifyForm" class="user" method="post" action="${pageContext.request.contextPath}/modifySystemAdminPw">
                                <div class="form-group">
                                    <input type="hidden" class="form-control form-control-user" id="exampleInputEmail"
                                        placeholder="Email Address" name="systemAdminId" value="${systemAdminId}">
                                </div>                 
                                <h4 class="small font-weight-bold">현재 비밀번호</h4>               
                                <div class="form-group">
                                    <input type="password" class="form-control form-control-user" id="systemAdminPw"
                                        placeholder="현재 비밀번호" name="systemAdminPw">
                                </div>  
                                <h4 class="small font-weight-bold">새로운 비밀번호</h4> 
                                 <div class="form-group">
                                    <input type="password" class="form-control form-control-user" id="systemAdminNewPw"
                                        placeholder="새로운 비밀번호" name="systemAdminNewPw">
                                </div>
                                <button type="button" id="modifyBtn" class="btn btn-primary btn-user btn-block">
                                    수정
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
	$('#modifyBtn').click(function(){
		if($('#systemAdminPw').val() == '') {
			alert('현재 비밀번호를 입력하세요.');
			return;
		}
		
		if($('#systemAdminNewPw').val() == '') {
			alert('새로운 비밀번호를 입력하세요.');
			return;
		}
				
		$('#modifyForm').submit();
	});	
</script>	
</body>

</html>