package com.groo.frontController;

import java.io.IOException;

import com.groo.controller.LoginImpl;
import com.groo.controller.MainImpl;
import com.groo.controller.SignUpImpl;
import com.groo.controller.TeamCreateImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FrontControllerServlet
 */
//@WebServlet("/*")
public class FrontControllerServlet extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());
		
		System.out.println("요청 URI: " + requestURI);
		System.out.println("매핑된 커맨드: " + command);
		
		// 2. 요청에 따라 적절한 컨트롤러(작업 클래스)로 위임
		if ("/login".equals(command)) {
			LoginImpl loginController = new LoginImpl();
			loginController.service(request, response);
		} else if ("/signup".equals(command)) {
			SignUpImpl sugnUpController = new SignUpImpl();
			sugnUpController.service(request, response);
		} else if ("/index".equals(command)) {
			MainImpl mainController = new MainImpl();
			mainController.service(request, response);
		} else if ("/teamcreate".equals(command)) {
			TeamCreateImpl teamCreateController = new TeamCreateImpl();
			teamCreateController.service(request, response);
		}else {
			if("login.jsp".equals(command)) {
				System.out.println("들어옴");
				request.getRequestDispatcher(requestURI).forward(request, response);
			}
		}
	}
}
