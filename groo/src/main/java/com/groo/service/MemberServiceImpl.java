package com.groo.service;

import org.apache.ibatis.session.SqlSession;

import com.groo.DAO.MemberDAO;
import com.groo.DAO.MemberDAOImpl;
import com.groo.config.SessionFactory;
import com.groo.error.InternalDataAccessException;
import com.groo.error.InternalServiceException;
import com.groo.model.MemberDTO;

public class MemberServiceImpl implements MemberService { //ISP 적용

	MemberDAO dao = new MemberDAOImpl();

	@Override
	public MemberDTO loginUserService(MemberDTO memberDTO) {

		SqlSession session = SessionFactory.getSqlSession();
		MemberDTO member = new MemberDTO();
		try {
			member = dao.login(memberDTO, session);
		}catch(InternalDataAccessException ie) {
			throw new InternalDataAccessException(ie);
		}catch(InternalServiceException rne) {
			throw new InternalServiceException("로그인 중 데이터베이스 오류 발생", rne);
		}catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("loginUserServie에서 예외 발생",e);
		}
		finally {
			session.close();
		}

		return member;
	}


//	@Override
//	public void insertUserService(MemberDTO memberDTO) {
//		// TODO Auto-generated method stub
//		SqlSession session = SessionFactory.getSqlSession();
//		dao.signUP(memberDTO, session);
//		try {
//			session.commit();
//		} catch (Exception e) {
//			e.printStackTrace();
//			throw new RuntimeException("insertUserService에서 예외 발생",e);
//		} finally {
//			session.close();
//		}
//	}

	@Override
	public void insertUserService(MemberDTO memberDTO) {
		SqlSession session = SessionFactory.getSqlSession();

		try {
			dao.signUp(memberDTO, session);
			session.commit();
		}catch(Exception e) {
			e.printStackTrace();
			session.rollback();
			throw new IllegalStateException("회원가입 실패", e);
		}finally {
			session.close();
		}
	}


	@Override
	public String selectLoginIdService(String memLoginId) {
		SqlSession session = SessionFactory.getSqlSession();
		String resultLoginId = null;

		try {
			resultLoginId = dao.selectLoginId(memLoginId, session);

		}catch(Exception e) {
			e.printStackTrace();

		}finally {
			session.close();
		}
		return resultLoginId;
	}


	@Override
	public String selectEmailService(String memEmail) {
		SqlSession session = SessionFactory.getSqlSession();
		String resultEmail = null;

		try {
			resultEmail = dao.selectEmail(memEmail, session);

		}catch(Exception e) {
			e.printStackTrace();

		}finally {
			session.close();
		}
		return resultEmail;
	}


	/**
	 * user를 비활성화 하기 위한 서비스 메서드
	 *
	 * @param member는 유저를 비활성화 하기 위한 Data Transfer Object 데이터 클래스
	 * @throws InternalServiceException DB 접근 오류나 예상치 못한 내부 오류 발생 시 상위 계층으로 던지는 서비스
	 * 예외
	 */
	@Override
	public void userDelete(MemberDTO member) {
		SqlSession session = SessionFactory.getSqlSession();
		try {
			dao.userDelete(member, session);
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


	@Override
	public void userUpdate(MemberDTO member) {
		SqlSession session = SessionFactory.getSqlSession();
		try {
			dao.userUpdate(member, session);
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

}
