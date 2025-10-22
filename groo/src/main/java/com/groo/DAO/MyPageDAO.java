package com.groo.DAO;

import org.apache.ibatis.session.SqlSession;

import com.groo.model.MyPageDTO;

public interface MyPageDAO {

	public MyPageDTO getNickname(MyPageDTO nickname, SqlSession session);
	public MyPageDTO getemail(MyPageDTO email);

}
