<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<h1>Search via category!</h1>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<script type="text/javascript">
		function check(){
			if(document.fu.category.value==""){
					alert("You need to select a category");
				return false;
			}else{
				document.fu.action="";
				return true;
			}
		}
</script>
</head>
	<center>
		<form method = "post"  name = "fu" onsubmit="check()">
	
    <label for="category">Category:</label>
    <select id="category" name="category" >
        <option value="">Select a category</option>
        <option value="Electronics">Electronics</option>
        <option value="Vehicles">Vehicles</option>
        <option value="Clothing">Clothing</option>
    </select><br><br>
   				<input type="submit" style="font-size:15px;height:30px;width:100px" value="Submit">
   				<br><br>
    </form>
    </center>
    <body>
    <center>
    <%
    try{
    	
    	String str = request.getParameter("category");
    	ApplicationDB db = new ApplicationDB();
    	Connection con = db.getConnection();
    	Statement stmt = con.createStatement();
    	
    	String query = "Select * from bidonitems where category = \"" + str + "\" ";
    	ResultSet rs = stmt.executeQuery(query);
    	ResultSetMetaData rsmd = rs.getMetaData();
    	int columns = rsmd.getColumnCount();
    	if(columns==0){
    		out.println("there are no auctions in this category.");
    	}
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
    <br>
    <br>
    <br>
	<form  method="post"  action = "manualbid.jsp">
	<input type="submit"  value="Place a manual bid on an item">
	</form>
	<br>
	<br>
	<form  method="post"  action = "automaticbid.jsp">
	<input type="submit"  value="Place an automatic bid on an item">
	</form>
	</center>
    
    
    
    
    
    
    </body>
    
    
    
    
    
    
    
    
</body>
	
</html> 