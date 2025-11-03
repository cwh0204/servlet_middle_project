package com.groo.controller;

import java.io.IOException;
import java.io.PrintWriter;

import com.google.gson.Gson;
import com.groo.error.InternalServiceException;
import com.groo.model.TeamDTO;
import com.groo.model.TeamMemberDTO;
import com.groo.service.TeamService;
import com.groo.service.TeamServiceImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


/**
 * 팀 생성을 처리하는 Controller 구현 클래스 Service 계층을 호출하고 처리 결과를 json 형태로
 * 클라이언트에 응답
 */
public class TeamInsertController implements Controller {

	/**
	 * HTTP 요청을 받아 팀을 생성하고 JSON 응답을 생성합니다.
	 *
	 * @param request  HTTP 요청 객체
	 * @param response HTTP 응답 객체
	 * @throws ServletException 서블릿 관련 오류 발생 시
	 * @throws IOException      입출력 오류 발생 시
	 */
	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String studyTitle = request.getParameter("studyTitle");
		String studyCategory = request.getParameter("studyCategory");
		String studyMax = request.getParameter("studyMax");
		String studyPass = request.getParameter("studyPass");
		String studyIntro = request.getParameter("studyIntro");

		String memId = request.getParameter("memId");

		TeamDTO team = new TeamDTO();
		team.setStudyTitle(studyTitle);
		team.setStudyCategory(studyCategory);

		if(studyMax != null && !studyMax.isEmpty()) {
			int serchMax = Integer.parseInt(studyMax);
			team.setStudyMax(serchMax);
		}
		team.setStudyPass(studyPass);
		team.setStudyIntro(studyIntro);

		TeamMemberDTO teamMember = new TeamMemberDTO();
		teamMember.setMemId(memId);
		teamMember.setStudyRoll("L");

		TeamService service = new TeamServiceImpl();

		try {

			service.insertTeam(team,teamMember);

			Gson gson = new Gson();
			String json = gson.toJson("sucsess");

			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");

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
