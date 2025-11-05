package com.groo.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.groo.DAO.TeamMemberDAO;
import com.groo.DAO.TeamMemberDAOImpl;
import com.groo.config.SessionFactory;
import com.groo.error.InternalDataAccessException;
import com.groo.error.InternalServiceException;
import com.groo.model.TeamMemberDTO;

public class TeamMemberServiceImpl implements TeamMemberService {
	
	TeamMemberDAO dao = new TeamMemberDAOImpl(); //업캐스팅
	List<TeamMemberDTO> teamMemberList = new ArrayList<>();

	@Override
	public void insertTeamMember(TeamMemberDTO teamMember) {
		// TODO Auto-generated method stub

	}

	public List<TeamMemberDTO> TeamMemberAllSelect(TeamMemberDTO teamMember) {
		SqlSession session = SessionFactory.getSqlSession();
		try {
			teamMemberList = dao.teamselectAll(teamMember, session);
		} catch (InternalDataAccessException ide) {
			ide.printStackTrace();
			throw new InternalServiceException("DB 접근 오류로 인한 서비스 예외", ide);
		} catch (Exception e) {
			e.printStackTrace();
			throw new InternalServiceException("예상치 못한 서비스 내부 오류", e);
		} finally {
			session.close();
		}
		return teamMemberList;
	}
}
