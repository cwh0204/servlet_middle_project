package com.groo.DAO;

import org.apache.ibatis.session.SqlSession;

import com.groo.model.MemberDTO;

public interface jiwonDAO {
	public void signUp(MemberDTO memberDto, SqlSession session);
	public MemberDTO selectLoginId(MemberDTO memberDto, SqlSession session);
	public MemberDTO selectEmail(MemberDTO memberDto, SqlSession session);
}
