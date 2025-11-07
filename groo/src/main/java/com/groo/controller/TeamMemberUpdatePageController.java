package com.groo.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

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
 * 팀장이 수정한 내용 가져오는 Controller 구현 클래스 Service 계층을 호출하고 처리 결과를 json 형태로
 * 클라이언트에 응답
 */
public class TeamMemberUpdatePageController implements Controller {

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");

		// 세션에서 로그인한 닉네임 가져오기
		HttpSession session = request.getSession();
		String loginNick = (String) session.getAttribute("memNick");

		// 전달된 studyId와 수정 내용
		String studyId = request.getParameter("studyId");
		String studyTitle = request.getParameter("studyTitle");
		String studyCategory = request.getParameter("studyCategory");
		String studyIntro = request.getParameter("studyIntro");
		String studyIntrocontent = request.getParameter("studyIntrocontent");

		TeamMemberService service = new TeamMemberServiceImpl();
		PrintWriter out = response.getWriter();
		Gson gson = new Gson();

		try {
			// 현재 studyId의 팀장 정보 조회
			TeamMemberDTO teamMember = new TeamMemberDTO();
			teamMember.setStudyId(studyId);

			List<TeamMemberDTO> teamPage = service.selectTeamPage(teamMember);

			if(teamPage.isEmpty()) {
				out.print(gson.toJson("fail"));
				return;
			}

			String leaderNick = teamPage.get(0).getMemNick();		// 팀장 닉네임

			// 로그인한 사용자가 팀장인지 확인
			if(!loginNick.equals(leaderNick)) {
				out.print(gson.toJson("unauthorized"));		// 팀장이 아님
				return;
			}

			// 팀장이 맞으면 수정 진행
			TeamMemberDTO updateDTO = new TeamMemberDTO();
			updateDTO.setStudyId(studyId);
			updateDTO.setStudyTitle(studyTitle);
			updateDTO.setStudyCategory(studyCategory);
			updateDTO.setStudyIntro(studyIntro);
			updateDTO.setStudyIntrocontent(studyIntrocontent);

			service.updateTeamPage(updateDTO);

			out.print(gson.toJson("success"));

		}catch (InternalServiceException ise) {
			ise.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			out.flush();
			out.close();
		}
	}
}
