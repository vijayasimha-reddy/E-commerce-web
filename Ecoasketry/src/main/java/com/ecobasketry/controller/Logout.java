package com.ecobasketry.controller;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/logout")
public class Logout extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session=req.getSession(false);
		if(session!=null) {
			session.invalidate();
			req.setAttribute("success","Logged Out Successfully");
			RequestDispatcher rd=req.getRequestDispatcher("home1.jsp");
		    rd.forward(req, resp);
		}
		else {
			req.setAttribute("error","Session Expired!!!");
			RequestDispatcher rd=req.getRequestDispatcher("home1.jsp");
		    rd.forward(req, resp);	
		}
}}