package com.groo.frontController;

import java.io.IOException;

import com.groo.controller.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class FrontControllerServlet
 */
@WebServlet("*.do")
public class FrontControllerImpl extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());

		FrontPath pathMapper = new FrontPath();

		FrontControllerPath controllerMapper = new FrontControllerPath(); 

		String jspPath = pathMapper.getJspPath(command);
		Controller controller = controllerMapper.getControllers(command);
		
		if (jspPath == null && controller == null) {
			response.sendRedirect("login.do");
			return;
		}
		
		/*
		if(!command.equals("/login.do") && !command.equals("/*.do") && !command.equals("/logins.do")) {
			HttpSession session = request.getSession(false);
		    String userId = (session != null) ? (String) session.getAttribute("userId") : null;
		    if (userId == null) {
		    	response.sendRedirect("login.do");
		    	return;
		    }
		}
		*/
		if (jspPath != null) {
			request.getRequestDispatcher(jspPath).forward(request, response);
			return;
		}

		if (controller != null) {
			controller.service(request, response); // 해당 컨트롤러 실행
			return;
		}
	}
}
