package com.groo.controller;

import java.io.IOException;
import java.util.Random;

import com.groo.service.MemberServiceImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class SendEmailAuthController implements Controller {	// 인증번호 발송 컨트롤러

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String email = request.getParameter("email");

		// 인증번호 생성 (6자리 랜덤)
		String authCode = String.format("%06d", new Random().nextInt(999999));

		// 세션에 인증번호 저장 (나중에 검증용)
		HttpSession httpSession = request.getSession();
		httpSession.setAttribute("emailAuthCode", authCode);
		httpSession.setAttribute("emailAuthTarget", email);

		// 이메일 발송 서비스 호출
		MemberServiceImpl serviceImpl = new MemberServiceImpl();
		boolean result = service.sendEmailAuth(email, authCode);

		response.setContentType("text/plain; charset=utf-8");
		if(result) {
			response.getWriter().write("success");
		}else {
			response.getWriter().write("fail");
		}
	}
}
