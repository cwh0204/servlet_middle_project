package com.groo.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.groo.config.SessionFactory;
import com.groo.model.TeamDAOImpl;
import com.groo.model.TeamDTO;

public class TeamServiceImpl implements TeamService{
	
	TeamDAOImpl dao = new TeamDAOImpl();
	
	@Override
	public void createTeam(TeamDTO teamDTO) {
		SqlSession session = SessionFactory.getSqlSession();
		
		try {
			dao.createTeam(teamDTO, session);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
	}

	@Override
	public List<TeamDTO> selectTeam(TeamDTO teamDTO) {
		List<TeamDTO> list = new ArrayList<>();
		SqlSession session = SessionFactory.getSqlSession();
		try {
			list = dao.selectTeam(teamDTO, session);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return list;
	}

	@Override
	public List<TeamDTO> selectTeamAll() {
		List<TeamDTO> list = new ArrayList<>();
		SqlSession session = SessionFactory.getSqlSession();
		try {
			list = dao.selectTeamAll(session);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return list;
	}
}
