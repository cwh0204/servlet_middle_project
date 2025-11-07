package com.groo.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

		 // JSON 변환기
        Gson gson = new Gson();
        Map<String, Object> result = new HashMap<>();

        try {
            // 세션에서 로그인한 닉네임 가져오기
            HttpSession session = request.getSession();
            String loginNick = (String) session.getAttribute("memNick");


            // 전달된 파라미터
            String studyId = request.getParameter("studyId");
            String studyTitle = request.getParameter("studyTitle");
            String studyCategory = request.getParameter("studyCategory");
            String studyIntro = request.getParameter("studyIntro");
            String studyIntrocontent = request.getParameter("studyIntrocontent");

            TeamMemberService service = new TeamMemberServiceImpl();

            // 현재 studyId의 팀장 정보 조회
            TeamMemberDTO teamMember = new TeamMemberDTO();
            teamMember.setStudyId(studyId);

            List<TeamMemberDTO> teamPage = service.selectTeamPage(teamMember);

			/*
			 * // 팀 정보 없음 if (teamPage == null || teamPage.isEmpty()) { result.put("status",
			 * "fail"); result.put("message", "팀 정보를 찾을 수 없습니다."); return; }
			 *
			 * String leaderNick = teamPage.get(0).getMemNick(); // 팀장 닉네임
			 *
			 * // 로그인한 사용자가 팀장인지 확인 if (loginNick == null || !loginNick.equals(leaderNick))
			 * { result.put("status", "unauthorized"); result.put("message",
			 * "팀장만 수정할 수 있습니다."); return; }
			 */

            // 수정 진행
            TeamMemberDTO updateDTO = new TeamMemberDTO();
            updateDTO.setStudyId(studyId);
            updateDTO.setStudyTitle(studyTitle);
            updateDTO.setStudyCategory(studyCategory);
            updateDTO.setStudyIntro(studyIntro);
            updateDTO.setStudyIntrocontent(studyIntrocontent);

            service.updateTeamPage(updateDTO);

            result.put("status", "success");
            result.put("message", "수정 완료되었습니다.");

        } catch (InternalServiceException ise) {
            ise.printStackTrace();
            result.put("status", "error");
            result.put("message", "내부 서비스 오류 발생");
        } catch (Exception e) {
            e.printStackTrace();
            result.put("status", "error");
            result.put("message", "서버 오류: " + e.getMessage());
        } finally {
            // 항상 JSON 응답 보내기 (빈 응답 금지)
        	PrintWriter out = response.getWriter();
            out.print(gson.toJson(result));
            out.flush();
        }
	}
}
