<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    
    <!-- Custom fonts for this template-->
    <link href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">
    
    <!-- Custom styles for this page -->
    <link href="${pageContext.request.contextPath}/resources/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
    
    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="${pageContext.request.contextPath}/">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-laugh-wink"></i>
                </div>
                <div class="sidebar-brand-text mx-3">T A B</div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/systemAdminMyPage">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>대시보드</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                업무 관리
            </div>
            
            <!-- Nav Item - Members -->
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/systemAdmin/memberList">
                    <i class="fas fa-user-circle"></i>
                    <span>회원목록</span></a>
            </li>
            
            <!-- Nav Item - Hosts -->
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/systemAdmin/hostList">
                    <i class="far fa-user-circle"></i>
                    <span>호스트목록</span></a>
            </li>
            
            <!-- Nav Item - withdrawalList -->
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/systemAdmin/withdrawalList">
                    <i class="fas fa-question-circle"></i>
                    <span>탈퇴내역</span></a>
            </li>
            
            <!-- Nav Item - category -->
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/systemAdmin/categoryList">
                    <i class="fas fa-question-circle"></i>
                    <span>카테고리별 관리</span></a>
            </li>
            
            <!-- Nav Item - Notices -->
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/systemAdmin/pointHistoryList">
                    <i class="fas fa-sticky-note"></i>
                    <span>사이트 내 결제내역</span></a>
            </li>
                        
            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                기타
            </div>
                                    
            <!-- Nav Item - Notices -->
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/systemAdmin/noticeList">
                    <i class="fas fa-sticky-note"></i>
                    <span>공지사항 관리</span></a>
            </li>
            
            <!-- Nav Item - Questions -->
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/systemAdmin/unansweredQuestionList">
                    <i class="fas fa-question-circle"></i>
                    <span>문의 미답변 리스트</span></a>
            </li>

             <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages"
                    aria-expanded="true" aria-controls="collapsePages">
                    <i class="fas fa-question-circle"></i>
                    <span>명소 관리</span>
                </a>
                <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="${pageContext.request.contextPath}/systemAdmin/attractionList">명소 전체 목록</a>
                        <a class="collapse-item" href="${pageContext.request.contextPath}/systemAdmin/approvalAttractionList">승인 대기중인 명소</a>
                        <a class="collapse-item" href="${pageContext.request.contextPath}/systemAdmin/addAttraction">명소 추가</a>
                    </div>
                </div>
            </li>
                       
			<!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">

            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>
            
        </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div>

                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                    <!-- Sidebar Toggle (Topbar) -->
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>

                    <!-- Topbar Navbar -->
                    <ul class="navbar-nav ml-auto">

                        <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                        <li class="nav-item dropdown no-arrow d-sm-none">
                        	<a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-search fa-fw"></i>
                            </a>
                            <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-search fa-fw"></i>
                            </a>
                            <!-- Dropdown - Messages -->
                            <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                                aria-labelledby="searchDropdown">
                                <form class="form-inline mr-auto w-100 navbar-search">
                                    <div class="input-group">
                                        <input type="text" class="form-control bg-light border-0 small"
                                            placeholder="Search for..." aria-label="Search"
                                            aria-describedby="basic-addon2">
                                        <div class="input-group-append">
                                            <button class="btn btn-primary" type="button">
                                                <i class="fas fa-search fa-sm"></i>
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </li>
						
						<!-- 포인트 시작 -->
                        <li class="nav-item dropdown no-arrow mx-1">
                        <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								<span class="mr-2 d-none d-lg-inline text-gray-600 small">보유 포인트 : ${loginUser.userPoint} 원</span>
							</a>
						</li>
                      
                        <div class="topbar-divider d-none d-sm-block"></div>

                        <!-- Nav Item - User Information -->
                        <li class="nav-item dropdown no-arrow">
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small">${loginUser.userName}</span>
                            </a>
                            <!-- Dropdown - User Information -->
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="userDropdown">
                                <a class="dropdown-item" href="${pageContext.request.contextPath}/modifySystemAdminInfo">
                                    <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                                    개인 정보 변경
                                </a>
                                <a class="dropdown-item" href="${pageContext.request.contextPath}/modifySystemAdminPw">
                                    <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                                    비밀번호 변경
                                </a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="${pageContext.request.contextPath}/logout" data-toggle="modal" data-target="#logoutModal">
                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                    로그아웃
                                </a>
                            </div>
                        </li>

                    </ul>

                </nav>
                <!-- End of Topbar -->
                
                <!-- Bootstrap core JavaScript-->
			    <script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
			    <script src="${pageContext.request.contextPath}/resources/vendor/bootstrap_sb/js/bootstrap.bundle.min.js"></script>
                
                <!-- Logout Modal-->
			    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
			        aria-hidden="true">
			        <div class="modal-dialog" role="document">
			            <div class="modal-content">
			                <div class="modal-header">
			                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
			                </div>
			                <div class="modal-body">현재의 로그인 세션을 종료하시겠습니까?</div>
			                <div class="modal-footer">
			                    <button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
			                    <a class="btn btn-primary" href="${pageContext.request.contextPath}/logout">로그아웃</a>
			                </div>
			            </div>
			        </div>
			    </div>