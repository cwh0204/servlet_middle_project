package com.groo.DAO;

import org.apache.ibatis.session.SqlSession;

import com.groo.model.TeamMemberDTO;

public interface TeamMemberDAO {
	public void insertTeamMember(TeamMemberDTO teamMember, SqlSession session);
}
