<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<script type="text/javascript">
			
			function take(){
				if(document.hue.question.value==""){
					alert("type in your question");
					return false;
				}else{
						alert("You need to refresh the page to see the changes made.");
						document.hue.action="questionfurther.jsp";
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
		String query = "SELECT * FROM question";
		ResultSet rs = stmt.executeQuery(query);
		ResultSetMetaData rsmd = rs.getMetaData();
		
		int columns = rsmd.getColumnCount();
		while(rs.next()){
			for(int i =1; i<=columns;i++){
				String columnValue = rs.getString(i);				
		        out.print( "<strong> " + rsmd.getColumnName(i)+ "<strong>" + ":  " + columnValue + "<br/>");
			}
			out.println("<br/>");
		}
		}catch(Exception e){
			out.println("error");
		}
	%>

<center>

	<form name = "hue" method="post" onsubmit="take()">
			What would you like to inquire? : <input name = "question" type = "text" >
			<input type="submit" value="Ask!">
		</form>
		
		
		
		
		
		
		<form method="post" action="Home.jsp">
			<input type="submit" value="Go to home page.">
		</form>
	</center>

</body>	
</html> 