<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Signup page </title>
   <style>
   *{
    box-sizing: border-box;   
}

body {

    font-family: Arial, sans-serif;
    display: flex;
    justify-content:right;
    align-items: center;
    height: 100vh;
    width:100%;    
}

.signup-container {
    background-color: #fff;
    padding: 30px;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    width: 50%;
    max-width: auto;
    text-align: center;
    margin:70px;
}
.image{
    width: 50%;
    max-width: auto;
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

.navigate {
    margin-top: 10px;
}

.navigate p {
    font-size: 14px;
    color: #007bff;
    text-decoration: none;
}

.navigate a:hover {
    text-decoration: underline;
}
body{
    margin-top: 12vh;
    }
   
   </style>
</head>
<body>
<jsp:include page="navbar1.jsp"/>
        <div  class="image">
        <img src="Images/signup.avif" alt="register-image">
        </div>
        <div class="signup-container">
        <h2>Welcome to Sigup page</h2>
        <%String m=(String)request.getAttribute("error");
        if(m!=null){%>
        <%=m %>
        <%} %>
        <form action="signup" method="post">
         <div class="input-group">
                <label for="username">UserName</label>
                <input type="text" id="username" name="username" required placeholder="Enter your name">
            </div>
             <div class="input-group">
                <label for="phone">Phone</label>
                <input type="tel" id="phone" name="phone" required placeholder="Enter your phone number">
            </div>
            <div class="input-group">
                <label for="username">Email</label>
                <input type="text" id="email" name="email" required placeholder="Enter your email-id">
            </div>
             <div class="input-group">
              <label for="password">Password</label>
                <input type="password" id="password" name="password" required placeholder="Enter your password">
            </div>
             <div class="input-group">
              <label for="confirm">Confirm Password</label>
                <input type="password" id="confirm" name="confirm" required placeholder="Re-enter the password">
            </div>
            <div class="button-container">
                <button type="submit" class="login-button">Create Account</button>
            </div>
            <div class="navigate">
            <a href="login.jsp" target="_blank">Already have account? click here to Login</a>
           </div>
        </form>
    </div>
</body>
</html>
