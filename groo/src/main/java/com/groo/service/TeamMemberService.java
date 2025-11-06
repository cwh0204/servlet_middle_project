package com.groo.service;

import java.util.List;

import com.groo.model.TeamMemberDTO;

public interface TeamMemberService {
	public void insertTeamMember(TeamMemberDTO teamMember);

	public List<TeamMemberDTO> selectTeamMember(TeamMemberDTO teamMember);
	public TeamMemberDTO selectTeamLeader(TeamMemberDTO teamMember);

	public List<TeamMemberDTO> TeamMemberLeaderSelect();

	public void updateTeamMemberKick(TeamMemberDTO teamMember);
	public void updateTeamLeaderChange(TeamMemberDTO teamMember, TeamMemberDTO teamLeader);

	public List<TeamMemberDTO> selectTeamPage(TeamMemberDTO teamMember);

}
