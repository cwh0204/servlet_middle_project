package com.groo.controller;

import java.io.IOException;

import com.groo.error.ErrorDTO;
import com.groo.error.InternalDataAccessException;
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

public class LoginController extends HttpServlet implements Controller {

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/plain; charset=UTF-8");
		HttpSession session = request.getSession(false);

		session.invalidate(); // 세션종료

		String userId = request.getParameter("userId");
		String password = request.getParameter("password");
		
		
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setUserId(userId);
		memberDTO.setPassword(password);

		try {
			MemberServiceImpl serviceImpl = new MemberServiceImpl();

			MemberDTO reMemberDTO = serviceImpl.loginUserService(memberDTO);

			if (reMemberDTO != null) {
				HttpSession httpSession = request.getSession();
				httpSession.setAttribute("userId", reMemberDTO.getUserId());
//					System.out.println("로그인 세션 정보 "+httpSession.getAttribute("userId"));
				response.sendRedirect("main.do");
			} else {
				response.getWriter().println("로그인 실패");
				response.sendRedirect("login.do");
			}
		} catch (InternalServiceException rne) {
			rne.printStackTrace();
			ErrorDTO error = new ErrorDTO(500, "로그인 중 오류 발생", "MemberDAO");
			response.getWriter().println(error.getStatus() + error.getError());
		} catch (InternalDataAccessException ie) {
			ErrorDTO error = new ErrorDTO(404, "로그인 입력데이터 오류 발생", "MemberDAO");
			response.getWriter().println(error.getStatus() + error.getError());
		} catch (RuntimeException re) {
			re.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
			response.getWriter().println("로그인 실패: " + e.getMessage());
		}
	}
}
