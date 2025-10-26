package com.groo.controller;

import java.io.IOException;

import com.groo.service.MemberServiceImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class SignUpSelectLoginIdController implements Controller {

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/plain; charset=UTF-8");

		String memLoginId = request.getParameter("userLoginId");

		MemberServiceImpl serviceImpl = new MemberServiceImpl();
		String checkLoginId = serviceImpl.selectLoginIdService(memLoginId);

		if(checkLoginId != null) {
			response.getWriter().write(checkLoginId);
		}else {
			response.getWriter().write("yes");
		}
	}
}
