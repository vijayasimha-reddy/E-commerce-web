package com.ecobasketry.controller;

import java.io.IOException;

import com.ecobasketry.model.dao.CustomerDAO;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/deleteUser")
public class RemoveUser extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id=Integer.parseInt(req.getParameter("Id"));
		HttpSession session=req.getSession(false);
		CustomerDAO cdo=new CustomerDAO();
		if(cdo.deleteUser(id)) {
			req.setAttribute("success", "User Deleted Successfully");
			RequestDispatcher rd=req.getRequestDispatcher("viewAllUsers.jsp");
			rd.forward(req, resp);
		}
		else
		{
			req.setAttribute("error", "Failed to delete User");
		    RequestDispatcher rd=req.getRequestDispatcher("viewAllUsers.jsp");
		    rd.forward(req, resp);
		}
	}

}