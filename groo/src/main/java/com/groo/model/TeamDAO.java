package com.groo.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

public interface TeamDAO {
	public void createTeam(TeamDTO teamDTO, SqlSession session);

	public List<TeamDTO> selectTeam(TeamDTO teamDTO, SqlSession session);

	public List<TeamDTO> selectTeamAll(SqlSession session);
}
