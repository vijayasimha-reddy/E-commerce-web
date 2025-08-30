package com.ecobasketry.controller;

import java.io.IOException;

import com.ecobasketry.model.dao.ProductDAO;
import com.ecobasketry.model.dto.Product;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/updateproduct")
public class UpdateProducts extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Product p=new Product();
		int id=Integer.parseInt(req.getParameter("pid"));
		p.setP_id(id);
		p.setP_name(req.getParameter("pname"));
		p.setCat_name(req.getParameter("cname"));
		p.setSubCat_id(Integer.parseInt(req.getParameter("sid")));
		p.setPrice(Double.parseDouble(req.getParameter("price")));
		p.setStock(Integer.parseInt(req.getParameter("stack")));
		p.setImg_url(req.getParameter("imgurl"));
		p.setP_desc(req.getParameter("desc"));
		
		ProductDAO pdo=new ProductDAO();
		if(pdo.updateProduct(p)) {
			req.setAttribute("success","Product Updated Successfully...");
			RequestDispatcher rd=req.getRequestDispatcher("viewAllProducts.jsp");
			rd.forward(req, resp);
		}
		else
		{
			req.setAttribute("error","Failed to Updated Product...");
			RequestDispatcher rd=req.getRequestDispatcher("updateProduct.jsp");
			rd.forward(req, resp);
		}
	}
}
