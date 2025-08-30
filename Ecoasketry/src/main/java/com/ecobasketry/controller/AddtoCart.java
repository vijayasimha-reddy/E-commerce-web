package com.ecobasketry.controller;

import java.io.IOException;

import com.ecobasketry.model.dao.CartDAO;
import com.ecobasketry.model.dao.WishlistDAO;
import com.ecobasketry.model.dto.Customer;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/addcart")
public class AddtoCart extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);

        Customer c = (Customer) session.getAttribute("user");
        int pid = Integer.parseInt(req.getParameter("id"));
        CartDAO cdo = new CartDAO(session);
        if(cdo.addCart(pid)) {
        	req.setAttribute("success", "Item Added to Cart Successfully");
        	RequestDispatcher rd=req.getRequestDispatcher("AdminHome.jsp");
        	rd.forward(req, resp);
        }
        else
        {
        	req.setAttribute("error","Failed to Add Cart");
        	RequestDispatcher rd=req.getRequestDispatcher("AdminHome.jsp");
        	rd.forward(req, resp);
        }
    }
}
