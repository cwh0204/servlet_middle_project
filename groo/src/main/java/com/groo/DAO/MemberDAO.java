package com.groo.DAO;

import org.apache.ibatis.session.SqlSession;

import com.groo.model.MemberDTO;

public interface MemberDAO {

	public void signUp(MemberDTO memberDto, SqlSession session);
	public String selectLoginId(String memLoginId, SqlSession session);
	public String selectEmail(String memEmail, SqlSession session);
	public MemberDTO login(MemberDTO memberDTO, SqlSession session);

	//이수민
	public void userDelete(MemberDTO member, SqlSession session);
	public void userUpdate(MemberDTO member, SqlSession session);
}
