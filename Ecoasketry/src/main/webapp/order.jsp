<%@page import="java.util.ArrayList"%>
<%@page import="com.ecobasketry.model.dto.*"%>
<%@page import="com.ecobasketry.model.dao.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Order</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        #success { color: green; }
        input[type="text"], input[type="number"], select {
            width: 100%;
            padding: 8px;
            margin: 6px 0;
            box-sizing: border-box;
        }
    </style>
</head>
<body style="padding-top: 70px;">
    <center><h2>Billing Page</h2></center>
    <%@include file="navbar.jsp" %>

    <div class="container mt-3">
        <%  
            Customer c1 = (Customer) session.getAttribute("user"); 
            String successMsg = (String) request.getAttribute("success");
            String errorMsg = (String) request.getAttribute("error");
        %>

        <% if (successMsg != null) { %>
            <h2 class="text-success text-center" id="success"><%= successMsg %></h2>
        <% } %>
        <% if (errorMsg != null) { %>
            <h2 class="text-danger text-center"><%= errorMsg %></h2>
        <% } %>

        <form action="orders" method="POST">
            <table class="table table-bordered">
                <tr>
                    <th>Product Image</th>
                    <th>Product Name</th>
                    <th>Total</th>
                </tr>

                <%
                    CartDAO cdo = new CartDAO(session);
                    ArrayList<Cart> cartList = cdo.getcartItem();
                    double grandTotal = 0;

                    if (cartList != null && !cartList.isEmpty()) {
                        for (Cart cart : cartList) {
                            double total = cart.getP_price() * cart.getQuantity();
                            grandTotal += total;
                %>
                <tr>
                    <td><img src="img/<%= cart.getImg_url() %>" width="100" height="100"/></td>
                    <td><%= cart.getP_name() %></td>
                    <td>₹<%= total %></td>
                </tr>
                <% 
                        }
                    } else { 
                %>
                <tr>
                    <td colspan="3">Your cart is empty.</td>
                </tr>
                <% } %>

                <%
                    double gst = grandTotal * 0.18;
                    double finalTotal = grandTotal + gst;
                %>

                <tr>
                    <td colspan="2"><strong>Subtotal</strong></td>
                    <td><strong>₹<%= String.format("%.2f", grandTotal) %></strong></td>
                </tr>
                <tr>
                    <td colspan="2"><strong>GST (18%)</strong></td>
                    <td><strong>₹<%= String.format("%.2f", gst) %></strong></td>
                </tr>
                <tr>
                    <td colspan="2"><strong>Final Amount</strong></td>
                    <td><strong>₹<%= String.format("%.2f", finalTotal) %></strong></td>
                </tr>
            </table>

            <% if (cartList != null) { %>
                <label for="payment_method"><strong>Payment Method:</strong></label>
                <select name="payment_method" id="payment_method" required>
                    <option value="cash">Cash on delivery</option>
                </select>

                <h4><u>Delivery Address:</u></h4>
                <input type="text" name="address" placeholder="Complete address" required>
                <input type="text" name="city" placeholder="Enter city" required>
                <input type="text" name="state" placeholder="Enter state" required>
                <input type="number" name="pin" placeholder="Enter Pin Code" required>

                <div class="text-center mt-3">
                    <button type="submit" class="btn btn-success">Place Order</button>
                </div>
            <% } %>
        </form>
    </div>
</body>
</html>
