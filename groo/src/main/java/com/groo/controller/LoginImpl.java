package com.groo.controller;

import java.io.IOException;

import com.groo.model.MemberDAOImpl;
import com.groo.model.MemberDTO;
import com.groo.service.MemberServiceImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginImpl
 */

public class LoginImpl extends HttpServlet implements Controller {

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
			MemberServiceImpl serviceImpl = new MemberServiceImpl();
			
			MemberDTO reMemberDTO = serviceImpl.loginUserService(memberDTO);
			
			if (reMemberDTO.getUserId() != null) {
				HttpSession httpSession = request.getSession();
				httpSession.setAttribute("userId", reMemberDTO.getUserId());

//				System.out.println("로그인 세션 정보 "+httpSession.getAttribute("userId"));
				response.sendRedirect("index.do");
			} else {
				response.getWriter().println("로그인 실패");
				response.sendRedirect("login.do");
			}
		} catch (Exception e) {
			e.printStackTrace();
			response.getWriter().println("로그인 실패: " + e.getMessage());
		}
	}
}
