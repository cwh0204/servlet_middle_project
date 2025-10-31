package com.groo.controller;

import java.io.IOException;

import com.groo.service.MemberServiceImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class UserdetailSelectNicknameController implements Controller {

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/plain; charset=UTF-8");
		
		String memNick = request.getParameter("userNickname");
		
		MemberServiceImpl  serviceImpl = new MemberServiceImpl();
		String checkNickname = serviceImpl.selectUserNicknameCheck(memNick);
		
		if(checkNickname != null) {
			response.getWriter().write(checkNickname);
		}else {
			response.getWriter().write("yes");
		}
	}

}
