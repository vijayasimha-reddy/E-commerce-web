package com.ecobasketry.controller;

import java.io.IOException;

import com.ecobasketry.model.dao.CustomerDAO;
import com.ecobasketry.model.dto.Customer;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/update")
public class Updates extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Customer c=null;
		HttpSession session=req.getSession(false);
		c=(Customer)session.getAttribute("user");
		c.setName(req.getParameter("name"));
		c.setPhone(Long.parseLong(req.getParameter("phone")));
		c.setMail(req.getParameter("mail"));
		
		CustomerDAO cdo=new CustomerDAO();
		if(cdo.updateCustomer(c))
		{
			   req.setAttribute("success", "Updated Successfully");
			   RequestDispatcher rd=req.getRequestDispatcher("AdminHome.jsp");
			   rd.forward(req, resp);
		}
		else
		{
			   req.setAttribute("error", "Failed to Update");
			   RequestDispatcher rd=req.getRequestDispatcher("update.jsp");
			   rd.forward(req, resp);
		}
	}
}