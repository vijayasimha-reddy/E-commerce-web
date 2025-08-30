<%@ page import="com.ecobasketry.model.dto.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Navbar</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        .fixed-top {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            z-index: 999;
            background-color: #eb6e34;
            padding: 10px 20px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .logo img {
            width: 80px;
            height: 50px;
        }

        .nav-links ul {
            display: flex;
            list-style: none;
        }

        .nav-links li {
            margin: 0 20px;
        }

        .nav-links a {
            color: white;
            text-decoration: none;
            font-weight: bold;
        }

        .nav-links a:hover {
            color: yellow;
            transition: 0.3s;
            transform: scale(1.1);
        }
    </style>
</head>
<body>
    <header>
        <nav class="navbar navbar-expand-lg fixed-top shadow">
            <div class="logo">
                <img src="Images/Basket.jpg" alt="logo">
            </div>

            <div class="nav-links">
                <ul>
                    <li><a href="home1.jsp">Home</a></li>
                    <li><a href="signup.jsp">Signup</a></li>
                    <li><a href="login.jsp">Login</a></li>
                </ul>
            </div>
        </nav>
    </header>
</body>
</html>
