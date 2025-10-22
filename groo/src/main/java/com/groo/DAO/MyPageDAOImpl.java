package com.groo.DAO;

import org.apache.ibatis.session.SqlSession;

import com.groo.model.MyPageDTO;

public class MyPageDAOImpl implements MyPageDAO {

	@Override
	public MyPageDTO getNickname(MyPageDTO nickname, SqlSession session) {

		MyPageDTO nick = new MyPageDTO();
		nick = session.selectOne("usernickname", nickname);
		return nick;
	}

	@Override
	public MyPageDTO getemail(MyPageDTO email) {
		return null;
	}

}
