package com.groo.mapper;

import java.util.List;

import com.groo.model.TeamDTO;

public interface TeamMapper {
	void insertTeam(TeamDTO teamDTO);
	
	List<Object> selectTeam(TeamDTO teamDTO);
	
}
