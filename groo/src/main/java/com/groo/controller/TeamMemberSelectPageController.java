package com.groo.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import com.google.gson.Gson;
import com.groo.error.InternalServiceException;
import com.groo.model.TeamDTO;
import com.groo.model.TeamMemberDTO;
import com.groo.service.TeamMemberService;
import com.groo.service.TeamMemberServiceImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


/**
 * 팀상세 페이지에서 팀장의 정보를 가져오기 위한 Controller 구현 클래스 Service 계층을 호출하고 처리 결과를 json 형태로
 * 클라이언트에 응답
 */
public class TeamMemberSelectPageController implements Controller {
	
	/**
	 * HTTP 요청을 받아 팀장의 정보를 조회하고 JSON 응답을 생성합니다.
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
		/*
		 * String studyTitle = request.getParameter("studyTitle"); String studyCategory
		 * = request.getParameter("studyCategory"); String studyIntro =
		 * request.getParameter("studyIntro"); String studyIntrocontent =
		 * request.getParameter("studyIntrocontent");
		 */
		
		TeamMemberDTO teamMember = new TeamMemberDTO();
		
		teamMember.setStudyId(studyId);
		
		List<TeamMemberDTO> teamMemberList = new ArrayList<>();
		
		TeamMemberService service = new TeamMemberServiceImpl();
		
		try {
			
			teamMemberList = service.selectTeamPage(teamMember);
			
			Gson gson = new Gson();
			String json = gson.toJson(teamMemberList);

			PrintWriter out = response.getWriter();
			out.print(json);
			out.flush();

		} catch (InternalServiceException ise) {
			ise.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
