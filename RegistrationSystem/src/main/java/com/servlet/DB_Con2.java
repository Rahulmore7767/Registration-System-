package com.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;


public class DB_Con2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		 String UserEmail = request.getParameter("email");
	     String UserPass = request.getParameter("password");
	     String Cond = request.getParameter("terms");
		
		
		String url = "jdbc:mysql://localhost:3306/";
        String db= " registrationsystem";
        String username = "root";
        String password = "Rahul@7767";
        
        
        String Username = null;
        
        try {
        	//this is the class loader driver
        	Class.forName("com.mysql.cj.jdbc.Driver");
        	
        	//this is the connection class to build connection with my sql
        	Connection Conn = DriverManager.getConnection(url+db, username, password);
           // out.println("Connection successful"); 
            String query = "SELECT EXISTS (\r\n"
            		+ "    SELECT 1 \r\n"
            		+ "    FROM Users \r\n"
            		+ "    WHERE email = '"+UserEmail+"' AND password = '"+UserPass+"' \r\n"
            		+ ") AS is_present;";
            PreparedStatement stm = Conn.prepareStatement(query);
            ResultSet res =stm.executeQuery();
            int Ans = 0;
            if(res.next()){
            	String ans = res.getString("is_present");
            	Ans = Integer.parseInt(ans);
            }
           
             
            if ( Ans == 1) {
//                // Valid credentials, set user as logged in
                HttpSession session = request.getSession();
                session.setAttribute("user", UserEmail);
//                //response.sendRedirect("Login.jsp");
	            session.setAttribute("massage", UserEmail+" Login SucessFul!");
	            response.sendRedirect("Login.jsp");
            } else {
                // Invalid credentials, redirect to login page with error
             	HttpSession session = request.getSession();
            	session.setAttribute("massage","User Not Register... Login Not SucessFul!");
            	response.sendRedirect("Login.jsp");
            }
            Conn.close();
        } catch (Exception e) {
        	e.printStackTrace();
            out.println("Database Not Connected To Servlet!");
        } 
        
        
       
        
        
        
        
        
        
        
      
        //followings is the login verification logic
//        if(Cond == "checked") {
//        if(DBEmail!= null || DBPass != null && UserEmail!= null || UserPass != null) {
//        	if(DBEmail .equals(UserEmail)) {
//        		out.println("Email Is Right");
//        	      if(DBPass.equals(UserPass)) {
//        		     out.println("Password is Right...");
//        		     out.println("<br>");
//        		     out.println("<h1>User Successfully Login...</h1>");
//        	        }else {
//        		     out.println("Password Is Wrong...");
//        	        }
//             }else {
//        	out.println("Email Is Wrong...");
//           }
//        }else {
//        	out.println("Data Not Fetched From Database Or User");
//        }
//        }else {
//        	out.println("Conditions not Accepted!");
//        }
	}

}
