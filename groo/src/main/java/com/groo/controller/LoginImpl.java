package com.groo.controller;

import java.io.IOException;

import com.groo.error.ErrorDTO;
import com.groo.error.InternalServiceException;
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

		String loginType = request.getParameter("login_type");

		if(loginType.equals("member")) {
			String userId = request.getParameter("userId");
			String password = request.getParameter("password");

			MemberDTO memberDTO = new MemberDTO();
			memberDTO.setMemId(userId);
			memberDTO.setMemPass(password);

			try {
				MemberServiceImpl serviceImpl = new MemberServiceImpl();

				MemberDTO reMemberDTO = serviceImpl.loginUserService(memberDTO);

				if (reMemberDTO != null) {
					HttpSession httpSession = request.getSession();
					httpSession.setAttribute("userId", reMemberDTO.getMemId());
//					System.out.println("로그인 세션 정보 "+httpSession.getAttribute("userId"));
					response.sendRedirect("main.do");
				} else {
					response.getWriter().println("로그인 실패");
					response.sendRedirect("login.do");
				}
			}catch(InternalServiceException ise) {
				ErrorDTO error = new ErrorDTO(404,"회원가입 입력데이터 오류 발생","MemberDAO");
				response.getWriter().println(error.getStatus()+error.getError());
			}catch (Exception e) {
				e.printStackTrace();
				response.getWriter().println("로그인 실패: " + e.getMessage());
			}
		} else if(loginType.equals("nonmember")) {
			response.sendRedirect("main.do");
		} else {
			response.sendRedirect("signup.do");
		}
	}
}
