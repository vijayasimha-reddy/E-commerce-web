<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.ecobasketry.model.dto.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ecobasketry.model.dao.CartDAO"%>
<!DOCTYPE html>
<html>
<head>
    <title>Your Cart Items</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <style>
    body{
    margin-top: 20vh;
    }
    </style>
</head>
<body>
<%@include file="navbar.jsp" %>
<%Customer c1 = (Customer) session.getAttribute("user");%>
<div class="container mt-5">
    <% if (c1 != null) { %>
        <h2>Your Cart Items</h2>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Image</th>
                    <th>Product Name</th>
                    <th>Cost (&#8377;)</th>
                    <th>Quantity</th>
                    <th>Total (&#8377;)</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <%
                    CartDAO cdo = new CartDAO(session);
                    ArrayList<Cart> ar = cdo.getcartItem();
                    for (Cart s : ar) {
                %>
                <tr class="cart-row">
                    <td><img src="img/<%=s.getImg_url()%>" style="height: 60px;"></td>
                    <td><%=s.getP_name()%></td>
                    <td class="price"><%=s.getP_price()%></td>
                    <td>
                        <div class="d-flex align-items-center">
                            <button class="btn btn-sm btn-outline-secondary decrease">-</button>
                            <span class="mx-2 number">1</span>
                            <button class="btn btn-sm btn-outline-secondary increase">+</button>
                        </div>
                    </td>
                    <td class="item-total"><%=s.getP_price()%></td>
                    <td>
                    <form action="deletecart" method="post">
                    <input type="hidden" name="cartid" value="<%=s.getC_id()%>">
                    <button type="submit" class="btn btn-danger">Remove</button>
                    </form>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>

        <h4>Total: &#8377;<span id="grand-total">0</span></h4>
        <a href="order.jsp" class="btn btn-primary">Proceed to Checkout</a>
        <a href="AdminHome.jsp" class="btn btn-primary">Back</a>
    <% } else { %>
        <h2>Please log in to view your cart.</h2>
    <% } %>
</div>

<script>
  function updateTotals() {
    let grandTotal = 0;
    document.querySelectorAll('.cart-row').forEach(row => {
      const price = parseFloat(row.querySelector('.price').textContent);
      const quantity = parseInt(row.querySelector('.number').textContent);
      const total = price * quantity;
      row.querySelector('.item-total').textContent = total.toFixed(2);
      grandTotal += total;
    });
    document.getElementById('grand-total').textContent = grandTotal.toFixed(2);
  }

  document.querySelectorAll('.cart-row').forEach(row => {
    const decreaseBtn = row.querySelector('.decrease');
    const increaseBtn = row.querySelector('.increase');
    const numberEl = row.querySelector('.number');

    decreaseBtn.addEventListener('click', () => {
      let qty = parseInt(numberEl.textContent);
      if (qty > 1) {
        numberEl.textContent = qty - 1;
        updateTotals();
      }
    });

    increaseBtn.addEventListener('click', () => {
      let qty = parseInt(numberEl.textContent);
      numberEl.textContent = qty + 1;
      updateTotals();
    });
  });

  updateTotals();
</script>
</body>
</html>