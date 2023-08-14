<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Selling</title>
</head>
<body>
<%


try{
	
	ApplicationDB db = new ApplicationDB();
	Connection con = db.getConnection();
	Statement stmt = con.createStatement();
	String str1 = request.getParameter("itemName");
	String str2 = request.getParameter("category");
	String str3 = request.getParameter("description");
	String str4 = request.getParameter("condition");
	String str5 = request.getParameter("initialbid");
	String str6 = request.getParameter("increments");
	String str7 = request.getParameter("reserveprice");
	String str8 = request.getParameter("endauction");
	String str9 = (String)session.getAttribute("username");
	String query = "Insert into itemForSale(itemcondition, initial_price, increments, username, name, lastdate, description, reserveprice, category) values('" + str4 + "', '" + str5 + "', '" + str6 + "', '" + str9 + "', '"+ str1 + "', '" + str8 + "', '"+ str3 +"', '"+ str7 + "', '"+str2 + "')";
	Statement stmt2 = con.createStatement();
	stmt2.executeUpdate(query);
	out.println("done");
	con.close();
	
	
	
	
}catch(Exception e){
	out.println("error");
}


%>
// button create
<form method="post" action="Home.jsp">
    <input type="submit" value="Go to Home">
</form>

</body>
</html>
