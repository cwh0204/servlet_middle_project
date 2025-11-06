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

	TeamMemberDAO dao = new TeamMemberDAOImpl();

	@Override
	public void insertTeamMember(TeamMemberDTO teamMember) {
		// TODO Auto-generated method stub

	}

	/**
	 * 팀원 목록을 조회하는 서비스 메서드입니다.
	 *
	 * @param TeamMember 정보를 가져오기 위한 Data Transfer Object 데이터 클래스
	 * @throws InternalServiceException DB 접근 오류나 예상치 못한 내부 오류 발생 시 상위 계층으로 던지는 서비스
	 *                                  예외
	 * @return 팀원목록 조회
	 */
	@Override
	public List<TeamMemberDTO> selectTeamMember(TeamMemberDTO teamMember) {

		List<TeamMemberDTO> teamMemberList = new ArrayList<>();
		SqlSession session = SessionFactory.getSqlSession();
		try {
			teamMemberList = dao.selectTeamMember(teamMember, session);
			session.commit();
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

	/**
	 * 팀장 여부를 확인하는 서비스 메서드입니다.
	 *
	 * @param TeamMember 정보를 가져오기 위한 Data Transfer Object 데이터 클래스
	 * @throws InternalServiceException DB 접근 오류나 예상치 못한 내부 오류 발생 시 상위 계층으로 던지는 서비스
	 *                                  예외
	 * @return 팀장여부 확인
	 */
	@Override
	public TeamMemberDTO selectTeamLeader(TeamMemberDTO teamMember) {

		TeamMemberDTO teamMemberList = new TeamMemberDTO();
		SqlSession session = SessionFactory.getSqlSession();
		try {
			teamMemberList = dao.selectTeamLeader(teamMember, session);
			session.commit();
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

	@Override
	public List<TeamMemberDTO> TeamMemberLeaderSelect() {
		SqlSession session = SessionFactory.getSqlSession();
		List<TeamMemberDTO> teamMemberList1 = new ArrayList<>();
		try {
			teamMemberList1 = dao.TeamMemberLeaderSelect(session);
		} catch (InternalDataAccessException ide) {
			ide.printStackTrace();
			throw new InternalServiceException("DB 접근 오류로 인한 서비스 예외", ide);
		} catch (Exception e) {
			e.printStackTrace();
			throw new InternalServiceException("예상치 못한 서비스 내부 오류", e);
		} finally {
			session.close();
		}
		return teamMemberList1;
	}

	/**
	 * 팀원을 강퇴하는 서비스 메서드입니다.
	 *
	 * @param TeamMember 정보를 가져오기 위한 Data Transfer Object 데이터 클래스
	 * @throws InternalServiceException DB 접근 오류나 예상치 못한 내부 오류 발생 시 상위 계층으로 던지는 서비스
	 *                                  예외
	 */
	@Override
	public void updateTeamMemberKick(TeamMemberDTO teamMember) {

		SqlSession session = SessionFactory.getSqlSession();

		try {
			dao.updateTeamMemberKick(teamMember, session);
			session.commit();
		} catch (InternalDataAccessException ide) {
			ide.printStackTrace();
			throw new InternalServiceException("DB 접근 오류로 인한 서비스 예외", ide);
		} catch (Exception e) {
			e.printStackTrace();
			throw new InternalServiceException("예상치 못한 서비스 내부 오류", e);
		} finally {
			session.close();
		}
	}

	/**
	 * 팀장 권한을 넘기는 서비스 메서드입니다.
	 *
	 * @param TeamMember 정보를 가져오기 위한 Data Transfer Object 데이터 클래스
	 * @throws InternalServiceException DB 접근 오류나 예상치 못한 내부 오류 발생 시 상위 계층으로 던지는 서비스
	 *                                  예외
	 */
	@Override
	public void updateTeamLeaderChange(TeamMemberDTO teamMember, TeamMemberDTO teamLeader) {

		SqlSession session = SessionFactory.getSqlSession();

		try {
			dao.updateTeamMemberChange(teamLeader, session);
			dao.updateTeamLeaderChange(teamMember, session);
			session.commit();
		} catch (InternalDataAccessException ide) {
			ide.printStackTrace();
			throw new InternalServiceException("DB 접근 오류로 인한 서비스 예외", ide);
		} catch (Exception e) {
			e.printStackTrace();
			throw new InternalServiceException("예상치 못한 서비스 내부 오류", e);
		} finally {
			session.close();
		}
	}

	/**
	 * 팀장의 정보를 가져오는 서비스 메서드입니다.
	 *
	 * @param TeamMember 정보를 가져오기 위한 Data Transfer Object 데이터 클래스
	 * @throws InternalServiceException DB 접근 오류나 예상치 못한 내부 오류 발생 시 상위 계층으로 던지는 서비스
	 * 예외
	 * @return 팀장의 정보를 리턴
	 */
	@Override
	public List<TeamMemberDTO> selectTeamPage(TeamMemberDTO teamMember) {
		SqlSession session = SessionFactory.getSqlSession();
		List<TeamMemberDTO> teamMemberList = new ArrayList<>();
		try {
			teamMemberList = dao.selectTeamPage(teamMember, session);
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
