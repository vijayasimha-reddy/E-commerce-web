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

@WebServlet("/forgot")
public class ForgotPassword extends HttpServlet{
@Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	Customer c=null;
	CustomerDAO cdao=new CustomerDAO();
    c=cdao.getUserbyMailPhone(req.getParameter("mail"),Long.parseLong(req.getParameter("phone")));
    if(req.getParameter("password").equals(req.getParameter("confirm")))
    {
      if(c!=null)
      {
    	    c.setPassword(req.getParameter("confirm"));
			if(cdao.updateCustomer(c))
			{
				   req.setAttribute("success","Reset successfull...Please login");
				   RequestDispatcher rd=req.getRequestDispatcher("login.jsp");
				   rd.forward(req, resp);
			}
			else 
			{
				   req.setAttribute("error","Failed to reset Password...Please try again");
				   RequestDispatcher rd=req.getRequestDispatcher("forgotpassword.jsp");
				   rd.forward(req, resp);
			}
			
		}
        else {
		   req.setAttribute("error","User not Found");
		   RequestDispatcher rd=req.getRequestDispatcher("forgotpassword.jsp");
		   rd.forward(req, resp);
	     }
	}
    else {
		  req.setAttribute("error","Password Mismatch...");
		   RequestDispatcher rd=req.getRequestDispatcher("forgotpassword.jsp");
		   rd.forward(req, resp);
	}
}
}
