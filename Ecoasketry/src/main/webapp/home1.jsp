<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.ecobasketry.model.dto.*" %>
<%@ page import="com.ecobasketry.model.dao.ProductDAO" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Home Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css"
          integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>

    <style>
        #carouselExampleCaptions {
            margin-top: 12vh;
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


       /* Fixed Sidebar Styling */
.sidebar {
    position: sticky;  
    top: 550px;
    width: 240px;
    background-color: #fff6f0;
    padding: 10px 0;
    height: fit-content;
    border-right: 1px solid #ccc;
    
}

.sidebar ul {
    list-style: none;
    padding-left: 0;
    margin: 0;
}

.sidebar li {
    position: sticky;
    padding: 12px 20px;
    cursor: pointer;
    border-bottom: 1px solid #ebebeb;
    font-weight: 600;
    color: #343a40;
    transition: background-color 0.3s ease;
    height: fit-content;
}

.sidebar li:hover {
    background-color: #ffe5d4;
    color: #d64500;
}

.subcategory-list {
    display: none;
    position: absolute;
    top: 0;
    left: 100%;
    background-color: #fff6f0;
    padding: 10px;
    min-width: 200px;
    z-index: 1001; /* Make sure it's above carousel */
    border: 1px solid #eb6e34;
    box-shadow: 2px 2px 10px rgba(0,0,0,0.1);
    border-radius: 8px;
    white-space: nowrap;
}


.sidebar li:hover .subcategory-list {
    display: block;
}

.subcategory-list a {
    display: block;
    padding: 8px;
    color: #333;
    text-decoration: none;
    border-radius: 4px;
    transition: background-color 0.3s;
}

.subcategory-list a:hover {
    background-color: #eb6e34;
    color: white;
}

.main-div {
    display: flex;
    align-items: fles-start;
    gap: 20px;
    padding: 20px;
}
.product-card {
    width: 270px; /* or whatever your original card width was */
    margin-bottom: 20px;
    background-color: #ffffff;
    padding: 16px;
    border-radius: 12px;
    box-shadow: 0 4px 8px rgba(0,0,0,0.1);
    text-align: center;
    transition: transform 0.2s ease-in-out;
}
.product-card:hover {
    transform: scale(1.02);
}
    
    </style>
</head>
<body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<%Customer c = (Customer) session.getAttribute("user"); %>
<header>
    <jsp:include page="navbar1.jsp"/>
    <%String m = (String) request.getAttribute("success");
    if (m != null) {%>
    <%= m %>
    <%}%>
	<%String m1 = (String) request.getAttribute("error");
	if (m1 != null) {%>
   <%= m1 %>
	<%}%>
	
		<div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
    <div class="carousel-indicators">
        <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active"></button>
        <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1"></button>
        <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2"></button>
    </div>

    <div class="carousel-inner">
        <div class="carousel-item active" data-bs-interval="3000" style="display-flex:center;">
            <img src="Images/car3.webp" class="d-block w-100" alt="Coupon Available" height="430vh">
        </div>
        <div class="carousel-item" data-bs-interval="3000">
            <img src="Images/car2.webp" class="d-block w-100" alt=" Happy Shopping" height="430vh">
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

</header>

<%
    ProductDAO pdo = new ProductDAO();
    String selectedCategory = request.getParameter("category");

    if (selectedCategory == null || selectedCategory.trim().isEmpty()) {
    
        selectedCategory = "Biscuits & Cookies";}%>
<main>
    <div class="main-div">
        <div class="category-box">
            <form action="home1.jsp" method="get">
               <div class="category-box sidebar">
    <ul>
        <%
            List<String> allCategories = pdo.getAllCategories(); // You should implement this
            for (String cat : allCategories) {
                List<String> subcats = pdo.getSubcategoriesByCategory(cat); // You already have this
        %>
        <li>
            <%= cat %>
            <div class="subcategory-list">
                <% for (String sub : subcats) { %>
                   <a href="home1.jsp?category=<%= java.net.URLEncoder.encode(sub, "UTF-8") %>"><%= sub %></a>

                <% } %>
            </div>
        </li>
        <% } %>
    </ul>
</div>
               
                </form>
        </div>  
        
        <div class="card-container">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <h4 class="mb-4">Category: <%= selectedCategory %></h4>
                       
                        
                    </div>
                    <%
                    int id=pdo.findsubcatid(selectedCategory);
                    ArrayList<Product> pl = pdo.getProductBySubcategoryid(id);
                        if (pl != null && !pl.isEmpty()) {
                            for (Product product : pl) {
                    %>
                     <div class="col-md-4 d-flex">
                     
            <div class="card p-3 position-relative">
                <img src="img/<%=product.getImg_url() %>" class="card-img-top" alt="Value Pack">
                <div class="card-body">
                    <p class="card-text">Product Name:<%=product.getP_name() %></p>
                    <h6>Description:<%=product.getP_desc() %></h6>
                    <h5>Price:<%=product.getPrice() %></h5>
                    <form action="addcart" method="post">
                    <input type="hidden" name="id" value="<%= product.getP_id()%>">
                    <button type="submit" class="btn add-btn">Add to Cart</button>
                    </form>
                    <form action="wishlist" method="post">
                    <input type="hidden" name="id" value="<%=product.getP_id()%>">
                    <button class="btn save-btn" id="wishlist"><i class="fas fa-bookmark"></i></button>
                    
                    </form>
                </div>
            </div>
        </div>
        <%} }else {
                    %>
                    <div class="col-12 alert alert-info">No products found.</div>
                    <% } %>
                </div>
            </div>
        </div>
        
    </div>
    
</main>

<jsp:include page="footer.jsp"/>

</body>
</html>