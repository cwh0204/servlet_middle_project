package com.groo.DAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.groo.model.TeamAvgDTO;
import com.groo.model.TeamDTO;

public interface TeamDAO {
	public void insertTeam(TeamDTO teamDTO, SqlSession session);

	public List<TeamDTO> selectTeam(TeamDTO team, SqlSession session);
	public List<TeamDTO> selectDisableTeam(TeamDTO team, SqlSession session);
	public TeamAvgDTO teamStats(SqlSession session);
	public void deleteTeam(TeamDTO team, SqlSession session);
	public void activateTeam(TeamDTO team, SqlSession session);
	public List<TeamDTO> selectMyTeam(TeamDTO team, SqlSession session);
}
