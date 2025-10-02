package com.groo.model;

import java.util.ArrayList;
import java.util.List;


import org.apache.ibatis.session.SqlSession;
import com.groo.config.SessionFactory;

public class TeamDAOImpl{
	
	SessionFactory sessionFactory = new SessionFactory();
	
	public void createTeam(TeamDTO teamDTO, SqlSession session) {
		// TODO Auto-generated method stub
		try {
			session.insert("insertTeam", teamDTO);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

	public List<TeamDTO> selectTeam(TeamDTO teamDTO, SqlSession session) {
		
		List<TeamDTO> list = new ArrayList<>();
		try {
			list = session.selectList("selectTeam",teamDTO);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<TeamDTO> selectTeamAll(SqlSession session) {

		List<TeamDTO> list = new ArrayList<>();
		try {
			list = session.selectList("selectTeamAll");
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
