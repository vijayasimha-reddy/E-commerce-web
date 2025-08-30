package com.ecobasketry.controller;

import java.io.IOException;
import java.net.Authenticator.RequestorType;

import com.ecobasketry.model.dao.OrderssDAO;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/UpdateOrderStatus")
public class UpdateOrderStatus extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session=req.getSession(false);
		int orderId = Integer.parseInt(req.getParameter("orderId"));
        String status = req.getParameter("status");
        OrderssDAO odo=new OrderssDAO(session);
        
        if(odo.updateOrderStatus(orderId, status)) {
        	req.setAttribute("success", "Status changed Successfully");
        	RequestDispatcher rd=req.getRequestDispatcher("viewAllOrders.jsp");
        	rd.forward(req, resp);
        }
        else
        {
        	req.setAttribute("error", "Failed to Update Status");
        	RequestDispatcher rd=req.getRequestDispatcher("viewAllOrders.jsp");
        	rd.forward(req, resp);
        }
	}
}
