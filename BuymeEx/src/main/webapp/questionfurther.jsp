<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<h1>Ask your question here!</h1>
	<head>
	</head>
	<body>
	
	<%
	try{

		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();
		Statement stmt = con.createStatement();
		String str1 = request.getParameter("question");
		String str2 = (String)session.getAttribute("username");
		String nuquery = "insert into question(user_id, question) values('"+str2 + "', '"+str1+"') ";
		stmt.executeUpdate(nuquery);
		response.sendRedirect("nuquestion.jsp");
		}catch(Exception e){
			out.println("error");
		}
	%>
</body>	
</html> 