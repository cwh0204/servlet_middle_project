package com.groo.model;

import org.apache.ibatis.session.SqlSession;

public class MyPageDAOImpl implements MyPageDAO {

	@Override
	public MyPageDTO getuserId(MyPageDTO id, SqlSession session) {
		
		MyPageDTO nick = new MyPageDTO();
		nick = session.selectOne("userId", id);
		return nick;
	}

	@Override
	public MyPageDTO getemail(MyPageDTO email) {
		return null;
	}

}
