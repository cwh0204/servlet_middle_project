package com.groo.model;


import org.apache.ibatis.session.SqlSession;
import com.groo.config.SessionFactory;
import com.groo.mapper.UserMapper;


public class MemberDAOImpl implements MemberDAO{

	SessionFactory sessionFactory = new SessionFactory();

	@Override
	public void signUP(MemberDTO memberDTO) {
		// TODO Auto-generated method stub
		// 5. 사용자 등록 처리
		SqlSession session = sessionFactory.getSqlSession();
		UserMapper mapper = session.getMapper(UserMapper.class);
		mapper.insertUser(memberDTO);
		session.commit();
	}

	@Override
	public String login(MemberDTO memberDTO) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.getSqlSession();
		UserMapper mapper = session.getMapper(UserMapper.class);
		String loginCk = mapper.loginUser(memberDTO);
		return loginCk;
	}


}
