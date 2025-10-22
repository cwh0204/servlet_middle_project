package com.groo.DAO;

import org.apache.ibatis.session.SqlSession;

import com.groo.model.MemberDTO;

public interface MemberDAO {
	public void signUP(MemberDTO memberDTO, SqlSession session);
	public MemberDTO login(MemberDTO memberDTO, SqlSession session);
}
