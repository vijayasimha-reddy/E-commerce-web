package com.ecobasketry.controller;

import java.io.IOException;
import java.net.Authenticator.RequestorType;

import com.ecobasketry.model.dao.CartDAO;
import com.ecobasketry.model.dao.WishlistDAO;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/wishlistcart")
public class WishlistToCart extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id=Integer.parseInt(req.getParameter("id"));
		HttpSession session=req.getSession(false);
		CartDAO cdo=new CartDAO(session);
		WishlistDAO wdo=new WishlistDAO(session);
		if(cdo.addCart(id))
		{
			if(wdo.deleteWishlist(id))
			{
				req.setAttribute("success","Item Added to Cart And Delete Wishlist");
				RequestDispatcher rd=req.getRequestDispatcher("wishlist.jsp");
				rd.forward(req, resp);
			}
			else
			{
				req.setAttribute("error","Failed to Delete Wishlist");
				RequestDispatcher rd=req.getRequestDispatcher("wishlist.jsp");
				rd.forward(req, resp);
			}
		}
		else
		{
			req.setAttribute("error","Failed to Add Cart");
			RequestDispatcher rd=req.getRequestDispatcher("wishlist.jsp");
			rd.forward(req, resp);
		}
	}
}
