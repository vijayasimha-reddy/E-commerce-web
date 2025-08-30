<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ForgotPassword</title>
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
    margin-top: 12vh;
    width:100%;
}
.image{
    width: 50%;
    display: flex;
    justify-content:center;
    align-items: center;
}
.reset-container{
    width: 50%;
    background-color: #fff;
    padding:30px;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    text-align: center;
    margin: 100px;
}
h2 {
    margin-bottom: 20px;
    font-size: 24px;
    color: #333;
}

label {
    font-size: 14px;
    color: #333;
}

input {

    width: 90%;
    padding: 10px;
    font-size: 16px;
    display-flex: center;
    border: 1px solid #ddd;
    border-radius: 4px;
    margin: 5px;
}

button {
    width: 90%;
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
     font-size: 14px;
    color: #007bff;
    text-decoration: none;
}


.navigate :hover {
    text-decoration: underline;
}
</style>
</head>
<body>
<jsp:include page="navbar1.jsp"/>
<div class="image">
<img src="Images/forgotpassword.jpg" alt="">
</div>
<div class="reset-container">
<form action="forgot" method="post">
            <h2>Reset Password</h2>
             <%String m1=(String)request.getAttribute("error");
        if(m1!=null){%>
        <%=m1 %>
        <%} %>
            <p>Use your mail-Id and password</p>
            <input type="text" placeholder="Email" name="mail"required>
            <input type="tel" placeholder="Enter the Phonenumber" name="phone"required>
            <input type="password" placeholder="Enter the New-Password" name="password" required>
            <input type="password" placeholder="Confirm your-password" name="confirm" required>
        <button class="reset">Reset</button><br><br>
        <a href="AdminHome.jsp" class="btn btn-primary">Back</a> <br>
        <a class="navigate" href="login.jsp" target="_blank">Click here to Login</a>
</form>
</div>
</body>
</html>