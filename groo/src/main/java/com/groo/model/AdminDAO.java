package com.groo.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

public interface AdminDAO {
	public List<MemberDTO> adminSelectAll(MemberDTO member, SqlSession session);
}
