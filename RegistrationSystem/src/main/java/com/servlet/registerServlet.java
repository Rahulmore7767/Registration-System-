package com.servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

public class registerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	String FullName,Email,Passward,check;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out= response.getWriter();
		
		registerServlet obj = new registerServlet();
		obj.FullName = request.getParameter("fullname");
		obj.Email = request.getParameter("email");
		obj.Passward = request.getParameter("password");
		obj.check = request.getParameter("terms");
	
		RequestDispatcher rd =request.getRequestDispatcher("DB_Con");
		rd.forward(request, response);	
	}

}
