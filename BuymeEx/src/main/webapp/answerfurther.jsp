<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	</head>
	<body>
	
	<%
	try{

		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();
		Statement stmt = con.createStatement();
		String str1 = request.getParameter("qid");
		String str2 = request.getParameter("answer");
		
		
		 /* String sql = "INSERT INTO question (answer) VALUES (?) WHERE question_id = ?";
         PreparedStatement preparedStatement = con.prepareStatement(sql);
         preparedStatement.setString(1, str2);
         preparedStatement.setInt(2, Integer.parseInt(str1));
         preparedStatement.executeUpdate();*/
         
         String updateBid = "update question set answer = ? where question_id = ?";
			PreparedStatement ps = con.prepareStatement(updateBid);
			ps.setString(1, str2);
			ps.setInt(2, Integer.parseInt(str1));
         	ps.executeUpdate();
         response.sendRedirect("answerquestion.jsp");
		}catch(Exception e){
			out.println("error");
		}
	%>
</body>	
</html> 