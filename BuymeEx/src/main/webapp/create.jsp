<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>BuyMe:create account</title>
	</head>
	<center>
	<h1>Buyme Login page </h1>
	<body>
		<form method="post" action="createfurther.jsp">
			New username: <input name = "newUser" type = "text">
			Choose password: <input name = "newPassword" type = "password">
			<input type="submit" style="font-size:15px;height:30px;width:100px" value="Login">
		</form>

	
</body></center>
</html>