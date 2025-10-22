package com.groo.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.groo.DAO.TeamDAO;
import com.groo.DAO.TeamDAOImpl;
import com.groo.config.SessionFactory;
import com.groo.model.TeamDTO;

public class TeamServiceImpl implements TeamInsertTeam, TeamSelectTeamOne, TeamSelectTeamAll{

	TeamDAO dao = new TeamDAOImpl(); //업캐스팅

	@Override
	public void insertTeam(TeamDTO teamDTO) {
		SqlSession session = SessionFactory.getSqlSession();
		dao.insertTeam(teamDTO, session);
		try {
			session.commit();
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
