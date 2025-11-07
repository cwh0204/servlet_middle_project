package com.groo.DAO;

import org.apache.ibatis.session.SqlSession;

import com.groo.error.InternalDataAccessException;
import com.groo.model.MemberDTO;

public class MemberDAOImpl implements MemberDAO{

	/**
	 * 회원을 비활성화 시키는 메서드
	 * @param member 유저의 검색정보를 가져오기 위한 Data Transfer Object 데이터 클래스
	 * @param session MyBatis 작업을 수행하는 데 사용되는 세션 객체
	 */
	@Override
	public int userDelete(MemberDTO member, SqlSession session) {
		// TODO Auto-generated method stub
		int deleteid = 0;
		try {
			deleteid= session.update("userDelete", member);
		}catch(Exception e) {
			e.printStackTrace();
			throw new InternalDataAccessException("DAO:userdetailpw 예외발생", e);
		}
		return deleteid;
	}


	/**
	 * 회원을 수정 시키는 메서드
	 * @param member 유저의 수정할 정보를 가져오기 위한 Data Transfer Object 데이터 클래스
	 * @param session MyBatis 작업을 수행하는 데 사용되는 세션 객체
	 */
	@Override
	public void userUpdate(MemberDTO member, SqlSession session) {
		// TODO Auto-generated method stub
		try {
			session.update("userUpdate", member);
		}catch(Exception e) {
			e.printStackTrace();
			throw new InternalDataAccessException("DAO:userdetail 예외발생", e);
		}
	}


	/**
	 * 소셜로그인 회원의 회원가입 여부를 확인하는 메서드
	 * @param member 유저의 검색정보를 가져오기 위한 Data Transfer Object 데이터 클래스
	 * @param session MyBatis 작업을 수행하는 데 사용되는 세션 객체
	 * @return 소셜로그인 회원 정보를 리턴
	 */
	@Override
	public MemberDTO selectSocialLoginCheck(MemberDTO member, SqlSession session) {

		MemberDTO socialMember = new MemberDTO();
		try {
			socialMember = session.selectOne("selectSocialLoginCheck", member);
		}catch(Exception e) {
			e.printStackTrace();
			throw new InternalDataAccessException("DAO:socialLoginCheck 예외발생", e);
		}

		return socialMember;
	}

	/**
	 * 소셜로그인 회원의 회원가입 메서드
	 * @param member 유저의 정보를 가져오기 위한 Data Transfer Object 데이터 클래스
	 * @param session MyBatis 작업을 수행하는 데 사용되는 세션 객체
	 */
	@Override
	public void insertSociallMember(MemberDTO member, SqlSession session) {

		try {
			session.insert("insertSociallMember", member);
		}catch(Exception e) {
			e.printStackTrace();
			throw new InternalDataAccessException("DAO:insertSociallMember 예외발생", e);
		}
	}
	/**
	 * 일반 회원의 로그인 메서드
	 * @param member 유저의 정보를 가져오기 위한 Data Transfer Object 데이터 클래스
	 * @param session MyBatis 작업을 수행하는 데 사용되는 세션 객체
	 */
	@Override
	public MemberDTO selectLoginMember(MemberDTO member, SqlSession session) {
		MemberDTO memberLogin = new MemberDTO();
		try {
			memberLogin = session.selectOne("selectLoginMember", member);
		}catch(Exception e) {
			e.printStackTrace();
			throw new InternalDataAccessException("DAO:selectLoginMember 예외발생", e);
		}
		return memberLogin;
	}

	/**
	 * 닉네임을 중복 여부를 확인하는 메서드
	 * @param member 유저의 수정정보를 가져오기 위한 Data Transfer Object 데이터 클래스
	 * @param session MyBatis 작업을 수행하는 데 사용되는 세션 객체
	 * @return 닉네임 정보를 리턴
	 */

	@Override
	public MemberDTO selectUserNicknameCheck(MemberDTO member, SqlSession session) {
		MemberDTO memberNickname = new MemberDTO();
		try {
			return session.selectOne("selectUserNicknameCheck", member);
		}catch(Exception e) {
			e.printStackTrace();
			return memberNickname;
		}
}

	/**
	 * 이메일을 중복 여부를 확인하는 메서드
	 * @param member 유저의 수정정보를 가져오기 위한 Data Transfer Object 데이터 클래스
	 * @param session MyBatis 작업을 수행하는 데 사용되는 세션 객체
	 * @return 이메일 정보를 리턴
	 */
	@Override
	public MemberDTO selectUserEmailCheck(MemberDTO member, SqlSession session) {
		MemberDTO memberEmail = new MemberDTO();
		try {
			return session.selectOne("selectUserEmailCheck", member);
		}catch(Exception e) {
			e.printStackTrace();
			return memberEmail;
		}
	}

	/**
	 * 유저정보를 가져오는 메서드
	 * @param member 유저의 수정정보를 가져오기 위한 Data Transfer Object 데이터 클래스
	 * @param session MyBatis 작업을 수행하는 데 사용되는 세션 객체
	 * @return 아이디 정보를 리턴
	 */
	@Override
	public MemberDTO selectUserDetail(MemberDTO member, SqlSession session) {
		MemberDTO userselect = new MemberDTO();
		try {
			userselect = session.selectOne("selectUserDetail", member);
		}catch(Exception e) {
			e.printStackTrace();
			throw new InternalDataAccessException("DAO:selectUserDetail 예외발생", e);
		}

		return userselect;
	}

	/**
	 * 유저아이디 정보를 가져오는 메서드
	 * @param member 유저의 수정정보를 가져오기 위한 Data Transfer Object 데이터 클래스
	 * @param session MyBatis 작업을 수행하는 데 사용되는 세션 객체
	 * @return 아이디 정보를 리턴
	 */
	@Override
	public MemberDTO selectFindMemberId(MemberDTO member, SqlSession session) {
		MemberDTO memberid = new MemberDTO();

		try {
			memberid = session.selectOne("selectFindMemberId", member);
		}catch (Exception e) {
			e.printStackTrace();
			throw new InternalDataAccessException("DAO:selectFindMemberId 예외발생", e);
		}
		return memberid;
	}

	/**
	 * 유저 비밀번호를 초기화하는 메서드
	 * @param member 유저의 수정정보를 가져오기 위한 Data Transfer Object 데이터 클래스
	 * @param session MyBatis 작업을 수행하는 데 사용되는 세션 객체
	 */
	@Override
	public void updateFindMemberPass(MemberDTO member, SqlSession session) {

		try {
			session.update("updateFindMemberPass", member);
		}catch (Exception e) {
			e.printStackTrace();
			throw new InternalDataAccessException("DAO:updateFindMemberPass 예외발생", e);
		}
	}


	/**
	 * 탈퇴 아이디 정보를 가져오는 메서드
	 * @param member 유저의 수정정보를 가져오기 위한 Data Transfer Object 데이터 클래스
	 * @param session MyBatis 작업을 수행하는 데 사용되는 세션 객체
	 * @return 아이디 정보를 리턴
	 */
	public MemberDTO selectuserDelete(MemberDTO member, SqlSession session) {
		MemberDTO deleteid = new MemberDTO();
		try {
			deleteid = session.selectOne("selectuserDelete", member);
		}catch(Exception e) {
			e.printStackTrace();
			throw new InternalDataAccessException("selectuserDelete 예외발생", e);
		}

		return deleteid;
	}
}






