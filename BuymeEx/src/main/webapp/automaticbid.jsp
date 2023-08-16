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
			if(document.auto.maxlimit.value=="" || document.auto.inc.value==""  || document.auto.iid.value=""){
					alert("You left one or more fields empty");
				return false;
			}else{
				if(document.auto.maxlimit.value<0 && document.auto.inc.value<0 && document.auto.iid.value<0){
					alert("you cannot bid negative amounts");
				}else{
				document.bid.action="automaticbidfurther.jsp";
				return true;
			}}
		}
</script>
	</head>
	<body>
	

<center>
	<form name = "auto" method="post" onsubmit="check()">
			Enter item ID:<input name = "iid" type = "text">
			Your maximum limit: <input name = "maxlimit" type = "text">
			Increments: <input name = "inc" type = "text">
			<input type="submit" value="Place your automatic bid">
		</form>
	</center>
	
</body>	
</html> 