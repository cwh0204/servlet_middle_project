package com.groo.controller;

import java.io.IOException;
import java.io.PrintWriter;

import com.google.gson.Gson;
import com.groo.error.ErrorDTO;
import com.groo.error.InternalServiceException;
import com.groo.model.TeamDTO;
import com.groo.service.TeamServiceImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class TeamActivateController implements Controller {

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		String studyId = request.getParameter("studyId");
		
		TeamDTO team = new TeamDTO();
		
		team.setStudyId(studyId);

		TeamServiceImpl service = new TeamServiceImpl();
		
		try {
			service.activateTeam(team);
			Gson gson = new Gson();
			String json = gson.toJson("성공");
			PrintWriter out = response.getWriter();
			out.print(json);
			out.flush();
		}catch (InternalServiceException ise) {
			ise.printStackTrace();
			ErrorDTO error = new ErrorDTO();
			error.setStatus(500);
		}
		catch (Exception e) {
			e.printStackTrace();
			ErrorDTO error = new ErrorDTO();
			error.setStatus(500);
		}
	}
}
