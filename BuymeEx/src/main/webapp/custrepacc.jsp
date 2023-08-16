<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
			<title>Customer representative:create account</title>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<script type="text/javascript">
		function sample(){
			if(document.fz.staffuser.value=="" && document.fz.staffpassword.value==""){
				alert("Please create a username and password.");
				return false;}
			
				if(document.fz.staffuser.value==""){
					alert("Please create a username");
					return false;}
				
				
			if(document.fz.staffpassword.value==""){
				alert("please create a password");
				return false;}
			
			if(document.fz.staffuser.value!="" && document.fz.staffpassword.value!=""){
				document.fz.action="createstaff.jsp";
				return true;}
		}
			
			

</script>
	</head>
	<center>
	<h1>Create Account</h1>
	<body>
		<form name = "fz" method="post"  onsubmit = "sample()">
			New username: <input name = "staffuser" type = "text">
			Choose password: <input name = "staffpassword" type = "password">
			<input type="submit" style="font-size:15px;height:30px;width:100px" value="Login">
		</form>

	
</body></center>
</html>