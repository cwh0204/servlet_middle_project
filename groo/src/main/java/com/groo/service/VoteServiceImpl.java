package com.groo.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.groo.DAO.VoteDAO;
import com.groo.DAO.VoteDAOImpl;
import com.groo.config.SessionFactory;
import com.groo.error.InternalDataAccessException;
import com.groo.error.InternalServiceException;
import com.groo.model.VoteDTO;

public class VoteServiceImpl implements VoteService{

	VoteDAO dao = new VoteDAOImpl();


	/**
	 * 투표를 생성하는 서비스 메서드입니다.
	 *
	 * @param vote 정보를 가져오기 위한 Data Transfer Object 데이터 클래스
	 * @throws InternalServiceException DB 접근 오류나 예상치 못한 내부 오류 발생 시 상위 계층으로 던지는 서비스
	 * 예외
	 */
	@Override
	public void insertVote(VoteDTO vote) {

		SqlSession session = SessionFactory.getSqlSession();
		try {
			dao.insertVote(vote, session);
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
	 * 투표를 조회하는 서비스 메서드입니다.
	 *
	 * @param vote 정보를 가져오기 위한 Data Transfer Object 데이터 클래스
	 * @throws InternalServiceException DB 접근 오류나 예상치 못한 내부 오류 발생 시 상위 계층으로 던지는 서비스
	 * 예외
	 * @return 투표 조회
	 */
	@Override
	public List<VoteDTO> selectVote(VoteDTO vote) {
		List<VoteDTO> voteList = new ArrayList<>();
		SqlSession session = SessionFactory.getSqlSession();
		try {
			voteList = dao.selectVote(vote, session);
		} catch (InternalDataAccessException ide) {
			ide.printStackTrace();
			throw new InternalServiceException("DB 접근 오류로 인한 서비스 예외", ide);
		} catch (Exception e) {
			e.printStackTrace();
			throw new InternalServiceException("예상치 못한 서비스 내부 오류", e);
		} finally {
			session.close();
		}
		return voteList;
	}

	/**
	 * 투표를 누적하는 서비스 메서드입니다.
	 *
	 * @param vote 정보를 가져오기 위한 Data Transfer Object 데이터 클래스
	 * @throws InternalServiceException DB 접근 오류나 예상치 못한 내부 오류 발생 시 상위 계층으로 던지는 서비스
	 * 예외
	 */
	@Override
	public void updateVoteOk(VoteDTO vote) {
		SqlSession session = SessionFactory.getSqlSession();
		try {
			dao.updateVoteOk(vote, session);
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
	 * 투표 주별 최다 득표리스트를 가져오기 위한 메서드
	 * 
	 * @param vote 정보를 가져오기 위한 Data Transfer Object 데이터 클래스
	 * @throws InternalServiceException DB 접근 오류나 예상치 못한 내부 오류 발생 시 상위 계층으로 던지는 서비스
	 * 예외
	 */
	@Override
	public List<VoteDTO> selectVoteRank(VoteDTO vote) {
		
		SqlSession session = SessionFactory.getSqlSession();
		List<VoteDTO> voteList = new ArrayList<>();
		try {
			voteList = dao.selectVoteRank(vote, session);
		} catch (InternalDataAccessException ide) {
			ide.printStackTrace();
			throw new InternalServiceException("DB 접근 오류로 인한 서비스 예외", ide);
		} catch (Exception e) {
			e.printStackTrace();
			throw new InternalServiceException("예상치 못한 서비스 내부 오류", e);
		} finally {
			session.close();
		}
		return voteList;
	}
}
