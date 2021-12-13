<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body id="page-top">

    <!-- start : hostHeader -->
   <div>
      <jsp:include page="/partial/hostHeader.jsp"></jsp:include>
   </div>
   <!-- end : hostHeader -->
   
    <!-- 원하는 대로 내용 채우기 -->
	<div id="content" class="container-fluid">

        <!-- Page Heading -->
        <h1 class="h3 mb-4 text-gray-800">분리했습니다~~</h1>
		<h3>사용시 주의사항을 알려드리겠습니다.</h3>
		<h5>host쪽 헤더와 푸터를 쓰신다면, 일단 body의 id를 "page-top"으로 설정하고 class는 "container-fluid"로 하시길 바랍니다.</h5>
		<h5>메인도 마찬가지이지만... 헤더와 푸터는 꼭 같이 쓰셔야 합니다. 헤더만 있는 경우는 없습니다.</h5>
	</div>

   <!-- start : hostFooter -->
   <div>
      <jsp:include page="/partial/hostFooter.jsp"></jsp:include>
   </div>
   <!-- end : hostFooter -->

</body>

</html>

