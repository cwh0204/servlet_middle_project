package com.groo.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.groo.DAO.TeamDAO;
import com.groo.DAO.TeamDAOImpl;
import com.groo.config.SessionFactory;
import com.groo.error.InternalDataAccessException;
import com.groo.error.InternalServiceException;
import com.groo.model.TeamDTO;

public class TeamServiceImpl implements TeamService{

	TeamDAO dao = new TeamDAOImpl(); //업캐스팅
	List<TeamDTO> teamlist = new ArrayList<>();
	
	
	/**
	 * 회원 목록을 조회하는 서비스 메서드입니다.
	 *
	 * @param member 유저의 검색정보를 가져오기 위한 Data Transfer Object 데이터 클래스
	 * @return 유저목록 조회 처리 결과
	 * @throws InternalServiceException DB 접근 오류나 예상치 못한 내부 오류 발생 시 상위 계층으로 던지는 서비스
	 * 예외
	 */
	@Override
	public List<TeamDTO> selectTeam(TeamDTO team) {
		
		SqlSession session = SessionFactory.getSqlSession();
		try {
			teamlist = dao.selectTeam(team, session);
		} catch (InternalDataAccessException ide) {
			ide.printStackTrace();
			throw new InternalServiceException("DB 접근 오류로 인한 서비스 예외", ide);
		} catch (Exception e) {
			e.printStackTrace();
			throw new InternalServiceException("예상치 못한 서비스 내부 오류", e);
		} finally {
			session.close();
		}
		return teamlist;
	}
}
