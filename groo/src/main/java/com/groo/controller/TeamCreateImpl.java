package com.groo.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.groo.model.TeamDAOImpl;
import com.groo.model.TeamDTO;

/**
 * Servlet implementation class TeamCreateImpl
 */
@WebServlet("/teamcreate")
public class TeamCreateImpl extends HttpServlet {
	
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/plain; charset=UTF-8");
		
		String teamName = request.getParameter("teamName");
		String userId = request.getParameter("userId");
		String teamInfo = request.getParameter("teamInfo");
		
		TeamDTO teamDTO = new TeamDTO();
		
		teamDTO.setTeamName(teamName);
		teamDTO.setUserId(userId);
		teamDTO.setTeamInfo(teamInfo);
		
		System.out.println(teamDTO.getUserId()+teamDTO.getTeamName()+teamDTO.getTeamInfo());
		try {
			TeamDAOImpl teamDAO = new TeamDAOImpl();
			teamDAO.createTeam(teamDTO);
			response.getWriter().println("팀등록 성공");
		} catch (Exception e) {
			e.printStackTrace();
			response.getWriter().println("팀등록 실패: " + e.getMessage());
		}
	}
}
