package com.groo.controller;

import java.io.IOException;
import java.io.PrintWriter;

import com.groo.model.TeamDTO;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class UserInfoImpl implements Controller {

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/plain; charset=UTF-8");

		TeamDTO teamDTO = new TeamDTO();
		HttpSession httpSession = request.getSession();
		String userId = (String)httpSession.getAttribute("userId");
		teamDTO.setUserId(userId);
		System.out.println(userId);
	}
}
