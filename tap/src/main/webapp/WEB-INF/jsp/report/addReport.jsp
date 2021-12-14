<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- start : mainHeader -->
    <div>
       <jsp:include page="/partial/mainHeader.jsp"></jsp:include>
    </div>
    <!-- end : mainHeader -->
    
 	 <main id="main">

    <!-- ======= Breadcrumbs ======= -->
    <section id="breadcrumbs" class="breadcrumbs">
      <div class="container">
        <div class="d-flex justify-content-between align-items-center">
          <h2>신고 추가</h2>
          <ol>
            <li><a href="/tap/index">Home</a></li>
            <li>신고 추가</li>
          </ol>
        </div>
      </div>
    </section><!-- End Breadcrumbs -->
    
    <form action="${pageContext.request.contextPath}/addReport" method="post">
    	<table border="1">
    		<tr>
    			<th>작성자ID</th>
    			<td><input type="text" name="writerId"></td>
    		</tr>
    		<tr>
    			<th>신고대상</th>
    			<td><input type="text" name="reportTarget"></td>
    		</tr>
    		<tr>
    			<th>신고대상 카테고리</th>
    			<td>
    				<select name="reportTargetCategory">
    					<option value="room_review">room_review</option>
    					<option value="room_evaluation">room_evaluation</option>			
    				</select>
    			</td>
    		</tr>
    		<tr>
    			<th>작성자 카테고리</th>
    			<td>
    				<select name="writerCategory">
    					<option value="member">member</option>
    					<option value="host">host</option>			
    				</select>
    			</td>
    		</tr>
    		<tr>
    			<th>신고 내용</th>
    			<td><textarea name="reportContent" rows="5" cols="50" placeholder="신고 내용"></textarea></td>
    		</tr>
    		<tr>
    			<th>승인여부</th>
    			<td>
    				<select name="approvalStatus">
    					<option value="Y">Y</option>
    					<option value="N">N</option>			
    				</select>
    			</td>
    		</tr>
    	</table>
    	<button type="submit">작성</button>
    </form>
    
    </main><!-- End #main -->
    
    <!-- start : mainFooter -->
	<div>
      <jsp:include page="/partial/mainFooter.jsp"></jsp:include>
    </div>
 	<!-- end : mainFooter -->
</body>
</html>