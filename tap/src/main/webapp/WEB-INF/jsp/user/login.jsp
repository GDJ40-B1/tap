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
	<script src="http://code.jquery.com/jquery-latest.js"></script> 
    <title>로그인</title>
    
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

        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-xl-10 col-lg-12 col-md-9">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <div class="col-lg-7">
                            		<div class="form-row" style="height: 100%;">
									    <div class="form-group col-md-4" style="height: 100%;">
									      <a href="${pageContext.request.contextPath}/login?userType=member">
									      	<div style="width: 100%; height: 100%; background: #EBE8FF;">
									      		<c:choose>
													<c:when test="${userType eq 'member'}">
														<img src="${pageContext.request.contextPath}/resources/img/login/selected_member_login.png" width="100%" height="100%">
													</c:when>
													<c:otherwise>
														<img src="${pageContext.request.contextPath}/resources/img/login/member_login.png" width="100%" height="100%">
													</c:otherwise>
												</c:choose>
									      	</div>
									      </a>
									    </div>
									    <div class="form-group col-md-4" style="height: 100%;">
									      <a href="${pageContext.request.contextPath}/login?userType=host">
									      	<div style="width: 100%; height: 100%; background: #FFECE2;">
									      		<c:choose>
													<c:when test="${userType eq 'host'}">
														<img src="${pageContext.request.contextPath}/resources/img/login/selected_host_login.png" width="100%" height="100%">
													</c:when>
													<c:otherwise>
														<img src="${pageContext.request.contextPath}/resources/img/login/host_login.png" width="100%" height="100%">
													</c:otherwise>
												</c:choose>
									      	</div>
									      </a>
									    </div>
									    <div class="form-group col-md-4" style="height: 100%;">
									      <a href="${pageContext.request.contextPath}/login?userType=system_admin">
									      	<div style="width: 100%; height: 100%; background: #E2F3FF;">
									      		<c:choose>
													<c:when test="${userType eq 'system_admin'}">
														<img src="${pageContext.request.contextPath}/resources/img/login/selected_systemAdmin_login.png" width="100%" height="100%">
													</c:when>
													<c:otherwise>
														<img src="${pageContext.request.contextPath}/resources/img/login/systemAdmin_login.png" width="100%" height="100%">
													</c:otherwise>
												</c:choose>
									      	</div>
									      </a>
									    </div>
									  </div>
                            </div>
                            <div class="col-lg-5">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">TAP과 함께 떠나볼까요?</h1>
                                    </div>
                                    <form id="loginForm" class="user" action="${pageContext.request.contextPath}/login" method="post">
                                        <div class="form-group">
                                        	<!-- 객체가 선택되었다면 테스트 아이디 입력 -->
                                        	<c:choose>
													<c:when test="${userType eq 'member'}">
														<input type="email" class="form-control form-control-user"
                                                			id="userId" placeholder="tap@email.com" name="userId" value="fjdkslvn9@gmail.com">
													</c:when>
													<c:when test="${userType eq 'host'}">
														<input type="email" class="form-control form-control-user"
                                                			id="userId" placeholder="tap@email.com" name="userId" value="dhtnsehf9@gmail.com">
													</c:when>
													<c:when test="${userType eq 'system_admin'}">
														<input type="email" class="form-control form-control-user"
                                                			id="userId" placeholder="tap@email.com" name="userId" value="dhekfhd9@naver.com">
													</c:when>
													<c:otherwise>
														<input type="email" class="form-control form-control-user"
                                                			id="userId" placeholder="tap@email.com" name="userId">
													</c:otherwise>
												</c:choose>
                                                
                                                
                                        </div>
                                        <div class="form-group">
                                        	<c:choose>
													<c:when test="${userType ne 'none'}">
														<input type="password" class="form-control form-control-user"
                                                			id="userPw" placeholder="Password" name="userPw" value="1234">
													</c:when>
													<c:otherwise>
														<input type="password" class="form-control form-control-user"
                                                			id="userPw" placeholder="password" name="userPw">
													</c:otherwise>
												</c:choose>
                                        </div>
                                        <input id="userType" name="userLevel" type="hidden" value="${userType }">
                                        <button id="loginBtn" type="button" class="btn btn-primary btn-user btn-block">로그인</button>
                                    </form>
                                    <hr>
                                    <div class="text-center">
                                        <a class="small" href="${pageContext.request.contextPath}/addMember">일반 회원 가입</a><br>
                                        <a class="small" href="${pageContext.request.contextPath}/addHost">호스트 회원 가입</a><br>
                                        <a class="small" href="${pageContext.request.contextPath}/addSystemAdmin">관리자 회원 가입</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </div>
    
    <script>
    $('#loginBtn').click(function(){
		if("${userType}"=='none'){
			alert('정체를 선택해주세요!');
		} else if($('#userId').val()==''){
			alert('아이디를 입력하세요');
		} else if($('#userPw').val()==''){
			alert('비밀번호를 입력하세요');
		} else{
			<!-- loginForm으로 이동 -->
			$('#loginForm').submit();
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