<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ecobasketry.model.dao.*"%>
<%@page import="com.ecobasketry.model.dto.*"%>
<!DOCTYPE html>
<head>
    <title>View Users</title>
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
<div class="container my-5">
        <h2 class="text-center text-danger text-uppercase mb-4">All Users</h2>
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
                        <th scope="col">User ID</th>
                        <th scope="col">User Name</th>
                        <th scope="col">User Phone No</th>
                        <th scope="col">User Mail Id</th>
                        <th scope="col">Action</th>
                        </tr>
                </thead>
                <tbody>
                    <% 
                        CustomerDAO cdo=new CustomerDAO();
                        ArrayList<Customer> ar = cdo.getAllUsers();
                        Iterator<Customer> itr = ar.iterator();
                        while (itr.hasNext()) {
                        	Customer c1= itr.next();
                    %>
                    <tr>
                        <td class="align-middle"><%=c1.getUser_id() %></td>
                        <td class="align-middle"><%=c1.getName()%></td>
                        <td class="align-middle"><%=c1.getPhone()%></td>
                        <td class="align-middle"><%=c1.getMail()%></td>
                        <td class="align-middle">
                        <form action="deleteUser" method="post">
                        <input type="hidden" name="Id" value="<%=c1.getUser_id()%>">
                        <button type="submit" class="btn btn-danger">Delete User</button>
                        </form>
                        </td>

                    </tr>
                    <% } %>
                </tbody>
            </table>
            <a href="AdminHome.jsp" class="btn btn-primary">Back</a><br>
        </div>
    	
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
