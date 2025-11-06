package com.groo.DAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.groo.model.TeamMemberDTO;

public interface TeamMemberDAO {
	public void insertTeamMember(TeamMemberDTO teamMember, SqlSession session);
	public List<TeamMemberDTO> selectTeamMember(TeamMemberDTO teamMember, SqlSession session);
	public TeamMemberDTO selectTeamLeader(TeamMemberDTO teamMember, SqlSession session);
	public List<TeamMemberDTO> TeamMemberLeaderSelect(SqlSession session);
	
	public void updateTeamMemberKick(TeamMemberDTO teamMember, SqlSession session);
	public void updateTeamLeaderChange(TeamMemberDTO teamMember, SqlSession session);
	

}
