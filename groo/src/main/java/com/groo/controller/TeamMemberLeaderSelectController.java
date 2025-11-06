package com.groo.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import com.google.gson.Gson;
import com.groo.error.InternalServiceException;
import com.groo.model.TeamMemberDTO;
import com.groo.service.TeamMemberService;
import com.groo.service.TeamMemberServiceImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class TeamMemberLeaderSelectController implements Controller {

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");

		TeamMemberService service = new TeamMemberServiceImpl();

		List<TeamMemberDTO> teamMemberList = new ArrayList<>();
		try {

			teamMemberList = service.TeamMemberLeaderSelect();

			Gson gson = new Gson();
			String json = gson.toJson(teamMemberList);

			PrintWriter out = response.getWriter();
			out.print(json);
			out.flush();
		}catch (InternalServiceException ise) {
			ise.printStackTrace();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}

}
