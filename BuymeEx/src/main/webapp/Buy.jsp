<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<h1>Buy items here!</h1>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Buying page</title></head>
		<body>
=		<center>
    	<form method = "post" action="condition.jsp">
		<input type="submit"  value="Sort By condition: New, used, Clearance">
		</form>
		<br>
		<form method = "post" action="auction.jsp">
		<input type="submit"  value="View items currently on sale">
		</form>
		<br>
		<form method = "post" action="categorysearch.jsp">
		<input type="submit"  value="Search by category ">
		</form>
   		<br>
   		<form method = "post" action="history.jsp">
		<input type="submit"  value="View bidding history ">
		</form>
   				
   </center>
</body>	
</html> 