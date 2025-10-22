package com.groo.model;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.groo.error.InternalDataAccessException;

public class AdminDAOImpl implements AdminDAO {
	private static final Logger log = LoggerFactory.getLogger(AdminDAOImpl.class);
	@Override
	public List<MemberDTO> adminSelectAll(MemberDTO member, SqlSession session) {
		
		List<MemberDTO> adminList = new ArrayList<>();
		try {
			adminList = session.selectList("adminSelectUserAll", member);
		}catch (Exception e) {
			log.error("DAO 접근 오류 발생: {}", e.getMessage(), e);
			throw new InternalDataAccessException("adminSelectAll 예외발생", e);
		}
		return adminList;
	}

}
