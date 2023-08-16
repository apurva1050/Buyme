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
		<form method = "post" action="removebid.jsp">
		<input type="submit"  value="Remove a bid">
		  </form>
		  <br>
		   <form method = "post" action="removeauction.jsp">
		  		<input type="submit"  value="Remove an auction">
		  </form>
		  <br>
		 
		  <form method = "post" action="HelloWorld.jsp">
		  		<input type="submit"  value="Logout">
		  </form>
		  <br>
		  <form method = "post" action="answer.jsp">
		  		<input type="submit"  value="Answer Questions here.">
		  </form>
		  <br>
		  <form method = "post" action="deleteaccount.jsp">
		  		<input type="submit"  value="Delete accounts here.">
		  </form>
		  </center>
		<br>
</body>
</html>