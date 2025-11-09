package com.groo.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import com.google.gson.Gson;
import com.groo.error.InternalServiceException;
import com.groo.model.TeamMemberDTO;
import com.groo.service.TeamMemberService;
import com.groo.service.TeamMemberServiceImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class TeamMemberDeletePageController implements Controller {

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");

		String studyId = request.getParameter("studyId");
		String memLoginId = request.getParameter("memLoginId");

		TeamMemberDTO teamMember = new TeamMemberDTO();
		teamMember.setStudyId(studyId);
		teamMember.setMemLoginId(memLoginId);

		TeamMemberService service = new TeamMemberServiceImpl();
		Map<String, Object> result = new HashMap<>();

		try {
			service.deleteTeamPage(teamMember);
			result.put("status", "success");
			result.put("message", "스터디 탈퇴가 완료되었습니다.");

		} catch (InternalServiceException ise) {
				ise.printStackTrace();
				result.put("status", "error");
				result.put("message", "내부 서비스 오류 발생");
		} catch (Exception e) {
				e.printStackTrace();
				result.put("status", "error");
				result.put("message", "탈퇴 처리 중 오류가 발생했습니다.");
		}

		String json = new Gson().toJson(result);
		PrintWriter out = response.getWriter();
		out.print(json);
		out.flush();
	}

}
