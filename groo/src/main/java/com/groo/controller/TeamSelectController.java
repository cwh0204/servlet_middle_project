package com.groo.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import com.google.gson.Gson;
import com.groo.error.ErrorDTO;
import com.groo.error.InternalServiceException;
import com.groo.model.AdminAvgReportDTO;
import com.groo.model.TeamDTO;
import com.groo.service.AdminServiceImpl;
import com.groo.service.TeamServiceImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/* @WebServlet("/teamselect") */
public class TeamSelectController extends HttpServlet implements Controller{

    @Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
    	
		String search = request.getParameter("search");
		
		TeamServiceImpl service = new TeamServiceImpl();
		TeamDTO team = new TeamDTO();
		
		List<TeamDTO> teamList = new ArrayList<>();
		
		try {

			teamList = service.selectTeam(team);
			Gson gson = new Gson();
			String json = gson.toJson(teamList);
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
