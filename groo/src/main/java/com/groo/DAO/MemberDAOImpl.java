package com.groo.DAO;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import com.groo.error.InternalDataAccessException;
import com.groo.model.MemberDTO;

public class MemberDAOImpl implements MemberDAO{

//	@Override
//	public void signUP(MemberDTO memberDTO, SqlSession session) {
//		try {
//			session.insert("insertUser", memberDTO);
//		}catch (Exception e) {
//			e.printStackTrace();
//			throw new InternalServiceException("회원가입 중 데이터베이스 오류 발생", e);
//		}
//	}

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




	@Override
	public MemberDTO login(MemberDTO memberDTO, SqlSession session) {
		// TODO Auto-generated method stub
		MemberDTO memberRe = new MemberDTO();
		/*
		 * if(memberDTO.getmemId().equals("")) { throw new
		 * InternalDataAccessException("사용자 입력데이터 불일치예외 발생"); } try { memberRe =
		 * session.selectOne("loginUser",memberDTO); System.out.println(memberRe);
		 * }catch (Exception e) { e.printStackTrace(); throw new
		 * InternalServiceException("로그인 중 데이터베이스 오류 발생", e); }
		 */
		return memberRe;
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




}
