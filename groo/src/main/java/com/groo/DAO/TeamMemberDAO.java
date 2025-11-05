package com.groo.DAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.groo.model.TeamMemberDTO;

public interface TeamMemberDAO {
	public void insertTeamMember(TeamMemberDTO teamMember, SqlSession session);
	public List<TeamMemberDTO> teamselectAll(TeamMemberDTO teamMember, SqlSession session);
}
