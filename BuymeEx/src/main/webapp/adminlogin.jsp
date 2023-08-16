<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
<title>login</title>
</head>
<body>
<%

try{
ApplicationDB db = new ApplicationDB();
Connection con = db.getConnection();
Statement stmt = con.createStatement();
String str1 = request.getParameter("stfuser");
String str2 = request.getParameter("passcode");
String query = "select * from administrator where admin_user = \"" + str1 + "\" " ;
ResultSet rs = stmt.executeQuery(query);
if(rs.absolute(1)){
	response.sendRedirect("adminhome.jsp");
}else{
	response.sendRedirect("loginfail.jsp");
}


con.close();

}catch(Exception e ){
	out.println("error");
}
%>



</body>
</html>