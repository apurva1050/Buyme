<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Welcome to BuyMe!</title>
	</head>
	<body>
		<h1 style="text-align:center">Welcome to Buyme!</h1>				  
		<br>
		<center>
		<form method = "post" action="login.jsp">
		<input type="submit"  value="Log in to existing account">
		  </form>
		  <br>
		 <br>
		 <br>
		  <form method = "post" action="create.jsp">
		  		<input type="submit"  value="Create Account">
		  </form>
		  <br>
		  <br>
		  <br>
		  <form method = "post" action="administratorlogin.jsp">
		  		<input type="submit"  value="Administrator login">
		  </form>
		  <br>
		  <br>
		  <br>
		  <form method = "post" action="lastlogin.jsp">
		  		<input type="submit"  value="Staff login">
		  </form>
		  
		  
		  </center>
		<br>
</body>
</html>