<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>



<style>
    body {
        font-family: 'Arial', sans-serif;
        margin: 0;
        padding: 0;
    }

    footer {
        background-color:#eb6e34;
        color: white;
        padding: 55px 0;
        display: flex;
        flex-wrap: wrap;
        justify-content: space-around;
    }

    .footer-column {
        flex: 1;
        margin: 20px;
        min-width: 200px;
    }

    .footer-column h3 {
        font-size: 18px;
        margin-bottom: 20px;
        color: #f4d03f;
        position: relative;
    }

    .footer-column h3::after {
        content: '';
        display: block;
        width: 50px;
        height: 3px;
        background-color: #f4d03f;
        margin-top: 5px;
    }

    .footer-column ul {
        list-style: none;
        padding: 0;
        margin: 0;
    }

    .footer-column ul li {
        margin-bottom: 10px;
    }

    .footer-column ul li a {
        color: white;
        font-size: 16px;
        text-decoration: none;
        transition: color 0.3s ease;
    }

    .footer-column ul li a:hover {
        color: #f4d03f;
    }

    .footer-column p {
        font-size: 14px;
        line-height: 1.8;
    }

    .newsletter input[type="email"] {
        padding: 12px;
        border: none;
        border-radius: 4px;
        width: 75%;
        margin-right: 10px;
        font-size: 14px;
    }

    .newsletter button {
        padding: 12px 15px;
        background-color: #f4d03f;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        font-size: 14px;
        transition: background-color 0.3s ease;
    }

    .newsletter button:hover {
        background-color: #e2b20e;
    }

    .newsletter {
        margin-top: 30px;
    }

    .footer-bottom {
        background-color: #eb6e34;
        padding: 20px;
        text-align: center;
        color: black;
        font-size: 14px;
        border-top: 1px solid #444;
    }

    .footer-bottom a {
        color: #f4d03f;
        text-decoration: none;
    }

    .footer-bottom a:hover {
        text-decoration: underline;
    }

    .footer-column img {
        width: 150px;
        margin-top: 20px;
    }
    i{
        font-size: 20px;
        color: white;
    }
    .popular-searches a,a {
        color: #fff;
        text-decoration: none;
        font-size: 14px;
        /* padding: 1px; */
        transition: color 0.2s ease;
    }

    .popular-searches a:hover {
        color: #f1cb33;
        text-decoration: underline;
    }

    img:hover,i:hover{
        color: #f4d03f;
    }

    .popular-searches{
        margin-left: 60px;
        margin-right: 60px;
        font-size: 18px;
        font-weight: 500;
    }
    
</style>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

</head>
<body>

    <footer>
        <div class="footer-column">
        <a href="home1.jsp">
            <img src="Images/logo.jpeg" alt="Eco-Basketry Logo">
            <p>Your one-stop destination for all daily essentials!</p></a>
        </div>

        <div class="footer-column">
            <h3>Shop by Category</h3>
            <ul>
                <li><a href="AdminHome.jsp?category=Bakery+Snacks">Bakery, Cakes and Dairy</a></li>
                <li><a href="AdminHome.jsp?category=Coffee">Beverages</a></li>
                <li><a href="AdminHome.jsp?category=Biscuits+%26+Cookies">Snacks & Branded Foods</a></li>
                <li><a href="AdminHome.jsp?category=Bin+%26+Bathroom+Ware">Cleaning & Household</a></li>
                <li><a href="AdminHome.jsp?category=Egg">Egg, Meat & Fish</a></li>
                <li><a href="AdminHome.jsp?category=Chocolates+%26+Biscuits">Gourmet & World Food</a></li>
                <li><a href="AdminHome.jsp?category=Cuts+%26+Sprouts">Fruits & Vegetables</a></li>
                <li><a href="AdminHome.jsp?category=Atta%2C+Flours+%26+Sooji">Foodgrains, Oil & Masala</a></li>
            </ul>
        </div>

        <div class="footer-column">
            <h3>Customer Service</h3>
            <ul>
                <li><a href="contact.jsp">Help Center</a></li>
                <li><a href="contact.jsp">FAQs</a></li>
                <li><a href="contact.jsp">Shipping & Delivery</a></li>
                <li><a href="contact.jsp">Returns</a></li>
                <li><a href="contact.jsp">Track Your Order</a></li>
            </ul>
        </div>

        <div class="footer-column">
            <h3>Get in Touch</h3>
            <p><i class="fa-solid fa-phone"></i> 080-45678765</p>
            <p><i class="fa-solid fa-envelope"></i> <a href="mailto:support@hub4pets.com">support@ecobasketry.com</a></p>
            <h3>Follow Us</h3>
            <div class="social-icons">
                <a href="#"><i class="fa-brands fa-twitter"></i></a>
                <a href="#"><i class="fa-brands fa-instagram"></i></a>
                <a href="#"><i class="fa-brands fa-facebook"></i></a>
                <a href="#"><i class="fa-brands fa-youtube"></i></a>
            </div>
        </div>

        <div class="footer-column">
          
            <div class="newsletter">
                <a href="signup.jsp"><button type="submit">Signup</button></a>
            </div>
        </div>

        <section class="popular-searches">
            <h3>POPULAR SEARCHES</h3>
            <div>
                <a href="AdminHome.jsp?category=Dairy"> | Milk</a>
                <a href="AdminHome.jsp?category=Organic+Fruits"> | Organic Food</a>
                <a href="AdminHome.jsp?category=Atta%2C+Flours+%26+Sooji"> | Wheat Atta</a>
                <a href="AdminHome.jsp?category=Oils+%26+Ghee"> | Ghee</a>
                <a href="AdminHome.jsp?category=Fruit+Juices+%26+Drinks"> | Juices</a>
                <a href="AdminHome.jsp?category=Mop%2C+Brushes+%26+Scrubs"> | Floor Cleaners</a>
                <a href="AdminHome.jsp?category=Egg"> | Eggs</a>
                <a href="AdminHome.jsp?category=Frozen+Veggies"> | Frozen Veg Food</a>
                </div>
        </section>
    </footer>

    <section class="footer-bottom">
        <p>&copy; 2025 Eco Basketry Pvt Ltd. All rights reserved. | <a href="">Privacy Policy</a> | <a href="#">Terms &
            Conditions</a></p>
    </section>


</body>
</html>