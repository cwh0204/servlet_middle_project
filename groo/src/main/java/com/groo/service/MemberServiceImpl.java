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
	public MemberDTO selectLoginIdService(MemberDTO memLoginId) {
		SqlSession session = SessionFactory.getSqlSession();
		MemberDTO memberDTO = new MemberDTO();

		try {
			memberDTO = dao.selectLoginId(memLoginId, session);

		}catch(Exception e) {
			e.printStackTrace();

		}finally {
			session.close();
		}
		return memberDTO;
	}


	@Override
	public MemberDTO selectEmailService(MemberDTO memEmail) {
		SqlSession session = SessionFactory.getSqlSession();
		
		MemberDTO memberDTO = new MemberDTO();

		try {
			memberDTO = dao.selectEmail(memEmail, session);

		}catch(Exception e) {
			e.printStackTrace();

		}finally {
			session.close();
		}
		return memberDTO;
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

	/**
	 * user를 수정 하기 위한 서비스 메서드
	 *
	 * @param member는 유저를 수정 하기 위한 Data Transfer Object 데이터 클래스
	 * @throws InternalServiceException DB 접근 오류나 예상치 못한 내부 오류 발생 시 상위 계층으로 던지는 서비스
	 * 예외
	 */
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


	/**
	 * 소셜로그인 회원가입 여부를 확인하기 위한 서비스 메서드
	 * @param member는 유저를 조회 하기 위한 Data Transfer Object 데이터 클래스
	 * @return 회원정보를 리턴
	 * @throws InternalServiceException DB 접근 오류나 예상치 못한 내부 오류 발생 시 상위 계층으로 던지는 서비스
	 * 예외
	 */
	@Override
	public MemberDTO selectSocialLoginCheck(MemberDTO member) {

		SqlSession session = SessionFactory.getSqlSession();
		MemberDTO socialMember = new MemberDTO();
		try {
			socialMember = dao.selectSocialLoginCheck(member, session);
		} catch (InternalDataAccessException ide) {
			ide.printStackTrace();
			throw new InternalServiceException("DB 접근 오류로 인한 서비스 예외", ide);
		} catch (Exception e) {
			e.printStackTrace();
			throw new InternalServiceException("예상치 못한 서비스 내부 오류", e);
		} finally {
			session.close();
		}
		return socialMember;
	}

	/**
	 * 소셜로그인 회원가입을 하기 위한 서비스 메서드
	 * @param member는 유저를 회원가입 하기 위한 Data Transfer Object 데이터 클래스
	 * @throws InternalServiceException DB 접근 오류나 예상치 못한 내부 오류 발생 시 상위 계층으로 던지는 서비스
	 * 예외
	 */
	@Override
	public void insertSociallMember(MemberDTO member) {
		// TODO Auto-generated method stub
		SqlSession session = SessionFactory.getSqlSession();
		try {
			dao.insertSociallMember(member, session);
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
	 * 일반회원 로그인을 하기위한 서비스 메서드
	 * @param member는 유저를 회원가입 하기 위한 Data Transfer Object 데이터 클래스
	 * @return 중복확인 정보return
	 * @throws InternalServiceException DB 접근 오류나 예상치 못한 내부 오류 발생 시 상위 계층으로 던지는 서비스
	 * 예외
	 */
	@Override
	public MemberDTO selectLoginMember(MemberDTO member) {
		SqlSession session = SessionFactory.getSqlSession();
		MemberDTO memberLogin = new MemberDTO();
		try {
			memberLogin = dao.selectLoginMember(member, session);
		} catch (InternalDataAccessException ide) {
			ide.printStackTrace();
			throw new InternalServiceException("DB 접근 오류로 인한 서비스 예외", ide);
		} catch (Exception e) {
			e.printStackTrace();
			throw new InternalServiceException("예상치 못한 서비스 내부 오류", e);
		} finally {
			session.close();
		}
		return memberLogin;
	}

	/**
	 * 닉네임을 중복 여부를 하기위한 서비스 메서드
	 * @param member는 유저를 회원가입 하기 위한 Data Transfer Object 데이터 클래스
	 * @return 중복확인 정보return
	 * @throws InternalServiceException DB 접근 오류나 예상치 못한 내부 오류 발생 시 상위 계층으로 던지는 서비스
	 * 예외
	 */
	@Override
	public MemberDTO selectUserNicknameCheck(MemberDTO member) {
		SqlSession session = SessionFactory.getSqlSession();
	    MemberDTO memberDTO = new MemberDTO();

	    try {
	    	memberDTO = dao.selectUserNicknameCheck(member, session);
	    } catch (Exception e) {
	        e.printStackTrace(); 
	    } finally {
	        session.close();
	    }

	    return memberDTO;
	}

}


	
	
		