package com.groo.controller;

import java.io.IOException;
import java.util.List;

import com.groo.model.TeamDAOImpl;
import com.groo.model.TeamDTO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class MainImpl
 */
@WebServlet("/index")
public class MainImpl extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/plain; charset=UTF-8");
		
		TeamDTO teamDTO = new TeamDTO();
		
		HttpSession httpSession = request.getSession();
//		String userId = (String)httpSession.getAttribute("userId");
		String userId = "csc";
		teamDTO.setUserId(userId);
		
		
//		System.out.println("세션확인"+userId);
		
		
		try {
			TeamDAOImpl teamDAO = new TeamDAOImpl();
			List<Object> teamList = teamDAO.selectTeam(teamDTO);
			response.getWriter().println(teamList);
		} catch (Exception e) {
			e.printStackTrace();
			response.getWriter().println("팀등록 실패: " + e.getMessage());
		}
	}
}
