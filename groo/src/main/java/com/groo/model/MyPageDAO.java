package com.groo.model;

import org.apache.ibatis.session.SqlSession;

public interface MyPageDAO {

	public MyPageDTO getNickname(MyPageDTO nickname, SqlSession session);
	public MyPageDTO getemail(MyPageDTO email);

}
