<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<h1>Remove an account </h1>
	<head>
	<script type="text/javascript">
			
			function check(){
				if(document.here.rename.rename==""){
					alert("Select a user to remove");
					return false;
				}else{
						alert("You need to refresh the page to see the changes made.");
						return true;
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
		String query = "SELECT username FROM user";
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
		String str1 = request.getParameter("rename");
		String nuquery = "delete from user where username in (?)";
		PreparedStatement ps = con.prepareStatement(nuquery);
		ps.setString(1, str1);
		ps.executeUpdate();
		
		}catch(Exception e){
			out.println("error");
		}
	%>

<center>
	<form name = "here" method="post" onsubmit="check()">
			What user would you like to remove : <input name = "rename" type = "text" placeholder="type in the user name">
			<input type="submit" value="Remove">
		</form>
		<form method="post" action="custrephome.jsp">
			<input type="submit" value="Go to home page.">
		</form>
	</center>

</body>	
</html> 