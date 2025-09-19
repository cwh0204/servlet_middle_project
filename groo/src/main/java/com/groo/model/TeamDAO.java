package com.groo.model;

import java.util.List;

public interface TeamDAO {
	public void createTeam(TeamDTO teamDTO);
	public List<TeamDTO> selectTeam(TeamDTO teamDTO);
}
