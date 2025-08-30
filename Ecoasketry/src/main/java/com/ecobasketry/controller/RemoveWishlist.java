package com.ecobasketry.controller;

import java.io.IOException;

import com.ecobasketry.model.dao.WishlistDAO;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/deletewishlist")
public class RemoveWishlist extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id=Integer.parseInt(req.getParameter("wishlistid"));
		HttpSession session=req.getSession(false);
		
		WishlistDAO wdo=new WishlistDAO(session);
		
		if(wdo.deleteWishlist(id)) {
			req.setAttribute("success", "Deleted Successfully");
		    RequestDispatcher rd=req.getRequestDispatcher("wishlist.jsp");
		    rd.forward(req, resp);
		}
		else
		{
			req.setAttribute("error", "Failed to delete Wishlist");
		    RequestDispatcher rd=req.getRequestDispatcher("wishlist.jsp");
		    rd.forward(req, resp);
		}
	}
}
