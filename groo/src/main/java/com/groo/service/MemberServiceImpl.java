package com.groo.service;

import org.apache.ibatis.session.SqlSession;

import com.groo.config.SessionFactory;
import com.groo.model.MemberDAO;
import com.groo.model.MemberDAOImpl;
import com.groo.model.MemberDTO;

public class MemberServiceImpl implements MemberLoginUser, MemberInsertUser { //ISP 적용

	MemberDAO dao = new MemberDAOImpl();

	@Override
	public MemberDTO loginUserService(MemberDTO memberDTO) {

		SqlSession session = SessionFactory.getSqlSession();
		MemberDTO member = new MemberDTO();
		try {
			member = dao.login(memberDTO, session);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}

		return member;
	}

	@Override
	public void insertUserService(MemberDTO memberDTO) {
		// TODO Auto-generated method stub
		SqlSession session = SessionFactory.getSqlSession();
		dao.signUP(memberDTO, session);
		try {
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
	}

}
