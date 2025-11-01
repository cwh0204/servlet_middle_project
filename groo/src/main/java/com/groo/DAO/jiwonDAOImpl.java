package com.groo.DAO;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import com.groo.error.InternalDataAccessException;
import com.groo.model.MemberDTO;

public class jiwonDAOImpl implements jiwonDAO {

	@Override
	public void insertMember(MemberDTO member, SqlSession session) {
		
		try {
			session.insert("insertMember", member);

		}catch(Exception e) {
			e.printStackTrace();
			throw new InternalDataAccessException("DAO:insertMember 예외발생", e);
		}
	}

	@Override
	public MemberDTO selectLoginId(MemberDTO member, SqlSession session) {
		
		MemberDTO memberLoginId = new MemberDTO();
		
		try {
			memberLoginId = session.selectOne("selectLoginId", member);

		}catch(Exception e) {
			e.printStackTrace();
			throw new InternalDataAccessException("DAO:selectLoginId 예외발생", e);
		}
		return memberLoginId;
	}

	@Override
	public MemberDTO selectEmail(MemberDTO member, SqlSession session) {
		
		MemberDTO memberEmail = new MemberDTO();
		
		try {
			memberEmail = session.selectOne("selectEmail", member);

		}catch(Exception e) {
			e.printStackTrace();
			throw new InternalDataAccessException("DAO:selectEmail 예외발생", e);
		}
		return memberEmail;
	}

}
