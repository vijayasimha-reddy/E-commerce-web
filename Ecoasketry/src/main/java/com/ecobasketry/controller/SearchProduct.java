package com.ecobasketry.controller;

import java.io.IOException;
import java.util.ArrayList;

import com.ecobasketry.model.dao.ProductDAO;
import com.ecobasketry.model.dto.Product;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/search")
public class SearchProduct extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession(false);
		String query = req.getParameter("product").trim();
        
        ProductDAO dao = new ProductDAO();
        ArrayList<Product> results = dao.searchProduct(query);
        if(session==null) {
            req.setAttribute("productList", results);
            RequestDispatcher rd = req.getRequestDispatcher("home1.jsp");
            rd.forward(req, resp);
           
        }
        else {
            req.setAttribute("productList", results);
            RequestDispatcher rd = req.getRequestDispatcher("AdminHome.jsp");
            rd.forward(req, resp);
        }    
	}
}
