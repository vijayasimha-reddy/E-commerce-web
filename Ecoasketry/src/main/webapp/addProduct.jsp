<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.ecobasketry.model.dto.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Product</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">

<style>
    body, html {
        height: 100%;
        margin: 0;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }

    body {
        background: url('Images/car11.webp') no-repeat center center fixed;
        background-size: cover;
    }

    .form-container {
        background-color: rgba(255, 255, 255, 0.92);
        max-width: 900px;
        margin: 80px auto;
        border-radius: 15px;
        box-shadow: 0 6px 15px rgba(0, 0, 0, 0.2);
        padding: 40px;
    }

    .form-header {
        text-align: center;
        margin-bottom: 30px;
    }

    .form-header h2 {
        font-weight: bold;
        color: #343a40;
    }

    .form-split {
        display: flex;
        gap: 20px;
        flex-wrap: wrap;
    }

    .form-left, .form-right {
        flex: 1;
        min-width: 250px;
    }

    .form-label {
        font-weight: 500;
        margin-top: 10px;
        color: #495057;
    }

    .form-control {
        margin-bottom: 15px;
    }

    .btn-success, .btn-primary {
        width: 100%;
        margin-top: 15px;
        padding: 10px;
        font-size: 16px;
        border-radius: 6px;
    }


    @media(max-width: 768px) {
        .form-split {
            flex-direction: column;
        }
    }
</style>
</head>
<body>

<header><jsp:include page="navbar.jsp"/></header>

<div class="form-container">
    <div class="form-header">
        <h2>Add New Product</h2>

        <% String m = (String) request.getAttribute("success");
           if (m != null) { %>
            <%= m %>
        <% } %>
        <% String m1 = (String) request.getAttribute("error");
           if (m1 != null) { %>
           <%= m1 %>
        <% } %>
    </div>

    <form action="addproduct" method="post">
        <div class="form-split">
            <div class="form-left">
                <label class="form-label">Product Name</label>
                <input type="text" name="pname" required class="form-control" placeholder="Enter product name">

                <label class="form-label">Category Name</label>
                <input type="text" name="cname" required class="form-control" placeholder="Enter category name">

                <label class="form-label">Subcategory Id</label>
                <input type="number" name="sid" required class="form-control" placeholder="Enter subcategory ID">

                <label class="form-label">Price</label>
                <input type="number" name="price" required class="form-control" placeholder="Enter price">
            </div>

            <div class="form-right">
                <label class="form-label">Stack</label>
                <input type="number" name="stack" required class="form-control" placeholder="Enter stock quantity">
                
                <label class="form-label">Img Url</label>
                <input type="text" name="imgurl" required class="form-control" placeholder="Enter image URL/path">

                <label class="form-label">Description</label>
                <input type="text" name="desc" required class="form-control" placeholder="Enter product description">
                <br>
                <button type="submit" class="btn btn-success">Add Product</button>
               
            </div>
        </div>
         <a href="AdminHome.jsp" class="btn btn-primary">Back To Home Page</a>
    </form>
</div>

</body>
</html>
