<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.ecobasketry.model.dto.*" %>
<%@ page import="com.ecobasketry.model.dao.ProductDAO" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Home Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css"
          integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <style>
    
    body{
    margin-top: 12vh;
    }
        #carouselExampleCaptions {
            margin-top: 30px;
        }

        .admin-links {
            background-color: #eb6e34;
            display: flex;
            gap: 15px;
            padding: 10px;
            justify-content: center;
            align-items: center;
        }

        .admin-links a {
            color: white;
            text-decoration: none;
            font-weight: bold;
        }

        .admin-links a:hover {
            text-decoration: underline;
        }

        .card {
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
            height: 100%;
        }

        .card-img-top {
            height: 200px;
            object-fit: contain;
        }

        .add-btn {
            border: 1px solid red;
            color: red;
            width: 65%;
        }

        .add-btn:hover {
            background-color: red;
            color: white;
        }

        .save-btn {
            border: 1px solid red;
            color: red;
            width: 20%;
        }

        .save-btn:hover {
            background-color: red;
            color: white;
        }

        .main-div {
            display: flex;
            padding: 20px;
            flex-wrap: wrap;
        }

        .category-box {
            width: 100%;
            margin-bottom: 20px;
        }

        .card-container {
            width: 100%;
        }

        .card-body {
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            height: calc(100% - 200px);
        }

        @media (min-width: 768px) {
            .category-box {
                width: 30%;
                margin-bottom: 0;
            }

            .card-container {
                width: 70%;
            }

            .save-btn i.fa-bookmark {
                color: red;
            }

            #wishlist:hover i.fa-bookmark {
                color: white;
            }
        }
    </style>
</head>
<body>
<%
    Customer c = (Customer) session.getAttribute("user");
%>

<!-- Navbar -->

    <jsp:include page="navbar.jsp"/>

<%
    String m = (String) request.getAttribute("success");
    if (m != null) {
%>
    <div class="alert alert-success text-center"><%= m %></div>
<%
    }
    String m1 = (String) request.getAttribute("error");
    if (m1 != null) {
%>
    <div class="alert alert-danger text-center"><%= m1 %></div>
<%
    }
%>

<!-- Admin Links -->
<% if (c != null && c.getUser_id() == 1) { %>
    <div class="admin-links">
        <a href="addProduct.jsp">Add Product</a>
        <a href="updateProduct.jsp">Update Product</a>
        <a href="deleteProduct.jsp">Delete Product</a>
        <a href="getAllProducts.jsp">Get All Products</a>
    </div>
<% } %>

<!-- Carousel -->
<div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
    <div class="carousel-indicators">
        <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active"></button>
        <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1"></button>
        <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2"></button>
    </div>

    <div class="carousel-inner">
        <div class="carousel-item active" data-bs-interval="3000">
            <img src="Images/car3.webp" class="d-block w-100" alt="Coupon Available" height="430vh">
        </div>
        <div class="carousel-item" data-bs-interval="3000">
            <img src="Images/car2.webp" class="d-block w-100" alt="Happy Shopping" height="430vh">
        </div>
        <div class="carousel-item" data-bs-interval="3000">
            <img src="Images/car11.webp" class="d-block w-100" alt="Upcoming Offers" height="430vh">
        </div>
    </div>

    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
        <span class="carousel-control-prev-icon"></span>
        <span class="visually-hidden">Previous</span>
    </button>

    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
        <span class="carousel-control-next-icon"></span>
        <span class="visually-hidden">Next</span>
    </button>
</div>

<!-- Main Section -->
<%
    ProductDAO pdo = new ProductDAO();
    String selectedCategory = request.getParameter("category");

    if (selectedCategory == null || selectedCategory.trim().isEmpty()) {
        selectedCategory = "Biscuits & Cookies";
    }
%>

<main>
    <div class="main-div">
        <!-- Category Dropdown -->
        <div class="category-box">
            <form action="AdminHome.jsp" method="get">
                <select name="category" class="form-select" onchange="this.form.submit()">
                    <option value="Biscuits & Cookies" <%= "Biscuits & Cookies".equals(selectedCategory) ? "selected" : "" %>>Biscuits & Cookies</option>
                    <option value="Breakfast Cereals" <%= "Breakfast Cereals".equals(selectedCategory) ? "selected" : "" %>>Breakfast Cereals</option>
                    <option value="Chocolate & Candies" <%= "Chocolate & Candies".equals(selectedCategory) ? "selected" : "" %>>Chocolate & Candies</option>
                    <option value="Frozen Veggies" <%= "Frozen Veggies".equals(selectedCategory) ? "selected" : "" %>>Frozen Veggies</option>
                    <option value="Indian sweet" <%= "Indian sweet".equals(selectedCategory) ? "selected" : "" %>>Indian sweet</option>
                    <option value="Spreads, Sauces & Ketchup" <%= "Spreads, Sauces & Ketchup".equals(selectedCategory) ? "selected" : "" %>>Spreads, Sauces & Ketchup</option>
                    <option value="Cuts & Sprouts" <%= "Cuts & Sprouts".equals(selectedCategory) ? "selected" : "" %>>Cuts & Sprouts</option>
                    <option value="Veggies & Fruits" <%= "Veggies & Fruits".equals(selectedCategory) ? "selected" : "" %>>Veggies & Fruits</option>
                    <option value="Herbs & Seasoning" <%= "Herbs & Seasoning".equals(selectedCategory) ? "selected" : "" %>>Herbs & Seasoning</option>
                    <option value="Organic Fruits" <%= "Organic Fruits".equals(selectedCategory) ? "selected" : "" %>>Organic Fruits</option>
                    <option value="Atta, Flours & Sooji" <%= "Atta, Flours & Sooji".equals(selectedCategory) ? "selected" : "" %>>Atta, Flours & Sooji</option>
                    <option value="Dal & Pulses" <%= "Dal & Pulses".equals(selectedCategory) ? "selected" : "" %>>Dal & Pulses</option>
                    <option value="Dry Fruits" <%= "Dry Fruits".equals(selectedCategory) ? "selected" : "" %>>Dry Fruits</option>
                    <option value="Oils & Ghee" <%= "Oils & Ghee".equals(selectedCategory) ? "selected" : "" %>>Oils & Ghee</option>
                    <option value="Rice & Rice Products" <%= "Rice & Rice Products".equals(selectedCategory) ? "selected" : "" %>>Rice & Rice Products</option>
                    <option value="Bin & Bathroom Ware" <%= "Bin & Bathroom Ware".equals(selectedCategory) ? "selected" : "" %>>Bin & Bathroom Ware</option>
                    <option value="Disposables & Garbage Bags" <%= "Disposables & Garbage Bags".equals(selectedCategory) ? "selected" : "" %>>Disposables & Garbage Bags</option>
                    <option value="Party & Festive Needs" <%= "Party & Festive Needs".equals(selectedCategory) ? "selected" : "" %>>Party & Festive Needs</option>
                    <option value="Pooja Needs" <%= "Pooja Needs".equals(selectedCategory) ? "selected" : "" %>>Pooja Needs</option>
                    <option value="Mop, Brushes & Scrubs" <%= "Mop, Brushes & Scrubs".equals(selectedCategory) ? "selected" : "" %>>Mop, Brushes & Scrubs</option>
                </select>
            </form>
        </div>

        <!-- Products Section -->
        <div class="card-container">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <h4 class="mb-4">Category: <%= selectedCategory %></h4>
                    </div>

                    <%
                        int id = pdo.findsubcatid(selectedCategory);
                        ArrayList<Product> pl = pdo.getProductByCategoryid(id);
                        if (pl != null && !pl.isEmpty()) {
                            for (Product product : pl) {
                    %>
                    <div class="col-md-4">
                        <div class="card p-3 position-relative">
                            <img src="img/<%= product.getImg_url() %>" class="card-img-top" alt="Product Image">
                            <div class="card-body">
                                <p class="card-text">Product Name: <%= product.getP_name() %></p>
                                <h6>Description: <%= product.getP_desc() %></h6>
                                <h5>Price: ₹<%= product.getPrice() %></h5>
                                <form action="addcart" method="post">
                                    <input type="hidden" name="id" value="<%= product.getP_id() %>">
                                    <button type="submit" class="btn add-btn">Add to Cart</button>
                                </form>
                                <form action="wishlist" method="post">
                                    <input type="hidden" name="id" value="<%= product.getP_id() %>">
                                    <button class="btn save-btn" id="wishlist"><i class="fas fa-bookmark"></i></button>
                                </form>
                            </div>
                        </div>
                    </div>
                    <%
                            }
                        } else {
                    %>
                    <div class="col-12 alert alert-info">No products found.</div>
                    <%
                        }
                    %>
                </div>
            </div>
        </div>
    </div>
</main>

<!-- Footer -->
<jsp:include page="footer.jsp"/>

</body>
</html>
