package com.groo.controller;

import java.io.IOException;
import java.io.PrintWriter;

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

	/**
	 * HTTP 요청을 받아 로그인정보를 가져오고 JSON 응답을 생성합니다.
	 *
	 * @param request  HTTP 요청 객체
	 * @param response HTTP 응답 객체
	 * @throws ServletException 서블릿 관련 오류 발생 시
	 * @throws IOException      입출력 오류 발생 시
	 */
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
		try {

			MemberDTO memberLogin = service.selectLoginMember(member);

			if(memberLogin != null) {
				session.setAttribute("loginServiceResponse", memLoginId);
			}
			Gson gson = new Gson();
			String json = gson.toJson(memberLogin);

			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");

			PrintWriter out = response.getWriter();
			out.print(json);
			out.flush();

		}catch (InternalServiceException ise) {
			ise.printStackTrace();
			ErrorDTO error = new ErrorDTO();
			error.setStatus(500);
		}
		catch (Exception e) {
			e.printStackTrace();
			ErrorDTO error = new ErrorDTO();
			error.setStatus(500);
		}
	}

}
