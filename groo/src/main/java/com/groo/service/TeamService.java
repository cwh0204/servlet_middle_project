package com.groo.service;

import java.util.List;

import com.groo.model.TeamDTO;

public interface TeamService {
	public List<TeamDTO> selectTeam(TeamDTO team);
}
