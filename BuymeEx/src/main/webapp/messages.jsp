<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>messages</title>
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
	<body>
	<center>
		<h1 style="text-align:center">View your messages, <%
		String str = (String)session.getAttribute("username");
		out.println(str);%></h1>
		<br>
		<textarea rows="50" cols="60">
		<%
		try{

			ApplicationDB db = new ApplicationDB();
			Connection con = db.getConnection();
			Statement stmt = con.createStatement();
			String query = "SELECT message FROM messages";
			ResultSet rs = stmt.executeQuery(query);
			ResultSetMetaData rsmd = rs.getMetaData();
			int columns = rsmd.getColumnCount();
			while(rs.next()){
				for(int i =1; i<=columns;i++){
					String columnValue = rs.getString(i);
			        out.print(columnValue);
			        out.println("");
				}
			}

			}catch(Exception e){
				out.println("error");
			}
		
		%>
		</textarea>
		</center>
		
		<form method = "post"  name = "fu" onsubmit="check()">
    <label for="category">Category:</label>
    <select id="category" name="categorymessage" >
        <option value="">Select a category</option>
        <option value="Electronics">Electronics</option>
        <option value="Vehicles">Vehicles</option>
        <option value="Clothing">Clothing</option>
    </select><br><br>
   				Pick a category to get alerted for: <input type="submit" style="font-size:15px;height:30px;width:100px" value="Submit">
   				<br><br>
    </form>
		
		
</body>
</html>