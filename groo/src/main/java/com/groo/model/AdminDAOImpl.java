package com.groo.model;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

public class AdminDAOImpl implements AdminDAO {

	@Override
	public List<MemberDTO> adminSelectAll(MemberDTO member, SqlSession session) {
		
		List<MemberDTO> adminList = new ArrayList<>();
		try {
			adminList = session.selectList("adminSelectUserAll", member);
		}catch (Exception e) {
			// TODO: handle exception
		}
		return adminList;
	}

}
