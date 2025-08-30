<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.ecobasketry.model.dto.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Page</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-SgOJa3DmI69IUzQ2PVdRZhwQ+dy64/BUtbMJw1MZ8t5HZApcHrRKUc4W0kG879m7" crossorigin="anonymous">
  <style>
   *{
    box-sizing: border-box;   
   }

    body {
    font-family: Arial, sans-serif;
    display: flex;
    justify-content:center;
    align-items: center;
    height: 100vh;
    width:100%;
}

.image{
    width: 50%;
}

.update-section{
    width: 30%;
    background-color: #fff;
    padding:30px;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    text-align: center;
    margin: 100px;
}

h2,p {
    margin-bottom: 20px;
    font-size: 24px;
    color: #333;
}

label {
    font-family: Arial, sans-serif;
    font-size: 14px;
    color: #333;
}

input {
    width: 300px;
    padding: 10px;
    font-size: 16px;
    display-flex: inline;
    border: 1px solid #ddd;
    border-radius: 4px;
    margin: 5px;
}

button {
    width: 300px;
    padding: 10px;
    background-color: #28a745;
    color: #fff;
    border: none;
    border-radius: 4px;
    font-size: 16px;
    cursor: pointer;
    margin: 5px;
    transition: background-color 0.3s;
}

body{
    margin-top: 12vh;
    }
</style>
</head>
<body>
 <jsp:include page="navbar.jsp"/>
<% Customer c = (Customer) session.getAttribute("user");%>
<div class="">
<img src="Images/update.jpg" alt="" width="370px" height="507px">
</div> 
<div class="update-section">
<form action="update" method="post">
<h2>Update Page</h2>
   			<%String m = (String) request.getAttribute("success");
   			 if (m != null) {%>
			<%= m %>
			<%}%>
			<%String m1 = (String) request.getAttribute("error");
			if (m1 != null) {%>
			<%= m1 %>
			<%}%>
    <p>Please enter the details</p>
            <label>Enter your Name</label><br>
            <input type="text" name="name"required="required" value="<%=c.getName()%>"><br>
            <label>Enter the Phonenumber</label><br>
            <input type="tel" name="phone"required="required" value="<%=c.getPhone()%>"><br>
            <label>Enter the Mail-id</label><br>
            <input type="text" name="mail" required="required" value="<%=c.getMail()%>"><br>
           
           <button>Update Account</button><br>
           <a href="AdminHome.jsp" class="btn btn-primary">Back</a> <br>
           <a href="forgotpassword.jsp" target="_blank">Click here to reset password</a><br>
           </form>
</div> 
</body>
</html>