package com.groo.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class VerifyEmailCodeController implements Controller {		// 인증번호 검증 요청 컨트롤러

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String inputCode = request.getParameter("code");
		HttpSession httpSession = request.getSession();
		
		String saveCode = (String) httpSession.getAttribute("emailAuthCode");
		
		response.setContentType("text/plain; charset=utf-8");
		
		if(saveCode != null && saveCode.equals(inputCode)) {
			response.getWriter().write("success");
			
			// 인증 완료 후 세션에서 제거
			httpSession.removeAttribute("emailAuthCode");
			httpSession.removeAttribute("emailAuthTarget");
		}else {
			response.getWriter().write("fail");
		}
	}
}
