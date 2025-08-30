package com.ecobasketry.controller;

import java.io.IOException;

import com.ecobasketry.model.dao.CartDAO;
import com.ecobasketry.model.dao.OrderssDAO;
import com.ecobasketry.model.dto.Customer;
import com.ecobasketry.model.dto.orderss;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/orders")
public class Order extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        Customer c = (Customer) session.getAttribute("user");
        
        orderss o=new orderss();
        
        o.setO_address(req.getParameter("address"));
        o.setO_city(req.getParameter("city"));
        o.setO_state(req.getParameter("state"));
        o.setPin(Integer.parseInt(req.getParameter("pin")));

        OrderssDAO odo=new OrderssDAO(session);
        CartDAO cdo=new CartDAO(session);
        int id=c.getUser_id();
        if (odo.addOrders(o)) {
        	if(cdo.deleteCartItem(id))
        	{
            req.setAttribute("success", "Order Placed Successfully");
            RequestDispatcher rd = req.getRequestDispatcher("placeorder.jsp");
            rd.forward(req, resp);} 
        	else {
            req.setAttribute("error", "Failed to delete Cart Item");
            RequestDispatcher rd = req.getRequestDispatcher("order.jsp");
            rd.forward(req, resp);
            }
        }
        else {
            req.setAttribute("error", "Failed to Place Order");
            RequestDispatcher rd = req.getRequestDispatcher("order.jsp");
            rd.forward(req, resp);
	}
}
}
