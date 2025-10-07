package com.groo.controller;

import java.io.IOException;

import com.groo.model.TeamDAOImpl;
import com.groo.model.TeamDTO;
import com.groo.service.TeamServiceImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class TeamCreateImpl
 */

public class TeamCreateImpl extends HttpServlet implements Controller{

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/plain; charset=UTF-8");

		String teamName = request.getParameter("teamName");
		String userId = request.getParameter("userId");
		String teamInfo = request.getParameter("teamInfo");

		TeamDTO teamDTO = new TeamDTO();
		
		teamDTO.setTeamName(teamName);
		teamDTO.setUserId(userId);
		teamDTO.setTeamInfo(teamInfo);

		try {
			TeamServiceImpl serviceImpl = new TeamServiceImpl();
			serviceImpl.createTeam(teamDTO);
			response.getWriter().println("팀등록 성공");
		} catch (Exception e) {
			e.printStackTrace();
			response.getWriter().println("팀등록 실패: " + e.getMessage());
		}
	}
}
