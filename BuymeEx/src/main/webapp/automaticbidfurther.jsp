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
	
	String query = "Select poster FROM bidonitems where itemNumber = \"" + Integer.parseInt(str3) + "\" ";
	ResultSet rs = stmt.executeQuery(query);
	String str5 = "";
	while(rs.next()){
		 str5 = rs.getString(1);
	}

	if(str5.equals(str4)){
		out.println("You cannot bid on your own item.");
	}else{
		
		String newQuery = "Select current_price, bidder from bidonitems where itemNumber = \"" + Integer.parseInt(str3) + "\" ";
		Statement stmt2 = con.createStatement();
		ResultSet rs2 = stmt2.executeQuery(newQuery);
		String str7 = "";
		String str8 = "";
		while(rs2.next()){
			str7 = rs2.getString(1);
			str8 = rs2.getString(2);
		}
		
		
		double a = Double.parseDouble(str7); //current price
		double b = Double.parseDouble(str1); // upper limit
		double c = Double.parseDouble(str2); // increments
		double d = 0; //new price
		
		
		
		if(str8==null){
			double m = a+c;
			String updateBid = "update bidonitems set current_price = ? where itemNumber = ?";
			PreparedStatement ps = con.prepareStatement(updateBid);
			ps.setDouble(1, a+c);
			ps.setInt(2, Integer.parseInt(str3));
			ps.executeUpdate();
			String updateagain = "update bidonitems set bidder = ? where itemNumber = ?";
			PreparedStatement ps2 = con.prepareStatement(updateagain);
			ps2.setString(1, str4);
			ps2.setInt(2, Integer.parseInt(str3));
			ps2.executeUpdate();
			String newquery = "Insert into allbids(item_id, username, price) values('" + str3 + "', '" + str4 + "', '" + d + "')";
			Statement stmt7 = con.createStatement();
			stmt7.executeUpdate(newquery);
			
			
			String message = "A bid was placed on item  " +str3+"";
			String lastQuery = "Insert into messages(item_id,user_id, message, bid) values('"+str3+"', '"+str4+"', '"+message+"', '"+ m+ "')";
			Statement stmt5 = con.createStatement();
			stmt5.executeUpdate(lastQuery);
			response.sendRedirect("Home.jsp");

		}
		
		if((!str8.equals(str4)) && (a<=b) ){
			d = a+c;
			String updateBid = "update bidonitems set current_price = ? where itemNumber = ?";
			PreparedStatement ps = con.prepareStatement(updateBid);
			ps.setDouble(1, d);
			ps.setInt(2, Integer.parseInt(str3));
			ps.executeUpdate();
			String updateagain = "update bidonitems set bidder = ? where itemNumber = ?";
			PreparedStatement ps2 = con.prepareStatement(updateagain);
			ps2.setString(1, str4);
			ps2.setInt(2, Integer.parseInt(str3));
			ps2.executeUpdate();
			String newquery = "Insert into allbids(item_id, username, price) values('" + str3 + "', '" + str4 + "', '" + d + "')";
			Statement stmt4 = con.createStatement();
			stmt4.executeUpdate(newquery);
			
			String message = "A bid was placed on item  " +str3+"";
			Statement stmt6 = con.createStatement();
			String lastQuery = "Insert into messages(item_id,user_id, message, bid) values('"+str3+"', '"+str4+"', '"+message+"', '"+ d+ "')";
			stmt6.executeUpdate(lastQuery);
			response.sendRedirect("Home.jsp");

		}
		
		
		
		
	}
		

con.close();


}catch(Exception e){
	response.sendRedirect("Home.jsp");
}



%>
	
</body>	
</html> 