package com.groo.DAO;

import org.apache.ibatis.session.SqlSession;

import com.groo.model.MemberDTO;

public interface jiwonDAO {
	public void insertMember(MemberDTO member, SqlSession session);
	public MemberDTO selectLoginId(MemberDTO member, SqlSession session);
	public MemberDTO selectEmail(MemberDTO member, SqlSession session);
}
