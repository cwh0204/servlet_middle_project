package com.groo.DAO;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import com.groo.model.MemberDTO;

public class jiwonDAOImpl implements jiwonDAO {

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
	public MemberDTO selectLoginId(MemberDTO MemberDTO, SqlSession session) {
		
		MemberDTO member = new MemberDTO();
		
		try {
			member = session.selectOne("selectLoginId", member);

		}catch(Exception e) {
			e.printStackTrace();
		}
		return member;
	}

	@Override
	public MemberDTO selectEmail(MemberDTO MemberDTO, SqlSession session) {

		try {
			return session.selectOne("selectEmail", MemberDTO);

		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}

}
