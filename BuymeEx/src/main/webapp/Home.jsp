<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Welcome to BuyMe!</title>
		<script type="text/javascript">
			
			function check(){
				alert("are you sure you want to delete your account?");
				document.see.action="deleteown.jsp";
				return true;
			}
		
		
</script>
	</head>
	<body>
	<center>
		<h1 style="text-align:center">Welcome to BuyMe!</h1>
		<br>				  
		<h1>Hello
		 <%
		String str = (String)session.getAttribute("username");
		out.println(str);%></h1>
		
		<form method = "post" action="Buy.jsp">
		<input type="submit"  value="Buy an item">
		</form>
		<br>
		<br>
		<form method = "post" action="Sell.jsp">
		<input type="submit"  value="Sell an item">
		</form>
		<br>
		<br>
		<form method = "post" action="nuquestion.jsp">
		<input type = "submit" value= "Have a question? Ask our customer representatives.">
		</form>
		<br>
		<br>
		<form method = "post" action="messages.jsp">
		<input type = "submit" value= "View you alerts here.">
		</form>
		<br>
		<br>
		<br>
		<br>
		<form method = "post" action="HelloWorld.jsp">
		<input type = "submit" value= "Logout">
		</form>
		<br>
		<br>
		<form method = "post" onsubmit="check()" name="see">
		  		<input type="submit"  value="Delete your account">
		  </form>
		
		</center>
</body>
</html>