<%@ page import="com.ecobasketry.model.dto.Customer" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
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
        .search-bar input {
            padding: 10px;
            width: 50vw;
            border-radius: 5px;
            border: none;
            outline: none;
        }
        .search-bar button {
            height: 5vh;
            padding: 5px;
            width: 5vw;
            border-radius: 5px;
            border: none;
            margin: 10px;
        }
        .nav-links ul {
            display: flex;
            list-style: none;
        }
        .nav-links li {
            margin: 0 15px;
            position: relative;
        }
        .nav-links i {
            color: white;
            font-size: 20px !important;
        }
        .nav-links i:hover {
             color: yellow;
             transform: scale(1.3);
             transition: 0.3s;
        }
        .login-link {
            margin-left: 10px;
            color: white;
            text-decoration: none;
        }
        .dropdown-menu {
            display: none;
            position: absolute;
            top: 40px;
            right: 0;
            background-color: #fff;
            border: 1px solid #ccc;
            min-width: 150px;
            box-shadow: 0 0 10px rgba(0,0,0,0.2);
            z-index: 100;
        }
        .dropdown-menu a {
            display: block;
            padding: 10px;
            color: #333;
            text-decoration: none;
        }
        .dropdown-menu a:hover {
            background-color: #f0f0f0;
        }
        .badge.green {
            background-color: green;
            color: white;
            padding: 2px 5px;
            border-radius: 3px;
        }
    </style>
</head>
<body>
<%
    Customer c = (Customer) session.getAttribute("user");
%>
<header>
    <nav class="navbar navbar-expand-lg fixed-top shadow">
        <div class="logo">
            <a href="AdminHome.jsp">
                <img src="Images/Basket.jpg" alt="logo">
            </a>
        </div>
        <div class="search-bar">
            <form action="search" method="get">
                <input type="text" placeholder="Search..." name="product">
                <button type="submit">Search</button>
            </form>
        </div>
        <div class="nav-links">
            <ul>
                <li><a href="wishlist.jsp"><i class="fas fa-heart"></i></a></li>
                <li><a href="cart.jsp"><i class="fas fa-shopping-cart"></i></a></li>
                <li>
                    <% if (c != null) { %>
                        <i class="fas fa-user" onclick="toggleDropdown()"></i>
                        <span class="login-link" id="loginLink"><%= c.getName() %></span>
                        <div id="dropdownMenu" class="dropdown-menu">
                            <a href="update.jsp">Update Account</a>
                            <a href="myorders.jsp">My Orders</a>
                            <a href="#">My Wallet <span class="badge green">₹0</span></a>
                            <a href="contact.jsp">Contact Us</a>
                            <a href="logout">Logout</a>
                        </div>
                    <% } else { %>
                        <a href="login.jsp">
                            <i class="fas fa-user"></i>
                            <span class="login-link" id="loginLink">Login/Signup</span>
                        </a>
                    <% } %>
                </li>
            </ul>
        </div>
    </nav>
</header>

<script>
    function toggleDropdown() {
        const dropdown = document.getElementById("dropdownMenu");
        dropdown.style.display = (dropdown.style.display === "block") ? "none" : "block";
    }

    document.addEventListener("click", function (event) {
        const dropdown = document.getElementById("dropdownMenu");
        const userIcon = document.querySelector(".fa-user");
        if (dropdown && !dropdown.contains(event.target) && !userIcon.contains(event.target)) {
            dropdown.style.display = "none";
        }
    });
</script>
</body>
</html>