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
String DB_URL = "jdbc:mysql://3.36.30.25:3306/goodee?serverTimezone=Asia/Seoul";
String DB_USER = "user_hw";
String DB_PASSWORD= "db1984@";

Connection conn;
Statement stmt;

try {
 Class.forName("com.mysql.jdbc.Driver");
 conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
 stmt = conn.createStatement();
 stmt.close();
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

DB_URL = "jdbc:mysql://localhost:3306/goodee?serverTimezone=Asia/Seoul";
DB_USER = "user_hw";
DB_PASSWORD= "db1984@";

try {
	 Class.forName("com.mysql.jdbc.Driver");
	 conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
	 stmt = conn.createStatement();
	 stmt.close();
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