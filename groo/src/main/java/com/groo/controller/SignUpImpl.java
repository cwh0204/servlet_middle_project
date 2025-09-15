package com.groo.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class SignUpImpl
 */
@WebServlet("/signup")
public class SignUpImpl extends HttpServlet implements SignUp{
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignUpImpl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
    @Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	request.setCharacterEncoding("UTF-8");
    	String name = request.getParameter("name");
    	String userId = request.getParameter("userId");
    	String password = request.getParameter("password");
    	
    	System.out.println("name = "+name);
    	System.out.println("userid = "+userId);
    	System.out.println("password = "+password);
	}

}
