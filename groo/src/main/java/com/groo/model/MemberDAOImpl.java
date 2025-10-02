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
			System.out.println("아이디"+memberRe.getUserId());
			System.out.println("비밀번호"+memberRe.getPassword());
			System.out.println("이름"+memberRe.getName());
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return memberRe;
	}
}
