package com.groo.frontController;

import java.io.IOException;

import com.groo.controller.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FrontControllerServlet
 */
@WebServlet("*.do")
public class FrontControllerImpl extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());

		FrontPath pathMapper = new FrontPath();
		FrontControllerPath controllerMapper = new FrontControllerPath();

		String jspPath = pathMapper.getJspPath(command);

		if (jspPath != null) {
		    request.getRequestDispatcher(jspPath).forward(request, response);
		    return;
		}

        Controller controller = controllerMapper.getControllers(command);
        if (controller != null) {
            controller.service(request, response); // 해당 컨트롤러 실행
            return;
        }
	}
}
