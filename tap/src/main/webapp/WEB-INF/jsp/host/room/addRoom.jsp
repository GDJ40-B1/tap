<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.js"></script> 
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body id="page-top">
	<!-- start : hostHeader -->
    <div>
    	<jsp:include page="/partial/hostHeader.jsp"></jsp:include>
    </div>
    <!-- end : hostHeader -->
    
    <!-- start : content -->
	<div id="content" class="container-fluid">
	
		<!-- breadcrumb : 3 level이 되는 부분부터 사용 -->
		<nav aria-label="breadcrumb">
			<ol class="breadcrumb bg-gray-100">
				<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/hostMyPage">홈</a></li>
				<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/host/roomList">숙소목록</a></li>
				<li class="breadcrumb-item active" aria-current="page">숙소등록</li>
			</ol>
		</nav>
		
		<h1 class="h3 mb-4 text-gray-800">숙소 등록</h1>
		<br>
		
		<form id="addRoomForm" action="${pageContext.request.contextPath}/host/addRoom" method="post" enctype="multipart/form-data">
			<!-- 전달을 위한 값 hidden처리 -->
			<input type="hidden" name="hostId" value="${hostId }">
			<input type="hidden" id="amenities" name="amenities">
			<input type="hidden" id="part" name="part">
			
			<div class="form-group row">
				<div class="col-sm-6 mb-3 mb-sm-0">
					<label>숙소명</label>
					<input type="text" class="form-control form-control-user" name="roomName" id="roomName" placeholder="숙소명을 입력하세요">
				</div>
				
				<div class="col-sm-6 mb-3 mb-sm-0">
					<label>카테고리</label>
					<select class="form-control" name="roomCategory">
						<c:forEach items="${roomCategoryList }" var="c">
							<option>${c }</option>
						</c:forEach>
					</select>
				</div>
			</div>
			
			<div class="form-group">
				<label for="exampleFormControlTextarea1">소개</label>
				<textarea class="form-control" name="roomIntro" id="roomIntro" rows="5"></textarea>
			</div>
			
			<div class="form-group row">
				<!-- select 방식으로 변경 예정 -->
				<div class="col-sm-6 mb-3 mb-sm-0">
					<label>숙소 형태</label>
					<input type="text" class="form-control form-control-user" name="roomForm" id="roomForm" placeholder="숙소 형태를 입력하세요">
				</div>
				
				<div class="col-sm-6 mb-3 mb-sm-0">
					<label>가격</label>
					<input type="number" class="form-control form-control-user" name="roomPrice" id="roomPrice" placeholder="숙박 기본 가격를 입력하세요">
				</div>
			</div>
			
			<div class="form-group row">
				<div class="col-sm-6 mb-3 mb-sm-0">
					<label>인원수</label>
					<input type="number" class="form-control form-control-user" name="peopleNum" id="peopleNum" placeholder="적정 인원수를 입력하세요">
				</div>
				
				<div class="col-sm-6 mb-3 mb-sm-0">
					<label>최소 숙박일</label>
					<input type="number" class="form-control form-control-user" name="minDay" id="minDay" placeholder="최소 숙박일을 입력하세요">
				</div>
			</div>
			
			<div class="form-group row">
				<div class="col-sm-6 mb-3 mb-sm-0">
					<label>체크인 시간</label>
					<select class="form-control" name="checkInTime">
						<c:forEach  var="CIT" begin="0" end="23">
							<c:choose>
								<c:when test="${CIT<10 }">
									<option>0${CIT }:00</option>
								</c:when>
								<c:otherwise>
									<option>${CIT }:00</option>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</select>
				</div>
				
				<div class="col-sm-6 mb-3 mb-sm-0">
					<label>체크아웃 시간</label>
					<select class="form-control" name="checkOutTime">
						<c:forEach  var="COT" begin="0" end="23">
							<c:choose>
								<c:when test="${COT<10 }">
									<option>0${COT }:00</option>
								</c:when>
								<c:otherwise>
									<option>${COT }:00</option>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</select>
				</div>
			</div>
			
			<div class="form-group row">
				<!-- select 방식으로 변경 예정 -->
				<div class="col-sm-6 mb-3 mb-sm-0">
					<label>주소</label>
					<div class="input-group mb-3">
						<input type="text" class="form-control" name="detailAddress" id="address" placeholder="주소를 검색하세요">
						<div class="input-group-append">
							<button class="btn btn-outline-secondary" type="button" id="searchBtn">지도</button>
						</div>
					</div>
				</div>
				
				<div class="col-sm-6 mb-3 mb-sm-0">
					<label>상세 주소</label>
					<input type="text" class="form-control form-control-user" name="detailAddress2" id="detailAddress2" placeholder="상세 주소를 입력하세요">
				</div>
			</div>
			
			<div class="form-group">
				<div id="map" style="width:100%;height:350px;"></div>
			</div>
			
			<div class="form-group">
				<label>숙소 사진</label>
				<div class="input-group mb-3">
				  <div class="custom-file">
				    <input multiple="multiple" type="file" name="file" class="custom-file-input">
				    <label class="custom-file-label" for="inputGroupFile02">사진을 한꺼번에 드래그해서 넣어주세요.</label>
				  </div>
				</div>
			</div>
			
			<div class="form-group row">
				<div class="col-sm-6 mb-3 mb-sm-0">
					<label>숙소 구성</label>
					<c:forEach items="${partList }" var="p">
						<div class="form-group row">
						    <label for="inputPassword" class="col-sm-2 col-form-label">${p}</label>
						    <div class="col-sm-10">
						        <input type="number" class="form-control" id="${p }-part" value="0">
						    </div>
						</div>
					</c:forEach>
				</div>
				
				<div class="col-sm-6 mb-3 mb-sm-0">
					<label>숙소 비품</label><br>
					<c:forEach items="${amenitiesList }" var="a">
						<div class="form-check form-check-inline">
						  <input class="form-check-input" type="checkbox" id="${a }-amenities" name="checkAmenities" value="${a }">
						  <label class="form-check-label" for="${a }-amenities">${a }</label>
						</div>
					</c:forEach>
				</div>
			</div>
			
			<div class="form-group">
				<label>해시태그</label>
				<input class="form-control" type="text" id="hashtag" name="hashtag" value="#">
			</div>
			
			<br>
			<button type="button" class="btn btn-primary btn-lg btn-block"  id="addBtn">숙소 등록</button>
			<br>
		</form>
	</div>
	
	<!-- start : hostFooter -->
	<div>
    	<jsp:include page="/partial/hostFooter.jsp"></jsp:include>
    </div>
    <!-- end : hostFooter -->
   
	<script>
		<!-- input 유효성 검사 -->
		
		// 숙소 등록을 클릭했을 때
		$('#addBtn').click(function(){
			if($('#roomName').val()==''){
				alert('숙소명을 입력하세요');
			} else if($('#roomForm').val()==''){
				alert('숙소 형태를 입력하세요');
			} else if($('#roomIntro').val()==''){
				alert('숙소 소개를 입력하세요');
			} else if($('#minDay').val()==''){
				alert('최소숙박일을 숫자만으로 입력하세요');
			} else if($('#peopleNum').val()==''){
				alert('인원수를 숫자만으로 입력하세요');
			} else if($('#roomPrice').val()==''){
				alert('숙소 가격을 숫자만으로 입력하세요');
			} else if($('#address').val()==''){
				alert('주소를 입력하세요');
			} else if($('#detailAddress2').val()==''){
				alert('상세 주소를 입력하세요');
			} else{
				<!-- 비품 추가-->
				var chk_arr = $("input[name='checkAmenities']");
				let chk_Val='';
				for( var i=0; i<chk_arr.length; i++ ) {
					if( chk_arr[i].checked == true ) {
						chk_Val += chk_arr[i].value+'/';
					}
				}
				$('#amenities').val(chk_Val);
				
				<!-- 구성 추가 -->
				let part_Val= '';
				<c:forEach items="${partList }" var="p">
					part_Val += '${p}'+'&'+$('#${p}-part').val()+'/';
				</c:forEach>
				$('#part').val(part_Val);
				console.log(part_Val);
				
				<!-- postAddRoom으로 이동 -->
				$('#addRoomForm').submit();
			}
		});
		
		<!-- 해시태그 관련 script -->
		
		// hashtag input에서 데이터를 모두 지워도 #은 남도록 한다.
		$('#hashtag').keydown(function(event) {
			var oldvalue=$(this).val();
			var field=this;
			setTimeout(function () {
			    if(field.value.indexOf('#') !== 0) {
			        $('#hashtag').val(oldvalue);
			    } 
			}, 1);
			
			// 스페이스바 기능 방지를 위한 변수
			var handled=false;
			  // 스페이스바 or 엔터를 칠 시 #자동생성
			  if (event.keyCode == '13') {
				  $('#hashtag').val($('#hashtag').val()+' #');
			  } else if(event.keyCode == '32'){
				  handled=true; // 기능 제한
				  $('#hashtag').val($('#hashtag').val()+' #');
			  }
			  
			  if(handled){
					event.preventDefault();
				}
		 });
		
	</script>
	
	<!-- kakao map API -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e1c10213787b97f0d88e77cdafcb6687&libraries=services"></script>
	<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  
	
	var map = new kakao.maps.Map(mapContainer, mapOption);
	
	$('#searchBtn').click(function(){
		// 버튼을 click했을때
		
		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch($('#address').val(), function(result, status) {
	
		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {
	
		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		        
		        let lat = result[0].y;
		        let lng = result[0].x;
		        getAddr(lat,lng);
		        function getAddr(lat,lng){
		            let geocoder = new kakao.maps.services.Geocoder();
	
		            let coord = new kakao.maps.LatLng(lat, lng);
		            let callback = function(result, status) {
		                if (status === kakao.maps.services.Status.OK) {
		                    $('#address').val(result[0].road_address.address_name);
		                }
		            }
		            geocoder.coord2Address(coord.getLng(), coord.getLat(), callback);
		        }
		        
		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords
		        });
	
		        // 인포윈도우로 장소에 대한 설명을 표시합니다
		        var infowindow = new kakao.maps.InfoWindow({
		            content: '<div style="width:150px;text-align:center;padding:6px 0;">숙소</div>'
		        });
		        infowindow.open(map, marker);
	
		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		    } 
		});  
	});
	  
	</script>
</body>
</html>