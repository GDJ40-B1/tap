<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

<<<<<<< HEAD
    <title>호스트 마이 페이지 | TAP</title>
=======
    <title>마이페이지</title>
    
    <!-- Favicons -->
    <link href="${pageContext.request.contextPath}/resources/img/tap_favicon.png" rel="icon">
    <link href="${pageContext.request.contextPath}/resources/img/tap_favicon.png" rel="apple-touch-icon">
>>>>>>> branch 'main' of https://github.com/GDJ40-B1/tap.git
    
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

<body id="page-top">
    
		<!-- header 불러오기 -->
		<c:import url="/partial/hostHeader.jsp"></c:import>
		
            <!-- Begin Page Content -->
            <div class="container-fluid">

                    
                    <!-- 호스트정보 카드 -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">호스트정보</h6>
                        </div>
                        <div class="card-body">
                            <h4 class="small font-weight-bold">아이디 <span
                                    class="float-right">${host.hostId}</span></h4>
                            <h4 class="small font-weight-bold">이름 <span
                                    class="float-right">${host.hostName}</span></h4>
                            <h4 class="small font-weight-bold">사업자 번호 <span
                                    class="float-right">${host.businessNumber}</span></h4>
                            <h4 class="small font-weight-bold">나이 <span
                                    class="float-right">${host.hostAge}</span></h4>
                            <h4 class="small font-weight-bold">전화번호 <span
                                    class="float-right">${host.hostPhone}</span></h4>
                            <h4 class="small font-weight-bold">보유 포인트 <span
                                    class="float-right">${host.hostPoint} 원</span></h4>
                            <h4 class="small font-weight-bold">가입날짜 <span
                                    class="float-right">${host.createDate.substring(0,11)}</span></h4>
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
                                                총 수익 포인트</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">${revenueHost}원</div>
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
                                                ${year}년 수익 포인트</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">${yearRevenueHost}원</div>
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
                                                등록 숙소 문의 미답변 수</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">${unansweredRoomQnaCount}개</div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-comments fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Content Row -->
					<!-- 등록한 숙소가 없는 경우 해당 div를 아예 안보이게 하거나 차트에서 표현할 방법 필요 -->
                    <div class="row">

                        <!-- Area Chart -->
                        <div class="col-xl-8 col-lg-7">
                            <div class="card shadow mb-4">
                                <div id="roomChart"
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary" style="width: 44%;">${year}년 ${roomName} 월별 숙소 이용객 수</h6>
                                    <c:if test="${!empty roomList}">
										<select class="form-control" name="room" id="room" style="width: 40%;">
											<c:forEach var="s" items="${roomList}">
												<option value="${s.roomId}">${s.roomName}</option>
											</c:forEach>
										</select>
										<select class="form-control" name="year" id="year" style="width: 20%; margin-left: 3%;"></select>
										<button class="btn btn-primary" id="roomAndYearBtn" type="button" style="width: 10%; margin-left: 3%;">조회</button>
									</c:if>
                                </div>
                                <!-- Card Body -->
                                <div class="card-body">
                                    <div class="chart-area">
                                        <canvas id="myBarChart"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Pie Chart -->
                        <div class="col-xl-4 col-lg-5">
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">${year}년 ${roomName} 이용 연령층</h6>
                                </div>
                                <!-- Card Body -->
                                <div class="card-body">
                                    <div class="chart-pie pt-4 pb-2">
                                        <canvas id="myPieChart"></canvas>
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
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

	<script>
		$(function(){
			selectYear();
		});   
	
		function selectYear(){
			var date = new Date();
			var year = date.getFullYear();
			for(var i=(year); i >= (year-10); i--) {
				$("#year").append("<option value='"+i+"'>" + i + "</option>");
			}
		}
	</script>
	
	<script>	
		$('#roomAndYearBtn').click(function(){
			var roomId = $("#room option:selected").val();
			var roomName = $("#room option:selected").text();
			var year = $("#year option:selected").val();
			
			location.href="${pageContext.request.contextPath}/hostMyPage?roomId="+roomId+"&year="+year+"&roomName="+roomName;
		});
    </script>
	
	<!-- Page level plugins -->
    <script src="${pageContext.request.contextPath}/resources/vendor/chart.js/Chart.min.js"></script>
	
	<script>
	var arr = new Array();
	var arr2 = new Array();
	var arr3 = new Array();
	var arr4 = new Array();
	
	<c:forEach items="${list}" var="m">
		arr.push("${m.monthList}");
		arr2.push("${m.userNum}");
	</c:forEach>

	<c:forEach items="${roomMonthRevenue}" var="r">
		arr3.push("${r.price}");
	</c:forEach>
	
	<c:forEach items="${monthRevenueHost}" var="mr">
		arr4.push("${mr.price}");
	</c:forEach>
	
	console.log(arr);
	console.log(arr2);
	console.log(arr3);
	console.log(arr4);

	var ctx = document.getElementById("myBarChart");
	var myBarChart = new Chart(ctx, {
	  type: 'bar',
	  data: {
	    labels: arr,
	    datasets: [{
	      label: "이용객 수",
	      backgroundColor: "#4e73df",
	      hoverBackgroundColor: "#2e59d9",
	      borderColor: "#4e73df",
	      data: arr2
	    },
	    
	    {
		      label: "숙소 수익",
		      backgroundColor: "#4e73df",
		      hoverBackgroundColor: "#2e59d9",
		      borderColor: "#4e73df",
		      data: arr3
		    },
		    
		    {
		      label: "총 수익",
		      backgroundColor: "#4e73df",
		      hoverBackgroundColor: "#2e59d9",
		      borderColor: "#4e73df",
		      data: arr4
		    }],
	  },
	  options: {
	    maintainAspectRatio: false,
	    layout: {
	      padding: {
	        left: 10,
	        right: 25,
	        top: 25,
	        bottom: 0
	      }
	    },
	    scales: {
	      xAxes: [{
	        time: {
	          unit: 'month'
	        },
	        gridLines: {
	          display: false,
	          drawBorder: false
	        },
	        ticks: {
	          maxTicksLimit: 6
	        },
	        maxBarThickness: 25,
	      }],
	      yAxes: [{
	        ticks: {
	          min: 0,
	          max: 10000000,
	          maxTicksLimit: 8,
	          padding: 10,
	        },
	        gridLines: {
	          color: "rgb(234, 236, 244)",
	          zeroLineColor: "rgb(234, 236, 244)",
	          drawBorder: false,
	          borderDash: [2],
	          zeroLineBorderDash: [2]
	        }
	      }],
	    },
	    legend: {
	      display: false
	    },
	    tooltips: {
	      titleMarginBottom: 10,
	      titleFontColor: '#6e707e',
	      titleFontSize: 14,
	      backgroundColor: "rgb(255,255,255)",
	      bodyFontColor: "#858796",
	      borderColor: '#dddfeb',
	      borderWidth: 1,
	      xPadding: 15,
	      yPadding: 15,
	      displayColors: false,
	      caretPadding: 10,
	    },
	  }
	});

	</script>
	
	<script>
	var arr5 = new Array();
	var arr6 = new Array();
	
	<c:forEach items="${ageList}" var="a">
		arr5.push("${a.ageGroup}");
		arr6.push("${a.age}");
	</c:forEach>
	
	console.log(arr5);
	console.log(arr6);

	var ctx = document.getElementById("myPieChart");
	var myPieChart = new Chart(ctx, {
	  type: 'pie',
	  data: {
	    labels: arr5,
	    datasets: [{
	      backgroundColor: ['#4e73df', '#1cc88a', '#36b9cc', '#e34f66', '#ebe86e', '#e8c25a'],
	      hoverBackgroundColor: ['#2e59d9', '#17a673', '#2c9faf', '#b8273d', '#c7c332', '#bd9426'],
	      hoverBorderColor: "rgba(234, 236, 244, 1)",
	      data: arr6,
	    }],
	  },
	  options: {
		    maintainAspectRatio: false,
		    tooltips: {
		      backgroundColor: "rgb(255,255,255)",
		      bodyFontColor: "#858796",
		      borderColor: '#dddfeb',
		      borderWidth: 1,
		      displayColors: false,
		      caretPadding: 10,
		    },
		  },
		});
	</script>   	
	
    <!-- Core plugin JavaScript-->
    <script src="${pageContext.request.contextPath}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>
    
    <!-- Custom scripts for all pages-->
    <script src="${pageContext.request.contextPath}/resources/js/sb-admin-2.min.js"></script>

</body>

</html>