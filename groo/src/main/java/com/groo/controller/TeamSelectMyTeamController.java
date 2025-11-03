package com.groo.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import com.google.gson.Gson;
import com.groo.error.InternalServiceException;
import com.groo.model.TeamDTO;
import com.groo.service.TeamService;
import com.groo.service.TeamServiceImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class TeamSelectMyTeamController implements Controller {

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memLoginId = request.getParameter("memLoginId");
		
		TeamDTO team = new TeamDTO();
		
		team.setMemLoginId(memLoginId);
		
		try {
			TeamService service = new TeamServiceImpl();
			List<TeamDTO> list = service.selectMyTeam(team);
			Gson gson = new Gson();
			String json = gson.toJson(list);

			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");

			PrintWriter out = response.getWriter();
			out.print(json);
			out.flush();
		}catch(InternalServiceException ise) {
			ise.printStackTrace();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
