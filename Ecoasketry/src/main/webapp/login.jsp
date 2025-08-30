<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login page</title>
   <style>
   *{
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    width:auto;
    font-family: Arial, sans-serif;
    background-color:white;
    display: flex;
    justify-content: right;
    align-items: center;
    height: 100vh;
}
.image{
    width: 60%;
    margin:40px;
    
}
.login-container {
    background-color: #fff;
    padding: 30px;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    width: 40%;
    max-width: auto;
    text-align: center;
    margin-right: 100px;
}

h2 {
    margin-bottom: 20px;
    font-size: 24px;
    color: #333;
}

.input-group {
    margin-bottom: 15px;
    text-align: left;
}

label {
    font-size: 14px;
    color: #333;
}

input {
    width: 100%;
    padding: 10px;
    font-size: 16px;
    border: 1px solid #ddd;
    border-radius: 4px;
    margin-top: 5px;
}

button {
    width: 100%;
    padding: 12px;
    background-color: #28a745;
    color: #fff;
    border: none;
    border-radius: 4px;
    font-size: 16px;
    cursor: pointer;
    transition: background-color 0.3s;
}

button:hover {
    background-color: #218838;
}

.forgot-password {
    margin-top: 10px;
}

.forgot-password a {
    font-size: 14px;
    color: #007bff;
    text-decoration: none;
}

.forgot-password a:hover {
    text-decoration: underline;
}
   
   </style>
</head>
<body>
<jsp:include page="navbar1.jsp"/>

<div class="image">
<img src="Images/login.jpeg" width="700" height="450">
</div>
    <div class="login-container">
        <h2>Welcome to Eco Basketry</h2>
        <%String m = (String) request.getAttribute("success");
   			 if (m != null) {%>
			<%= m %>
			<%} %>
        <%String m1=(String)request.getAttribute("error");
        if(m1!=null){%>
        <%=m1 %>
        <%} %>
        <form action="login" method="post">
            <div class="input-group">
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" required placeholder="Enter your email-id">
            </div>
            <div class="input-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required placeholder="Enter your password">
            </div>
            <div class="button-container">
                <button type="submit" class="login-button">Login</button>
            </div>
            <div class="forgot-password">
               <p> <a href="forgotpassword.jsp"  target="_blank">Forgot Password?</a></p>
                <a href="signup.jsp" target="_blank">New User click here for Signup</a>
            </div>
        </form>
    </div>
</body>
</html>
