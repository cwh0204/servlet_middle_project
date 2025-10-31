package com.groo.service;

import org.apache.ibatis.session.SqlSession;

import com.groo.DAO.jiwonDAO;
import com.groo.DAO.jiwonDAOImpl;
import com.groo.config.SessionFactory;
import com.groo.model.MemberDTO;

public class jiwonServiceImpl implements jiwonService {
	
	jiwonDAO dao = new jiwonDAOImpl();
	
	@Override
	public void insertUserService(MemberDTO memberDTO) {
		SqlSession session = SessionFactory.getSqlSession();

		try {
			dao.signUp(memberDTO, session);
			session.commit();
		}catch(Exception e) {
			e.printStackTrace();
			session.rollback();
			throw new IllegalStateException("회원가입 실패", e);
		}finally {
			session.close();
		}
	}


	@Override
	public MemberDTO selectLoginIdService(MemberDTO memLoginId) {
		SqlSession session = SessionFactory.getSqlSession();
		MemberDTO memberDTO = new MemberDTO();

		try {
			memberDTO = dao.selectLoginId(memLoginId, session);

		}catch(Exception e) {
			e.printStackTrace();

		}finally {
			session.close();
		}
		return memberDTO;
	}


	@Override
	public MemberDTO selectEmailService(MemberDTO memEmail) {
		SqlSession session = SessionFactory.getSqlSession();
		
		MemberDTO memberDTO = new MemberDTO();

		try {
			memberDTO = dao.selectEmail(memEmail, session);

		}catch(Exception e) {
			e.printStackTrace();

		}finally {
			session.close();
		}
		return memberDTO;
	}
}
