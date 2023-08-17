<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<h1>Check bidding history</h1>
	
	<body>
	
	<%
	try{

		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();
		Statement stmt = con.createStatement();
		
		String str1 = request.getParameter("whatitem");
		out.println(str1);
		String query = "Select * from allbids where itemNumber = \"" + str1 + "\" ";
		ResultSet rs = stmt.executeQuery(query);
		ResultSetMetaData rsmd = rs.getMetaData();
		int columns = rsmd.getColumnCount();
		while(rs.next()){
			for(int i =1; i<=columns;i++){
				String columnValue = rs.getString(i);				
		        out.print( rsmd.getColumnName(i)+ ":  " + columnValue + "<br/>");
			}
			out.println("<br/>");
		}
		}catch(Exception e){
			out.println("error");
		}
	%>
	
	

</body>	
</html> 