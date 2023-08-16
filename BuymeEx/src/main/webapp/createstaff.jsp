<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
<title>login</title>
</head>
<body>

<%
try{
ApplicationDB db = new ApplicationDB();
Connection con = db.getConnection();
Statement stmt = con.createStatement();
String str1 = request.getParameter("staffuser");
String str2 = request.getParameter("staffpassword");
String query = "select * from customer_representative where staff_user = \"" + str1 + "\" " ;
ResultSet rs = stmt.executeQuery(query);
if(rs.absolute(1)){
	response.sendRedirect("createfail.jsp");
}else{
	String newQuery = "insert into customer_representative(staff_user, staff_password) values('"+str1+ "', '"+str2+"') ";
	Statement stmt2 = con.createStatement();
	stmt2.executeUpdate(newQuery);
}
con.close();
}catch(Exception e ){
	out.println("error");
}
%>
<h1>Account created for staff! You can log in now!</h1>
	<a href='adminhome.jsp'><button>Return to Homepage!</button></a>


</body>
</html>