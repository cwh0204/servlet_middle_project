package com.groo.controller;

import java.io.IOException;
import java.io.PrintWriter;

import com.google.gson.Gson;
import com.groo.error.InternalServiceException;
import com.groo.model.TeamMemberDTO;
import com.groo.service.TeamMemberService;
import com.groo.service.TeamMemberServiceImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


/**
 * 팀장을 넘기는 작업을 처리하는 Controller 구현 클래스 Service 계층을 호출하고 처리 결과를 json 형태로
 * 클라이언트에 응답
 */
public class TeamMemberLeaderChangeController implements Controller {

	/**
	 * HTTP 요청을 받아 팀장을 넘기고 JSON 응답을 생성합니다.
	 *
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
		String memLoginId = request.getParameter("memLoginId");
		String studyId = request.getParameter("studyId");

		TeamMemberDTO teamMember = new TeamMemberDTO();

		teamMember.setMemId(memId);
		teamMember.setStudyRoll("L");
		teamMember.setStudyId(studyId);

		TeamMemberDTO teamLeader = new TeamMemberDTO();

		teamLeader.setMemLoginId(memLoginId);
		teamLeader.setStudyRoll("M");
		teamLeader.setStudyId(studyId);

		TeamMemberService service = new TeamMemberServiceImpl();

		try {

			service.updateTeamLeaderChange(teamMember, teamLeader);

			Gson gson = new Gson();
			String json = gson.toJson("sucsess");

			PrintWriter out = response.getWriter();
			out.print(json);
			out.flush();
		}catch (InternalServiceException ise) {
			ise.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

}
