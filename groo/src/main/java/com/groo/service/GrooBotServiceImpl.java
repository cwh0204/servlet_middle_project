package com.groo.service;

import org.apache.ibatis.session.SqlSession;

import com.groo.DAO.GrooBotDAO;
import com.groo.DAO.GrooBotDAOImpl;
import com.groo.config.SessionFactory;
import com.groo.error.InternalDataAccessException;
import com.groo.error.InternalServiceException;
import com.groo.model.GrooBotDTO;

public class GrooBotServiceImpl implements GrooBotService {
	
	GrooBotDAO dao = new GrooBotDAOImpl();
	
	/**
	 * 그루봇 리뷰 생성 서비스 메서드입니다.
	 *
	 * @param 댓글을 등록하기 위한 Data Transfer Object 데이터 클래스
	 * @throws InternalServiceException DB 접근 오류나 예상치 못한 내부 오류 발생 시 상위 계층으로 던지는 서비스
	 * 예외
	 */
	@Override
	public void insertGrooBot(GrooBotDTO bot) {
		SqlSession session = SessionFactory.getSqlSession();
		try {
			dao.insertGrooBot(bot, session);
			session.commit();
		}catch(InternalDataAccessException ie) {
			throw new InternalDataAccessException(ie);
		}catch(InternalServiceException rne) {
			throw new InternalServiceException("로그인 중 데이터베이스 오류 발생", rne);
		}catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("insertGrooBot에서 예외 발생",e);
		}
		finally {
			session.close();
		}
	}
	
	/**
	 * 그루봇 리뷰 조회 서비스 메서드입니다.
	 *
	 * @param 댓글을 등록하기 위한 Data Transfer Object 데이터 클래스
	 * @throws InternalServiceException DB 접근 오류나 예상치 못한 내부 오류 발생 시 상위 계층으로 던지는 서비스
	 * 예외
	 */
	@Override
	public GrooBotDTO selectGrooBot(GrooBotDTO bot) {
		SqlSession session = SessionFactory.getSqlSession();
		GrooBotDTO grooBotDTO = new GrooBotDTO();
		try {
			grooBotDTO = dao.selectGrooBot(bot, session);
		}catch(InternalDataAccessException ie) {
			throw new InternalDataAccessException(ie);
		}catch(InternalServiceException rne) {
			throw new InternalServiceException("로그인 중 데이터베이스 오류 발생", rne);
		}catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("insertGrooBot에서 예외 발생",e);
		}
		finally {
			session.close();
		}
		
		return grooBotDTO;
	}
	
}
