package com.ecobasketry.controller;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.ecobasketry.model.dao.CustomerDAO;
import com.ecobasketry.model.dto.Customer;
@WebServlet("/login")
public class Login extends HttpServlet{
	protected void doPost(HttpServletRequest req,HttpServletResponse resp) throws ServletException, IOException
	{
		HttpSession session=req.getSession();
		CustomerDAO cdo=new CustomerDAO();
		Customer c=null;
		String u=req.getParameter("username");
		String p=req.getParameter("password");
		c=cdo.Login(u, p);
		if(c!=null)
		{
			   req.setAttribute("success", "Login Successfull");
			   session.setAttribute("user", c);
			   RequestDispatcher rd=req.getRequestDispatcher("AdminHome.jsp");
			   rd.forward(req, resp);
		}
		else {
			   req.setAttribute("error","Incorrect Credentials");
			   RequestDispatcher rd=req.getRequestDispatcher("login.jsp");
			   rd.forward(req, resp);
		   }
	}
}
