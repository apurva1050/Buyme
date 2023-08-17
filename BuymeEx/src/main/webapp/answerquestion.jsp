<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<script type="text/javascript">
			
			function take(){
				if(document.hue.qid.value=="" || document.hue.answer.value==""){
					alert("one or more fields is empty");
					return false;
				}else{
						alert("You need to refresh the page to see the changes made.");
						document.hue.action="answerfurther.jsp";
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
			What question would you like to answer? : <input name = "qid" type = "text" placeholder= "question id goes here" >
			<textarea name="answer" rows="6" columns = "10">Type your answer here</textarea>
			<input type="submit" value="Post!">
		</form>
		<br>
		
		
		
		
		
		<form method="post" action="custrephome.jsp">
			<input type="submit" value="Go to home page.">
		</form>
	</center>

</body>	
</html> 