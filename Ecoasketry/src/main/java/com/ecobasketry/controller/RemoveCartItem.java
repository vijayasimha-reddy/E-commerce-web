package com.ecobasketry.controller;

import java.io.IOException;

import com.ecobasketry.model.dao.CartDAO;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/deletecart")
public class RemoveCartItem extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id=Integer.parseInt(req.getParameter("cartid"));
		HttpSession session=req.getSession(false);
		
		CartDAO cdo=new CartDAO(session);
		if(cdo.removeCartItem(id))
		{
			req.setAttribute("success", "Cart Item Removed Successfully");
			RequestDispatcher rd=req.getRequestDispatcher("cart.jsp");
			rd.forward(req, resp);
		}
		else
		{
			req.setAttribute("error", "Failed to Remove Cart Item");
			RequestDispatcher rd=req.getRequestDispatcher("cart.jsp");
			rd.forward(req, resp);
		}
	}

}
