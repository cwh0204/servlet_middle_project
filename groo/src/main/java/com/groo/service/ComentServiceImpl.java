package com.groo.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.groo.DAO.ComentDAO;
import com.groo.DAO.ComentDAOImpl;
import com.groo.config.SessionFactory;
import com.groo.error.InternalDataAccessException;
import com.groo.error.InternalServiceException;
import com.groo.model.ComentDTO;
import com.groo.model.MemberDTO;

public class ComentServiceImpl implements ComentService {

	ComentDAO dao = new ComentDAOImpl();


	/**
	 * 댓글 등록 서비스 메서드입니다.
	 *
	 * @param 댓글을 등록하기 위한 Data Transfer Object 데이터 클래스
	 * @throws InternalServiceException DB 접근 오류나 예상치 못한 내부 오류 발생 시 상위 계층으로 던지는 서비스
	 * 예외
	 */
	@Override
	public void comentInsert(ComentDTO coment) {
		SqlSession session = SessionFactory.getSqlSession();
		try {
			dao.comentInsert(coment, session);
			session.commit();
		}catch(InternalDataAccessException ie) {
			throw new InternalDataAccessException(ie);
		}catch(InternalServiceException rne) {
			throw new InternalServiceException("로그인 중 데이터베이스 오류 발생", rne);
		}catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("comentInsert에서 예외 발생",e);
		}
		finally {
			session.close();
		}
	}

	/**
	 * 댓글 조회 서비스 메서드입니다.
	 *
	 * @param 댓글을 등록하기 위한 Data Transfer Object 데이터 클래스
	 * @return 댓글 조회 정보
	 * @throws InternalServiceException DB 접근 오류나 예상치 못한 내부 오류 발생 시 상위 계층으로 던지는 서비스
	 * 예외
	 */
	@Override
	public List<ComentDTO> comentSelect(ComentDTO coment) {
		SqlSession session = SessionFactory.getSqlSession();
		List<ComentDTO> comentList = new ArrayList<>();
		try {
			comentList = dao.comentSelect(coment, session);
		}catch(InternalDataAccessException ie) {
			throw new InternalDataAccessException(ie);
		}catch(InternalServiceException rne) {
			throw new InternalServiceException("로그인 중 데이터베이스 오류 발생", rne);
		}catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("comentInsert에서 예외 발생",e);
		}
		finally {
			session.close();
		}
		return comentList;
	}

	/**
	 * 댓글 삭제 서비스 메서드입니다.
	 *
	 * @param 댓글을 삭제하기 위한 Data Transfer Object 데이터 클래스
	 * @throws InternalServiceException DB 접근 오류나 예상치 못한 내부 오류 발생 시 상위 계층으로 던지는 서비스
	 * 예외
	 */
	@Override
	public void comentDelete(ComentDTO coment) {
		// TODO Auto-generated method stub
		SqlSession session = SessionFactory.getSqlSession();
		try {
			dao.comentDelete(coment, session);
			session.commit();
		}catch(InternalDataAccessException ie) {
			throw new InternalDataAccessException(ie);
		}catch(InternalServiceException rne) {
			throw new InternalServiceException("로그인 중 데이터베이스 오류 발생", rne);
		}catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("comentInsert에서 예외 발생",e);
		}
		finally {
			session.close();
		}
	}

	@Override
	public void comentEdit(ComentDTO coment) {
		// TODO Auto-generated method stub
		SqlSession session = SessionFactory.getSqlSession();
		try {
			dao.comentEdit(coment, session);
			session.commit();
		}catch(InternalDataAccessException ie) {
			throw new InternalDataAccessException(ie);
		}catch(InternalServiceException rne) {
			throw new InternalServiceException("로그인 중 데이터베이스 오류 발생", rne);
		}catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("comentInsert에서 예외 발생",e);
		}
		finally {
			session.close();
		}
	}
	
	
	/**
	 * 내가 쓴 댓글 조회 서비스 메서드입니다.
	 *
	 * @param 내가 쓴 댓글 조회 위한 Data Transfer Object 데이터 클래스
	 * @throws InternalServiceException DB 접근 오류나 예상치 못한 내부 오류 발생 시 상위 계층으로 던지는 서비스
	 * 예외
	 */
	
	@Override
	public List<ComentDTO> selectMyCommentList(MemberDTO member) {
		SqlSession session = SessionFactory.getSqlSession();
		List<ComentDTO> list = new ArrayList<>();
		try {
			list = dao.selectMyCommentList(member, session);
		}catch(InternalDataAccessException ie) {
			throw new InternalDataAccessException(ie);
		}catch(InternalServiceException rne) {
			throw new InternalServiceException("로그인 중 데이터베이스 오류 발생", rne);
		}catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("comentInsert에서 예외 발생",e);
		}
		finally {
			session.close();
		}
		return list;
	}

}
