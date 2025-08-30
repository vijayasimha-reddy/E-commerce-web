package com.ecobasketry.controller;

import java.io.IOException;

import com.ecobasketry.model.dto.Review;
import com.ecobasketry.model.dao.ReviewDAO;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/addReview")
public class Reviewss extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Review r=new Review();
		int id=Integer.parseInt(req.getParameter("pid"));
		r.setPid(id);
		r.setRating(Integer.parseInt(req.getParameter("rating")));
		r.setReview(req.getParameter("review"));
		HttpSession session=req.getSession(false);
		ReviewDAO rdo=new ReviewDAO(session);
		if(rdo.addReview(r)) {
			req.setAttribute("success", "Your Review Added Successfully");
			RequestDispatcher rd=req.getRequestDispatcher("product.jsp");
			rd.forward(req, resp);
		}
		else
		{
			req.setAttribute("error", "Failed to Add Review Please Try Again");
			RequestDispatcher rd=req.getRequestDispatcher("product.jsp");
			rd.forward(req, resp);
		}
		
	}
}
