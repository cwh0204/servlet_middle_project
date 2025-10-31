package com.groo.DAO;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import com.groo.error.InternalDataAccessException;
import com.groo.model.MemberDTO;

public class MemberDAOImpl implements MemberDAO{

	@Override
	public void signUp(MemberDTO memberDto, SqlSession session) {

		try {
			session.insert("insertMember", memberDto);

		}catch(Exception e) {
			e.printStackTrace();
			throw new PersistenceException("회원가입 중 DB 오류 발생", e);		//이메일이나 ID 중복 등일 때 발생
		}
	}

	@Override
	public String selectLoginId(String memLoginId, SqlSession session) {

		try {
			return session.selectOne("selectLoginId", memLoginId);

		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public String selectEmail(String memEmail, SqlSession session) {

		try {
			return session.selectOne("selectEmail", memEmail);

		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}


	/**
	 * 회원을 비활성화 시키는 메서드
	 * @param member 유저의 검색정보를 가져오기 위한 Data Transfer Object 데이터 클래스
	 * @param session MyBatis 작업을 수행하는 데 사용되는 세션 객체
	 */
	@Override
	public void userDelete(MemberDTO member, SqlSession session) {
		// TODO Auto-generated method stub
		try {
			session.update("userDelete", member);
		}catch(Exception e) {
			e.printStackTrace();
			throw new InternalDataAccessException("DAO:userdetailpw 예외발생", e);
		}
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
}


	
	

	



