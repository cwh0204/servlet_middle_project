package com.groo.service;

import java.util.List;

import com.groo.model.TeamMemberDTO;

public interface TeamMemberService {
	public void insertTeamMember(TeamMemberDTO teamMember);
	public List<TeamMemberDTO> TeamMemberAllSelect(TeamMemberDTO teamMember);
}
