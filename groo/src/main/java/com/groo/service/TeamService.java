package com.groo.service;

import java.util.List;

import com.groo.model.TeamDTO;

public interface TeamService {
	public void createTeam(TeamDTO teamDTO);
	public List<TeamDTO> selectTeam(TeamDTO teamDTO);
	public List<TeamDTO> selectTeamAll();
}
