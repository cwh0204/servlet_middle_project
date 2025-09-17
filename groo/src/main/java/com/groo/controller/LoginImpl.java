package com.groo.controller;

import java.io.IOException;

import com.groo.model.MemberDAOImpl;
import com.groo.model.MemberDTO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginImpl
 */
@WebServlet("/login")
public class LoginImpl extends HttpServlet implements Login {

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/plain; charset=UTF-8");
		String userId = request.getParameter("userId");
		String password = request.getParameter("password");
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setUserId(userId);
		memberDTO.setPassword(password);

		try {
			MemberDAOImpl memberDAO = new MemberDAOImpl();
			String loginCk = memberDAO.login(memberDTO);
			if (loginCk != null) {
				HttpSession httpSession = request.getSession();
				httpSession.setAttribute("userId", loginCk);
				System.out.println(httpSession.getAttribute("userId"));

				response.getWriter().println("로그인 완료 UserId: " + memberDTO.getUserId());
			} else {
				response.getWriter().println("로그인 실패");
				response.sendRedirect("login.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
			response.getWriter().println("로그인 실패: " + e.getMessage());
		}
	}
}
