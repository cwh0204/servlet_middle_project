package com.groo.controller;

import java.io.IOException;

import com.groo.model.MemberDTO;
import com.groo.service.jiwonService;
import com.groo.service.jiwonServiceImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SignUpImpl
 */

public class SignUpController extends HttpServlet implements Controller {

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/plain; charset=UTF-8");

		String memLoginId = request.getParameter("userLoginId");
		String memPass = request.getParameter("userPass");
		String memName = request.getParameter("userName");
		String memEmail = request.getParameter("userEmail");
		String memBirth = request.getParameter("userBirth");
		String memGender = request.getParameter("userGender");

		MemberDTO member = new MemberDTO();

		member.setMemLoginId(memLoginId);
		member.setMemPass(memPass);
		member.setMemName(memName);
		member.setMemEmail(memEmail);
		member.setMemBirth(memBirth);
		member.setMemGender(memGender);

		try {
			jiwonService service = new jiwonServiceImpl();
			service.insertMember(member);
			response.getWriter().println("회원가입 완료: "+ member.getMemLoginId());
		}catch(Exception e) {
			e.printStackTrace();
			response.getWriter().println("회원가입 실패: "+ e.getMessage());
		}

	}
}
