<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Staff login here!</title>
		
		<script type="text/javascript">
		function check(){
			if(document.lu.usern.value=="" || document.lu.passn.value==""){
					alert("You left one or more fields empty");
				return false;
			}else{
				document.lu.action="stafflogin.jsp";
				return true;
			}}
		
</script>
	</head>
	<body>
		<h1 style="text-align:center">Welcome to Buyme!</h1>				  
		<br>
		<center>
		<form method="post" onsubmit="check()" name="lu">
			Staff username: <input name = "usern" type = "text">
			password: <input name = "passn" type = "password">
			<input type="submit" style="font-size:15px;height:30px;width:100px" value="Login">
		</form>
		  
		  </center>
		<br>
</body>
</html>