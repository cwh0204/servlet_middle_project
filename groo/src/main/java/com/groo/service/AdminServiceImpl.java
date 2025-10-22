package com.groo.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.groo.config.SessionFactory;
import com.groo.error.InternalDataAccessException;
import com.groo.error.InternalServiceException;
import com.groo.model.AdminDAO;
import com.groo.model.AdminDAOImpl;
import com.groo.model.MemberDTO;

public class AdminServiceImpl implements AdminService {
	
	private static final Logger log = LoggerFactory.getLogger(AdminServiceImpl.class);
	
	AdminDAO dao = new AdminDAOImpl();
	List<MemberDTO> memberlist = new ArrayList<>();
	
	@Override
	public List<MemberDTO> adminSelectAll(MemberDTO member) {
		SqlSession session = SessionFactory.getSqlSession();
		try {
			memberlist = dao.adminSelectAll(member, session);
		}catch (InternalDataAccessException ide) {
			log.error("데이터 접근 오류 발생: {}", ide.getMessage(), ide);
            throw new InternalServiceException("DB 접근 오류로 인한 서비스 예외", ide);
		}catch (Exception e) {
			log.error("Service 오류 발생: {}", e.getMessage(), e);
			throw new InternalServiceException("예상치 못한 서비스 내부 오류",e);
		}finally {
			session.close();
		}
		return memberlist;
	}

}
