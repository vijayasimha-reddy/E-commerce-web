<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ecobasketry.model.dao.*"%>
<%@page import="com.ecobasketry.model.dto.*"%>
<!DOCTYPE html>
<head>
    <title>View Order</title>
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
        <h2 class="text-center text-danger text-uppercase mb-4">All Orders</h2>
        <%String m = (String) request.getAttribute("success");
    	if (m != null) {%>
    	<%= m %>
    	<%}%>
    	<%String m1 = (String) request.getAttribute("error");
    	if (m1 != null) {%>
   		<%= m1 %>
   		<%}%>
        <div class="table-responsive">
            <table class="table table-bordered table-striped table-hover text-center">
                <thead class="thead-dark">
                    <tr>
                        <th scope="col">Order ID</th>
                        <th scope="col">User ID</th>
                        <th scope="col">User Name</th>
                        <th scope="col">Product Name</th>
                        <th scope="col">Order Date</th>
                        <th scope="col">Order Status</th>

                    </tr>
                </thead>
                <tbody>
                    <% 
                        OrderssDAO odo=new OrderssDAO(session);
                        ArrayList<orderss> ar = odo.getAllOrders();
                        Iterator<orderss> itr = ar.iterator();
                        while (itr.hasNext()) {
                        	orderss o= itr.next();
                    %>
                    <tr>
                        <td class="align-middle"><%=o.getO_id() %></td>
                        <td class="align-middle"><%=o.getUser_id()%></td>
                        <td class="align-middle"><%=o.getUname() %></td>
                        <td class="align-middle"><%=o.getP_name() %></td>
                        <td class="align-middle"><%=o.getO_date() %></td>
                        <td class="align-middle">
                        <form action="UpdateOrderStatus" method="post">
                        <input type="hidden" name="orderId" value="<%= o.getO_id()%>">
                        <select name="status" onchange="this.form.submit()">
                        <option value="CONFIRMED" <%= "CONFIRMED".equals(o.getStatus()) ? "selected" : "" %>>CONFIRM</option>
                        <option value="CANCELLED" <%= "CANCELLED".equals(o.getStatus()) ? "selected" : "" %>>CANCELL</option>
                        <option value="DELIVERED" <%= "DELIVERED".equals(o.getStatus()) ? "selected" : "" %>>DELIVER</option>
                        </select>
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
