package com.groo.model;

import org.apache.ibatis.session.SqlSession;

public interface MyPageDAO {
	
	public MyPageDTO getuserId(MyPageDTO id, SqlSession session);
	public MyPageDTO getemail(MyPageDTO email);

}
