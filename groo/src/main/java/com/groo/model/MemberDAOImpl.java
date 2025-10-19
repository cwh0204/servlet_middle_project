package com.groo.model;

import org.apache.ibatis.session.SqlSession;

import com.groo.error.InternalServerErrorException;
import com.groo.error.ResourceNotFoundException;

public class MemberDAOImpl implements MemberDAO{

	@Override
	public void signUP(MemberDTO memberDTO, SqlSession session) {
		try {
			session.insert("insertUser", memberDTO);
		}catch (Exception e) {
			e.printStackTrace();
			throw new ResourceNotFoundException("회원가입 중 데이터베이스 오류 발생", e);
		}
	}

	@Override
	public MemberDTO login(MemberDTO memberDTO, SqlSession session) {
		// TODO Auto-generated method stub
		MemberDTO memberRe = new MemberDTO();
		if(memberDTO.getUserId().equals("")) {
			throw new InternalServerErrorException("사용자 입력데이터 불일치예외 발생");
		}
		try {
			memberRe = session.selectOne("loginUser",memberDTO);
			System.out.println(memberRe);
		}catch (Exception e) {
			e.printStackTrace();
			throw new ResourceNotFoundException("로그인 중 데이터베이스 오류 발생", e);
		}
		return memberRe;
	}
}
