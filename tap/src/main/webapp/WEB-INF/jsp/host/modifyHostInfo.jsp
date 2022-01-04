<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>호스트 정보 수정</title>
    
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
                    	<img src="${pageContext.request.contextPath}/resources/img/system/update_user.png"
                    	width="70%" height="70%" style="margin-left: 15%; margin-top: 15%;">
                    </div>
                    <div class="col-lg-7">
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">호스트 정보를 수정하세요!</h1>
                            </div>
                            <form class="user" method="post" action="${pageContext.request.contextPath}/modifyHostInfo" >
                                <div class="form-group">
                                    <input type="hidden" class="form-control form-control-user" id="exampleInputEmail"
                                        placeholder="Email Address" name="hostId" value="${host.hostId}">
                                </div>                                
                                <div class="form-group">
                                    <h4 class="small font-weight-bold">이름</h4>
                                    <input type="text" class="form-control form-control-user" id="exampleInputName"
                                        placeholder="name" name="hostName" value="${host.hostName}">
                                </div>                                
                                <div class="form-group">
                                	<h4 class="small font-weight-bold">나이</h4>
                                    <input type="text" class="form-control form-control-user" id="exampleInputAge"
                                        placeholder="age" name="hostAge" value="${host.hostAge}">
                                </div>
                                <div class="form-group">
                                	<h4 class="small font-weight-bold">전화번호</h4>
                                    <input type="text" class="form-control form-control-user" id="exampleInputPhone"
                                        placeholder="phone number" name="hostPhone" value="${host.hostPhone}">
                                </div>
                                <button type="submit" class="btn btn-primary btn-user btn-block">
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

</body>

</html>