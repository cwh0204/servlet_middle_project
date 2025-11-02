package com.groo.service;

import java.util.List;

import com.groo.model.TeamAvgDTO;
import com.groo.model.TeamDTO;
import com.groo.model.TeamMemberDTO;

public interface TeamService {
	public void insertTeam(TeamDTO team, TeamMemberDTO teamMember);
	public List<TeamDTO> selectTeam(TeamDTO team);
	public List<TeamDTO> selectDisableTeam(TeamDTO team);
	public TeamAvgDTO teamStats();
	public void deleteTeam(TeamDTO team);
	public void activateTeam(TeamDTO team);
}
