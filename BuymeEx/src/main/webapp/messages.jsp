<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>messages</title>
	</head>
	<body>
	<center>
		<h1 style="text-align:center">View your messages, <%
		String str = (String)session.getAttribute("username");
		out.println(str);%></h1>
		<br>
		<textarea rows="50" cols="60">
		<%
		try{

			ApplicationDB db = new ApplicationDB();
			Connection con = db.getConnection();
			Statement stmt = con.createStatement();
			String query = "SELECT message FROM messages";
			ResultSet rs = stmt.executeQuery(query);
			ResultSetMetaData rsmd = rs.getMetaData();
			int columns = rsmd.getColumnCount();
			while(rs.next()){
				for(int i =1; i<=columns;i++){
					String columnValue = rs.getString(i);
			        out.print(columnValue + "<br/>");
				}
				out.println("<br/>");
				
			}

			}catch(Exception e){
				out.println("error");
			}
		
		%>
		</textarea>
		</center>
</body>
</html>