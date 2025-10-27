package com.groo.service;

import java.util.List;

import com.groo.model.TeamAvgDTO;
import com.groo.model.TeamDTO;

public interface TeamService {
	public List<TeamDTO> selectTeam(TeamDTO team);
	public List<TeamDTO> selectDisableTeam(TeamDTO team);
	public TeamAvgDTO teamStats();
}
