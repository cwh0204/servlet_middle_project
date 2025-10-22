package com.groo.DAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.groo.model.MemberDTO;

public interface AdminDAO {
	public List<MemberDTO> adminSelectAll(MemberDTO member, SqlSession session);
	public List<MemberDTO> adminSelectUserInsertCheck(MemberDTO member, SqlSession session);
}
