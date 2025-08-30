<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.ecobasketry.model.dto.*" %>
<%@ page import="com.ecobasketry.model.dao.*" %>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Product Details</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            margin-top: 20vh;
        }

        .product-card {
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.15);
            padding: 30px 20px;
            margin: 0 20px;
        }

        .product-image {
            max-width: 100%;
            height: 90%;
            border-radius: 10px;
        }

        .back-btn {
            margin-top: 20px;
        }

        .user-reviews-section {
            border-radius: 10px;
            padding: 20px;
            margin-top: 20px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.15);
        }

        .review-form {
            display: flex;
            flex-direction: column;
        }

        .review-form textarea {
            height: 120px;
            border-radius: 8px;
            border: 1px solid #ccc;
            padding: 12px;
            font-size: 1rem;
            resize: none;
            margin-bottom: 12px;
            transition: border-color 0.3s;
        }

        .review-form textarea:focus {
            border-color: #ffca28;
            outline: none;
        }

        .emoji-rating {
            display: flex;
            gap: 5px;
            margin-bottom: 10px;
        }

        .emoji-rating .emoji {
            font-size: 1.5rem;
            cursor: pointer;
        }
    </style>
</head>
<body>

<jsp:include page="navbar.jsp" />

<%
    String Stringid = request.getParameter("id");
    Product p = null;
    if (Stringid != null) {
        try {
            int id = Integer.parseInt(Stringid);
            ProductDAO dao = new ProductDAO();
            p = dao.getProductById(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
%>

<div class="product-card">
    <% if (p != null) { %>
        <div class="row">
            <div class="col-md-6">
                <img src="img/<%= p.getImg_url() %>" alt="Product Image" class="product-image">
            </div>
            <div class="col-md-6">
                <h2><%= p.getP_name() %></h2>
                <p><strong>Description:</strong> <%= p.getP_desc() %></p>
                <h4>Price: ₹<%= p.getPrice() %></h4>

                <h4>Delivery Estimation:</h4>
                <ul class="product-info-list mt-2">
                    <li><strong>Details:</strong> <%= p.getP_desc() %></li>
                    <li><strong>Availability:</strong> In Stock</li>
                    <li><strong>Estimated Delivery:</strong> 3–5 business days</li>
                    <li><strong>Shipping:</strong> Free on orders over ₹1000</li>
                </ul>

                <form action="addcart" method="post" style="margin-top: 20px;">
                    <input type="hidden" name="id" value="<%= p.getP_id() %>">
                    <button type="submit" class="btn btn-outline-success">Add to Cart</button>
                </form>

                <form action="wishlist" method="post" style="margin-top: 10px;">
                    <input type="hidden" name="id" value="<%= p.getP_id() %>">
                    <button class="btn btn-outline-danger">
                        <i class="fas fa-bookmark"></i>
                    </button>
                </form>

                <a href="AdminHome.jsp" class="btn btn-secondary back-btn">Back to Home</a>
            </div>
        </div>

        <div class="user-reviews-section">
            <h4>User Reviews:</h4>
            <div class="review-form mb-3">
                <form action="addReview" method="post">
                    <input type="hidden" name="pid" value="<%= p.getP_id() %>" />
                    <div class="emoji-rating">
                        <input type="radio" id="emoji5" name="rating" value="1" />
                        <label for="emoji5" class="emoji">&#11088;</label>

                        <input type="radio" id="emoji4" name="rating" value="2" />
                        <label for="emoji4" class="emoji">&#11088;</label>

                        <input type="radio" id="emoji3" name="rating" value="3" />
                        <label for="emoji3" class="emoji">&#11088;</label>

                        <input type="radio" id="emoji2" name="rating" value="4" />
                        <label for="emoji2" class="emoji">&#11088;</label>

                        <input type="radio" id="emoji1" name="rating" value="5" />
                        <label for="emoji1" class="emoji">&#11088;</label>
                    </div>

                    <textarea name="review" placeholder="Write your review here..." required></textarea>
                    <button type="submit" class="btn btn-success mt-2">Submit Review</button>
                </form>
            </div>
        </div>
    <% } else { %>
        <div class="alert alert-danger">Product not found.</div>
    <% } %>
</div>

</body>
</html>
