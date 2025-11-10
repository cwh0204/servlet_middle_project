package com.groo.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map; // Map 추가

import com.google.gson.Gson;
import com.groo.error.ErrorDTO;
import com.groo.error.InternalServiceException;
import com.groo.model.MemberDTO;
import com.groo.service.MemberService;
import com.groo.service.MemberServiceImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * 일반 회원의 로그인을 처리하는 Controller 구현 클래스 Service 계층을 호출하고 처리 결과를 json 형태로
 * 클라이언트에 응답
 */
public class MemberLoginController implements Controller {

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		String memLoginId = request.getParameter("memLoginId");
		String memPass = request.getParameter("memPass");

		MemberDTO member = new MemberDTO();

		member.setMemLoginId(memLoginId);
		member.setMemPass(memPass);

		MemberService service = new MemberServiceImpl();
		HttpSession session = request.getSession();


		Object jsonResponseData = null;

		try {

			MemberDTO memberLogin = service.selectLoginMember(member);

			if (memberLogin != null) {

				if ("Y".equals(memberLogin.getMemStatus())) {

					Map<String, String> withdrawnResponse = new HashMap<>();
					withdrawnResponse.put("status", "WITHDRAWN");
					jsonResponseData = withdrawnResponse;
				}

				else if ("N".equals(memberLogin.getMemStatus())) {

					session.setAttribute("loginServiceResponse", memLoginId);
					jsonResponseData = memberLogin;
				} else {

                    jsonResponseData = null;
                }
			} else {

				jsonResponseData = null;
			}

			Gson gson = new Gson();
			String json = gson.toJson(jsonResponseData);

			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");

			PrintWriter out = response.getWriter();
			out.print(json);
			out.flush();

		} catch (InternalServiceException ise) {
			ise.printStackTrace();
			ErrorDTO error = new ErrorDTO();
			error.setStatus(500);

		} catch (Exception e) {
			e.printStackTrace();
			ErrorDTO error = new ErrorDTO();
			error.setStatus(500);

		}
	}
}