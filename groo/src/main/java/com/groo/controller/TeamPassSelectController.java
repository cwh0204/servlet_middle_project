package com.groo.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import com.google.gson.Gson;
import com.groo.error.ErrorDTO;
import com.groo.error.InternalServiceException;
import com.groo.model.TeamDTO;
import com.groo.model.TeamMemberDTO;
import com.groo.service.TeamService;
import com.groo.service.TeamServiceImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * 팀 페이지에서 팀의 비밀번호를 조회하는 Controller 구현 클래스 Service 계층을 호출하고 처리 결과를 json 형태로 클라이언트에
 * 응답
 */
public class TeamPassSelectController implements Controller {
	
	/**
	 * HTTP 요청을 받아 팀원 목록을 조회하고 JSON 응답을 생성합니다.
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

		String studyId = request.getParameter("studyId");

		TeamDTO team = new TeamDTO();

		team.setStudyId(studyId);

		TeamService service = new TeamServiceImpl();

		TeamDTO teamList = new TeamDTO();
		try {

			teamList = service.selectTeamPass(team);

			Gson gson = new Gson();
			String json = gson.toJson(teamList);

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
