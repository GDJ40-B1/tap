<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
	<title>명소 추가</title>
	
	<!-- Favicons -->
	<link href="${pageContext.request.contextPath}/resources/img/tap_favicon.png" rel="icon">
	
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	
    <!-- Custom styles for this template-->
    <link href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">
	 
</head>
<body id="page-top">
	
    <!-- start : systemAdminHeader -->
    <div>
    	<jsp:include page="/partial/systemAdminHeader.jsp"></jsp:include>
    </div>
    <!-- end : systemAdminHeader -->
    
    <!-- start : content -->
	<div id="content" class="container-fluid">
		<!-- DataTales Example -->
	    <div class="card shadow mb-4">
	        <div class="card-header py-3">
	            <h6 class="m-0 font-weight-bold text-primary">명소 추가</h6>
	        </div>
	        <div class="card-body">
	        	
	            <div class="table-responsive">
	            	<form action="${pageContext.request.contextPath}/systemAdmin/addAttraction" method="post" enctype="multipart/form-data">
			
			<div class="form-group">
			<label>명소 사진</label>
			<div class="input-group mb-3">
				 <div class="custom-file">
				   <input multiple="multiple" type="file" name="file" class="custom-file-input">
				   <label class="custom-file-label" for="inputGroupFile02">사진을 한꺼번에 드래그해서 넣어주세요.</label>
				 </div>
			</div>
		</div>
				
		<div class="form-group">
			<label class="form-label mt-4">명소 이름</label>
			<div>
				<input type="text" name="attractionName" class="form-control">			
			</div>
		</div>
		<div class="form-group">
			<label class="form-label mt-4">카테고리</label>
			<div class="form-group">
				<select name="attractionCategory" class="form-control">
					<c:forEach items="${attractionCategoryList}" var="list">
						<option>${list }</option>
					</c:forEach>
				</select>			
			</div>

		</div>
		
		<div>
			<!-- 전화번호 형태? 예쁘게 만들기+숫자만 들어가게끔 하기 -->
			<label class="form-label mt-4">전화번호</label>
			<div>
				<input type="text" name="attractionPhoneNumber" class="form-control">
			</div>
		</div>
		
		<div class="form-group">
			<label class="form-label mt-4">명소 소개</label>
			<div>
			<textarea style="height:400px;"name="attractionContent" class="form-control"></textarea>
			</div>
		</div>
		<div>
			<label class="form-label mt-4">주소</label>
			<div>
				<input type="text" name="detailAddress" id="address" class="form-control" style="margin-bottom:10px;">
			</div>			
			<div>
				<button type="button" name="searchBtn"id="searchBtn"class="btn btn-secondary">찾기</button>
			</div>
			<div style="margin-top:10px;">상세주소</div>
			<div>
				<input type="text" name="detailAddress2" id="detailAddress2" class="form-control">
			</div>
			<div id="map" style="width:600px; height:359px; margin-top:20px; margin-bottom:10px;"></div>
			
			<div>
				<label class="form-label mt-4">해시태그</label>
			<div>
            	<input type="text" id="hashtag" name="hashtag" value="#" class="form-control">			
			</div>
         	</div>		
		</div>			
			<br>
			<button type="submit" id="addBtn" class="btn btn-outline-success">명소등록</button>
		</form>	

	            </div>
	        </div>
	    </div>

	</div>
	<!-- end : content -->
	
	<!-- start : systemAdminFooter -->
    <div>
       <jsp:include page="/partial/systemAdminFooter.jsp"></jsp:include>
    </div>
    <!-- end : systemAdminFooter -->
    

   <script>
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

   <!-- kakao API -->
   <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e1c10213787b97f0d88e77cdafcb6687&libraries=services"></script>
   
	<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  
	
	// 지도를 생성합니다    
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
		                    console.log(result[0].road_address.address_name);
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
		            content: '<div style="width:150px;text-align:center;padding:6px 0;">명소</div>'
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

