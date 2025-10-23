package com.groo.controller;

import java.io.IOException;

import com.groo.model.MemberDTO;
import com.groo.service.MemberServiceImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class SignUpSelectEmailController implements Controller {

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/plain; charset=UTF-8");
		
		String memEmail = request.getParameter("userEmail");
		
		MemberServiceImpl serviceImpl = new MemberServiceImpl();
		String checkEmail = serviceImpl.selectEmailService(memEmail);
		
		if(checkEmail != null) {
			response.getWriter().write(checkEmail);
		}else {
			response.getWriter().write("yes");
		}
	}
}
