package com.groo.model;


import org.apache.ibatis.session.SqlSession;

public class MemberDAOImpl{
	
	public void signUP(MemberDTO memberDTO, SqlSession session) {
		
		try {
			session.insert("insertUser", memberDTO);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

	public MemberDTO login(MemberDTO memberDTO, SqlSession session) {
		// TODO Auto-generated method stub
		MemberDTO memberRe = new MemberDTO();
		
		try {
			memberRe = session.selectOne("loginUser",memberDTO);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return memberRe;
	}
}
