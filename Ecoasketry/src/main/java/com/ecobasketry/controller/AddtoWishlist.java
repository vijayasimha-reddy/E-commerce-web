package com.ecobasketry.controller;

import java.io.IOException;

import com.ecobasketry.model.dao.CartDAO;
import com.ecobasketry.model.dao.WishlistDAO;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/wishlist")
public class AddtoWishlist extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession(false);
		
		int pid=Integer.parseInt(req.getParameter("id"));
		WishlistDAO wdo=new WishlistDAO(session);
		
		if(wdo.addWishlist(pid))
		{
			   req.setAttribute("success", "Added to wishlist Successfully");
			   RequestDispatcher rd=req.getRequestDispatcher("AdminHome.jsp");
			   rd.forward(req, resp);
		}
		else {
            req.setAttribute("error", "Failed to add to wishlist");
            RequestDispatcher rd = req.getRequestDispatcher("AdminHome.jsp");
            rd.forward(req, resp);
        }
       
    }
}