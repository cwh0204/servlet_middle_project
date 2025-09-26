package com.groo.model;

import java.util.List;


import org.apache.ibatis.session.SqlSession;
import com.groo.config.SessionFactory;
import com.groo.mapper.TeamMapper;

public class TeamDAOImpl implements TeamDAO{
	
	SessionFactory sessionFactory = new SessionFactory();
	
	@Override
	public void createTeam(TeamDTO teamDTO) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.getSqlSession();
		TeamMapper mapper = session.getMapper(TeamMapper.class);
		mapper.insertTeam(teamDTO);
		session.commit();
	}

	@Override
	public List<TeamDTO> selectTeam(TeamDTO teamDTO) {

		System.out.println("selectTeam = "+teamDTO.getUserId());
		SqlSession session = sessionFactory.getSqlSession();
		TeamMapper mapper = session.getMapper(TeamMapper.class);
		List<TeamDTO> teamList = mapper.selectTeam(teamDTO);
		return teamList;
	}

	@Override
	public List<TeamDTO> selectTeamAll() {
		SqlSession session = sessionFactory.getSqlSession();
		TeamMapper mapper = session.getMapper(TeamMapper.class);
		List<TeamDTO> teamList = mapper.selectTeamAll();
		return teamList;
	}
}
