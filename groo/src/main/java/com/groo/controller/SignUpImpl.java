package com.groo.controller;

import java.io.IOException;

import com.groo.model.MemberDAOImpl;
import com.groo.model.MemberDTO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SignUpImpl
 */
@WebServlet("/signup")
public class SignUpImpl extends HttpServlet implements SignUp {

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SignUpImpl() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/plain; charset=UTF-8");
		
		String name = request.getParameter("name");
		String userId = request.getParameter("userId");
		String password = request.getParameter("password");
		
		MemberDTO memberDTO = new MemberDTO();
		
		memberDTO.setName(name);
		memberDTO.setUserId(userId);
		memberDTO.setPassword(password);
		
		try {
			MemberDAOImpl memberDAO = new MemberDAOImpl();
			memberDAO.signUP(memberDTO);
			response.sendRedirect("login.jsp");
			response.getWriter().println("사용자 등록 완료: " + memberDTO.getUserId());
		} catch (Exception e) {
			e.printStackTrace();
			response.getWriter().println("사용자 등록 실패: " + e.getMessage());
		}
	}

}
