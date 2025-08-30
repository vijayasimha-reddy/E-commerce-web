<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ecobasketry.model.dao.*"%>
<%@page import="com.ecobasketry.model.dto.*"%>
<!DOCTYPE html>
<head>
    <title>Wishlist</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    
    body{
    margin-top: 12vh;
    }
    <style>
        .wishlist-image {
            max-width: 100px;
            height: auto;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        @media (max-width: 768px) {
            .wishlist-image {
                max-width: 80px;
            }
        }
    </style>
</head>
<body class="bg-light text-dark">
<%@include file="navbar.jsp" %>
<%Customer c1 = (Customer) session.getAttribute("user");%>
<div class="container my-5">
    <% if (c1!= null) { %>
        <h2 class="text-center text-danger text-uppercase mb-4">Wishlist</h2>
        <div class="table-responsive">
            <table class="table table-bordered table-striped table-hover text-center">
                <thead class="thead-dark">
                    <tr>
                        <th scope="col">Image</th>
                        <th scope="col">Item Name</th>
                        <th scope="col" colspan="2">Actions</th>

                    </tr>
                </thead>
                <tbody>
                    <% 
                        WishlistDAO wdo=new WishlistDAO(session);
                        ArrayList<Wishlist> ar = wdo.getAllWishlist();
                        Iterator<Wishlist> itr = ar.iterator();
                        while (itr.hasNext()) {
                            Wishlist w = itr.next();
                    %>
                    <tr>
                        <td>
                            <img src="img/<%=w.getImg_url()%>" alt="<%=w.getP_name()%>" class="wishlist-image img-fluid">
                        </td>
                        <td class="align-middle"><%=w.getP_name()%></td>
                        <td class="align-middle">
                          <form action="wishlistcart" method="post">
                           <input type="hidden" name="id" value="<%=w.getP_id()%>">
                          <button type="submit" class="btn btn-success">Add To Cart</button>
                          </form>
                        </td>
                        <td class="align-middle">
                            <form action="deletewishlist" method="post" class="d-inline-block">
                                <input type="hidden" name="wishlistid" value="<%=w.getP_id()%>"/>
                                <button type="submit" class="btn btn-danger">Remove</button>
                            </form>
                        </td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
            <a href="AdminHome.jsp" class="btn btn-primary">Back</a><br>
        </div>
    <% } else { %>
        <h2 class="text-center text-danger">Please log in to view your wishlist.</h2>
    <% } %>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
