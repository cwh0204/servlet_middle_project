package com.groo.service;

import org.apache.ibatis.session.SqlSession;

import com.groo.DAO.jiwonDAO;
import com.groo.DAO.jiwonDAOImpl;
import com.groo.config.SessionFactory;
import com.groo.error.InternalDataAccessException;
import com.groo.error.InternalServiceException;
import com.groo.model.MemberDTO;

public class jiwonServiceImpl implements jiwonService {
	
	jiwonDAO dao = new jiwonDAOImpl();
	
	@Override
	public void insertMember(MemberDTO member) {
		SqlSession session = SessionFactory.getSqlSession();

		try {
			dao.insertMember(member, session);
			session.commit();
		} catch (InternalDataAccessException ide) {
			ide.printStackTrace();
			throw new InternalServiceException("DB 접근 오류로 인한 서비스 예외", ide);
		} catch (Exception e) {
			e.printStackTrace();
			throw new InternalServiceException("예상치 못한 서비스 내부 오류", e);
		}finally {
			session.close();
		}
	}


	@Override
	public MemberDTO selectLoginId(MemberDTO member) {
		SqlSession session = SessionFactory.getSqlSession();
		MemberDTO memberLoginId = new MemberDTO();

		try {
			memberLoginId = dao.selectLoginId(member, session);

		} catch (InternalDataAccessException ide) {
			ide.printStackTrace();
			throw new InternalServiceException("DB 접근 오류로 인한 서비스 예외", ide);
		} catch (Exception e) {
			e.printStackTrace();
			throw new InternalServiceException("예상치 못한 서비스 내부 오류", e);
		}finally {
			session.close();
		}
		return memberLoginId;
	}


	@Override
	public MemberDTO selectEmail(MemberDTO member) {
		SqlSession session = SessionFactory.getSqlSession();
		MemberDTO memberEmail = new MemberDTO();

		try {
			memberEmail = dao.selectEmail(member, session);

		} catch (InternalDataAccessException ide) {
			ide.printStackTrace();
			throw new InternalServiceException("DB 접근 오류로 인한 서비스 예외", ide);
		} catch (Exception e) {
			e.printStackTrace();
			throw new InternalServiceException("예상치 못한 서비스 내부 오류", e);
		}finally {
			session.close();
		}
		return memberEmail;
	}
}
