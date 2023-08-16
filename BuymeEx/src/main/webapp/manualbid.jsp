<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<h1>Place a manual bid</h1>
	<head>
	<script type="text/javascript">
		function check(){
			if(document.bid.whatItem.value=="" || document.bid.yourbid.value=="" ){
					alert("You left one or more fields empty");
				return false;
			}else{
				if(document.bid.yourbid.value<0){
					alert("you cannot bid negative amounts");
				}else{
				document.bid.action="manualbidsuccess.jsp";
				return true;
			}}
		}
		
</script>
	</head>
	<body>
	

<center>
	<form name = "bid" method="post" onsubmit="check()">
			Item number: <input name = "whatItem" type = "text">
			Your bid: <input name = "yourbid" type = "text">
			<input type="submit" value="Place your bid">
		</form>
	</center>
	
	
	
	
	
</body>	
</html> 