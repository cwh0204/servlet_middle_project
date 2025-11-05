package com.groo.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import com.google.gson.Gson;
import com.groo.error.ErrorDTO;
import com.groo.error.InternalServiceException;
import com.groo.model.TeamDTO;
import com.groo.service.TeamService;
import com.groo.service.TeamServiceImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class TeamSeclectAllController implements Controller {

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");

		TeamDTO team = new TeamDTO();
		ErrorDTO Error = new ErrorDTO();

		try {
			TeamService teamService = new TeamServiceImpl();
			List<TeamDTO> list = teamService.teamselectAll(team);
			Gson gson = new Gson();
			String json = gson.toJson(list);

			PrintWriter out = response.getWriter();
			out.print(json);
			out.flush();

		} catch (InternalServiceException ise) {
			ise.printStackTrace();
			Error.setStatus(500);
		} catch (Exception e) {
			e.printStackTrace();
			Error.setStatus(500);
		}
	}
}
