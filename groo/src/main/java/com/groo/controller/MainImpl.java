package com.groo.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import com.google.gson.Gson;
import com.groo.model.TeamDAOImpl;
import com.groo.model.TeamDTO;

import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class MainImpl
 */
@WebServlet("/index")
public class MainImpl extends HttpServlet implements Controller{
	
	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/plain; charset=UTF-8");
		
		TeamDTO teamDTO = new TeamDTO();
		
		HttpSession httpSession = request.getSession();
		String userId = (String)httpSession.getAttribute("userId");
		teamDTO.setUserId(userId);
		
		
//		System.out.println("세션확인"+userId);
		
		
		try {
			TeamDAOImpl teamDAO = new TeamDAOImpl();
			List<TeamDTO> teamList = teamDAO.selectTeam(teamDTO);
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
