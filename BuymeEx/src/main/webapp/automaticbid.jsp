<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<script type="text/javascript">
	
	
		function turn(){
			if(document.geo.maxlimit.value=="" || document.geo.inc.value==""  || document.geo.iid.value==""){
					alert("You left one or more fields empty");
				return false;
			}else{
				if(document.geo.maxlimit.value<0 && document.geo.inc.value<0 && document.geo.iid.value<0){
					alert("you cannot bid negative amounts");
					return false;
				}else{
				document.geo.action="automaticbidfurther.jsp";
				return true;
			}}
			
		}
</script>



	</head>
	
	
	<body>
<center>

	<form name = "geo" method="post" onsubmit= "turn()">
			Enter item ID:<input name = "iid" type = "text">
			Your maximum limit: <input name = "maxlimit" type = "text">
			Increments: <input name = "inc" type = "text">
			<input type="submit" value="Place your automatic bid">
		</form>
		
	</center>
	
</body>	
</html> 