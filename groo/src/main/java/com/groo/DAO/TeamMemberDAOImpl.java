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
	 * 팀원 조회를 위한 메서드
	 * @param teamMember 팀원을 조회 하기위한 Data Transfer Object 데이터 클래스
	 * @param session MyBatis 작업을 수행하는 데 사용되는 세션 객체
	 * @return 팀원 목록 리턴
	 */
	@Override
	public List<TeamMemberDTO> selectTeamMember(TeamMemberDTO teamMember, SqlSession session) {
		
		List<TeamMemberDTO> teamMemberList = new ArrayList<>();
		
		try {
			teamMemberList = session.selectList("selectTeamMember",teamMember);
		}catch (Exception e) {
			throw new InternalServiceException("DAO:selectTeamMember 예외발생",e);
		}
		return teamMemberList;
	}
	
	/**
	 * 팀장 여부 확인을 위한 메서드
	 * @param teamMember 팀원을 조회 하기위한 Data Transfer Object 데이터 클래스
	 * @param session MyBatis 작업을 수행하는 데 사용되는 세션 객체
	 * @return 팀장 여부 리턴
	 */
	@Override
	public TeamMemberDTO selectTeamLeader(TeamMemberDTO teamMember, SqlSession session) {
		
		TeamMemberDTO teamMemberList = new TeamMemberDTO();
		try {
			teamMemberList = session.selectOne("selectTeamLeader",teamMember);
		}catch (Exception e) {
			throw new InternalServiceException("DAO:selectTeamLeader 예외발생",e);
		}
		return teamMemberList;
	}

	/**
	 * 팀의 리더를 모두 가져오기 위한 메서드
	 * @param teamMember 팀원을 생성 하기위한 Data Transfer Object 데이터 클래스
	 * @param session MyBatis 작업을 수행하는 데 사용되는 세션 객체
	 */
	@Override
	public List<TeamMemberDTO> TeamMemberLeaderSelect(SqlSession session) {
		List<TeamMemberDTO> list = new ArrayList<>();
		try {
			list = session.selectList("TeamMemberLeaderSelect");
		}catch (Exception e) {
			throw new InternalServiceException("DAO:selectAllTeamMember 예외발생",e);
		}
		return list;
	}
	
	/**
	 * 팀의 유저를 강퇴하기 위한 메서드
	 * @param teamMember 팀원을 강퇴 하기위한 Data Transfer Object 데이터 클래스
	 * @param session MyBatis 작업을 수행하는 데 사용되는 세션 객체
	 */
	@Override
	public void updateTeamMemberKick(TeamMemberDTO teamMember, SqlSession session) {

		try {
			session.selectList("updateTeamMemberKick",teamMember);
		}catch (Exception e) {
			throw new InternalServiceException("DAO:updateTeamMemberKick 예외발생",e);
		}
	}
	
	/**
	 * 팀의 리더를 모두 가져오기 위한 메서드
	 * @param teamMember 팀원의 권한을 넘겨 주기위한 Data Transfer Object 데이터 클래스
	 * @param session MyBatis 작업을 수행하는 데 사용되는 세션 객체
	 */
	@Override
	public void updateTeamLeaderChange(TeamMemberDTO teamMember, SqlSession session) {

		try {
			session.selectList("updateTeamLeaderChange",teamMember);
		}catch (Exception e) {
			throw new InternalServiceException("DAO:updateTeamLeaderChange 예외발생",e);
		}
	}
}
