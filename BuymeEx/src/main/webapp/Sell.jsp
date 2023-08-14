<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<h1>Sell your item here!</h1>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<script type="text/javascript">
		function check(){
			if(document.fu.category.value=="" || document.fu.itemName.value=="" || document.fu.itemDescription.value=="" || document.fu.condition.value=="" || 
					document.fu.initialbid.value=="" || document.fu.increments.value=="" || document.fu.reserveprice.value=="" || document.fu.endauction.value==""){
					alert("You left one or more fields empty");
				return false;
			}else{
				document.fu.action="sellfurther.jsp";
				return true;
			}
		}
</script>
		<title>Selling page</title></head>
		<h3>All fields are mandatory</h3>
		<form method = "post"  name = "fu" onsubmit="check()">
		<center>
    <label for="category">Category:</label>
    <select id="category" onchange="showSubcategories()">
        <option value="">Select a category</option>
        <option value="Electronics">Electronics</option>
        <option value="Vehicles">Vehicles</option>
        <option value="Clothing">Clothing</option>
    </select><br><br>
    			Item name: <input name = "itemName" type = "text"><br><br>
    			<label for = "description">Write your description here:</label>
    			<textarea id = "itemDescription" name = "itemDescription" rows = "5" columns = "20">Write a short description...</textarea>
   				<br><br>
   				
   				<p>Condition</p>
   				<input type = "radio" id = "New" name = "condition" value = "New">
   				<label for = "New">New</label>
   				<br><br>
   				<input type = "radio" id = "Clearance" name = "condition" value = "Clearance">
   				<label for = "Clearance">Clearance</label>
   				<br><br>
   				<input type = "radio" id = "used" name = "condition" value = "used">
   				<label for = "used">used</label>
   				<br><br>
   				
   				
   				Initial bid: <input name = "initialbid" type = "text">
   				<br><br>
   				Increments: <input name = "increments" type = "text">
   				<br><br>
   				Reserve price: <input name = "reserveprice" type = "text">
   				<br><br>
   				Auction ends:<input name = "endauction" type = "datetime-local">
   				<br><br>
   				<input type="submit" style="font-size:15px;height:30px;width:100px" value="Submit">
   				
   </center>
    </form>
</body>
	
</html> 