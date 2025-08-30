<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.ecobasketry.model.dao.*"%>
<%@page import="com.ecobasketry.model.dto.*"%>
<!DOCTYPE html>
<html>
<head>
<title>Update Product</title>
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
    }
</style>
</head>
<body>

<header><jsp:include page="navbar.jsp"/></header>
<%String idPara = request.getParameter("id");
    Product p = null;
    if (idPara != null) {
        try {
            int pid = Integer.parseInt(idPara);
            ProductDAO dao = new ProductDAO();
            p = dao.getProductById(pid);
            request.setAttribute("product", p);
        } catch (Exception e) {
        }
    }
%>
<div class="form-container">
    <div class="form-header">
        <h2>Update Product</h2>
        <% String m1 = (String) request.getAttribute("error");
           if (m1 != null) { %>
            <%= m1 %>
        <% } %>
    </div>

    <form action="updateproduct" method="post">
        <input type="hidden" name="pid" value="<%= p.getP_id() %>">
        <div class="form-split">
            <div class="form-left">
                <label class="form-label">Product Name</label>
                <input type="text" name="pname" value="<%= p.getP_name() %>" required class="form-control">

                <label class="form-label">Category Name</label>
                <input type="text" name="cname" value="<%= p.getCat_name() %>" required class="form-control">

                <label class="form-label">Subcategory Id</label>
                <input type="number" name="sid" value="<%= p.getSubCat_id() %>" required class="form-control">

                <label class="form-label">Price</label>
                <input type="number" name="price" value="<%= p.getPrice() %>" required class="form-control">

                
            </div>

            <div class="form-right">
                <label class="form-label">Stack</label>
                <input type="number" name="stack" value="<%= p.getStock() %>" required class="form-control">
                
                <label class="form-label">Img Url</label>
                <input type="text" name="imgurl" value="<%= p.getImg_url() %>" required class="form-control">

                <label class="form-label">Description</label>
                <input type="text" name="desc" value="<%= p.getP_desc() %>" required class="form-control">
                <br>
                <button type="submit" class="btn btn-success">Update Product</button>
                
            </div>
        </div>
        <a href="AdminHome.jsp" class="btn btn-primary">Back to Home Page</a>
    </form>
</div>
</body>
</html>