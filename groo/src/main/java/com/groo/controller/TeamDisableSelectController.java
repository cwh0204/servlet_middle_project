package com.groo.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import com.google.gson.Gson;
import com.groo.error.ErrorDTO;
import com.groo.error.InternalServiceException;
import com.groo.model.TeamDTO;
import com.groo.service.TeamServiceImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
/**
 * 비활성 팀 목록 조회를 처리하는 Controller 구현 클래스 Service 계층을 호출하고 처리 결과를 json 형태로
 * 클라이언트에 응답
 */
public class TeamDisableSelectController implements Controller {
	/**
	 * HTTP 요청을 받아 회원 목록을 조회하고 JSON 응답을 생성합니다.
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
    	
		String search = request.getParameter("search");
		
		TeamServiceImpl service = new TeamServiceImpl();
		TeamDTO team = new TeamDTO();
		if(search != null && !search.isEmpty()) {
			int serchMax = Integer.parseInt(request.getParameter("search"));
			team.setStudyMax(serchMax);
		}
		
		team.setStudyId(search);
		team.setStudyTitle(search);
		team.setStudyCategory(search);
		team.setStudyIntro(search);
		team.setStudyIntroContent(search);
		team.setStudyDeleteDate(search);
		
		List<TeamDTO> teamList = new ArrayList<>();
		
		try {

			teamList = service.selectDisableTeam(team);
			Gson gson = new Gson();
			String json = gson.toJson(teamList);
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
