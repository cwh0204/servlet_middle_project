package com.groo.controller;

import java.io.IOException;
import java.io.PrintWriter;

import com.google.gson.Gson;
import com.groo.error.ErrorDTO;
import com.groo.error.InternalServiceException;
import com.groo.model.AdminTeamMemberDTO;
import com.groo.service.AdminServiceImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * 관리자 페이지에서 팀맴버를 비활성화 시키는 Controller 구현 클래스
 * Service 계층을 호출하고 조회 결과를 json 형태로 클라이언트에 응답
 */

public class AdminStudyMemberDeleteController implements Controller {

	/**
	 * HTTP 요청을 받아 회원 목록을 조회하고 JSON 응답을 생성합니다.
	 * @param request  HTTP 요청 객체
	 * @param response HTTP 응답 객체
	 * @throws ServletException 서블릿 관련 오류 발생 시
	 * @throws IOException      입출력 오류 발생 시
	 */
	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");

		String memId = request.getParameter("memId");
		String studyId = request.getParameter("studyId");
		
		AdminTeamMemberDTO member = new AdminTeamMemberDTO();

		member.setMemId(memId);
		member.setStudyId(studyId);

		AdminServiceImpl service = new AdminServiceImpl();

		try {

			service.adminStudyMemberDelete(member);

			Gson gson = new Gson();
			String json = gson.toJson("성공");

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
