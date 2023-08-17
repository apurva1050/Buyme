<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	</head>
	<body>
	<%
	try{

		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();
		Statement stmt = con.createStatement();
		String str1 = (String)session.getAttribute("username");
		String nuquery = "delete from user where username in (?)";
		PreparedStatement ps = con.prepareStatement(nuquery);
		ps.setString(1, str1);
		ps.executeUpdate();
		response.sendRedirect("HelloWorld.jsp");

		
		}catch(Exception e){
			out.println("error");
		}
	%>



</body>	
</html> 