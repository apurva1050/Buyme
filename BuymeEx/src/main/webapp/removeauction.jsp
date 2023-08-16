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
				if(document.here.reitem.value==""){
					alert("type in what auction you want to remove.");
					return false;
				}else{
					if(document.here.reitem.value<0){
						alert("you cannot have negative values");
						return false;
					}else{
						alert("You need to refresh the page to see the changes made.");
						return true;
					}
				}
			}
		
		
</script>
	</head>
	<body>
	<%
	try{

		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();
		Statement stmt = con.createStatement();
		String query = "SELECT * FROM bidonitems";
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
		String str1 = request.getParameter("reitem");
		String nuquery = "delete from bidonitems where itemNumber in (?)";
		PreparedStatement ps = con.prepareStatement(nuquery);
		ps.setString(1, str1);
		ps.executeUpdate();
		
		String nuQuery = "delete from itemforsale where id in (?)";
		PreparedStatement ps2 = con.prepareStatement(nuQuery);
		ps2.setString(1, str1);
		ps2.executeUpdate();
		
		}catch(Exception e){
			out.println("error");
		}
	%>

<center>
	<form name = "here" method="post" onsubmit="check()">
			What auction would you like to remove: <input name = "reitem" type = "text" placeholder="type in the item nummber">
			<input type="submit" value="Remove">
		</form>
	</center>

</body>	
</html> 