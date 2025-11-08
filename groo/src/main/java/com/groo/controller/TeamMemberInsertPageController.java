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
import jakarta.servlet.http.HttpSession;

/**
 * 팀상세 페이지에서 가입하기 버튼 클릭 시 스터디 멤버 정보를 추가하기 위한 Controller 구현 클래스 Service 계층을 호출하고 처리 결과를 json 형태로
 * 클라이언트에 응답
 */
public class TeamMemberInsertPageController implements Controller {

	/**
	 * HTTP 요청을 받아 스터디 멤버를 추가하고 JSON 응답을 생성합니다.
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

		PrintWriter out = response.getWriter();
		Gson gson = new Gson();
		
		try {
			
			// 세션에서 로그인한 사용자 아이디 가져오기
			HttpSession session = request.getSession();
			String memLoginId = (String) session.getAttribute("userId");
			
			// 파라미터로 전달된 studyId 가져오기
			String studyId = request.getParameter("studyId");
			
			TeamMemberDTO teamMember = new TeamMemberDTO();
			teamMember.setMemLoginId(memLoginId);
			teamMember.setStudyId(studyId);
			
			TeamMemberService service = new TeamMemberServiceImpl();
			service.insertTeamPage(teamMember);

			/*
			 * String json = gson.toJson(result);
			 * 
			 * PrintWriter out = response.getWriter(); out.print(json); out.flush();
			 */
		} catch (InternalServiceException ise) {
			ise.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
