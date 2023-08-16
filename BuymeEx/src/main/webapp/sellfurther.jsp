<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ page import = "java.io.*,java.util.*" %>
<%@ page import = "javax.servlet.*,java.text.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
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
	String str3 = request.getParameter("itemDescription");
	String str4 = request.getParameter("condition");
	String str5 = request.getParameter("initialbid");
	String str6 = request.getParameter("increments");
	String str7 = request.getParameter("reserveprice");
	String str8 = request.getParameter("endauction");
	String str9 = (String)session.getAttribute("username");
	
	
	String query = "Insert into itemForSale(itemcondition, initial_price, increments, username, name, lastdate, description, reserveprice, category) values('" + str4 + "', '" + str5 + "', '" + str6 + "', '" + str9 + "', '"+ str1 + "', '" + str8 + "', '"+ str3 +"', '"+ str7 + "', '"+str2 + "')";
	Statement stmt2 = con.createStatement();
	stmt2.executeUpdate(query);
	String newQuery="SELECT id from itemforsale where name = \"" + str1 + "\" and " + "description = \"" + str3 + "\" " ;
	ResultSet rs = stmt.executeQuery(newQuery);
	String str10="";
	while(rs.next()){
		 str10 = rs.getString(1);
	}
	String nuQuery="Insert into bidOnItems(itemNumber, current_price, item_name, increments, category, item_description, poster, item_condition, auction_ends_at) values('"+ str10+ "', '"+str5+"', '"+str1+"', '"+str6+"', '"+ str2+"', '"+str3+"', '" + str9 + "', '"+str4+"', '"+str8+"' )";
		Statement stmt3 = con.createStatement();
		stmt3.executeUpdate(nuQuery);
		String message = "item number " +str10+ " which is a "+str1+" has just been placed for auction.";
				
	String lastQuery = "Insert into messages(item_id, item_name, user_id, message, bid) values('"+str10+"', '"+str1+"', '"+str9+"', '"+message+"', '"+str5+"')";
	Statement stmt4 = con.createStatement();
	stmt4.executeUpdate(lastQuery);
	response.sendRedirect("sellfurthersuccess.jsp");
	
	
	con.close();
	
	
	
	
}catch(Exception e){
	out.println("error");
}







%>

</body>
</html>