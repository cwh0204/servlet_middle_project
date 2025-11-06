package com.groo.DAO;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.groo.error.InternalServiceException;
import com.groo.model.TeamMemberDTO;

public class TeamMemberDAOImpl implements TeamMemberDAO{

	/**
	 * 팀원 추가를 위한 메서드
	 * @param teamMember 팀원을 생성 하기위한 Data Transfer Object 데이터 클래스
	 * @param session MyBatis 작업을 수행하는 데 사용되는 세션 객체
	 */
	@Override
	public void insertTeamMember(TeamMemberDTO teamMember, SqlSession session) {
		// TODO Auto-generated method stub
		try {
			session.insert("insertTeamMember",teamMember);
		}catch (Exception e) {
			throw new InternalServiceException("DAO:insertTeam 예외발생",e);
		}
	}

	/**
	 * 팀의 리더를 모두 가져오기 위한 메서드
	 * @param teamMember 팀원을 생성 하기위한 Data Transfer Object 데이터 클래스
	 * @param session MyBatis 작업을 수행하는 데 사용되는 세션 객체
	 */
	@Override
	public List<TeamMemberDTO> TeamMemberLeaderSelect(TeamMemberDTO teamMember, SqlSession session) {
		List<TeamMemberDTO> list = new ArrayList<>();
		try {
			list = session.selectList("TeamMemberLeaderSelect",teamMember);
		}catch (Exception e) {
			throw new InternalServiceException("DAO:selectAllTeamMember 예외발생",e);
		}
		return list;
	}
}
