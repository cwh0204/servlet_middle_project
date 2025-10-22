package com.groo.DAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.groo.model.TeamDTO;

public interface TeamDAO {
	public void insertTeam(TeamDTO teamDTO, SqlSession session);

	public List<TeamDTO> selectTeam(TeamDTO teamDTO, SqlSession session);

	public List<TeamDTO> selectTeamAll(SqlSession session);
}
