<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Dashboard</title>
    
    

    
    <!-- Custom fonts for this template-->
    <link href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    
    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.css" rel="stylesheet" type="text/css">
    <link href="https://cdn.datatables.net/1.11.3/css/dataTables.bootstrap4.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">
    
		<!-- header 불러오기 -->
		<c:import url="/partial/memberHeader.jsp"></c:import>
		
                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">포인트</h1>
                    </div>
                    
                    <!-- Content Row -->
                    <div class="row">
						
                        <!-- Content Column -->
                        <div class="col-xl-4 col-lg-5">
		                    <!-- 포인트 충전 카드 -->
		                    <div class="card shadow mb-4">
		                        <div class="card-header py-3">
		                            <h6 class="m-0 font-weight-bold text-primary">충전할 금액을 입력해 주세요.</h6>
		                        </div>
		                        <div class="card-body">
									<form class="user" action="${pageContext.request.contextPath}/earnPoint" method="post">
									    <div class="form-group">
									        <input type="hidden" class="form-control form-control-user"
									            id="loginUserId" aria-describedby="emailHelp"
									            placeholder="Enter Email Address..." name="memberId"  value="${loginUser.userId}">
									    </div>
									    <div class="form-group">
									        <input type="text" class="form-control form-control-user"
									            id="exampleInputPassword" placeholder="충전금액" name="memberPoint">
									    </div>     
									    <button type="submit" class="btn btn-primary btn-user btn-block">충전</button>
									</form>
		                        </div>
		                    </div>
		                     <!-- 포인트 전환 카드 -->
		                    <div class="card shadow mb-4">
		                        <div class="card-header py-3">
		                            <h6 class="m-0 font-weight-bold text-primary">전환할 금액을 입력해 주세요.</h6>
		                        </div>
		                        <div class="card-body">
									<form class="user" action="${pageContext.request.contextPath}/spendPoint" method="post">
									    <div class="form-group">
									        <input type="hidden" class="form-control form-control-user"
									            id="exampleInputEmail" aria-describedby="emailHelp"
									            placeholder="Enter Email Address..." name="memberId"  value="${loginUser.userId}">
									    </div>
									    <div class="form-group">
									        <input type="text" class="form-control form-control-user"
									            id="exampleInputPassword" placeholder="전환금액" name="memberPoint">
									    </div>
									    <button type="submit" class="btn btn-primary btn-user btn-block">전환</button>
									</form>
		                        </div>
		                    </div>
                        </div>
						
						

						<!-- pie chart -->                        
                        <div class="col-xl-8 col-lg-7 ">
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">Revenue Sources</h6>
                                    <div class="dropdown no-arrow">
                                        <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
                                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                            aria-labelledby="dropdownMenuLink">
                                            <div class="dropdown-header">Dropdown Header:</div>
                                            <a class="dropdown-item" href="#">Action</a>
                                            <a class="dropdown-item" href="#">Another action</a>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="#">Something else here</a>
                                        </div>
                                    </div>
                                </div>
                                <!-- Card Body -->
                                <div class="card-body">
                                    <div class="chart-pie pt-4 pb-2">
                                        <canvas id="myPieChart"></canvas>
                                    </div>
                                    <div class="mt-4 text-center small">
                                        <span class="mr-2">
                                            <i class="fas fa-circle text-primary"></i> Direct
                                        </span>
                                        <span class="mr-2">
                                            <i class="fas fa-circle text-success"></i> Social
                                        </span>
                                        <span class="mr-2">
                                            <i class="fas fa-circle text-info"></i> Referral
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div> 
                    </div>              
                    
                    <!-- Content Row --> 
                    <div class="row">

                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-primary shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                                Earnings (Monthly)</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">$40,000</div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-calendar fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-success shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                                Earnings (Annual)</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">$215,000</div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-info shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-info text-uppercase mb-1">Tasks
                                            </div>
                                            <div class="row no-gutters align-items-center">
                                                <div class="col-auto">
                                                    <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">50%</div>
                                                </div>
                                                <div class="col">
                                                    <div class="progress progress-sm mr-2">
                                                        <div class="progress-bar bg-info" role="progressbar"
                                                            style="width: 50%" aria-valuenow="50" aria-valuemin="0"
                                                            aria-valuemax="100"></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Pending Requests Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-warning shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                                Pending Requests</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">18</div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-comments fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <!-- pointHisory Row -->
					<div class="row">
						<div class="col-xl-12 col-lg-12">
							<!-- DataTales Example -->
						    <div class="card shadow mb-4">
						        <div class="card-header py-3">
						            <h6 class="m-0 font-weight-bold text-primary">포인트 이용 내역</h6>
						        </div>
						        <div class="card-body">
						            <div class="table-responsive" id="pointHistorylistDiv">
						                <table class="table table-bordered" id="pointHistoryDataTable" width="100%"  cellspacing="0">
						                    <thead>
						                        <tr>
						                            <th>금액</th>
						                            <th>변동금액</th>
						                            <th>유형</th>
						                            <th>이용날짜</th>
						                        </tr>
						                    </thead>
						                    <tfoot>
						                        <tr>
						                            <th>금액</th>
						                            <th>변동금액</th>
						                            <th>유형</th>
						                            <th>이용날짜</th>
						                        </tr>
						                    </tfoot>
						                </table>
						            </div>
						        </div>
						    </div>
                        </div>
                    </div>
                        
                    <!-- Content Row -->

                    <div class="row">
                        <!-- Area Chart -->
                        <div class="col-xl-12 col-lg-7">
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">Earnings Overview</h6>
                                    <div class="dropdown no-arrow">
                                        <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
                                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                            aria-labelledby="dropdownMenuLink">
                                            <div class="dropdown-header">Dropdown Header:</div>
                                            <a class="dropdown-item" href="#">Action</a>
                                            <a class="dropdown-item" href="#">Another action</a>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="#">Something else here</a>
                                        </div>
                                    </div>
                                </div>
                                <!-- Card Body -->
                                <div class="card-body">
                                    <div class="chart-area">
                                        <canvas id="myAreaChart"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Your Website 2021</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>
		
    <!-- Bootstrap core JavaScript-->
    <script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/vendor/bootstrap_sb/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="${pageContext.request.contextPath}/resources/vendor/jquery-easing/jquery.easing.min.js">

    </script>

    <!-- Custom scripts for all pages-->
    <script src="${pageContext.request.contextPath}/resources/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="${pageContext.request.contextPath}/resources/vendor/chart.js/Chart.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="${pageContext.request.contextPath}/resources/js/demo/chart-area-demo.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/demo/chart-pie-demo.js"></script>
    
    
    <!-- 데이터테이블 사용하기위한 임포트 스크립트 -->
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
     <script src="https://cdn.datatables.net/1.11.3/js/dataTables.bootstrap4.min.js"></script>
    <script>
    
   	// dataTable 설정 스크립트
   	jQuery(document).ready(function() {
   		
   		// 회원 아이디를 저장
   		let userId= $("#loginUserId").val();
   		
   		// 저장된 아이디로 회원의 포인트 이용 내역을 조회하는 ajax 실행
   		$("#pointHistoryDataTable").DataTable({
   			ajax:{url:"${pageContext.request.contextPath}/point/getPointHistoryList",
   				type: 'get',
   				data: {'userId': userId},
   			},
   			// 날짜 최신순으로 정렬
   			order:[[3,"desc"]],
   			// 테이블 속 컬럼 설정
   			columnDefs:[
   				// 포인트(3자리 수마다 ','를 찍어주고 끝에 0을 붙임)
   				{targets: 0,data: "point", render: $.fn.dataTable.render.number(  ',' , '.' , 0 , '' , '원' ) },
   				// 포인트 변동 금액(증가면 +, 감소면 -를 앞에 붙임 )
   				{targets: 1,data: "changedPoint",  render: function (data, type, rows){
   					
   					var money;
   					
   					if (rows.pointHistoryCategory=="충전") {
   						money = "+ " + data.toLocaleString();
   					} else{
   						money = "- " + data.toLocaleString();
   					}
   					
   					return money;
   					},
   				},
   				// 포인트 이용 내용(유형)
   				{targets: 2, data: "pointHistoryCategory"},
   				// 포인트 이용 날짜(yyyy년 mm월 dd일 hh시 mm분 ss초)
   				{targets: 3, data: "createDate", render: function (data,type,rows){
   					var year = data.substring(0,4);
   					var month = data.substring(5,7);
   					var day = data.substring(8,10);
   					var hour = data.substring(11,13);
   					var muinit = data.substring(14,16);
   					var second = data.substring(17,19);
   					
   					let TimeFormat = year + "년 " + month + "월 " + day + "일 " + hour + "시 " + muinit + "분 "+ second + "초";
   					return TimeFormat;
   				} }
   			]
   		});
   	});
   	</script>
</body>

</html>