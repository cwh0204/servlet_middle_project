package com.groo.service;

import org.apache.ibatis.session.SqlSession;

import com.groo.config.SessionFactory;
import com.groo.model.MyPageDAO;
import com.groo.model.MyPageDAOImpl;
import com.groo.model.MyPageDTO;

public class MpageselectNickImpl implements MpageselectNick {

	MyPageDAO dao = new MyPageDAOImpl();//DAO 생성
	@Override
	public MyPageDTO selectNickName(MyPageDTO nickname) {
		
		SqlSession session = SessionFactory.getSqlSession();
		MyPageDTO nick = new MyPageDTO();
		nick = dao.getuserId(nickname, session);
		return nick;
	}

}
