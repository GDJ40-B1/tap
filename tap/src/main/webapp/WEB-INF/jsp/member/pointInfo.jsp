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

    <title>포인트</title>
    
    <!-- Favicons -->
    <link href="${pageContext.request.contextPath}/resources/img/tap_favicon.png" rel="icon">
    <link href="${pageContext.request.contextPath}/resources/img/tap_favicon.png" rel="apple-touch-icon">

    
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
                        <div class="col-xl-8 col-lg-8" >
                            <div class="card shadow mb-4" style="height: 95%">
                                <!-- Card Header - Dropdown -->
                                <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">포인트 이용 비율</h6>
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
                                <div class="card-body align-middle" style="vertical-align:middle;">
                                    <div class="chart-pie pt-4 pb-2"  style="min-height:360px">  
                                        <canvas id="myPieChart" ></canvas>
                                    </div>
                                </div>
                            </div>
                        </div> 
                    </div>              
                    
                    <!-- Content Row --> 
                    <div class="row">

                        <!-- 충전 금액 카드 -->
                        <div class="col-xl-4 col-md-6 mb-4">
                            <div class="card border-left-primary shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xl font-weight-bold text-primary text-uppercase mb-1">
                                                충전 금액</div>
                                            <div id="chargeSummary" class="h4 mb-0 font-weight-bold text-gray-800"></div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- 전환 금액 카드 -->
                        <div class="col-xl-4 col-md-6 mb-4">
                            <div class="card border-left-info shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xl font-weight-bold text-info text-uppercase mb-1">
                                                전환 금액</div>
                                            <div id="transSummary" class="h4 mb-0 font-weight-bold text-gray-800"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <!-- 수입 금액 카드 -->
                        <div class="col-xl-4 col-md-6 mb-4">
                            <div class="card border-left-success shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xl font-weight-bold text-success text-uppercase mb-1">
                                                수입 금액</div>
                                            <div id="earnSummary" class="h4 mb-0 font-weight-bold text-gray-800"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- 지출 금액 카드 -->
                        <div class="col-xl-4 col-md-6 mb-4">
                            <div class="card border-left-danger shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xl font-weight-bold text-danger text-uppercase mb-1">지출 금액
                                            </div>
                                            <div class="row no-gutters align-items-center">
                                                <div class="col-auto">
                                                    <div id="spendSummary" class="h4 mb-0 mr-3 font-weight-bold text-gray-800"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- 환불 금액 카드 -->
                        <div class="col-xl-4 col-md-6 mb-4">
                            <div class="card border-left-warning shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xl font-weight-bold text-warning text-uppercase mb-1">
                                                환불 금액</div>
                                            <div id="refundSummary" class="h4 mb-0 font-weight-bold text-gray-800"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                         <!-- 이용 횟수 카드 -->
                        <div class="col-xl-4 col-md-6 mb-4">
                            <div class="card border-left-secondary  shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xl font-weight-bold text-secondary  text-uppercase mb-1">
                                                이용 횟수</div>
                                            <div id="countSummary" class="h4 mb-0 font-weight-bold text-gray-800"></div>
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
                <!-- /.container-fluid -->

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
   					
   					if (rows.pointCategory=="충전" || rows.pointCategory=="수입") {
   						money = "+ " + data.toLocaleString() + "원";
   					} else{
   						money = "- " + data.toLocaleString() + "원";
   					}
   					
   					return money;
   					},
   				},
   				// 포인트 이용 내용(유형)
   				{targets: 2, data: "pointCategory"},
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
   		
   		// 포인트 이용 유형별 횟수를 도넛 차트로
   		$.ajax({
   		    type: 'get', //post method
   		    url: '${pageContext.request.contextPath}/point/getPointHistoryCategoryCount',
   		 	data: {'userId': userId},
   		    success: function (result, textStatus)
   		    {
   		        console.log(result);
   		    	
   		        let charge = result.countData.charge;
	   		    let trans = result.countData.trans;
	   		    let earn = result.countData.earn;
		   		let spend = result.countData.spend;
		   		let refund = result.countData.refund;
		   		
		   		var ctx = document.getElementById("myPieChart");
			   	var myPieChart = new Chart(ctx, {
			   	  type: 'doughnut',
			   	  data: {
			   	    labels: ["충전", "전환", "수입", "지출", "환불"],
			   	    datasets: [{
			   	      data: [charge, trans, earn, spend, refund],
			   	      backgroundColor: ['#4e73df', '#36b9cc', '#1cc88a', '#e74a3b', '#f6c23e'],
			   	    }],
			   	  },
			   	  options: {
			   	    maintainAspectRatio: false,
			   	    tooltips: {
			   	      backgroundColor: "rgb(255,255,255)",
			   	      bodyFontColor: "#858796",
			   	      borderColor: '#dddfeb',
			   	      borderWidth: 1,
			   	      xPadding: 15,
			   	      yPadding: 15,
			   	      displayColors: false,
			   	      caretPadding: 10,
			   	    },
			   		pieceLabel: { mode: 'percentage',fontColor: '#000'},
			   	    legend: {
			   	      display: true,
			   	      position: 'left',
			   	      labels:{
			   	    	padding: 25, 
			   	    	usePointStyle: true, 
			   	    	pointStyle: "circle",
			   	    	font: { size: 20 }
			   	      }
			   	    },
			   	    cutoutPercentage: 65,
			   	  }
			   	});
   		    }
   		});
   		
   		// 포인트 이용 유형별 금액을 카드로
   		$.ajax({
   		    type: 'get', //post method
   		    url: '${pageContext.request.contextPath}/point/getPointHistoryCategorySummary',
   		 	data: {'userId': userId},
   		 	success: function(result, textStatus) {
   		 			console.log(result);
   		 			
   		 			let count = result.summaryData.count;
   	   		        let charge = result.summaryData.charge;
   		   		    let trans = result.summaryData.trans;
   		   		    let earn = result.summaryData.earn;
   			   		let spend = result.summaryData.spend;
   			   		let refund = result.summaryData.refund;
   			   		
   			   		console.log(count);
   			   		console.log(charge);
   			   		
   			   		// toLocaleString 은 숫자 데이터를 클라이언트의 국가에 맞춰서 일정 단위마다 ','를 찍어주는 함수
   			   		$("#chargeSummary").append(charge.toLocaleString() + " 원");
   			   		$("#transSummary").append(trans.toLocaleString() + " 원");
   			   		$("#earnSummary").append(earn.toLocaleString() + " 원");
   			   		$("#spendSummary").append(spend.toLocaleString() + " 원");
   			   		$("#refundSummary").append(refund.toLocaleString() + " 원");
   			 		$("#countSummary").append(count.toLocaleString() + " 회");
   			   		
   		 		}
   		 	});
   	});
   	</script>
	
   	<!-- pie chart --> 
   	<!--    
   	<script>
	   	var ctx = document.getElementById("myPieChart");
	   	var myPieChart = new Chart(ctx, {
	   	  type: 'doughnut',
	   	  data: {
	   	    labels: ["Direct", "Referral", "Social"],
	   	    datasets: [{
	   	      data: [55, 30, 15],
	   	      backgroundColor: ['#4e73df', '#1cc88a', '#36b9cc'],
	   	      hoverBackgroundColor: ['#2e59d9', '#17a673', '#2c9faf'],
	   	      hoverBorderColor: "rgba(234, 236, 244, 1)",
	   	    }],
	   	  },
	   	  options: {
	   	    maintainAspectRatio: false,
	   	    tooltips: {
	   	      backgroundColor: "rgb(255,255,255)",
	   	      bodyFontColor: "#858796",
	   	      borderColor: '#dddfeb',
	   	      borderWidth: 1,
	   	      xPadding: 15,
	   	      yPadding: 15,
	   	      displayColors: false,
	   	      caretPadding: 10,
	   	    },
	   	    legend: {
	   	      display: false
	   	    },
	   	    cutoutPercentage: 80,
	   	  },
	   	});
   	</script>
	-->
</body>

</html>