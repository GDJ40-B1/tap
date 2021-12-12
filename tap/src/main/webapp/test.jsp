<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>DB Connection Test</title>
</head>
<body>
<%
String DB_URL = "jdbc:mariadb://3.36.30.25:3306/goodee?serverTimezone=Asia/Seoul";
String DB_USER = "user_db";
String DB_PASSWORD= "cap1984@";

Connection conn;
Statement stmt;

try {
 Class.forName("org.mariadb.jdbc.Driver");
 %>
	<h1>3.36.30.25 접속 성공</h1>
<%
 conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
%>
	<h1>3.36.30.25 접속 성공</h1>
<%
 stmt = conn.createStatement();
%>
	<h1>3.36.30.25 접속 성공</h1>
<%
 conn.close();
 
 %>
 	<h1>3.36.30.25 접속 성공</h1>
 <%
 

} catch(Exception e) {
 out.println(e.getMessage());
 
 %>
	<h1>3.36.30.25 접속 실패</h1>
<%
}

DB_URL = "jdbc:mariadb://localhost:3306/goodee?serverTimezone=Asia/Seoul";
DB_USER = "user_db";
DB_PASSWORD= "cap1984@";

try {
	 Class.forName("org.mariadb.jdbc.Driver");
	 %>
	 	<h1>3.36.30.25 접속 성공</h1>
	 <%
	 conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
	 %>
	 	<h1>3.36.30.25 접속 성공</h1>
	 <%
	 stmt = conn.createStatement();
	 %>
	 	<h1>3.36.30.25 접속 성공</h1>
	 <%
	 conn.close();
	 
	 %>
	 	<h1>로컬호스트 접속 성공</h1>
	 <%
	 

	} catch(Exception e) {
	 out.println(e.getMessage());
	 
	 %>
		<h1>로컬호스트 접속 실패</h1>
	<%
	}

 %>
</body>
</html>