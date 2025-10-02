package com.groo.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import com.google.gson.Gson;
import com.groo.model.TeamDAOImpl;
import com.groo.model.TeamDTO;
import com.groo.service.TeamServiceImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class MainImpl
 */

public class MainImpl extends HttpServlet implements Controller{

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/plain; charset=UTF-8");

		TeamDTO teamDTO = new TeamDTO();

		HttpSession httpSession = request.getSession();
		String userId = (String)httpSession.getAttribute("userId");
		teamDTO.setUserId(userId);

		try {
			TeamServiceImpl serviceImpl = new TeamServiceImpl();
			List<TeamDTO> teamList = serviceImpl.selectTeam(teamDTO);
			
			Gson gson = new Gson();
			String json = gson.toJson(teamList);

			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");

			PrintWriter out = response.getWriter();
			out.print(json);
			out.flush();

		} catch (Exception e) {
			e.printStackTrace();
			response.getWriter().println("팀등록 실패: " + e.getMessage());
		}
	}
}
