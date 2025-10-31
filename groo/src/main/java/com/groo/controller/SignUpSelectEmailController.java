package com.groo.controller;

import java.io.IOException;
import java.io.PrintWriter;

import com.google.gson.Gson;
import com.groo.model.MemberDTO;
import com.groo.service.jiwonService;
import com.groo.service.jiwonServiceImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class SignUpSelectEmailController implements Controller {

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String memEmail = request.getParameter("userEmail");

		jiwonService serviceImpl = new jiwonServiceImpl();
		
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setMemEmail(memEmail);
		
		MemberDTO checkEmail = serviceImpl.selectEmailService(memberDTO);

		Gson gson = new Gson();
		String json = gson.toJson(checkEmail);

		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");

		PrintWriter out = response.getWriter();
		out.print(json);
		out.flush();
	}
}
