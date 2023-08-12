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

if(request.getParameter("newUser").equals(null) || request.getParameter("newPassword").equals(null)){
	response.sendRedirect("createfail.jsp");
}
try{
ApplicationDB db = new ApplicationDB();
Connection con = db.getConnection();
Statement stmt = con.createStatement();
String str1 = request.getParameter("newUser");
String str2 = request.getParameter("newPassword");
String query = "select * from user where username = \"" + str1 + "\" ";
ResultSet rs = stmt.executeQuery(query);
if(rs.absolute(1)){
	response.sendRedirect("createfail.jsp");
}else{
	String newQuery = "insert into user(username, password) values('"+str1 + "', '"+str2+"') ";
	Statement stmt2 = con.createStatement();
	stmt2.executeUpdate(newQuery);
	// add a button to get to the regular page
}


con.close();

}catch(Exception e ){
	out.println("error");
}
%>
<h1>Account created! You can log in now!</h1>


</body>
</html>