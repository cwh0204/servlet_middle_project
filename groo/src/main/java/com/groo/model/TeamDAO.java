package com.groo.model;

import java.util.List;

public interface TeamDAO {
	public void createTeam(TeamDTO teamDTO);
	public List<Object> selectTeam(TeamDTO teamDTO);
}
