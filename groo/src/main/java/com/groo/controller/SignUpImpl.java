package com.groo.controller;

import java.io.IOException;

import com.groo.model.MemberDTO;
import com.groo.service.MemberServiceImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SignUpImpl
 */

public class SignUpImpl extends HttpServlet implements Controller {

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
			MemberServiceImpl serviceImpl = new MemberServiceImpl();
			serviceImpl.insertUserService(memberDTO);
			response.sendRedirect("login.jsp");
			response.getWriter().println("사용자 등록 완료: " + memberDTO.getUserId());
		} catch (Exception e) {
			e.printStackTrace();
			response.getWriter().println("사용자 등록 실패: " + e.getMessage());
		}
	}

}
