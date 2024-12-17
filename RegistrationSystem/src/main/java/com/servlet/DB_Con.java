package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


public class DB_Con extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
     
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 response.setContentType("text/html");
	        PrintWriter out = response.getWriter();
	        
	        
	        String FullName = request.getParameter("fullname");
			String Email = request.getParameter("email");
			String Password = request.getParameter("password");

	        String url = "jdbc:mysql://localhost:3306/";
	        String db= " registrationsystem";
	        String username = "root";
	        String password = "Rahul@7767";
	        
	        try {
	        	Class.forName("com.mysql.cj.jdbc.Driver");
	        	
	        	Connection Conn = DriverManager.getConnection(url+db, username, password);
	           // out.println("Connection successful"); 
	          
	            String query = "INSERT INTO Users(username, email, password) VALUES (?, ?, ?)";
	            PreparedStatement stmt = Conn.prepareStatement(query);
	            stmt.setString(1, FullName);
	            stmt.setString(2, Email);
	            stmt.setString(3, Password);
	            stmt.executeUpdate();
	            
	            //following lines for a send a Massage to register page to show
	            HttpSession httpsession = request.getSession();
	            httpsession.setAttribute("massage", "A new user was inserted successfully!");
	            response.sendRedirect("register.jsp");
	            Conn.close();
	        } catch (Exception e) {
	        	e.printStackTrace();
	            out.println("Connection failed!");
	        } 
	    }
}


