<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<h1>Place a manual bid</h1>
	<head>
	</head>
	<body>
	
<%
try{
	ApplicationDB db = new ApplicationDB();
	Connection con = db.getConnection();
	Statement stmt = con.createStatement();
	
	String str1 = request.getParameter("maxlimit");
	String str2 = request.getParameter("inc");
	String str3 = request.getParameter("iid");
	String str4 = (String)session.getAttribute("username");
	
	String nuquery = "select itemNumber from bidonitems";
	Statement stmt3 = con.createStatement();
	ResultSet rs3 = stmt3.executeQuery(nuquery);
	int i = 1;
	ArrayList<String> vague = new ArrayList<String>(); 
	while(rs3.next()){
		vague.add(rs3.getString(i));
	}
	
	int k = 0;
	for(int j = 0; j<vague.size(); j++){
		if(str3.equals(vague.get(j))){
			k++;
		}
	}
	if(k!=1){
		response.sendRedirect("failure.jsp");
	}
	
	
	String query = "Select poster FROM bidonitems where itemNumber = \"" + str3 + "\" ";
	ResultSet rs = stmt.executeQuery(query);
	String str5 = "";
	while(rs.next()){
		 str5 = rs.getString(1);
	}
	if(str5.equals(str4)){
		out.println("You cannot bid on your own item.");
	}else{
		
		String newQuery = "Select current_price from bidonitems where itemNumber = \"" + str3 + "\" ";
		Statement stmt2 = con.createStatement();
		ResultSet rs2 = stmt2.executeQuery(newQuery);
		String str7 = "";
		while(rs2.next()){
			str7 = rs2.getString(1); //current price
		}
		double a = Double.parseDouble(str7); //current price

		
		/*
		if(c-a>=b){
			a = c;
			String nu = a+"";
			String updateBid = "update bidonitems set current_price = ? where itemNumber = ?";
			PreparedStatement ps = con.prepareStatement(updateBid);
			ps.setDouble(1, a);
			ps.setInt(2, Integer.parseInt(itemID));
			ps.executeUpdate();
			String updateagain = "update bidonitems set bidder = ? where itemNumber = ?";
			PreparedStatement ps2 = con.prepareStatement(updateagain);
			ps2.setString(1, str1);
			ps2.setInt(2, Integer.parseInt(itemID));
			ps2.executeUpdate();
			response.sendRedirect("manualbidfurther.jsp");
		}else{
			out.println("you did not meet the increment.");
			response.sendRedirect("manualbidfail.jsp");
		}
	}*/
	con.close();	
	
	
	
	
	
	
	
	
	
	
}catch(Exception e){
	
}









%>
	
</body>	
</html> 