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


@WebServlet("/signup")
public class SignUp extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Customer c=new Customer();
		HttpSession session=req.getSession(false);
		CustomerDAO cdao=new CustomerDAO();
		c.setName(req.getParameter("username"));
		c.setPhone(Long.parseLong(req.getParameter("phone")));
		c.setMail(req.getParameter("email"));
		if(req.getParameter("password").equals(req.getParameter("confirm"))) {
			c.setPassword(req.getParameter("password"));
			if(cdao.Register(c)) {
				req.setAttribute("success", "SignUp Successfull...Please Login");
				RequestDispatcher rd=req.getRequestDispatcher("login.jsp");
				rd.forward(req, resp);
			}
			else {
				req.setAttribute("error", "Failed to SignUp...Please try again");
				RequestDispatcher rd=req.getRequestDispatcher("signup.jsp");
				rd.forward(req, resp);
			}
		}
		else {
			req.setAttribute("error", "Password Mismatch....");
			RequestDispatcher rd=req.getRequestDispatcher("signup.jsp");
			rd.forward(req, resp);
		}
		
	}
}
