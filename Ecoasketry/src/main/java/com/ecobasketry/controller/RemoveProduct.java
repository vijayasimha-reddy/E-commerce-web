package com.ecobasketry.controller;

import java.io.IOException;

import com.ecobasketry.model.dao.ProductDAO;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/deleteproduct")
public class RemoveProduct extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id=Integer.parseInt(req.getParameter("pid"));
		ProductDAO pdo=new ProductDAO();
		if(pdo.deleteProduct(id)) {
			req.setAttribute("success", "Product Deleted Successfully");
			RequestDispatcher rd=req.getRequestDispatcher("viewAllProducts.jsp");
			rd.forward(req, resp);
		}
		else
		{
			req.setAttribute("error", "Failed to delete Product");
		    RequestDispatcher rd=req.getRequestDispatcher("viewAllProducts.jsp");
		    rd.forward(req, resp);
		}
	}

}
