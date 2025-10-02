package com.groo.model;

import org.apache.ibatis.session.SqlSession;

public interface MemberDAO {
	public void signUP(MemberDTO memberDTO, SqlSession session);
	public MemberDTO login(MemberDTO memberDTO, SqlSession session);
}
