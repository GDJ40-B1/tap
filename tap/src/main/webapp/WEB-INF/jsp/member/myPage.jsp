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

    <title>마이페이지</title>
    
    <!-- Favicons -->
    <link href="${pageContext.request.contextPath}/resources/img/tap_favicon.png" rel="icon">
    <link href="${pageContext.request.contextPath}/resources/img/tap_favicon.png" rel="apple-touch-icon">
	
	<script src="http://code.jquery.com/jquery-latest.js"></script> 
	
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
		<c:import url="/partial/memberHeader.jsp"></c:import>
		

                <!-- Begin Page Content -->
                <div class="container-fluid">
                    
                    <!-- 회원정보 카드 -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">회원정보</h6>
                        </div>
                        <div class="card-body">
                            <h4 class="small font-weight-bold">아이디 <span
                                    class="float-right">${member.memberId}</span></h4>
                            <h4 class="small font-weight-bold">이름 <span
                                    class="float-right">${member.memberName}</span></h4>
                            <h4 class="small font-weight-bold">나이 <span
                                    class="float-right">${member.memberAge}</span></h4>
                            <h4 class="small font-weight-bold">전화번호 <span
                                    class="float-right">${member.memberPhone}</span></h4>
                            <h4 class="small font-weight-bold">가입날짜 <span
                                    class="float-right">${member.createDate.substring(0,11)}</span></h4>
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
                                                서비스 총 결제 횟수</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">${totalPaymentCount}번 결제</div>
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
                                                보유 쿠폰 수</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">${couponCount}개</div>
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
                                                현재 포인트</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">${point}원</div>
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

                    <div class="row">

                        <!-- Area Chart -->
                        <div class="col-xl-8 col-lg-7">
                            <div class="card shadow mb-4">
                                <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">${year}년 결제 금액</h6>
									<select name="year" id="year" onchange="selectYear()">
										<option value="">연도 선택</option>
									</select>
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
                                <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">${year}년 숙소 결제 금액 비율</h6>
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
                <!-- /.container-fluid -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>
	
	<script>
	   $('#removeFavorites').click(function() {
           var roomId = $(this).val();
           var memberId = "${member.memberId}";

           console.log("roomId: " + roomId);
           console.log("memberId: " + memberId);

           var form = {
               roomId : roomId,
               memberId : memberId,
           };

           $.ajax({
               type : 'POST',
               contentType: "application/x-www-form-urlencoded; charset=UTF-8",
               url : '${pageContext.request.contextPath}/removeFavorites',
               cache : false,
               data : form,
               success : function(result) {
                   console.log(result);
                   console.log("즐겨찾기 삭제 완료")
                   alert('즐겨찾기 등록을 취소했습니다.');
                   location.reload();
               },
               error : function(e) {
                   console.log(e);
                   alert('문제가 발생했습니다.');
                   location.reload();
               }
           })
	   });   
    </script> 
	
    <!-- Core plugin JavaScript-->
    <script src="${pageContext.request.contextPath}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="${pageContext.request.contextPath}/resources/js/sb-admin-2.min.js"></script>

 	<script>
		$(function(){
			yearList();
		});   
	
		function yearList(){
			var date = new Date();
			var year = date.getFullYear();
			for(var i=(year); i >= (year-10); i--) {
				$("#year").append("<option value='"+i+"'>" + i + "</option>");
			}
		}
	</script>
	
	<script>	
		function selectYear(){
			var year = $("#year option:selected").val();
			
			location.href="${pageContext.request.contextPath}/myPage?year="+year;
		}
    </script>

	<!-- Page level plugins -->
    <script src="${pageContext.request.contextPath}/resources/vendor/chart.js/Chart.min.js"></script>
	
	<script>
	var arr = new Array();
	var arr2 = new Array();
	
	<c:forEach items="${totalPaymentList}" var="r">
		arr.push("${r.monthList}");
		arr2.push("${r.price}");
	</c:forEach>
	
	console.log(arr);
	console.log(arr2);

	var ctx = document.getElementById("myBarChart");
	var myBarChart = new Chart(ctx, {
	  type: 'bar',
	  data: {
	    labels: arr,
	    datasets: [{
	      label: "월 결제 금액",
	      backgroundColor: "#4e73df",
	      hoverBackgroundColor: "#2e59d9",
	      borderColor: "#4e73df",
	      data: arr2,
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
	          maxTicksLimit: 12
	        },
	        maxBarThickness: 25,
	      }],
	      yAxes: [{
	        ticks: {
	          min: 0,
	          max: 5000000,
	          maxTicksLimit: 12,
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
	      callbacks: {
              label: function(tooltipItem, data) {
                  return tooltipItem.yLabel.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "원"; 
                  }
	    	},
	    },
	  }
	});

	</script>

	<script>
	var arr3 = new Array();
	var arr4 = new Array();
	
	<c:forEach items="${roomTotalPayment}" var="r">
		arr3.push("${r.roomName}");
		arr4.push("${r.price}");
	</c:forEach>
	
	console.log(arr3);
	console.log(arr4);

	var ctx = document.getElementById("myPieChart");
	var myPieChart = new Chart(ctx, {
	  type: 'pie',
	  data: {
	    labels: arr3,
	    datasets: [{
	      backgroundColor: ['#4e73df', '#1cc88a', '#36b9cc', '#e34f66', '#ebe86e', '#e8c25a'],
	      hoverBackgroundColor: ['#2e59d9', '#17a673', '#2c9faf', '#b8273d', '#c7c332', '#bd9426'],
	      hoverBorderColor: "rgba(234, 236, 244, 1)",
	      data: arr4,
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
</body>

</html>