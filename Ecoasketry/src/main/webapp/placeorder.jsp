<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Order Placed</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .success-container {
            margin-top: 100px;
        }
    </style>
</head>
<body style="padding-top: 70px;">
<%@include file="navbar.jsp" %>

<div class="container text-center success-container">
    <h2 class="text-success">🎉 Your order has been placed successfully!</h2>
    <p>Thank you for shopping with us.</p>

    <a href="AdminHome.jsp" class="btn btn-primary mt-4">Return to Home</a>
    <a href="order.jsp" class="btn btn-primart mt-4">Track Your Orders</a>
</div>

</body>
</html>
