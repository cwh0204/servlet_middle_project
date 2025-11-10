package com.groo.service;

import org.apache.ibatis.session.SqlSession;

import com.groo.DAO.MemberDAO;
import com.groo.DAO.MemberDAOImpl;
import com.groo.error.InternalDataAccessException;
import com.groo.error.InternalServiceException;
import com.groo.model.MemberDTO;

public class MemberServiceImpl implements MemberService { //ISP 적용

	MemberDAO dao = new MemberDAOImpl();

	/**
	 * user를 비활성화 하기 위한 서비스 메서드
	 *
	 * @param member는 유저를 비활성화 하기 위한 Data Transfer Object 데이터 클래스
	 * @throws InternalServiceException DB 접근 오류나 예상치 못한 내부 오류 발생 시 상위 계층으로 던지는 서비스
	 * 예외
	 */
	@Override
	public int userDelete(MemberDTO member) {
		SqlSession session = com.groo.config.SessionFactory.getSqlSession();
		int deletedd= 0;
		try {
			deletedd = dao.userDelete(member, session);
			if(deletedd>0) {
				session.commit();
			}
		} catch (InternalDataAccessException ide) {
			ide.printStackTrace();
			throw new InternalServiceException("DB 접근 오류로 인한 서비스 예외", ide);
		} catch (Exception e) {
			e.printStackTrace();
			throw new InternalServiceException("예상치 못한 서비스 내부 오류", e);
		} finally {
			session.close();
		}
		return deletedd;
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
		SqlSession session = com.groo.config.SessionFactory.getSqlSession();
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

		SqlSession session = com.groo.config.SessionFactory.getSqlSession();
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
		SqlSession session = com.groo.config.SessionFactory.getSqlSession();
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
		SqlSession session = com.groo.config.SessionFactory.getSqlSession();
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
		SqlSession session = com.groo.config.SessionFactory.getSqlSession();
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

	/**
	 * 이메일을 중복 여부를 하기위한 서비스 메서드
	 * @param member는 유저를 회원가입 하기 위한 Data Transfer Object 데이터 클래스
	 * @return 중복확인 정보return
	 * @throws InternalServiceException DB 접근 오류나 예상치 못한 내부 오류 발생 시 상위 계층으로 던지는 서비스
	 * 예외
	 */
	@Override
	public MemberDTO selectUserEmailCheck(MemberDTO member) {
		SqlSession session = com.groo.config.SessionFactory.getSqlSession();
		MemberDTO memberEmail = new MemberDTO();

		try {
			memberEmail = dao.selectUserEmailCheck(member, session);
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return memberEmail;
	}

	/**
	 * 유저정보를 확인하기 위한 서비스 메서드
	 * @param member는 유저를 조회 하기 위한 Data Transfer Object 데이터 클래스
	 * @return 아이디정보를 리턴
	 * @throws InternalServiceException DB 접근 오류나 예상치 못한 내부 오류 발생 시 상위 계층으로 던지는 서비스
	 * 예외
	 */
	@Override
	public MemberDTO selectUserDetail(MemberDTO member) {
		SqlSession session = com.groo.config.SessionFactory.getSqlSession();
		MemberDTO userselect = new MemberDTO();

		try {
			userselect = dao.selectUserDetail(member, session);
		} catch (InternalDataAccessException ide) {
			ide.printStackTrace();
			throw new InternalServiceException("DB 접근 오류로 인한 서비스 예외", ide);
		} catch (Exception e) {
			e.printStackTrace();
			throw new InternalServiceException("예상치 못한 서비스 내부 오류", e);
		} finally {
			session.close();
		}
		return userselect;
	}

	/**
	 * 유저아이디를 확인하기 위한 서비스 메서드
	 * @param member는 유저 아이디를 조회 하기 위한 Data Transfer Object 데이터 클래스
	 * @return 아이디정보를 리턴
	 * @throws InternalServiceException DB 접근 오류나 예상치 못한 내부 오류 발생 시 상위 계층으로 던지는 서비스
	 * 예외
	 */
	@Override
	public MemberDTO selectFindMemberId(MemberDTO member) {

		SqlSession session = com.groo.config.SessionFactory.getSqlSession();
		MemberDTO userselect = new MemberDTO();
		try {
			userselect = dao.selectFindMemberId(member, session);
		} catch (InternalDataAccessException ide) {
			ide.printStackTrace();
			throw new InternalServiceException("DB 접근 오류로 인한 서비스 예외", ide);
		} catch (Exception e) {
			e.printStackTrace();
			throw new InternalServiceException("예상치 못한 서비스 내부 오류", e);
		} finally {
			session.close();
		}
		return userselect;
	}

	/**
	 * 유저 비밀번호 초기화를 하기 위한 서비스 메서드
	 * @param member는 유저를 조회 하기 위한 Data Transfer Object 데이터 클래스
	 * @return 아이디정보를 리턴
	 * @throws InternalServiceException DB 접근 오류나 예상치 못한 내부 오류 발생 시 상위 계층으로 던지는 서비스
	 * 예외
	 */
//	@Override
//	public void updateFindMemberPass(MemberDTO member) {
//
//		SqlSession session = SessionFactory.getSqlSession();
//		try {
//			dao.updateFindMemberPass(member, session);
//			session.commit();
//		} catch (InternalDataAccessException ide) {
//			ide.printStackTrace();
//			throw new InternalServiceException("DB 접근 오류로 인한 서비스 예외", ide);
//		} catch (Exception e) {
//			e.printStackTrace();
//			throw new InternalServiceException("예상치 못한 서비스 내부 오류", e);
//		} finally {
//			session.close();
//		}
//	}


	/**
	 * 탈퇴 아이디 정보를 확인하기 위한 서비스 메서드
	 * @param member는 유저를 조회 하기 위한 Data Transfer Object 데이터 클래스
	 * @return 아이디정보를 리턴
	 * @throws InternalServiceException DB 접근 오류나 예상치 못한 내부 오류 발생 시 상위 계층으로 던지는 서비스
	 * 예외
	 */
	@Override
	public MemberDTO selectuserDelete(MemberDTO member) {
		SqlSession session = com.groo.config.SessionFactory.getSqlSession();
		MemberDTO deleteid = new MemberDTO();

		try {
			deleteid = dao.selectuserDelete(member, session);
		} catch (InternalDataAccessException ide) {
			ide.printStackTrace();
			throw new InternalServiceException("DB 접근 오류로 인한 서비스 예외", ide);
		} catch (Exception e) {
			e.printStackTrace();
			throw new InternalServiceException("예상치 못한 서비스 내부 오류", e);
		} finally {
			session.close();
		}
		return deleteid;
	}

	/**
	 * 유저비밀번호를 확인하기 위한 서비스 메서드
	 * @param member는 유저 비밀번호를 조회 하기 위한 Data Transfer Object 데이터 클래스
	 * @return 비밀번호정보를 리턴
	 * @throws InternalServiceException DB 접근 오류나 예상치 못한 내부 오류 발생 시 상위 계층으로 던지는 서비스
	 * 예외
	 */
//	@Override
//	public MemberDTO selectFindMemberPass(MemberDTO member) {
//		SqlSession session = SessionFactory.getSqlSession();
//		MemberDTO memberpw = new MemberDTO();
//		try {
//			memberpw = dao.selectFindMemberPass(member, session);
//		} catch (InternalDataAccessException ide) {
//			ide.printStackTrace();
//			throw new InternalServiceException("DB 접근 오류로 인한 서비스 예외", ide);
//		} catch (Exception e) {
//			e.printStackTrace();
//			throw new InternalServiceException("예상치 못한 서비스 내부 오류", e);
//		} finally {
//			session.close();
//		}
//		return memberpw;
//	}
//
//}

//	 합친거
	// DAO 객체 선언 (주입 방식에 따라 달라짐. 여기서는 단순 선언으로 가정)

	    // 1. 새 비밀번호 업데이트 메서드
		@Override
		public void updateFindMemberPass(MemberDTO member) {

			SqlSession session = com.groo.config.SessionFactory.getSqlSession();
			try {
				// DAO를 통해 비밀번호 업데이트
				dao.updateFindMemberPass(member, session);
				session.commit();
			} catch (InternalDataAccessException ide) {
				ide.printStackTrace();
				// 롤백이 필요하다면 여기에 session.rollback(); 추가
				throw new InternalServiceException("DB 접근 오류로 인한 서비스 예외", ide);
			} catch (Exception e) {
				e.printStackTrace();
				// 롤백이 필요하다면 여기에 session.rollback(); 추가
				throw new InternalServiceException("예상치 못한 서비스 내부 오류", e);
			} finally {
				session.close();
			}
		}

	    // 2. ID와 이메일 조회 메서드
		@Override
		public MemberDTO selectFindMemberPass(MemberDTO member) {
			SqlSession session = com.groo.config.SessionFactory.getSqlSession();
			MemberDTO memberpw = new MemberDTO();
			try {
				// DAO를 통해 회원 정보 조회
				memberpw = dao.selectFindMemberPass(member, session);
			} catch (InternalDataAccessException ide) {
				ide.printStackTrace();
				throw new InternalServiceException("DB 접근 오류로 인한 서비스 예외", ide);
			} catch (Exception e) {
				e.printStackTrace();
				throw new InternalServiceException("예상치 못한 서비스 내부 오류", e);
			} finally {
				session.close();
			}
			return memberpw;
		}

	}




